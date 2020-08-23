#define _Noreturn

namespace net;

#if defined(__WIN32__)

#define WIN32_LEAN_AND_MEAN
#define String _String
#include <winsock2.h>
#undef String

#elif defined(__unix__) || defined(__APPLE__)

default:
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
import "List"

#if 1 //!defined(__EMSCRIPTEN__)

// SERVER

static enum DCOMPacketType
{
   dcom_CreateInstance        = 3,
   dcom_CallMethod            = 5,
   dcom_CallVirtualMethod     = 6,
   dcom_InstanceCreated       = 9,
   dcom_VirtualMethodReturned = 10,
   dcom_MethodReturned        = 11
};

static class DCOMPacket : Packet
{
   DCOMPacketType type;
};
static class CreateInstancePacket : DCOMPacket
{
   //int classID;
   char className[1];
};

static class ObjectCreatedPacket : DCOMPacket
{
   unsigned int objectID;
};

static class CallMethodPacket : DCOMPacket
{
   int objectID;
   int methodID;
   int callID;
   bool hasReturnValue;
   unsigned int argsSize;
   byte args[1];
};

static class CallVirtualMethodPacket : DCOMPacket
{
   int methodID;
   int callID;
   bool hasReturnValue;
   unsigned int argsSize;
   byte args[1];
};

static class MethodReturnedPacket : DCOMPacket
{
   int methodID;
   int callID;
   unsigned int argsSize;
   byte args[1];
};

static class VirtualMethodReturnedPacket : DCOMPacket
{
   unsigned int objectID;
   unsigned int methodID;
   unsigned int callID;
   bool overridden;
   unsigned int argsSize;
   byte args[1];
};

/*static */class VirtualCallAck : struct
{
public:
   int objectID;
   int methodID;
   int callID;
   bool overridden;

   SerialBuffer buffer { };
}

class CallAck : struct
{
public:
   int objectID;
   int methodID;
   int callID;
   SerialBuffer buffer { };
}

public class DCOMServerObject
{
   VirtualCallAck VirtualCallAcknowledged(int methodID, int objectID, int callID)
   {
      Iterator<VirtualCallAck> it { acks };
      while(it.Next())
      {
         VirtualCallAck ack = it.data;
         if(ack.methodID == methodID && ack.objectID == objectID && ack.callID == callID)
         {
            it.Remove();
            return ack;
         }
      }
      return null;
   }

public:
   Instance instance;

   virtual void CallMethod(unsigned int __ecereMethodID, SerialBuffer __ecereBuffer);

   dllexport bool CallVirtualMethod(unsigned int methodID, bool hasReturnValue)
   {
      bool result = false;

      if(serverSocket && serverSocket.connected)
      {
         int lockCount;
         int64 currentThreadID = GetCurrentThreadID();
         int callID = nextCallID++;
         DCOMServerSocket socket = serverSocket;
         DCOMServerSocket processingSocket;
         unsigned int size = (uint)(uintptr)&((CallVirtualMethodPacket)0).args + argsBuffer.size; // sizeof(class CallVirtualMethodPacket) + virtualsBuffer.size - 1;
         CallVirtualMethodPacket packet = (CallVirtualMethodPacket)new0 byte[size];
         VirtualCallAck ack = null;

         if(currentThreadID == (int64)serverSocket.thread.id)
            processingSocket = serverSocket;
         else
         {
            processingSocket = null;
            if(serverSocket.service)
            {
               Socket next;
               for(processingSocket = serverSocket.service.sockets.first;
                   processingSocket;
                   processingSocket = (DCOMServerSocket)next)
               {
                  next = processingSocket.next;
                  if(processingSocket.connected &&
                     (int64)processingSocket.thread.id == currentThreadID)
                     break;
               }
            }
         }

         packet.type = (DCOMPacketType)htoled((DCOMPacketType)dcom_CallVirtualMethod);
         packet.size = size;
         packet.callID = callID;
         packet.methodID = htoled(methodID);
         packet.hasReturnValue = hasReturnValue;
         packet.argsSize = htoled(argsBuffer.size);
         argsBuffer.ReadData(packet.args, argsBuffer.size);
         argsBuffer.Free();

         serverSocket.SendPacket(packet);
         delete packet;

         socket._refCount += 2;
         if(processingSocket)
            processingSocket._refCount += 2;

         incref this;

         while(true && hasReturnValue)
         {
            if(!serverSocket || !serverSocket.connected || !serverSocket.thread)
               break;
            if((ack = VirtualCallAcknowledged(methodID, id, callID)))
               break;

            lockCount = guiApp.UnlockEx();
            mutex.Release();
            if(processingSocket && processingSocket.connected)
               processingSocket.ProcessTimeOut(0.01);
            else
               ecere::sys::Sleep(0.01);//serverSocket.thread.semaphore.Wait();
            guiApp.LockEx(lockCount);
            mutex.Wait();
         }

         if(ack)
         {
            result = ack.overridden;
            returnBuffer.WriteData(ack.buffer.buffer, ack.buffer.count);
            delete ack;
         }
         else if(!hasReturnValue)
            result = true;

         lockCount = guiApp.UnlockEx();
         mutex.Release();

         if(socket._refCount > 1)
            socket._refCount--;
         delete socket;

         if(processingSocket && processingSocket._refCount > 1)
            processingSocket._refCount--;
         delete processingSocket;

         guiApp.LockEx(lockCount);
         mutex.Wait();

         if(_refCount > 1)
            _refCount--;
      }
      return result;
   }
// private:
   DCOMServerSocket serverSocket;
   unsigned int id;
   SerialBuffer argsBuffer { };
   SerialBuffer returnBuffer { };
   private List<VirtualCallAck> acks { };
   Mutex mutex { };
   int nextCallID;

