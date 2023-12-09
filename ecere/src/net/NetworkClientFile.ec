#define _Noreturn

namespace net;

// NOTE: These definitions are currently necessary for defining FileServerConnection class
//       inheriting from Socket. Because of lack of "static" members SOCKADDR_IN a; gets
//       re-declared here.
#ifndef ECERE_NONET

#if defined(__WIN32__)

#define WIN32_LEAN_AND_MEAN
#define String _String
#include <winsock2.h>
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

typedef struct sockaddr_in SOCKADDR_IN;

#endif


import "network"

#define PUTXDWORD(b, d) \
   (b)[0] = (byte)(((d) >> 24) & 0xFF); \
   (b)[1] = (byte)(((d) >> 16) & 0xFF); \
   (b)[2] = (byte)(((d) >> 8)  & 0xFF); \
   (b)[3] = (byte)( (d)        & 0xFF);
#define XDWORD(d) \
   { \
      (byte)(((d) >> 24) & 0xFF), \
      (byte)(((d) >> 16) & 0xFF), \
      (byte)(((d) >> 8)  & 0xFF), \
      (byte)((d)         & 0xFF) \
   }
#define GETXDWORD(b) (uint32)(((b)[0] << 24) | ((b)[1] << 16) | ((b)[2] << 8) | (b)[3])

/*
#define PACKET_SIZE     6 * 1024 * 1024 //65536 //16384
#define MAXBUFFERSIZE   6 * 1024 * 1024 //104867572
#define BUFFER_SIZE     6 * 1024 * 1024 //65536 * 8 //16384 * 8 //5001265536
*/

#define MAXBUFFERSIZE   1024*1024
#define PACKET_SIZE     65530 //131072
#define BUFFER_SIZE     PACKET_SIZE * 8

// Packets sent from Client to Server
static struct NetworkClientPacket
{
   byte type[4];
   byte size[4];
};

static class OpenPacket : NetworkClientPacket
{
   byte fileNameLen[4];
   char fileName[1]; // Rest follows, null terminated
};

static struct ClosePacket : NetworkClientPacket
{
   byte handle[4];
};

static struct ReadPacket : NetworkClientPacket
{
   byte handle[4];
   byte readStart[4];
   byte readSize[4];
};

static struct SizePacket : NetworkClientPacket
{
   byte handle[4];
};

static class NetDataBlock : struct
{
   NetDataBlock prev, next;
   uint start, end;
};

static enum NetworkClientPacketType { open, close, read, getSize };

static class Request : struct
{
   Request prev, next;
   uint numBytes;
   void (* CallBack)(Request request, const byte * buffer);

   NetworkClientFile file;
   Semaphore semaphore;
   uint readStart, readSize;

   void ReadCallback(const byte * buffer)
   {
      NetworkClientFile file = this.file;
      FileServerConnection connection = file.connection;
      connection.mutex.Wait();
      {
         // Check where this goes in the buffer
         int64 overlap = file.position + file.bufferCount - (int)readStart;
         int64 bytesToRead = numBytes - (int)overlap;

         // Make an exception if this is an actual read (it's been waited on...)
         if(!semaphore)
            bytesToRead = Min(bytesToRead, MAXBUFFERSIZE - (int)file.bufferCount);

         if(bytesToRead > 0)
         {
            if(file.bufferSize < file.bufferCount + bytesToRead)
            {
               file.buffer = renew file.buffer byte[file.bufferCount + bytesToRead];
               file.bufferSize = file.bufferCount + bytesToRead;
            }
            memcpy(file.buffer + file.bufferCount, buffer + overlap, bytesToRead);
            file.bufferCount += bytesToRead;
         }

         // Request some more data!
         if(file.bufferCount < BUFFER_SIZE)
         {
            // Don't do it if we know it's passed end of file
            if(numBytes)
               file.ReadMoreData(file.position + file.bufferCount, PACKET_SIZE, false);
         }

         if(semaphore)
            // This request is being waited on... we can't free it yet
            semaphore.Release();
         else
            delete this;
      }
      connection.mutex.Release();
   }

   void ReadResultCallback(const byte * buffer)
   {
      NetworkClientFile file = this.file;
      file.connection.mutex.Wait();
      // Reuse this request, reinsert it at the head
      file.connection.requests.Insert(null, this);
      numBytes = GETXDWORD(buffer);
      CallBack = ReadCallback;

      file.connection.mutex.Release();
   }

   void SizeCallback(const byte * buffer)
   {
      readSize = GETXDWORD(buffer);
      semaphore.Release();
   }

   void OpenCallback(const byte * buffer)
   {
      file.handle = GETXDWORD(buffer);
      semaphore.Release();
   }
};

