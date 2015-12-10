#define _Noreturn

namespace net;

#include <stdarg.h>

#if defined(__WIN32__)

#define WIN32_LEAN_AND_MEAN
#define String _String
#include <winsock.h>
#undef String
#define SOCKLEN_TYPE int

#elif defined(__unix__) || defined(__APPLE__)

default:
#define SOCKLEN_TYPE socklen_t
#define set _set
#define uint _uint
#include <sys/time.h>
#include <unistd.h>

#include <netinet/in.h>
#include <netdb.h>
#include <sys/socket.h>
#include <sys/wait.h>
#include <sys/types.h>
#include <sys/time.h>
#include <arpa/inet.h>
#undef set
#undef uint
private:

typedef int SOCKET;
typedef struct hostent HOSTENT;
typedef struct sockaddr SOCKADDR;
typedef struct sockaddr_in SOCKADDR_IN;
typedef struct in_addr IN_ADDR;
#define closesocket(s) close(s)

#endif

import "network"


#ifdef __ANDROID__
#include <endian.h>
#undef ntohs
#undef htons

#define SWAP_WORD(word) (((uint16)(word) & 0x00ff) << 8) \
                      | (((uint16)(word) & 0xff00) >> 8)

#if _BYTE_ORDER == _BIG_ENDIAN
#define ntohs(x)(x)
#define htons(x)(x)
#else
#define ntohs(x) SWAP_WORD(x)
#define htons(x) SWAP_WORD(x)
#endif

#endif

#define GETLEDWORD(b) (uint32)(((b)[3] << 24) | ((b)[2] << 16) | ((b)[1] << 8) | (b)[0])

#define PUTLEDWORD(b, d) \
   (b)[3] = (byte)(((d) >> 24) & 0xFF); \
   (b)[2] = (byte)(((d) >> 16) & 0xFF); \
   (b)[1] = (byte)(((d) >> 8)  & 0xFF); \
   (b)[0] = (byte)( (d)        & 0xFF);

public enum SocketType { tcp, udp };
public enum DisconnectCode { remoteLost = 1, remoteClosed = 2, resolveFailed = 3, connectFailed = 4 };

public class Packet : struct
{
public:
   uint size;
};

static class SocketConnectThread : Thread
{
   Socket socket;

   uint Main()
   {
      bool result = false;
      HOSTENT * host = gethostbyname(socket.address);
      if(host)
      {
         network.mutex.Wait();

         if(!socket.destroyed)
         {
            socket.a.sin_addr = *((IN_ADDR *)host->h_addr);
            network.mutex.Release();
            if(socket.type == udp ||
               !connect(socket.s,(SOCKADDR *)&socket.a,sizeof(socket.a)))
            {
               network.mutex.Wait();
               strcpy(socket.inetAddress, inet_ntoa(socket.a.sin_addr));
               socket.inetPort = ntohs(socket.a.sin_port);
               network.mutex.Release();

               if(socket.OnEstablishConnection((int)socket.s))
               {
                  network.mutex.Wait();
                  result = true;
               }
               else
               {
                  network.mutex.Wait();
                  socket.disconnectCode = connectFailed;
               }
            }
            else
            {
               network.mutex.Wait();
               socket.disconnectCode = connectFailed;
            }
         }
      }
      else
         socket.disconnectCode = resolveFailed;

   #ifdef DEBUG_SOCKETS
      Log("[C] Signaling connect event (%X)\n", socket);
   #endif
      if(result && !socket.destroyed)
         socket._connected = 1;
      else if(socket._connected == -2)
         socket._connected = -1;

   #ifdef DEBUG_SOCKETS
      Log("[C] Getting out of connect thread (%X)\n", socket);
   #endif
      network.connectEvent = true;
      if(guiApp)
         guiApp.SignalEvent();
      network.mutex.Release();
      return 0;
   }

};