   nextCallID = GetRandom(1, 999999);//100;

   ~DCOMServerObject()
   {
      acks.Free();
   }
};

#define GETLEDWORD(b) (uint32)(((b)[3] << 24) | ((b)[2] << 16) | ((b)[1] << 8) | (b)[0])

#define PUTLEDWORD(b, d) \
   (b)[3] = (byte)(((d) >> 24) & 0xFF); \
   (b)[2] = (byte)(((d) >> 16) & 0xFF); \
   (b)[1] = (byte)(((d) >> 8)  & 0xFF); \
   (b)[0] = (byte)( (d)        & 0xFF);

static uint32 htoled(uint32 value)
{
   uint32 result;
   PUTLEDWORD((byte *)&result, value);
   return result;
}

static uint32 letohd(uint32 value)
{
   return GETLEDWORD((byte *)&value);
}

class DCOMServerThread : Thread
{
   DCOMServerSocket socket;
   Semaphore semaphore { };
   bool connected;

   unsigned int Main()
   {
      incref socket;
      incref socket;
      while(connected)
      {
         socket.ProcessTimeOut(0.01);
         guiApp.Lock();
         socket.ProcessCalls();
         guiApp.Unlock();
         semaphore.Release();
      }
      // TOCHECK: Why isn't the first incref enough?
      socket._refCount--;
      delete socket;
      return 0;
   }
};

class DCOMClientThread : Thread
{
   Socket socket;
   Semaphore semaphore { };
   bool connected;
   unsigned int Main()
   {
      socket.mutex.Wait();
      socket._refCount += 2;
      socket.mutex.Release();
      while(connected)
      {
         socket.ProcessTimeOut(0.01);
         semaphore.Release();
      }
      socket.mutex.Wait();
      if(socket._refCount > 1)
         socket._refCount--;
      socket.mutex.Release();
      delete socket;
      return 0;
   }
};