class FileClientThread : Thread
{
   FileServerConnection socket;
   uint Main()
   {
      while(!terminate)
      {
         //guiApp.WaitNetworkEvent();
         //guiApp.ProcessNetworkEvents();
         socket.Process();
      }
      return 0;
   }
   bool terminate;
}

public class NetworkClientFile : File
{
   // The only guys who will be moving where the buffer data is mapped to the file are Read or Seek!
   uintsize Read(byte * buffer, uintsize size, uintsize count)
   {
      FileServerConnection connection = this.connection;
      uintsize bytesRead = 0;

      count *= size;

      connection.mutex.Wait();

      // buffer is always data at virtual position in the file
      // position is virtual position in the file
      bytesRead = bufferCount;
      if(bytesRead < count)
      {
         connection.mutex.Release();
         // Here we are missing (count - bytesRead) bytes starting at file->position
         // ReadMoreData(position + bufferCount, (count - bufferCount), true);
         ReadMoreData(position + bufferCount, (Max(count, BUFFER_SIZE) - bufferCount), true);
         connection.mutex.Wait();
      }
      bytesRead = Min(count, bufferCount);

      memcpy(buffer, this.buffer, bytesRead);
      memcpy(this.buffer, this.buffer + bytesRead, bufferCount - bytesRead);
      bufferCount -= bytesRead;
      position += bytesRead;

      connection.mutex.Release();
      return bytesRead;
   }

   uintsize Write(const byte * buffer, uintsize size, uintsize count)
   {
      return 0;
   }

   bool Getc(char * ch)
   {
      return 0;
   }

   bool Putc(char ch)
   {
      return 0;
   }

   bool Puts(const char * string)
   {
      return 0;
   }

   bool Seek(int64 pos, FileSeekMode mode)
   {
      uint64 newPosition = position;
      switch(mode)
      {
         case start:
            newPosition = pos;
            break;
         case current:
            newPosition += pos;
            break;
         case end:
         {
            // Get size of file
            connection.mutex.Wait();
            {
               Request request = connection.AddRequest(4, Request::SizeCallback, this, true);
               connection.SendSizePacket(handle);
               connection.mutex.Release();
               request.semaphore.Wait();
               connection.mutex.Wait();
               delete request.semaphore;
               newPosition = request.readSize;
               delete request;
            }
            connection.mutex.Release();
            break;
         }
      }
      if(newPosition != position)
      {
         if(newPosition > position && newPosition < position + bufferCount)
         {
            memcpy(buffer, buffer + newPosition - position, bufferCount - (newPosition - position));
            bufferCount -= (newPosition - position);
         }
         else
            bufferCount = 0;
         position = newPosition;
      }
      return true;
   }

   uint64 Tell()
   {
      return position;
   }

   bool Eof()
   {
      return false;
   }

   uint64 GetSize()
   {
      uint size;
      connection.mutex.Wait();
      {
         Request request = connection.AddRequest(4, Request::SizeCallback, this, true);
         connection.SendSizePacket(handle);
         connection.mutex.Release();
         request.semaphore.Wait();
         connection.mutex.Wait();
         delete request.semaphore;
         size = request.readSize;
         delete request;
      }
      connection.mutex.Release();
      return size;
   }

   // Returns the last request needed to fill this needed size
   Request FigureOutMissingData(uint64 * start, uint64 * size)
   {
      Request lastRequest = null;
      FileServerConnection connection = this.connection;
      OldList blocks { };
      Request request;
      NetDataBlock block { };

      blocks.Add(block);

      // Initialize block to what we need
      block.start = (uint)*start;
      block.end = (uint)(*start + *size - 1);

      for(request = connection.requests.first; request; request = request.next)
      {
         if(request.file == this &&
            (request.CallBack == Request::ReadResultCallback || request.CallBack == Request::ReadCallback))
         {
            // If this request overlap with the entire block of data we need
            if(*start + *size >= request.readStart &&
               *start + *size < request.readStart + request.readSize)
            {
               NetDataBlock next;
               for(block = blocks.first; block; block = next)
               {
                  next = block.next;
                  // If this block overlap with this request
                  if(request.readStart                     < block.end &&
                     request.readStart + request.readSize >= block.start)
                  {
                     // We have all this block, get rid of it
                     if(request.readStart <= block.start &&
                        request.readStart + request.readSize > block.end)
                        blocks.Delete(block);
                     // We're missing data at the end of this block
                     else if(request.readStart <= block.start)
                        block.start = request.readStart;
                     // We're missing data at the beginning of this block
                     else if(request.readStart + request.readSize > block.end)
                        block.end = request.readStart + request.readSize-1;
                     lastRequest = request;
                  }
               }
            }
         }
      }

      if(blocks.first)
      {
         // We still need data
         *start = ((NetDataBlock)blocks.first).start;
         *size = ((NetDataBlock)blocks.last).end - *start + 1;

         blocks.Free(null); // eList_Delete(&blocks, NULL); ??
      }
      else
         *size = 0;
      return lastRequest;
   }

