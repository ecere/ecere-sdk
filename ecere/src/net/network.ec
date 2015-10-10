#define _Noreturn

namespace net;

#ifndef ECERE_NONET

#if defined(__WIN32__)

#define WIN32_LEAN_AND_MEAN
#define String _String
#include <winsock.h>
#undef String
static WSADATA wsaData;

#elif defined(__unix__) || defined(__APPLE__)
default:
#define set _set
#define uint _uint
#include <sys/time.h>
#include <unistd.h>

#include <netinet/in.h>
#include <netdb.h>
#include <sys/select.h>
#include <sys/socket.h>
#include <sys/wait.h>
#include <sys/types.h>
#include <sys/time.h>
#include <arpa/inet.h>
#undef set
#undef uint
typedef int SOCKET;
typedef struct hostent HOSTENT;
typedef struct sockaddr SOCKADDR;
typedef struct sockaddr_in SOCKADDR_IN;
typedef struct in_addr IN_ADDR;
#define closesocket(s) close(s)
private:
#endif

import "GuiApplication"
import "Service"
import "Socket"

private struct NetworkData
{
   // Connections to the outside world
   OldList sockets;
   // Local services
   OldList services;
   // Ongoing Connections
   OldList connectSockets;
   // Socket Sets
   fd_set readSet, writeSet, exceptSet;
   fd_set selectRS, selectWS, selectES;

   int ns;

   // Synchronization Elements
   Thread networkThread;
   Semaphore socketsSemaphore;
   Semaphore selectSemaphore;
   bool networkEvent;
   bool connectEvent;
   bool networkInitialized;
   bool networkTerminated;
   uint errorLevel, lastErrorCode;
   bool leftOverBytes;
   Mutex processMutex;
   Mutex mutex;
   int64 mainThreadID;
   OldList mtSemaphores;
};

#include <errno.h>

NetworkData network;

static class NetworkThread : Thread
{
   uint Main()
   {
      network.mutex.Wait();
      while(!network.networkTerminated)
      {
         int ns = network.ns;

         if(ns)
         {
            struct timeval tv = { 0, 0 }; // TESTING 0 INSTEAD OF (int)(1000000 / 18.2) };

            network.selectRS = network.readSet, network.selectWS = network.writeSet, network.selectES = network.exceptSet;

            network.mutex.Release();
   #ifdef DEBUG_SOCKETS
            Log("[N] Waiting for network event...\n");
   #endif
            if(select(ns, &network.selectRS, &network.selectWS, &network.selectES, &tv))
            {
               network.mutex.Wait();
               network.networkEvent = true;
   #ifdef DEBUG_SOCKETS
               Log("[N] Signaling Network event\n");
   #endif
               guiApp.SignalEvent();
   #ifdef DEBUG_SOCKETS
               Log("[N] Waiting for select semaphore in Network Thread...\n");
   #endif
               network.mutex.Release();
               network.selectSemaphore.Wait();
               network.mutex.Wait();
            }
            else
            {
               ecere::sys::Sleep(1 / 18.2f);
               network.mutex.Wait();
            }
         }
         else
         {
            network.mutex.Release();
            network.socketsSemaphore.Wait();
            network.mutex.Wait();
         }

      }
      network.mutex.Release();
      return 0;
   }
}

void Network_DetermineMaxSocket()
{
   Service service;
   Socket socket;

   network.mutex.Wait();
   network.ns = 0;
   for(socket = network.sockets.first; socket; socket = socket.next)
      if(!socket.processAlone && !socket.destroyed && socket.s >= network.ns)
         network.ns = (int)(socket.s + 1);
   for(socket = network.connectSockets.first; socket; socket = socket.next)
      if(!socket.destroyed && socket.s >= network.ns)
         network.ns = (int)(socket.s + 1);

   for(service = network.services.first; service; service = service.next)
   {
      if(!service.destroyed && !service.processAlone)
      {
         if(service.s >= network.ns)
            network.ns = (int)(service.s + 1);
      }
      for(socket = service.sockets.first; socket; socket = socket.next)
         if(!socket.destroyed && !socket.processAlone && socket.s >= network.ns)
            network.ns = (int)(socket.s + 1);
   }
   network.mutex.Release();
}

