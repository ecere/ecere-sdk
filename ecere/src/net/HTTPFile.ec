#ifndef ECERE_NONET

import "network"

static OldList connections { };

namespace net;

#define BUFFERSIZE   65536

static Mutex connectionsMutex { };

static class ServerNode : BTNode
{
   char address[24];
   bool resolved;
   ~ServerNode()
   {
      char * name = (char *)key;
      delete name;
   }   
}

static class ServerNameCache
{
   BinaryTree servers
   {
      CompareKey = (void *)BinaryTree::CompareString;
   };
   Mutex mutex { };

   ~ServerNameCache()
   {
      ServerNode server;
      while((server = (ServerNode)servers.root))
      {
         servers.Remove(server);
         delete server;
      }
   }
   bool Resolve(char * host, char * address)
   {
      ServerNode server;
      mutex.Wait();
      server = (ServerNode)servers.FindString(host);
      if(!server)
      {
         server = ServerNode { key = (uintptr)CopyString(host) };
         servers.Add(server);
         server.resolved = GetAddressFromName(host, server.address);
      }
      mutex.Release();
      if(server.resolved)
         strcpy(address, server.address);
      return server.resolved;
   }
};

static ServerNameCache serverNameCache { };

static char * GetString(char * string, char * what, int count)
{
   int c;
   for(c = 0; what[c]; c++)
   {
      if((count && c >= count) || (string[c] != what[c] && tolower(string[c]) != tolower(what[c])))
         return null;
   }
   return string + c;
}

private class HTTPConnection : Socket
{
   HTTPConnection prevConnection, nextConnection;
   char * server;
   int port;
   HTTPFile file;

   processAlone = true;

   ~HTTPConnection()
   {
      if(prevConnection || nextConnection || connections.first == this)
         printf("");      
   }
   
   HTTPConnection()
   {
      if(!connections.offset)
         connections.offset = (uint)&((HTTPConnection)0).prevConnection;
   }

   void OnDisconnect(int code)
   {
      connectionsMutex.Wait();
      if(file)
         file.connection = null;
      delete server;
      connections.Remove(this);
      connectionsMutex.Release();
   }

   uint Open_OnReceive(const byte * buffer, uint count)
   {
      HTTPFile file = this.file;
      int pos = 0;
      int c;
      while(!file.done)
      {
         bool gotEndLine = false;
         for(c = 0; c<count-1; c++)
         {
            if(buffer[c] == '\r' && buffer[c+1] == '\n')
            {
               gotEndLine = true;
               break;
            }
         }   
         if(!gotEndLine)
            // Incomplete packet
            return pos;
         if(c<count)
         {
            char * string = (char *)buffer;

            /*
            char line[1024];
            memcpy(line, buffer, c+2);
            line[c+2] = 0;
            Log(line);
            */
            
            /*
            fwrite(buffer, 1, c, stdout);
            puts("");
            */

            if(!c)
            {
               //if(file.openStarted)
                  file.done = true;
            }
            else
            {
               //file.openStarted = true;
               if((string = GetString((char *)buffer, "HTTP/1.1 ", count)) ||
                       (string = GetString((char *)buffer, "HTTP/1.0 ", count)))
               {
                  file.status = atoi(string);
               }
               else if(string = GetString((char *)buffer, "Transfer-Encoding: ", count))
               {
                  if(!strnicmp(string, "chunked", strlen("chunked")))
                  {
                     file.chunked = true;
                  }
               }
               else if(string = GetString((char *)buffer, "Content-Length: ", count))
               {
                  file.totalSize = atoi(string);
                  file.totalSizeSet = true;
               }
               else if(string = GetString((char *)buffer, "Connection: ", count))
               {
                  if(!strnicmp(string, "close", strlen("close")))
                  {
                     file.close = true;
                  }
               }
               else if(string = GetString((char *)buffer, "Location: ", count))
               {
                  if(file.relocation)
                  {
                     strncpy(file.relocation, buffer + 10, c - 10);
                     file.relocation[c - 10] = '\0';
                  }
               }
            }
            // return c+2;
            if(buffer[c] == '\r') c++;
            if(buffer[c] == '\n') c++;
            pos += c;
            count -= c;
            buffer += c;
            
         }
         else
            break;
      }
      
      return pos;
   }

