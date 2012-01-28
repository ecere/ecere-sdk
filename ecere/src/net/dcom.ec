namespace net;

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
   unsigned int argsSize;
   byte args[1];
};

static class CallVirtualMethodPacket : DCOMPacket
{
   int methodID;
   unsigned int argsSize;
   byte args[1];
};

static class MethodReturnedPacket : DCOMPacket
{
   unsigned int argsSize;
   byte args[1];
};

static class VirtualMethodReturnedPacket : DCOMPacket
{
   unsigned int objectID;
   bool overridden;
   unsigned int argsSize;
   byte args[1];
};

public class DCOMServerObject
{
public:
   Instance instance;

   virtual void CallMethod(unsigned int __ecereMethodID, SerialBuffer __ecereBuffer);

   dllexport bool CallVirtualMethod(unsigned int methodID)
   {
      guiApp.Unlock();
      if(serverSocket && serverSocket.connected)
      {
         unsigned int size = (uint)&((CallVirtualMethodPacket)0).args + virtualsBuffer.size; // sizeof(class CallVirtualMethodPacket) + virtualsBuffer.size - 1;
         CallVirtualMethodPacket packet = (CallVirtualMethodPacket)new0 byte[size];
         packet.type = (DCOMPacketType)htoled((DCOMPacketType)dcom_CallVirtualMethod);
         packet.size = size;
         packet.methodID = htoled(methodID);
         packet.argsSize = htoled(virtualsBuffer.size);
         virtualsBuffer.ReadData(packet.args, virtualsBuffer.size);
         answered = false;

         serverSocket.SendPacket(packet);
         delete packet;

         while(serverSocket && !answered)
         {
            if(GetCurrentThreadID() == serverSocket.thread.id)
               serverSocket.Process();
            else
               serverSocket.thread.semaphore.Wait();
         }
         guiApp.Lock();
         return overridden == true;
      }
      guiApp.Lock();
      return false;
   }
// private:
   DCOMServerSocket serverSocket;
   unsigned int id;
   SerialBuffer buffer { };
   SerialBuffer virtualsBuffer { };
   bool answered, overridden;
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
   Socket socket;
   Semaphore semaphore { };
   bool connected;
   unsigned int Main()
   {
      incref socket;
      while(connected)
      {
         socket.Process();
         semaphore.Release();
      }
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
      incref socket;
      while(connected)
      {
         socket.Process();
         semaphore.Release();
      }
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
            object.serverSocket = this;
            object.id = numObjects++;
            object.instance = eInstance_New(runClass);   
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
            CallMethodPacket callMethod = (CallMethodPacket)packet;
            callMethod.objectID = letohd(callMethod.objectID);
            callMethod.argsSize = letohd(callMethod.argsSize);
            if(callMethod.objectID < numObjects /*&& callMethod.methodID < numMethods*/)
            {
               DCOMServerObject object = objects[callMethod.objectID];

               MethodReturnedPacket packet;
               unsigned int size;
               SerialBuffer buffer = object.buffer;

               buffer.WriteData(callMethod.args, callMethod.argsSize);
               // TOFIX: Hardcoded VTBL ID
               object._vTbl[10](object, callMethod.methodID, buffer);

               size = (uint)&((MethodReturnedPacket)0).args + buffer.size; // sizeof(class MethodReturnedPacket) + buffer.size - 1;
               packet = (MethodReturnedPacket)new0 byte[size];
               packet.type = (DCOMPacketType)htoled((DCOMPacketType)dcom_MethodReturned);
               packet.size = size;
               packet.argsSize = htoled(buffer.size);
               buffer.ReadData(packet.args, buffer.size);
               buffer.Free();
               SendPacket(packet);
               delete packet;
            }
            break;
         }
         case dcom_VirtualMethodReturned:
         {
            VirtualMethodReturnedPacket methodReturned = (VirtualMethodReturnedPacket)packet;
            if(methodReturned.objectID < numObjects)
            {
               DCOMServerObject object = objects[methodReturned.objectID];
               object.virtualsBuffer.WriteData(methodReturned.args, letohd(methodReturned.argsSize));
               object.answered = true;
               object.overridden = methodReturned.overridden;
            }
            break;
         }
      }
      guiApp.Unlock();
   }

   void OnDisconnect(int code)
   {
      int c;
      guiApp.Lock();
      thread.connected = false;
      for(c = 0; c<numObjects; c++)
      {
         objects[c].instance._vTbl--;
         delete objects[c].instance._vTbl;
         delete objects[c].instance;
         delete objects[c];         
      }
      delete objects;
      guiApp.Unlock();
   }

   ~DCOMServerSocket()
   {
      if(thread.started && GetCurrentThreadID() != thread.id)
         thread.Wait();
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
      if(thread.started && GetCurrentThreadID() != thread.id)
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
      bool result;
      DCOMServerSocket socket;
      thread.connected = false;
      result = Service::Stop();
      if(thread.started && GetCurrentThreadID() != thread.id)
         thread.Wait();
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
public:
   unsigned int objectID;
   bool answered;
   SerialBuffer __ecereBuffer { };
   SerialBuffer virtualsBuffer { };
   processAlone = true;
   private DCOMClientThread thread
   {
      socket = this, connected = true;
   };

   bool Connect(char * server, int port)
   {
      bool result = false;
      if(Socket::Connect(server, port))
      {
         int len = strlen(_class.name) + 4 - strlen("DCOMClient_");
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
         guiApp.Unlock();
         while(!answered && thread)
         {
            //guiApp.WaitNetworkEvent();
            //guiApp.ProcessNetworkEvents();
            // Process();

            if(GetCurrentThreadID() == thread.id)
               Process();
            else
               thread.semaphore.Wait();
         }
         guiApp.Lock();
         result = true;
      }
      return result;
   }

   virtual void CallVirtualMethod(unsigned int __ecereMethodID, SerialBuffer __ecereBuffer);

   void OnReceivePacket(DCOMPacket p)
   {
      guiApp.Lock();
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
            __ecereBuffer.WriteData(packet.args, letohd(packet.argsSize));
            answered = true;
            break;
         }
         // Virtual Method Called
         case dcom_CallVirtualMethod:
         {
            CallVirtualMethodPacket callMethod = (CallVirtualMethodPacket)p;
            VirtualMethodReturnedPacket packet;
            unsigned int size = (uint)&((VirtualMethodReturnedPacket)0).args; // sizeof(class VirtualMethodReturnedPacket);
            SerialBuffer buffer = virtualsBuffer;
            // TOFIX: Hardcoded VTBL ID
            bool overridden = _vTbl[18 + callMethod.methodID] != _class._vTbl[18 + callMethod.methodID];
            callMethod.argsSize = letohd(callMethod.argsSize);
            if(overridden)
            {
               buffer.WriteData(callMethod.args, callMethod.argsSize);
               // TOFIX: Hardcoded VTBL ID
               _vTbl[17](this, callMethod.methodID, buffer);
               size += buffer.size; // - 1;
            }
            packet = (VirtualMethodReturnedPacket)new0 byte[size];
            packet.overridden = overridden;
            packet.objectID = objectID;
            packet.type = (DCOMPacketType)htoled((DCOMPacketType)dcom_VirtualMethodReturned);
            packet.size = size;
            packet.argsSize = htoled(buffer.size);
            buffer.ReadData(packet.args, buffer.size);
            buffer.Free();
            SendPacket(packet);
            delete packet;
            break;
         }
      }
      guiApp.Unlock();
   }

   void OnDisconnect(int code)
   {
      if(thread)
         thread.connected = false;
      answered = 2;
   }

   dllexport bool CallMethod(unsigned int methodID)
   {
      guiApp.Unlock();
      if(connected)
      {
         unsigned int size = (uint)&((CallMethodPacket)0).args + __ecereBuffer.size; // sizeof(class CallMethodPacket) + __ecereBuffer.size - 1;
         CallMethodPacket packet = (CallMethodPacket)new0 byte[size];
         packet.type = (DCOMPacketType)htoled((DCOMPacketType)dcom_CallMethod);
         packet.size = size;
         packet.objectID = htoled(objectID);
         packet.methodID = htoled(methodID);
         packet.argsSize = htoled(__ecereBuffer.size);
         __ecereBuffer.ReadData(packet.args, __ecereBuffer.size);
         answered = false;
         SendPacket(packet);
         delete packet;

         while(!answered && thread)
         {
            //guiApp.WaitNetworkEvent();
            //guiApp.ProcessNetworkEvents();
            //Process();
            if(GetCurrentThreadID() == thread.id)
               Process();
            else
               thread.semaphore.Wait();
         }
         return answered == true;
      }
      guiApp.Lock();
      return false;
   }

   ~DCOMClientObject()
   {
      if(thread.started)
      {
         if(GetCurrentThreadID() != thread.id)
            thread.Wait();
      }
   }
};