// --- Network System ---
#endif

bool Network_Initialize()
{
#ifndef ECERE_NONET
   if(!network.networkInitialized)
   {
#if defined(__WIN32__) || defined(__unix__) || defined(__APPLE__)
      network.networkInitialized = true;
      network.networkTerminated = false;
#if defined(__WIN32__)
      WSAStartup(0x0002, &wsaData);
#endif

      network.services.Clear();

      network.services.offset = (uint)(uintptr)&((Service)0).prev;
      network.sockets.Clear();

      network.sockets.offset = (uint)(uintptr)&((Socket)0).prev;

      network.connectSockets.Clear();
      network.connectSockets.offset = (uint)(uintptr)&((Socket)0).prev;

      FD_ZERO(&network.readSet);
      FD_ZERO(&network.writeSet);
      FD_ZERO(&network.exceptSet);

      network.socketsSemaphore = Semaphore { };
      network.selectSemaphore = Semaphore { };
      network.networkThread = NetworkThread { };
      incref network.networkThread;

      network.errorLevel = 2;

      network.processMutex = Mutex { };
      network.mutex = Mutex { };

      network.mainThreadID = GetCurrentThreadID();

      network.networkThread.Create();
#endif
   }
   return true;
#else
   return false;
#endif
}

void Network_Terminate()
{
#ifndef ECERE_NONET

   if(network.networkInitialized)
   {
#if defined(__WIN32__) || defined(__unix__) || defined(__APPLE__)
      Service service;
      Socket socket;

      guiApp.PauseNetworkEvents();
      network.networkTerminated = true;

      delete network.processMutex;
      delete network.mutex;

      for(socket = network.connectSockets.first; socket; socket = socket.next)
      {
         socket.connectThread.Wait();
         delete socket.connectThread;
      }

      network.socketsSemaphore.Release();
      network.selectSemaphore.Release();

      network.networkThread.Wait();
      delete network.networkThread;

      // Cleanup External network.sockets
      while((socket = network.sockets.first))
      {
         incref socket;
         //network.sockets.Remove(socket); //THIS IS ALREADY DONE IN Socket::Free
         socket.Free(true);
         if(socket._refCount > 1) socket._refCount--;
         delete socket;
      }
      while((socket = network.connectSockets.first))
      {
         //network.connectSockets.Remove(socket); //THIS IS ALREADY DONE IN Socket::Free
         socket.Free(true);
         delete socket;
      }

      // Cleanup network.services
      while((service = network.services.first))
         service.Stop();

      network.ns = 0;

#if defined(__WIN32__)
      WSACleanup();
#endif

      delete network.selectSemaphore;
      delete network.socketsSemaphore;
#endif
#ifdef DEBUG_SOCKETS
      Log("[P] Network System Terminated\n");
#endif
      network.networkInitialized = false;
   }
#endif
}

#ifndef ECERE_NONET

public bool GetAddressFromName(const char * hostName, char * inetAddress)
{
   HOSTENT * host;

   if(!Network_Initialize())
      return false;

   host = gethostbyname(hostName);
   if(host)
   {
      strcpy(inetAddress, inet_ntoa(*((IN_ADDR *)host->h_addr)));
      return true;
   }
   return false;
}

public bool GetNameFromAddress(const char * inetAddress, char * hostName)
{
   struct in_addr in;
   HOSTENT * host;

   if(!Network_Initialize())
      return false;

   in.s_addr = inet_addr(inetAddress);
   host = gethostbyaddr((char *)&in, 4, PF_INET);
   if(host)
   {
      strcpy(hostName, host->h_name);
      return true;
   }
   return false;
}

public bool GetHostName(char * hostName, int size)
{
   if(!Network_Initialize())
      return false;

   return !gethostname(hostName,size);
}

#endif
