namespace net;

#ifndef ECERE_NONET

#if defined(__WIN32__)

#define WIN32_LEAN_AND_MEAN
#include <winsock.h>
static WSADATA wsaData;

#elif defined(__unix__) || defined(__APPLE__)
default:
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

public class Service
{
public:
   property int port { set { port = value; } get { return port; } };
   property Socket firstClient { get { return sockets.first; } };
   property bool processAlone { get { return processAlone; } set { processAlone = value; } };

   virtual void OnAccept();

   s = -1;

   // --- Services ---

   bool Start()
   {
   #if defined(__WIN32__) || defined(__unix__) || defined(__APPLE__)
      SOCKET s;

   #ifdef DEBUG_SOCKETS
      Log("[P] [NStartService]\n");
   #endif

      s = socket(AF_INET,SOCK_STREAM,0);
      if(s != -1)
      {
         SOCKADDR_IN a;
         bool val = true;

         a.sin_family=AF_INET;
         a.sin_port=htons((uint16)port);
         a.sin_addr.s_addr=INADDR_ANY;
   #ifdef DEBUG_SOCKETS
         Log("Service Socket: %x\n", s);
   #endif

         setsockopt(s, SOL_SOCKET, SO_REUSEADDR, (char *)&val, sizeof(val));
         if(!bind(s,(SOCKADDR *)&a, sizeof(a)))
         {
            if(!listen(s,5))
            {
               // Fix up the links/offsets here...
               network.mutex.Wait();
               network.services.Add(this);
               this.s = s;

               destroyed = false;
               sockets.Clear();

               sockets.offset = (uint)&((Socket)0).prev;

               FD_SET(s, &network.readSet);
               FD_SET(s, &network.exceptSet);
               if(s >= network.ns) 
               {
                  network.ns = s+1;
                  network.socketsSemaphore.Release();
               }
               network.mutex.Release();
               return true;
            }
         }
         closesocket(s);
      }
   #endif
      return false;
   }

   bool Stop(void)
   {
   #if defined(__WIN32__) || defined(__unix__) || defined(__APPLE__)
      SOCKET s = this.s;
      Socket socket;

   #ifdef DEBUG_SOCKETS
      Log("[P] [NStopService]\n");
   #endif

      network.mutex.Wait();
      while((socket = sockets.first))
      {
         socket.Free(false);
         delete socket;
      }
      network.mutex.Release();

      if(s != -1)
      {
         network.mutex.Wait();
         this.s = -1;
         network.services.Remove(this);
         FD_CLR(s, &network.readSet);
         FD_CLR(s, &network.exceptSet);
         network.mutex.Release();
         closesocket(s);
      }

      Network_DetermineMaxSocket();
      return true;
   #endif
      return false;
   }

   bool Process()
   {
      bool gotEvent = false;
      if(s != -1)
      {
         fd_set rs, ws, es;
         int selectResult;
         struct timeval tvTO = {0, 200000};

         FD_ZERO(&rs);
         FD_ZERO(&ws);
         FD_ZERO(&es);
         FD_SET(s, &rs);
         //FD_SET(s, &ws);
         FD_SET(s, &es);

         selectResult = select(s+1, &rs, &ws, &es, &tvTO);
         if(selectResult > 0)
         {
            if(FD_ISSET(s, &rs))
            {
               accepted = false;
               OnAccept();
               if(!accepted)
               {
                  SOCKET s;
                  SOCKADDR_IN a;
                  int addrLen = sizeof(a);
                  s = accept(this.s,(SOCKADDR *)&a,&addrLen);
                  closesocket(s);
               }
               gotEvent |= true;
            }
         }
      }
      return gotEvent;
   }

private:

   Service()
   {
      Network_Initialize();
   }

   ~Service()
   {
      Stop();
   }

   int port;
   Service prev, next;

   SOCKET s;
   OldList sockets;
   bool destroyed;
   bool accepted;
   bool processAlone;
}
#endif