/*static */public class DCOMServerSocket : Socket
{
   int numObjects;
   DCOMServerObject * objects;
   processAlone = true;
   DCOMServerThread thread
   {
      socket = this, connected = true;
   };
   List<CallMethodPacket> calls { };
   bool processingCalls;

   void ProcessCalls()
   {
      CallMethodPacket callMethod;
      Iterator <CallMethodPacket> it { calls };
      while(true)
      {
         mutex.Wait();
         it.pointer = null;
         if(!it.Next() || disconnected)
         {
            mutex.Release();
            break;
         }
         callMethod = it.data;
         it.Remove();
         processingCalls = true;
         mutex.Release();

         if(callMethod.objectID < numObjects /*&& callMethod.methodID < numMethods*/)
         {
            DCOMServerObject object = objects[callMethod.objectID];
            bool hasReturnValue = callMethod.hasReturnValue; //true;
            MethodReturnedPacket packet;
            unsigned int size;
            SerialBuffer buffer { };
            int methodID = callMethod.methodID;
            int callID = callMethod.callID;

            buffer.WriteData(callMethod.args, callMethod.argsSize);

            if(!hasReturnValue)
            {
               /*
               size = (uint)(uintptr)&((MethodReturnedPacket)0).args;
               packet = (MethodReturnedPacket)new0 byte[size];
               packet.type = (DCOMPacketType)htoled((DCOMPacketType)dcom_MethodReturned);
               packet.size = size;
               packet.callID = callMethod.callID;
               packet.methodID = callMethod.methodID;
               packet.argsSize = 0;
               SendPacket(packet);
               */
            }

            incref object;

            // TOFIX: Hardcoded VTBL ID
            ((void (*)(void *, uint, SerialBuffer))(void *)object._vTbl[10])(object, methodID, buffer);

            if(hasReturnValue)
            {
               size = (uint)(uintptr)&((MethodReturnedPacket)0).args + buffer.size; // sizeof(class MethodReturnedPacket) + buffer.size - 1;
               packet = (MethodReturnedPacket)new0 byte[size];
               packet.type = (DCOMPacketType)htoled((DCOMPacketType)dcom_MethodReturned);
               packet.size = size;
               packet.callID = callID;
               packet.methodID = methodID;
               packet.argsSize = htoled(buffer.size);
               buffer.ReadData(packet.args, buffer.size);
               SendPacket(packet);
            }
            delete buffer;
            delete packet;

            if(object._refCount > 1)
               object._refCount--;
         }
         delete callMethod;
         mutex.Wait();
         processingCalls = false;
         mutex.Release();
      }
   }

   void OnReceivePacket(DCOMPacket packet)
   {
      guiApp.Lock();
      switch((DCOMPacketType)letohd(packet.type))
      {
         case dcom_CreateInstance:
         {
            CreateInstancePacket createInstance = (CreateInstancePacket)packet;
            Class _class = eSystem_FindClass(__thisModule.application, createInstance.className);
            Class runClass = eSystem_FindClass(__thisModule.application, createInstance.className + 4);
            DCOMServerObject object;
            int vid;

            if(!_class)
               _class = eSystem_FindClass(runClass.module, createInstance.className);

            objects = renew objects DCOMServerObject[numObjects+1];
            object = objects[numObjects] = eInstance_New(_class);
            incref object;
            object.serverSocket = this;
            object.id = numObjects++;
            object.instance = eInstance_New(runClass);
            incref object.instance;
            object.instance._vTbl = new void *[object.instance._class.vTblSize + 1];
            object.instance._vTbl++;
            object.instance._vTbl[-1] = (void *)object;
            memcpy(object.instance._vTbl, object.instance._class._vTbl, sizeof(int(*)()) * object.instance._class.vTblSize);
            for(vid = runClass.base.vTblSize; vid < runClass.vTblSize; vid++)
            {
               object.instance._vTbl[vid] = object._vTbl[vid - runClass.base.vTblSize + 11];
            }

            {
               ObjectCreatedPacket sendPacket = ObjectCreatedPacket { };
               sendPacket.type = (DCOMPacketType)htoled((DCOMPacketType)dcom_InstanceCreated);
               sendPacket.size = sizeof(class ObjectCreatedPacket);
               sendPacket.objectID = htoled(object.id);
               SendPacket(sendPacket);
               delete sendPacket;
            }
            break;
         }
         case dcom_CallMethod:
         {
            CallMethodPacket p;
            CallMethodPacket callMethod = (CallMethodPacket)packet;
            callMethod.objectID = letohd(callMethod.objectID);
            callMethod.argsSize = letohd(callMethod.argsSize);
            mutex.Wait();
            p = (CallMethodPacket)new byte[callMethod.size];
            memcpy(p, callMethod, callMethod.size);
            calls.Add(p);
            mutex.Release();
            break;
         }
         case dcom_VirtualMethodReturned:
         {
            VirtualMethodReturnedPacket methodReturned = (VirtualMethodReturnedPacket)packet;
            if(methodReturned.objectID < numObjects)
            {
               DCOMServerObject object = objects[methodReturned.objectID];
               VirtualCallAck ack
               {
                  methodReturned.objectID,
                  methodReturned.methodID,
                  methodReturned.callID,
                  methodReturned.overridden
               };
               ack.buffer.WriteData(methodReturned.args, letohd(methodReturned.argsSize));
               mutex.Wait();
               object.acks.Add(ack);
               mutex.Release();
            }
            break;
         }
      }
      guiApp.Unlock();
   }

   void OnDisconnect(int code)
   {
      guiApp.Lock();
      thread.connected = false;
      guiApp.Unlock();
      if(thread.started && GetCurrentThreadID() != (int64)thread.id)
         thread.Wait();
   }

   ~DCOMServerSocket()
   {
      int c;
      guiApp.Lock();
      mutex.Wait();
      for(c = 0; c<numObjects; c++)
      {
         objects[c].instance._vTbl--;
         delete objects[c].instance._vTbl;
         objects[c].instance._vTbl = objects[c].instance._class._vTbl;
         delete objects[c].instance;
         delete objects[c];
      }
      delete objects;
      mutex.Release();
      guiApp.Unlock();
   }
};