   uint Read_OnReceive(const byte * buffer, uint count)
   {
      HTTPFile file = this.file;
      if(file)
      {
         int read;
         if(file.chunked && !file.chunkSize)
         {
            int pos = 0, c = 0;
            char * string = null;
            bool ready = false;
            while(pos + c < (int)count-3)
            {
               if(buffer[pos+c] == '\r' && buffer[pos+c+1] == '\n')
               {
                  if(string)
                  {
                     ready = true;
                     pos += c + 2;
                     if(buffer[pos] == '\r' && buffer[pos+1] =='\n') pos+= 2;
                     break;
                  }
                  else
                  {
                     pos += 2;
                     c = 0;
                  }
               }
               else
               {
                  if(!string)
                     string = buffer + pos;
                  c++;
               }
            }
            if(ready)
            {
               file.chunkSize = strtol(string, null, 16);
               if(!file.chunkSize)
               {
                  //connection.file = null;
                  file.connection.file = null;
                  file.connection = null;
               }
            }
            return pos;
         }

         read = Min(count, BUFFERSIZE - file.bufferCount);
         if(file.chunked)
         {
            read = Min(read, file.chunkSize);
            file.chunkSize -= read;
         }
         if(read)
         {
            memcpy(file.buffer + file.bufferCount, buffer, read);
            // fwrite(file.buffer, 1, read, stdout);
            file.bufferCount += read;
            /*
            if(GetCurrentThreadID() == network.mainThreadID)
               fwrite(buffer, 1, read, stdout);
            */
         }
         return read;
      }
      else
         return count;   
   }
}

public class HTTPFile : File
{
public:
   bool OpenURL(char * name, char * referer, char * relocation)
   {
      bool result = false;
      if(this && strstr(name, "http://") == name)
      {
         char server[1024];
         char msg[1024];
         int len;
         char * serverStart = ecere::net::GetString(name, "http://", 0);
         char * fileName = strstr(serverStart, "/");
         int port = 80;
         char * colon;
         bool reuse = false;
         HTTPConnection connection = null;
         close = false;

         if(fileName) 
         {
            fileName++;
            memcpy(server, serverStart, fileName - serverStart - 1);
            server[fileName - serverStart - 1] = '\0';
         }
         else
            strcpy(server, serverStart);

         if(relocation && !fileName && name[strlen(name)-1] != '/')
         {
            strcpy(relocation, "http://");
            strcat(relocation, server);
            strcat(relocation, "/");
         }

         colon = strchr(server, ':');
         if(colon)
         {
            port = atoi(colon+1);
            *colon = '\0';
         }

         connectionsMutex.Wait();
         if(this.connection)
         {
            this.connection.file = null;
            if(close)
            {
               this.connection.Disconnect(0);
               delete this.connection;
            }
            this.connection = null;
         }

         if(chunked)
         {
            connectionsMutex.Release();
            while(this.connection && this.connection.file)
            {
               this.connection.Process();
            }
            connectionsMutex.Wait();
         }
         
         for(connection = connections.first; connection; connection = connection.nextConnection)
         {
            if(!strcmpi(connection.server, server) && connection.port == port && !connection.file)
               break;
         }

         if(connection)
         {
            incref connection;
            reuse = true;

            connection.file = this;
         }

         if(!connection)
         {
            char ipAddress[1024];
            connection = HTTPConnection { };
            //incref connection;
            
            connection.file = this;

            connectionsMutex.Release();

            if(serverNameCache.Resolve(server, ipAddress) && connection.Connect(ipAddress /*server*/, port))
            {
               connectionsMutex.Wait();

               connections.Add(connection);
               connection.server = CopyString(server);
               connection.port = port;
            }
            else
            {
               connectionsMutex.Wait();
               delete connection;
            }
         }

         if(connection)
         {
            connection.OnReceive = HTTPConnection::Open_OnReceive;
            connection.file = this;
            this.connection = connection;
            this.relocation = relocation;
            //openStarted = false;
                  
            strcpy(msg, "GET /");

            if(fileName)
            {
               byte ch;
               int c;
               len = strlen(msg);
               for(c = 0; (ch = fileName[c]); c++)
               {
                  if(ch <= 32 || ch > 128)
                  {
                     byte nibble;
                     msg[len++] = '%';
                     nibble = (ch & 0xF0) >> 4;
                     msg[len++] = (nibble > 9) ? (nibble - 10 + 'a') : (nibble + '0');
                     nibble = ch & 0x0F;
                     msg[len++] = (nibble > 9) ? (nibble - 10 + 'a') : (nibble + '0');
                  }
                  else
                     msg[len++] = ch;
               }
               msg[len] = '\0';
            }

            strcat(msg, " HTTP/1.1\r\nHost: ");
            //strcat(msg, " HTTP/1.0\r\nHost: ");
            strcat(msg, server);
            strcat(msg, "\r\n");
            strcat(msg, "Accept-Charset: ISO-8859-1\r\n");
            //strcat(msg, "Accept-Charset: UTF-8\r\n");
            strcat(msg, "Connection: Keep-Alive\r\n");
            if(referer)
            {
               strcat(msg, "Referer: ");
               strcat(msg, referer);
               strcat(msg, "\r\n");
            }
            strcat(msg, "\r\n");
            len = strlen(msg);
            
            connectionsMutex.Release();

            connection.Send(msg, len);

            while(this.connection && !done)
            {
               this.connection.Process();
            }

            if(this.connection)
            {
               if(status == 200 || (!status && totalSizeSet))
               {
                  this.connection.OnReceive = HTTPConnection::Read_OnReceive;
                  result = true;
                  connectionsMutex.Wait();
               }
               else
               {
                  if(chunked)
                  {
                     bool wait = false;
                     this.connection.OnReceive = HTTPConnection::Read_OnReceive;
                     while(!eof)
                     {
                        if(!this.connection)
                           eof = true;
                        else
                        {
                           // First time check if we already have bytes, second time wait for an event
                           this.connection.Process();
                           wait = true;
                        }   
                     }
                  }
                  else if(totalSizeSet)
                  {
                     done = false;
                     this.connection.OnReceive = HTTPConnection::Read_OnReceive;
                     while(this.connection && position < totalSize)
                     {
                        connection.Process();
                        position += bufferCount;
                        bufferCount = 0;
                     }
                  }
                  
                  connectionsMutex.Wait();
                  if(this.connection)
                  {
                     this.connection.OnReceive = null;
                     this.connection.file = null;
                     
                     if(close)
                     {
                        this.connection.Disconnect(0);
                        delete this.connection;
                        connection = null;
                     }
                  }
                  

                  status = 0;
                  this.connection = null;
                  this.relocation = null;
                  totalSize = 0;
                  totalSizeSet = false;
                  done = false;
                  eof = false;
                  position = 0;
                  bufferPos = 0;
                  bufferCount = 0;
                  chunked = false;
               }
            }
            else
            {
               connectionsMutex.Wait();
            }
            if(reuse)
               delete connection;
         }
         connectionsMutex.Release();
      }
      return result;
   }

private:

   ~HTTPFile()
   {
      {
         connectionsMutex.Wait();
         if(connection)
         {
            if(totalSizeSet)
            {
               done = false;
               this.connection.OnReceive = HTTPConnection::Read_OnReceive;
               while(this.connection && position < totalSize)
               {
                  connection.Process();
                  position += bufferCount;
                  bufferCount = 0;
               }
               position = 0;
            }

            if(connection)
            {
               connection.file = null;
               if(close)
               {
                  connection.Disconnect(0);
                  delete connection;
               }
               connection = null;
            }
         }
         connectionsMutex.Release();

         if(chunked)
         {
            while(connection && connection.file)
            {
               connection.Process();
            }
         }
      }
   }

   int Read(byte * buffer, uint size, uint count)
   {
      uint readSize = size * count;
      uint read = 0;
      bool wait = false;

      if(totalSizeSet && position >= totalSize)
         eof = true;
      while(!eof && read < readSize && !aborted)
      {
         uint numbytes = bufferCount - bufferPos;
         numbytes = Min(numbytes, readSize - read);
         if(totalSizeSet)
            numbytes = Min(numbytes, totalSize - position);
         
         if(numbytes)
         {
            memcpy(buffer + read, this.buffer + bufferPos, numbytes);
            bufferPos += numbytes;
            position += numbytes;
            read += numbytes;

            if(bufferPos > BUFFERSIZE / 2)
            {
               // Shift bytes back to beginning of buffer
               uint shift = bufferCount - bufferPos;
               if(shift)
                  memcpy(this.buffer, this.buffer + bufferPos, shift);
               bufferCount -= bufferPos;
               bufferPos = 0;
            }
         }
         else
         {
            if(!connection)
               eof = true;
            else
            {
               // First time check if we already have bytes, second time wait for an event
               connection.Process();
               wait = true;
            }   
         }
         if(totalSizeSet && position >= totalSize)
            eof = true;
      }
      return read / size;
   }

   int Write(byte * buffer, uint size, uint count)
   {
      return 0;
   }

   bool Getc(char * ch)
   {
      int read = Read(ch, 1, 1);
      return !eof && read != 0;
   }

   bool Putc(char ch)
   {
      return false;
   }

   bool Puts(char * string)
   {
      return false;
   }

   bool Seek(int pos, FileSeekMode mode)
   {
      return false;
   }

   uint Tell()
   {
      return position;
   }

   bool Eof()
   {
      return eof;
   }

   bool GetSize()
   {
      return totalSize;
   }

   void Abort()
   {
      aborted = true;
   }

   HTTPConnection connection;
   uint position;
   bool done;
   bool eof;
   int status;
   uint totalSize;
   bool chunked;
   bool close;
   uint chunkSize;
   char * relocation;

   // Buffering...
   byte buffer[BUFFERSIZE];
   uint bufferPos;
   uint bufferCount;
   bool aborted;
   bool totalSizeSet;
}

public HTTPFile FileOpenURL(char * name)
{
   HTTPFile f { };
   if(f.OpenURL(name, null, null))
      return f;
   else
   {
      delete f;
      return null;
   }   
}

#endif