public class Socket
{
public:
   property Service service
   {
      set
      {
         if(value)
         {
            SOCKET s;
            SOCKADDR_IN a;
            SOCKLEN_TYPE addrLen = sizeof(a);

            value.accepted = true;
            s = accept(value.s,(SOCKADDR *)&a, &addrLen);
            if(s != -1)
            {
               int sendsize=65536;
               int recvsize=65536;

               value.sockets.Add(this);
               incref this;

               setsockopt(s, SOL_SOCKET, SO_SNDBUF, (char *)&sendsize, (int)sizeof(sendsize));
               setsockopt(s, SOL_SOCKET, SO_RCVBUF, (char *)&recvsize, (int)sizeof(recvsize));

               destroyed = false;
               // TESTING THIS HERE
               _connected = 1;
               address = null;
               this.a = a;
               strcpy(inetAddress, inet_ntoa(this.a.sin_addr));
               inetPort = ntohs(a.sin_port);
               this.s = s;
               service = value;
               connectThread = null;
               disconnectCode = (DisconnectCode)-1;
               disconnected = false;

               network.mutex.Wait();
               FD_SET(s, &network.exceptSet);
               FD_SET(s, &network.readSet);
               if(s >= network.ns)
               {
                  network.ns = (int)(s+1);
                  network.socketsSemaphore.Release();
               }
               network.mutex.Release();
            }
            else if(!_refCount)
            {
               delete this;
            }
         }
      }
      get { return this ? service : null; }
   };

   property const char * inetAddress { get { return (char *)inetAddress; } };
   property int inetPort { get { return inetPort; } }
   property Socket next { get { return next; } };
   property bool connected { get { return _connected == 1 || _connected == -2; } };
   property bool processAlone { get { return processAlone; } set { processAlone = value; } };

   virtual void OnConnect(void);
   virtual uint OnReceive(const byte * buffer, uint count)
   {
      if(count >= sizeof(class Packet))
      {
         Packet packet = (Packet)buffer;
         uint size = GETLEDWORD((byte *)&packet.size);
         if(count >= size)
         {
            byte * tempBuffer = null;
            if(size)
            {
               if(recvBytes - size)
               {
                  tempBuffer = new byte[size];
                  packet = (Packet)tempBuffer;
                  memcpy(tempBuffer, buffer, size);
                  memmove(recvBuffer, recvBuffer + size, recvBytes - size);
               }
               recvBytes -= size;
            }
            OnReceivePacket(packet);
            delete tempBuffer;
            return 0;
         }
      }
      return 0;
   }

   virtual void OnDisconnect(int code);
   virtual void OnReceivePacket(Packet packet);

   bool Connect(const char * address, int port)
   {
      bool result = false;
   #if defined(__WIN32__) || defined(__unix__) || defined(__APPLE__)
      SOCKET s = socket(AF_INET,SOCK_STREAM,0);
   #ifdef DEBUG_SOCKETS
      Log("\n[P] [NConnect]\n");
   #endif
      if(s != -1)
      {
         result = _Connect(s, address, port);
      }
   #endif
      return result;
   }

   void Disconnect(DisconnectCode code)
   {
      if(this)
      {
         bool wasDisconnected = disconnected;
   #if defined(__WIN32__) || defined(__unix__) || defined(__APPLE__)
         SOCKET s = this.s;

   #ifdef DEBUG_SOCKETS
         Logf("[P] [NDisconnect (%X, %x)]\n", this, this.s);
   #endif
         network.mutex.Wait();
         disconnectCode = code;
         destroyed = true;

         if(!disconnected)
         {
            if(_connected == -2 && connectThread)
            {
               incref this;
               network.mutex.Release();
               connectThread.Wait();
               delete connectThread;
               network.mutex.Wait();
               _refCount--;
            }
            disconnected = true;
            if(!service)
            {
               if(_connected)
                  ((_connected == -1 || _connected == -2) ? network.connectSockets : network.sockets).Remove(this);
            }
            else
            {
               service.sockets.Remove(this);
               service = null;
            }
            _connected = 0;
            network.mutex.Release();
            OnDisconnect(disconnectCode);
            network.mutex.Wait();
         }

         if(s == network.ns - 1)
            Network_DetermineMaxSocket();

         if(s != -1)
         {
            FD_CLR(s, &network.readSet);
            FD_CLR(s, &network.writeSet);
            FD_CLR(s, &network.exceptSet);
         }
         // Why wasn't this here? Don't want it here :) Hmm why don't we want it here? Service created socket not getting freed in DICOMTest...
         // Trying >= 1 instead of > 1
         // Free(code);
         //if(_refCount > 1)
         /*if(_refCount >= 1)
            _refCount--;*/

         shutdown(s, 2);

         if(!wasDisconnected)
            delete this;

         network.mutex.Release();
   #endif
      }
   }