class DCOMServiceThread : Thread
{
   DCOMService service;
   bool connected;
   unsigned int Main()
   {
      DCOMService service = this.service;
      incref service;
      while(connected)
      {
         service.Process();
      }
      delete service;
      return 0;
   }
};

public class DCOMService : Service
{
   port = 3114;
   processAlone = true;
   DCOMServiceThread thread
   {
      service = this, connected = true;
   };
   ~DCOMService()
   {
      if(thread.started && GetCurrentThreadID() != (int64)thread.id)
         thread.Wait();
   }

   public bool Start()
   {
      bool result = Service::Start();
      if(result)
      {
         thread.connected = true;
         thread.Create();
      }
      return result;
   }

   public bool Stop()
   {
      bool result = true;
      thread.connected = false;
      result = Service::Stop();
      if(thread.started && GetCurrentThreadID() != (int64)thread.id)
         thread.Wait();
      return result;
   }

   void OnAccept()
   {
      DCOMServerSocket socket { };
      incref socket;
      socket.service = this;
      if(socket.connected)
         socket.thread.Create();
      delete socket;
   }
};

// CLIENT
public class DCOMClientObject : Socket
{
   CallAck CallAcknowledged(int methodID, int objectID, int callID)
   {
      Iterator<CallAck> it { acks };
      while(it.Next())
      {
         CallAck ack = it.data;
         if(ack.methodID == methodID && ack.objectID == objectID && ack.callID == callID)
         {
            it.Remove();
            return ack;
         }
      }
      return null;
   }

public:
   unsigned int objectID;
   bool answered;
   SerialBuffer __ecereBuffer { };
   private List<CallAck> acks { };
   int nextCallID;

   nextCallID = GetRandom(1, 999999);

   processAlone = true;
   private DCOMClientThread thread
   {
      socket = this, connected = true;
   };

   bool Connect(const char * server, int port)
   {
      bool result = false;
      if(Socket::Connect(server, port))
      {
         int lockCount;
         int len = (int)(strlen(_class.name) + 4 - strlen("DCOMClient_"));
         unsigned int size = sizeof(class CreateInstancePacket) + len;
         CreateInstancePacket packet = (CreateInstancePacket)new0 byte[size];
         packet.type = (DCOMPacketType)htoled((DCOMPacketType)dcom_CreateInstance);
         packet.size = size;
         CopyBytes(packet.className, "DCOM", 4);
         CopyBytes(packet.className + 4, _class.name + strlen("DCOMClient_"), len-4+1);
         answered = false;
         SendPacket(packet);
         delete packet;
         thread.socket = this;
         thread.connected = true;
         thread.Create();
         lockCount = guiApp.UnlockEx();
         while(!answered && thread && connected)
         {
            //guiApp.WaitNetworkEvent();
            //guiApp.ProcessNetworkEvents();
            // Process();

            if(GetCurrentThreadID() == (int64)thread.id)
               Process();
            else
               thread.semaphore.Wait();
         }
         guiApp.LockEx(lockCount);
         result = connected;
      }
      return result;
   }

   virtual void CallVirtualMethod(unsigned int __ecereMethodID, SerialBuffer __ecereBuffer);

