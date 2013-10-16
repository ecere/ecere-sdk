import "ecere"

/////////////////////////////////////////////////////////////////////

typedef byte XDWord[4];
typedef byte XWord[2];

#define MDWORD(a,b) ((((uint32)((uint16)(b)))<<16)+((uint16)(a)))
#define LOWORD(l)   ((uint16)(l))
#define HIWORD(l)   ((uint16)(((uint32)(l) >> 16) & 0xFFFF))

#define SWAP_WORD(word) (((uint16)(word) & 0x00ff) << 8) \
                      | (((uint16)(word) & 0xff00) >> 8)

#define SWAP_DWORD(dword) ((((uint32)(dword) & 0x000000ff) << 24) \
                         | (((uint32)(dword) & 0x0000ff00) <<  8) \
                         | (((uint32)(dword) & 0x00ff0000) >>  8) \
                         | (((uint32)(dword) & 0xff000000) >> 24))

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

#define PUTXWORD(b, w) \
   (b)[0] = (byte)(((w) >> 8) & 0xFF); \
   (b)[1] = (byte)(((w)     ) & 0xFF);

#define XWORD(w) \
   { \
      (byte)(((w) >> 8)  & 0xFF), \
      (byte)((w)         & 0xFF) \
   }

#define GETXWORD(b) (uint16)(((b)[0] << 8) | (b)[1])

/////////////////////////////////////////////////////////////////////

define SERVER_PORT = 7649;

define MAX_HANDLES = 16;

// Packets sent from Client to Server

class BasePacket : struct
{
   byte type[4];
   byte size[4];
};

class OpenPacket : BasePacket
{
   byte fileNameLen[4];
   char fileName[1]; // Rest follows, null terminated
};

class ClosePacket : BasePacket
{
   byte handle[4];
};

class ReadPacket : BasePacket
{
   byte handle[4];
   byte readStart[4];
   byte readSize[4];
};

class SizePacket : BasePacket
{
   byte handle[4];
};

enum PacketType { open, close, read, size };

class NetworkServer : Service
{
   OldList clients { offset = (uint)&((ClientConnection)0).prev };
   void OnAccept()
   {
      ClientConnection socket { this };
      clients.Add(socket);
      Logf("Connection from %s, port %d\n", socket.inetAddress, SERVER_PORT);
   }
};

class ClientConnection : Socket
{
   ClientConnection prev, next;
   File handles[MAX_HANDLES];
   byte * readBuf;
   uint readSize;

   uint OnReceive(const byte * buffer, uint count)
   {
      if(count >= sizeof(class Packet))
      {
         BasePacket packetHeader = (BasePacket) buffer;
         if(count >= GETXDWORD(packetHeader.size))
         {
            Log("received packet\n");
            switch((PacketType)GETXDWORD(packetHeader.type))
            {
               case open:
               {
                  OpenPacket packet = (OpenPacket) packetHeader;
                  byte reply[4] = XDWORD(MAXDWORD);
                  int c;

                  Log("Open\n");
                  for(c = 0; c < MAX_HANDLES; c++)
                  {
                     if(!handles[c])
                        break;
                  }
                  // Test valid free handle
                  if(c < MAX_HANDLES)
                  {
                     handles[c] = FileOpen(packet.fileName, read);
                     if(handles[c])
                        PUTXDWORD(reply, c+1);
                  }
                  Send(reply, sizeof(reply));
                  break;
               }
               case close:
               {
                  ClosePacket packet = (ClosePacket) packetHeader;
                  uint handle = GETXDWORD(packet.handle);
                  Log("Close\n");
                  if(handle > 0 && handle <= MAX_HANDLES)
                  {
                     File file = handles[handle-1];
                     if(file)
                     {
                        delete file;
                        handles[handle-1] = null;
                     }
                  }
                  break;
               }
               case read:
               {
                  ReadPacket packet = (ReadPacket) packetHeader;
                  byte reply[4];
                  uint handle = GETXDWORD(packet.handle);
                  uint realRead = 0;
                  Log("Read\n");
                  if(handle > 0 && handle <= MAX_HANDLES)
                  {
                     File file = handles[handle-1];
                     if(file)
                     {
                        uint readSize = GETXDWORD(packet.readSize);

                        if(readSize > this.readSize)
                        {
                           readBuf = renew readBuf byte[readSize];
                           this.readSize = readSize;
                        }
                        if(readBuf)
                        {
                           file.Seek(GETXDWORD(packet.readStart), start);
                           realRead = file.Read(readBuf, 1, readSize);
                        }
                     }
                  }
                  PUTXDWORD(reply, realRead);
                  Send(reply, sizeof(reply));
                  Send(readBuf, realRead);
                  break;
               }
               case size:
               {
                  SizePacket packet = (SizePacket) packetHeader;
                  byte reply[4] = XDWORD(0);
                  uint handle = GETXDWORD(packet.handle);
                  Logf("Size %d\n",handle);
                  if(handle > 0 && handle <= MAX_HANDLES)
                  {
                     File file = handles[handle-1];
                     if(file)
                     {
                        uint size;
                        file.Seek(0, end);
                        size = file.Tell();
                        PUTXDWORD(reply, size);
                     }
                  }
                  Send(reply, sizeof(reply));
                  break;
               }
               default:
                  Log("Unknown packet type\n");
            }
            Log("Request processed\n");
            return GETXDWORD(packetHeader.size);
         }
      }
      return 0;
   }

   void OnDisconnect(int code)
   {
      delete readBuf;
      ((NetworkServer)service).clients.Remove(this);
   }
}

NetworkServer tcpServer { port = SERVER_PORT };

class ServerApp : GuiApplication
{
   void Main()
   {
      // SetLoggingMode(stdout, null);
      SetLoggingMode(0, null);
      if(tcpServer.Start())
      {
         Log("Server started\n");
         while(true)
         {
            WaitEvent();
            ProcessNetworkEvents();
         }
      }
   }
}