   // --- Transfer ---
   bool Send(const void * buffer, int size)
   {
   #if defined(__WIN32__) || defined(__unix__) || defined(__APPLE__)
      if(this)
      {
         safeIncRef();
         {
         SOCKET s = this.s;
         int count;
         fd_set ws, es;

         if(s != -1 && ((type == tcp && (count = SendData(buffer, size, 0))) ||
            (type == udp && (count = (int)sendto(s, buffer, size,0, (SOCKADDR *)&a, sizeof(a))))))
         {
   #if defined(__WIN32__)
            int error = WSAGetLastError();
   #endif
            FD_ZERO(&ws);
            FD_ZERO(&es);
            FD_SET(s, &ws);
            FD_SET(s, &es);
   #if defined(__WIN32__)
            if(error)
   #endif
            {
               //Print("~");
            }

            // This is what was making eCom jam...
            // select(s+1, null, &ws, &es, null);

            safeDecRef();
            return true;
         }
         }
         safeDecRef();
      }
   #endif
      return false;
   }

   bool SendPacket(Packet packet)
   {
      if(this && packet)
      {
         bool result;
         uint size = packet.size;
         PUTLEDWORD((byte *)&packet.size, size);
         result = Send(packet, size);
         packet.size = size;
         return result;
      }
      return false;
   }

   bool SendString(const char * string)
   {
      return Send(string, (int)strlen(string));
   }

   bool Sendf(const char * format, ...)
   {
      bool result;
      va_list args;
      char string[MAX_F_STRING];
      va_start(args, format);
      vsnprintf(string, sizeof(string), format, args);
      string[sizeof(string)-1] = 0;
      result = Send(string, (int)strlen(string));
      va_end(args);
      return result;
   }

   bool DatagramConnect(const char * sendAddress, int port)
   {
      SOCKET s = socket(AF_INET,SOCK_DGRAM,0);
      if(s != -1)
      {
         _Connect(s, sendAddress, port);
         type = udp;
         return true;
      }
      return false;
   }

   bool DatagramHost(int port)
   {
      SOCKET s = socket(AF_INET,SOCK_DGRAM,0);
      if(s != -1 && !_connected)
      {
         SOCKADDR_IN a;
         bool val = true;
         a.sin_family=AF_INET;
         a.sin_port = htons((uint16)port);
         a.sin_addr.s_addr=INADDR_ANY;
         setsockopt(s, SOL_SOCKET, SO_REUSEADDR, (char *)&val, sizeof(val));
         if(!bind(s,(SOCKADDR *)&a, sizeof(a)))
         {
            network.mutex.Wait();
            type = udp;
            this.s = s;
            network.sockets.Add(this);
            incref this;

            disconnectCode = (DisconnectCode)-1;
            _connected = 1;

            FD_CLR(s, &network.writeSet);
            FD_SET(s, &network.readSet);
            FD_SET(s, &network.exceptSet);
            if(s >= network.ns)
            {
               network.ns = (int)(s+1);
               network.socketsSemaphore.Release();
            }
            network.mutex.Release();
            return true;
         }
         closesocket(s);
      }
      return false;
   }

   virtual int ReceiveData(byte * buffer, int count, uint flags)
   {
      return (int)recv(s, (char *)buffer, count, flags);
   }
   virtual int SendData(const byte * buffer, int count, uint flags)
   {
      return (int)send(s, (const char *)buffer, count, flags);
   }
   virtual bool OnEstablishConnection(int s);

   dllexport void safeIncRef()
   {
      mutex.Wait();
      incref this;
      //mutex.Release();
   }

   dllexport void safeDecRef()
   {
      Mutex mutex = this.mutex;
      //mutex.Wait();
      delete this;
      mutex.Release();
   }

private:
   Socket()
   {
      Network_Initialize();
      disconnected = true;
   }