   void OnReceivePacket(DCOMPacket p)
   {
      guiApp.Lock();
      if(connected)
      {
         switch((DCOMPacketType)letohd(p.type))
         {
            case dcom_InstanceCreated:
            {
               ObjectCreatedPacket packet = (ObjectCreatedPacket)p;
               objectID = letohd(packet.objectID);
               answered = true;
               break;
            }
            case dcom_MethodReturned:
            {
               MethodReturnedPacket packet = (MethodReturnedPacket)p;
               CallAck ack
               {
                  objectID,
                  packet.methodID,
                  packet.callID
               };
               ack.buffer.WriteData(packet.args, letohd(packet.argsSize));
               acks.Add(ack);
               break;
            }
            // Virtual Method Called
            case dcom_CallVirtualMethod:
            {
               CallVirtualMethodPacket callMethod = (CallVirtualMethodPacket)p;
               VirtualMethodReturnedPacket packet = null;
               unsigned int size = (uint)(uintptr)&((VirtualMethodReturnedPacket)0).args; // sizeof(class VirtualMethodReturnedPacket);
               SerialBuffer buffer { };
               bool hasReturnValue = callMethod.hasReturnValue;
               int methodID = callMethod.methodID;
               int callID = callMethod.callID;
               // TOFIX: Hardcoded VTBL ID
               bool overridden = _vTbl[18 + methodID] != _class._vTbl[18 + methodID];
               callMethod.argsSize = letohd(callMethod.argsSize);

               if(!hasReturnValue)
               {
                  packet = (VirtualMethodReturnedPacket)new0 byte[size];
                  packet.overridden = overridden;
                  packet.objectID = objectID;
                  packet.methodID = methodID;
                  packet.callID = callID;
                  packet.type = (DCOMPacketType)htoled((DCOMPacketType)dcom_VirtualMethodReturned);
                  packet.size = size;
                  packet.argsSize = 0;
                  SendPacket(packet);
               }

               if(overridden)
               {
                  buffer.WriteData(callMethod.args, callMethod.argsSize);

                  // TOFIX: Hardcoded VTBL ID
                  ((void (*)(void *, uint, SerialBuffer))(void *)_vTbl[17])(this, callMethod.methodID, buffer);

                  // WARNING: callMethod packet is invalidated !!!

                  size += buffer.size; // - 1;
               }
               if(hasReturnValue)
               {
                  packet = (VirtualMethodReturnedPacket)new0 byte[size];
                  packet.overridden = overridden;
                  packet.objectID = objectID;
                  packet.methodID = methodID;
                  packet.callID = callID;
                  packet.type = (DCOMPacketType)htoled((DCOMPacketType)dcom_VirtualMethodReturned);
                  packet.size = size;
                  packet.argsSize = htoled(buffer.size);
                  buffer.ReadData(packet.args, buffer.size);
                  SendPacket(packet);
               }
               delete buffer;
               delete packet;
               break;
            }
         }
      }
      guiApp.Unlock();
   }

   void OnDisconnect(int code)
   {
      if(thread)
         thread.connected = false;
      answered = true; //2;
   }

   dllexport bool CallMethod(unsigned int methodID, bool hasReturnValue)
   {
      bool result = false;
      if(this && connected)
      {
         CallAck ack = null;
         int callID = nextCallID++;
         unsigned int size = (uint)(uintptr)&((CallMethodPacket)0).args + __ecereBuffer.size; // sizeof(class CallMethodPacket) + __ecereBuffer.size - 1;
         CallMethodPacket packet = (CallMethodPacket)new0 byte[size];
         packet.type = (DCOMPacketType)htoled((DCOMPacketType)dcom_CallMethod);
         packet.size = size;
         packet.hasReturnValue = hasReturnValue;
         packet.objectID = htoled(objectID);
         packet.methodID = htoled(methodID);
         packet.callID = callID;
         packet.argsSize = htoled(__ecereBuffer.size);
         __ecereBuffer.ReadData(packet.args, __ecereBuffer.size);
         SendPacket(packet);
         delete packet;

         while(hasReturnValue && true)
         {
            int lockCount;
            if(!thread || !connected)
               break;
            if((ack = CallAcknowledged(methodID, objectID, callID)))
               break;
            lockCount = guiApp.UnlockEx();

            //guiApp.WaitNetworkEvent();
            //guiApp.ProcessNetworkEvents();
            //Process();
            mutex.Release();
            if(GetCurrentThreadID() == (int64)thread.id)
               ProcessTimeOut(0.01);
            else
               ecere::sys::Sleep(0.01);//thread.semaphore.Wait();
            mutex.Wait();
            guiApp.LockEx(lockCount);
         }

         //if(ack)
         {
            __ecereBuffer.Free();
            if(ack)
               __ecereBuffer.WriteData(ack.buffer.buffer, ack.buffer.count);
            delete ack;
            result = true;
         }
      }
      return result;
   }

   ~DCOMClientObject()
   {
      if(thread.started)
      {
         if(GetCurrentThreadID() != (int64)thread.id)
            thread.Wait();
      }
      acks.Free();
   }
};

// A class to make set of things happen atomically
// e.g. to send a bunch of notifications all at once,
// without anything else happening in between
public class DCOMSendControl
{
   bool sendingOut;
public:
   void Stop()
   {
      while(sendingOut) { int lockCount = guiApp.UnlockEx(); ecere::sys::Sleep(0.01); guiApp.LockEx(lockCount); }
      sendingOut = true;
   }

   void Resume()
   {
      sendingOut = false;
   }
}

#endif // !defined(__EMSCRIPTEN__)
