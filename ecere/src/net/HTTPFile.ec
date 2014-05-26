#ifndef ECERE_NONET

#include <stdio.h>

import "List"
import "network"
#ifndef ECERE_NOSSL
import "SSLSocket"
#endif

class ConnectionsHolder
{
   List<HTTPConnection> connections { };

   ~ConnectionsHolder()
   {
      HTTPConnection c;
      while((c = connections[0]))
         delete c;   // The HTTPConnection destructor will take out from the list
   }
}

static ConnectionsHolder holder { };

namespace net;

/*static */define HTTPFILE_BUFFERSIZE = 65536;

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

#ifdef ECERE_NOSSL
private class HTTPConnection : Socket
#else
private class HTTPConnection : SSLSocket
#endif
{
   class_no_expansion;
   char * server;
   int port;
   HTTPFile file;
   bool secure;

   processAlone = true;

   ~HTTPConnection()
   {
      // printf("Before TakeOut we have %d connections:\n", holder.connections.count); for(c : holder.connections) ::PrintLn(c.server); ::PrintLn("");
      holder.connections.TakeOut(this);
      /*
      PrintLn(server, " Connection Closed (", holder.connections.count, ") opened");
      printf("Now we have %d connections:\n", holder.connections.count);
      for(c : holder.connections)
      {
         ::PrintLn(c.server);
      }
      ::PrintLn("");
      */
      delete server;
   }

   void OnDisconnect(int code)
   {
      connectionsMutex.Wait();
      if(file)
         delete file.connection; // This decrements the file's reference

      connectionsMutex.Release();

      // PrintLn(server, " Disconnected Us");

      delete this;         // The 'connections' reference
   }

   uint Open_OnReceive(const byte * buffer, uint count)
   {
      HTTPFile file = this.file;
      int pos = 0;
      int c;
      while(!file.done)
      {
         bool gotEndLine = false;
         for(c = 0; c<(int)count-1; c++)
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

#ifdef _DEBUG
            fwrite(buffer, 1, c, stdout);
            puts("");
#endif

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
               else if(string = GetString((char *)buffer, "Content-Type: ", count))
               {
                  char * cr = strstr(string, "\r");
                  char * lf = strstr(string, "\n");
                  int len;
                  if(cr)
                     len = cr - string;
                  else if(lf)
                     len = lf - string;
                  else
                     len = strlen(string);

                  file.contentType = new char[len+1];
                  memcpy(file.contentType, string, len);
                  file.contentType[len] = 0;
               }
               else if(string = GetString((char *)buffer, "Content-disposition: ", count))
               {
                  char * cr = strstr(string, "\r");
                  char * lf = strstr(string, "\n");
                  int len;
                  if(cr)
                     len = cr - string;
                  else if(lf)
                     len = lf - string;
                  else
                     len = strlen(string);

                  file.contentDisposition = new char[len+1];
                  memcpy(file.contentDisposition, string, len);
                  file.contentDisposition[len] = 0;
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
                  file.connection.file = null;
                  if(file.close)
                     file.connection.Disconnect(0);
                  delete file.connection; // This decrements the file's reference
               }
            }
            return pos;
         }

         read = Min(count, HTTPFILE_BUFFERSIZE - file.bufferCount);
         if(file.chunked)
         {
            read = Min(read, file.chunkSize);
            file.chunkSize -= read;
         }
         if(read)
         {
            memcpy(file.buffer + file.bufferCount, buffer, read);
            file.bufferCount += read;
         }
         return read;
      }
      else
         return count;
   }
}

public class HTTPFile : File
{
   bool reuseConnection;
   reuseConnection = true;
public:
   property bool reuseConnection
   {
      set { reuseConnection = value; }
      get { return reuseConnection; }
   }
   property String contentType
   {
      get { return contentType; }
   }
   property String contentDisposition
   {
      get { return contentDisposition; }
   }

   bool OpenURL(char * name, char * referer, char * relocation)
   {
      return RetrieveHead(name, referer, relocation, false);
   }

private:

   bool RetrieveHead(char * name, char * referer, char * relocation, bool askBody)
   {
      bool result = false;
      String http, https;
      if(!this || !name) return false;
      http = strstr(name, "http://");
      if(http != name) http = null;
      https = http ? null : strstr(name, "https://"); if(https && https != name) https = null;

      askedBody = askBody;

      done = false;
      delete contentType;
      delete contentDisposition;
      // ::PrintLn("Opening ", name, " ", (uint64)this, " in thread ", GetCurrentThreadID(), "\n");
      if(this && (http || https))
      {
         char server[1024];
         char msg[1024];
         int len;
         char * serverStart = http ? ecere::net::GetString(name, "http://", 0) : ecere::net::GetString(name, "https://", 0);
         char * fileName = strstr(serverStart, "/");
         int port = https ? 443 : 80;
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
            strcpy(relocation, http ? "http://" : "https://");
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
               this.connection.Disconnect(0);
            delete this.connection;
         }

         if(chunked)
         {
            while(this.connection && this.connection.connected && this.connection.file)
            {
               connectionsMutex.Release();
               this.connection.Process();
               connectionsMutex.Wait();
            }
         }

         if(reuseConnection)
         {
            bool retry = true;
            while(retry)
            {
               retry = false;
               connection = null;
               for(c : holder.connections)
               {
                  if(!strcmpi(c.server, server) && c.port == port && c.secure == (https ? true : false))
                  {
                     if(!c.file && c.connected)
                     {
                        connection = c;      // TOFIX: 'incref c' doesn't work
                        incref connection;      // HTTPFile reference if we keep it
                        connectionsMutex.Release();
                        connection.ProcessTimeOut(0.000001);
                        connectionsMutex.Wait();
                        if(!connection.connected || connection.file)
                        {
                           // We're disconnected or reused already...
                           retry = true;
                           delete connection;
                        }
                        break;
                     }
                  }
               }
            }
            if(connection)
            {
               // ::PrintLn("Reusing Connection ", (uint64)connection, " for ", name, " ", (uint64)this, " in thread ", GetCurrentThreadID(), "\n");
               reuse = true;
               connection.file = this;
            }
         }

      tryagain:
         if(!connection)
         {
            char ipAddress[1024];
            connection = HTTPConnection
            {
#ifndef ECERE_NOSSL
               autoEstablish = https ? true : false
#endif
            };
            incref connection;      // HTTPFile reference on success

            connection.file = this;

            connectionsMutex.Release();

            if(serverNameCache.Resolve(server, ipAddress))
            {
               // ::PrintLn("No Connection - Connecting ", (uint64)connection, " for ", name, " ", (uint64)this, " in thread ", GetCurrentThreadID());
               if(connection.Connect(ipAddress /*server*/, port))
               {
                  //::PrintLn("Successfully Connected for ", name, " ", (uint64)this, " in thread ", GetCurrentThreadID());
                  //::PrintLn("Waiting on connectionsMutex for ", name, " ", (uint64)this, " in thread ", GetCurrentThreadID());
                  connectionsMutex.Wait();

                  connection.server = CopyString(server);
                  connection.port = port;
                  connection.secure = https ? true : false;

                  //::PrintLn("Got connectionsMutex for ", name, " ", (uint64)this, " in thread ", GetCurrentThreadID());
                  holder.connections.Add(connection);
                  /*
                  printf("Now we have %d connections:\n", holder.connections.count);
                  for(c : holder.connections)
                  {
                     String s = c.server;
                     ::Print("Server: ");
                     ::PrintLn(c.server);
                  }
                  ::PrintLn("");
                  */
                  incref connection;   // Global List Reference
               }
               else
               {
                  // ::PrintLn("Connection Failed for ", name, " ", (uint64)this, " in thread ", GetCurrentThreadID());
                  connectionsMutex.Wait();
                  delete connection;
               }
            }
            else
            {
               connectionsMutex.Wait();
               delete connection;
            }
         }

         if(connection)
         {
            incref connection;      // local reference

            connection.OnReceive = HTTPConnection::Open_OnReceive;
            connection.file = this;
            this.connection = connection;
            this.relocation = relocation;
            //openStarted = false;

            totalSizeSet = false;   // HEAD will sometimes give you 0!
            strcpy(msg, askBody ? "GET /" : "HEAD /");

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
            strcat(msg, "Accept-Charset: UTF-8\r\n");
            //strcat(msg, "Accept-Charset: ISO-8859-1\r\n");
            strcat(msg, "Connection: Keep-Alive\r\n");
            if(referer)
            {
               strcat(msg, "Referer: ");
               strcat(msg, referer);
               strcat(msg, "\r\n");
            }
            strcat(msg, "\r\n");
            len = strlen(msg);

            //::PrintLn("Releasing connectionsMutex before GET for ", name, " ", (uint64)this, " in thread ", GetCurrentThreadID());
            connectionsMutex.Release();

            // ::PrintLn("Sending GET for ", name, " ", (uint64)this, " in thread ", GetCurrentThreadID(), "\n");
            connection.Send(msg, len);

            while(this.connection && this.connection.connected && !done)
            {
               this.connection.Process();
            }
            //::PrintLn("Got DONE for ", name, " ", (uint64)this, " in thread ", GetCurrentThreadID(), "\n");

            if(this.connection)
            {
               if(name != location)
               {
                  delete location;
                  location = CopyString(name);
               }
               if(status == 200 || (!status && totalSizeSet))
               {
                  if(askBody)
                     this.connection.OnReceive = HTTPConnection::Read_OnReceive;

                  result = true;
                  connectionsMutex.Wait();
               }
               else
               {
                  if(askBody)
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
                        // Is it possible to have Content-Length set but not chunked?
                        done = false;
                        this.connection.OnReceive = HTTPConnection::Read_OnReceive;
                        while(this.connection && this.connection.connected && position + (bufferCount - bufferPos) < totalSize)
                        {
                           connection.Process();
                           position += bufferCount - bufferPos;
                           bufferCount = 0;
                           bufferPos = 0;
                        }
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
                        connection = null;
                     }
                  }

                  status = 0;
                  delete this.connection; // This decrements the file's reference
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
            if(reuse && !status && connection && !connection.connected)
            {
               delete connection;
               reuse = false;
               goto tryagain;
            }
            else
               delete connection;
         }
         connectionsMutex.Release();
      }
      return result;
   }

   ~HTTPFile()
   {
      delete location;
      delete contentType;
      delete contentDisposition;
      {
         connectionsMutex.Wait();
         if(connection)
         {
            if(totalSizeSet && askedBody)
            {
               done = false;
               this.connection.OnReceive = HTTPConnection::Read_OnReceive;
               while(this.connection && this.connection.connected && position + (bufferCount - bufferPos) < totalSize)
               {
                  connectionsMutex.Release();
                  connection.Process();
                  connectionsMutex.Wait();
                  position += bufferCount - bufferPos;
                  bufferCount = 0;
                  bufferPos = 0;
               }
               position = 0;
            }

            if(connection)
            {
               connection.file = null;
               if(close)
                  connection.Disconnect(0);
               delete connection;
            }
         }
         connectionsMutex.Release();

         if(chunked)
         {
            while(connection && connection.connected && connection.file)
            {
               connectionsMutex.Release();
               connection.Process();
               connectionsMutex.Wait();
            }
         }
         //::PrintLn("Done with ", (uint64)this);
      }
   }

   int Read(byte * buffer, uint size, uint count)
   {
      uint readSize = size * count;
      uint read = 0;
      bool wait = false;
      Time lastTime = GetTime();

      if(!askedBody)
      {
         askedBody = true;
         if(!RetrieveHead(this.location, null, null, true))
            return 0;
      }

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
            lastTime = GetTime();
            memcpy(buffer + read, this.buffer + bufferPos, numbytes);
            bufferPos += numbytes;
            position += numbytes;
            read += numbytes;

            lastTime = GetTime();

            if(bufferPos > HTTPFILE_BUFFERSIZE / 2)
            {
               // Shift bytes back to beginning of buffer
               uint shift = bufferCount - bufferPos;
               if(shift)
                  memmove(this.buffer, this.buffer + bufferPos, shift);
               bufferCount -= bufferPos;
               bufferPos = 0;
            }
         }
         else
         {
            if(!connection || !connection.connected)
               eof = true;
            else
            {
               // First time check if we already have bytes, second time wait for an event
               connection.Process();
               if(wait && bufferCount - bufferPos == 0 && GetTime() - lastTime > 5)
                  eof = true;
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
      if(mode == start && bufferPos == 0 && pos <= bufferCount && pos >= 0)
      {
         bufferPos = pos;
         return true;
      }
      else if(mode == current && bufferPos == 0 && (position + pos) <= bufferCount && (position + pos) >= 0)
      {
         bufferPos = position + pos;
         return true;
      }
      else if(mode == end && totalSizeSet && bufferPos == 0 && bufferCount == totalSize && (totalSize - pos) <= bufferCount && (totalSize - pos) >= 0)
      {
         bufferPos = totalSize - pos;
         return true;
      }
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

   uint GetSize()
   {
      return totalSize;
   }

   void Abort()
   {
      aborted = true;
   }
private:

   bool askedBody;

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
   String location;

   // Buffering...
   byte buffer[HTTPFILE_BUFFERSIZE];
   uint bufferPos;
   uint bufferCount;
   bool aborted;
   bool totalSizeSet;

   String contentType;
   String contentDisposition;
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