   ~Socket()
   {
      _refCount = MAXINT;
      Free(true);
      _refCount = 0;
   }

#ifndef ECERE_NONET
   void Free(bool mustLock)
   {
      SOCKET s = this.s;

      if(mustLock) network.mutex.Wait();

      if(!service && _connected)
      {
         ((_connected == -1 || _connected == -2) ? network.connectSockets : network.sockets).Remove(this);
         _connected = 0;
      }

      if(!disconnected)
      {
         disconnected = true;
         network.mutex.Release();
         incref this;
         OnDisconnect(disconnectCode);
         // if(_refCount > 1) _refCount--;
         _refCount--;
         network.mutex.Wait();
      }

      if(service)
      {
         service.sockets.Remove(this);
         service = null;
         _connected = 0;
      }

      if(s != -1) { closesocket(s); this.s = -1; }

      delete address;
      delete recvBuffer;

      recvBufferSize = 0;
      recvBytes = 0;

      if(s != -1)
      {
         FD_CLR(s, &network.readSet);
         FD_CLR(s, &network.writeSet);
         FD_CLR(s, &network.exceptSet);
      }

      disconnectCode = 0;

      // COMMENTED THIS OUT SINCE IT WAS INVALIDATING PROTECTION FOR HTTP FILE CONNECTION REUSE...
      // WATCH FOR LEAKS IN OTHER PROJECTS?
      //if(_refCount > 1) _refCount--;
      if(mustLock) network.mutex.Release();
   }

   void _Disconnect(DisconnectCode code)
   {
      SOCKET s = this.s;
      network.mutex.Wait();

      disconnectCode = code;

      Free(false);
      delete this;

      if(s == network.ns - 1)
         Network_DetermineMaxSocket();
      network.mutex.Release();
   }

   bool _Connect(SOCKET s, const char * address, int port)
   {
      bool result = false;
      if(this)
      {
         SOCKADDR_IN a;
         a.sin_family = AF_INET;
         a.sin_port = htons((uint16)port);

         network.mutex.Wait();

         delete this.address;

         // incref this;
         destroyed = false;
         this.address = new char[strlen(address)+1];
         strcpy(this.address, address);
         this.a = a;
         this.s = s;
         service = null;
         disconnected = false;
         disconnectCode = (DisconnectCode)-1;
         connectThread = null;
         _connected = -2;

         FD_SET(s, &network.writeSet);
         if(s >= network.ns && !processAlone)
         {
            network.ns = (int)(s+1);
            network.socketsSemaphore.Release();
         }
         connectThread = SocketConnectThread { socket = this };

         if(OnConnect == Socket::OnConnect)
         {
            result = true;

            network.mutex.Release();
            connectThread.Main();
            network.mutex.Wait();

            if(_connected == -1 || destroyed)
            {
               _connected = 0;

               if(s == network.ns - 1)
                  Network_DetermineMaxSocket();
#if 0
               if(this.disconnectCode == resolveFailed)
                  Logf("Error resolving address %s\n", this.address);
#endif
               // Free();
               this.s = -1;
               result = false;
            }
            else if(_connected == 1)
            {
               FD_CLR(s, &network.writeSet);
               FD_SET(s, &network.readSet);
               FD_SET(s, &network.exceptSet);
               network.sockets.Add(this);

               incref this;
               result = true;
            }
            else
               this.s = -1;

            delete connectThread;
         }
         else
         {
            network.connectSockets.Add(this);
            incref this;
            incref connectThread;
            connectThread.Create();
            result = true;
         }
         /*if(_refCount > 1)
            delete this;*/
      }
      network.mutex.Release();
      return result;
   }

   #define MAX_RECEIVE  65536