   void ReadMoreData(uint64 start, uint64 size, bool wait)
   {
      FileServerConnection connection = this.connection;
      Request lastRequestNeeded;

      // If it's not already requested, request it
      connection.mutex.Wait();
      lastRequestNeeded = FigureOutMissingData(&start, &size);
      // If we still need to request more
      if(size)
      {
         Request request = connection.AddRequest(4, Request::ReadResultCallback, this, wait);
         request.readStart = (uint)start;
         request.readSize = (uint)size;
         connection.SendReadPacket(handle, (uint)start, (uint)size);
         connection.mutex.Release();
         if(wait)
         {
            request.semaphore.Wait();
            delete request.semaphore;
            delete request;
         }
      }
      else
      {
         if(wait && lastRequestNeeded)
         {
            if(!lastRequestNeeded.semaphore)
               lastRequestNeeded.semaphore = Semaphore { };
         }
         connection.mutex.Release();
         lastRequestNeeded.semaphore.Wait();
      }
   }

   FileServerConnection connection;
   int handle;
   byte * buffer;
   uint64 bufferSize;
   uint64 bufferCount;
   uint64 position;
}

public FileServerConnection ConnectToFileServer(const char * hostName, int port)
{
   FileServerConnection connection { };
   if(connection)
   {
      if(connection.Connect(hostName, port))
         connection.fileClientThread.Create();
      else
         delete connection;
   }
   return connection;
}

public class FileServerConnection : Socket
{
   processAlone = true;
public:
   NetworkClientFile Open(const char * fileName, FileOpenMode mode)
   {
      NetworkClientFile f { };
      Request request;

      f.connection = this;
      f.position = 0;

      mutex.Wait();
      request = AddRequest(4, Request::OpenCallback, f, true);
      SendOpenPacket(fileName);
      mutex.Release();
      request.semaphore.Wait();
      delete request.semaphore;
      delete request;

      if(!f.handle)
         delete f;
      return f;
   }

private:
   ~FileServerConnection()
   {
      if(fileClientThread)
      {
         fileClientThread.terminate = true;
         //guiApp.SignalEvent();
         fileClientThread.socket.Disconnect(0);
         fileClientThread.Wait();
         delete fileClientThread;
      }
   }

   uint OnReceive(const byte * buffer, uint count)
   {
      Request request;
      uint bytesProcessed = 0;

      mutex.Wait();
      while((request = requests.first))
      {
         uint numBytes = request.numBytes;
         if(count - bytesProcessed < numBytes)
            break;

         requests.Remove(request);
         mutex.Release();

         request.CallBack(request, buffer + bytesProcessed);
         bytesProcessed += numBytes;

         mutex.Wait();
      }
      mutex.Release();
      return bytesProcessed;
   }

   Request AddRequest(uint numBytes, void (* callback)(Request request, const byte * buffer), NetworkClientFile file, bool createSemaphore)
   {
      Request request { numBytes = numBytes, CallBack = callback, file = file };
      if(createSemaphore)
         request.semaphore = Semaphore { };
      requests.Add(request);

      // There is a possibility that OnReceive already got the data for our request
      // If it is the case, and it had no other request, it will have returned 0.
      // This mean that OnReceive won't be called again unless more data comes in.
      // Signaling an event will unblock the thread to make sure OnReceive is called again.
      guiApp.SignalEvent();
      return request;
   }

   // Packet Sending Functions
   void SendOpenPacket(const char * fileName)
   {
      int len = strlen(fileName);
      OpenPacket packet = (OpenPacket) new0 byte[sizeof(class OpenPacket) + len];
      PUTXDWORD(packet.type, NetworkClientPacketType::open);
      PUTXDWORD(packet.size, sizeof(class OpenPacket) + len);
      PUTXDWORD(packet.fileNameLen, len);
      strcpy(packet.fileName, fileName);
      Send(packet, GETXDWORD(packet.size));
      delete packet;
   }

   void SendReadPacket(int handle, uint start, uint size)
   {
      ReadPacket packet
      {
         XDWORD(NetworkClientPacketType::read),
         XDWORD(sizeof(class ReadPacket)),
         XDWORD(handle),
         XDWORD(start),
         XDWORD(size)
      };
      Send(packet, GETXDWORD(packet.size));
   }

   void SendSizePacket(int handle)
   {
      SizePacket packet
      {
         XDWORD(NetworkClientPacketType::getSize),
         XDWORD(sizeof(class SizePacket)),
         XDWORD(handle)
      };
      Send(packet, GETXDWORD(packet.size));
   }

   FileClientThread fileClientThread { socket = this };
   Mutex mutex { };
   OldList requests;
}

#endif