   bool ProcessSocket(fd_set * rs, fd_set * ws, fd_set * es)
   {
      bool result = false;
      SOCKET s;
      Mutex mutex = this.mutex;

      mutex.Wait();
      incref this;
      // network.mutex.Wait();
      s = this.s;
      if(FD_ISSET(s, rs) || leftOver)
      {
         int count = 0;

         result = true;
         if((int)recvBufferSize - recvBytes < MAX_RECEIVE)
         {
            recvBuffer = renew recvBuffer byte[recvBufferSize + MAX_RECEIVE];
            recvBufferSize += MAX_RECEIVE;
         }

         if(FD_ISSET(s, rs) && disconnectCode == (DisconnectCode)-1)
         {
            if(type == tcp /*|| _connected*/)
               count = ReceiveData(recvBuffer + recvBytes, recvBufferSize - recvBytes, 0);
            else
            {
               SOCKLEN_TYPE len = sizeof(a);
               count = (int)recvfrom(s, (char *)recvBuffer + recvBytes,
                  recvBufferSize - recvBytes, 0, (SOCKADDR *)&a, &len);
               strcpy(inetAddress, inet_ntoa(this.a.sin_addr));
               inetPort = ntohs((uint16)a.sin_port);
            }
            switch(count)
            {
               case 0:
                  disconnectCode = remoteClosed;
                  break;
               case -1:
               {
                  /*int yo = errno;
                  printf("Errno is %d", errno);*/
                  disconnectCode = remoteLost;
                  break;
               }
            }
         }

         if(count > 0 || (leftOver && !count))
         {
            uint flushCount;
            leftOver = false;
            recvBytes += count;
            for(flushCount = 0; flushCount < recvBytes; )
            {
               uint recvCount = OnReceive(recvBuffer + flushCount, recvBytes - flushCount);
               if(!recvCount)
               {
                  if(recvBytes)
                     leftOver = true;
                  if(!processAlone)
                     network.leftOverBytes = true;
                  break;
               }
               flushCount += recvCount;
            }

            if(flushCount < recvBytes)
            {
               if(flushCount)
               {
                  memmove(recvBuffer, recvBuffer + flushCount, recvBytes - flushCount);
                  recvBytes -= flushCount;
               }
               else
               {
                  // If nothing was acknowledged, clear socket so that OnReceive doesn't keep getting called
                  if(disconnectCode > -1)
                     recvBytes = 0;
               }
            }
            else
               recvBytes = 0;
         }
      }
      else if(FD_ISSET(s, es))
      {
         result = true;
#if 0
         Logf("Remote Lost %s\n", (void *)inet_ntoa(a.sin_addr));
#endif
         if(type != udp)
            _Disconnect(remoteLost);
      }

      // Disconnect it here
      if(!recvBytes && disconnectCode > -1 && _connected)
      {
         result = true;
#if 0
         if(disconnectCode)
            Logf("Disconnected (%d) %s\n", disconnectCode, (void *)inet_ntoa(a.sin_addr));
#endif
         if(type != udp)
            _Disconnect(disconnectCode);
      }
      // network.mutex.Release();
      delete this;
      mutex.Release();

      return result;
   }
#endif

   public bool Process()
   {
      return ProcessTimeOut(0);
   }

   public bool ProcessTimeOut(Seconds timeOut)
   {
      bool gotEvent = false;
      struct timeval tv = {0, 0};
      struct timeval tvTO = {(uint)timeOut, (uint)((timeOut -(uint)timeOut)* 1000000)};
      fd_set rs, ws, es;
      int selectResult;
      Mutex mutex;

      if(disconnectCode > 0 && !leftOver) return false;
      FD_ZERO(&rs);
      FD_ZERO(&ws);
      FD_ZERO(&es);
      FD_SET(s, &rs);
      //FD_SET(s, &ws);
      FD_SET(s, &es);

      mutex = this.mutex;
      mutex.Wait();
      incref this;
      mutex.Release();
      selectResult = select((int)(s+1), &rs, &ws, &es, leftOver ? &tv : (timeOut ? &tvTO : null));

      if(s != -1 && _refCount && (leftOver || selectResult))
      {
         gotEvent |= ProcessSocket(&rs, &ws, &es);
      }
      mutex.Wait();
      delete this;
      mutex.Release();
      return gotEvent;
   }

   Service service;
   bool leftOver;

   char inetAddress[20];
   int inetPort;

   Socket prev, next;

   SOCKET s;
   char * address;
   Thread connectThread;
   DisconnectCode disconnectCode;
   bool destroyed;
   int _connected;         // -2: Initial value when calling Connect(), -1: Disconnected or otherwise destroyed while connecting, 1: succesfully connected, 0: no longer in any connect/sockets list
   bool disconnected;

   // Receiving Buffer
   byte * recvBuffer;
   uint recvBytes;
   uint recvBufferSize;
   SocketType type;
   bool processAlone;
   SOCKADDR_IN a;
   Mutex mutex { };
};
