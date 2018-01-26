import "ecere"

static const char * indexNames[] =
{
   "index.html",
   "index.htm",
   "home.html",
   "home.htm",
   "welcome.html",
   "welcome.htm",
   "default.html",
   "default.htm"
};

#define NUM_INDEX    (sizeof(indexNames) / sizeof(char *))

static void WriteFileName(File f, const char * fileName)
{
   byte ch;
   int c;
   for(c = 0; (ch = fileName[c]); c++)
   {
      if(ch <= 32 || ch > 128)
      {
         byte nibble;
         f.Putc('%');
         nibble = (ch & 0xF0) >> 4;
         f.Putc((char)((nibble > 9) ? (nibble - 10 + 'a') : (nibble + '0')));
         nibble = ch & 0x0F;
         f.Putc((char)((nibble > 9) ? (nibble - 10 + 'a') : (nibble + '0')));
      }
      else
         f.Putc(ch);
   }
}

char contentPath[MAX_LOCATION] = ".";

static void CreateDirectoryListing(File f, char * directory)
{
   FileListing listing { directory };

   f.Puts("<HTML><HEAD></HEAD><BODY>\r\n");

   if(directory[0] && directory[1] && (directory[1] != ':' || (directory[2] && directory[3])))
      f.Puts("<A HREF=../>../</A><BR>\r\n");

   while(listing.Find())
   {
      f.Puts("<A HREF=");
      WriteFileName(f, listing.name);
      if(listing.stats.attribs.isDirectory)
         f.Puts("/");
      f.Puts(">");
      f.Puts(listing.name);
      f.Puts("</A><BR>\r\n");
   }

   f.Puts("\r\n</BODY></HTML>\r\n");
}

static const char * GetString(const char * string, const char * what, int count)
{
   int c;
   bool result = true;
   for(c = 0; what[c]; c++)
   {
      if((count && c >= count) || (string[c] != what[c] && tolower(string[c]) != tolower(what[c])))
         return null;
   }
   return string + c;
}

class HTTPClient : Socket
{
   File f;
   bool close;

   #define ishexdigit(x) (isdigit(x) || (x >= 'a' && x<='f') || (x >= 'A' && x <= 'F'))

   uint OnReceive(const byte * buffer, uint count)
   {
      int c;
      for(c = 0; c<count-1; c++)
      {
         if(buffer[c] == '\r' && buffer[c+1] == '\n')
            break;
      }
      if(c<count)
      {
         const char * string = (const char *)buffer;

         if((string = GetString(string, "GET ", count)))
         {
            char reply[2048];
            char path[MAX_LOCATION];
            char addedPath[MAX_LOCATION];
            int d, i;
            FileAttribs attribs;
            int len = 0;

            for(d = c; d > 0 && string[d] != ' '; d--);
            for(i = 0; i<d; i++)
            {
               if(string[i] == '%' && ishexdigit(string[i+1]) && ishexdigit(string[i+2]))
               {
                  char digits[3];
                  digits[0] = string[i+1];
                  digits[1] = string[i+2];
                  digits[2] = '\0';
                  addedPath[len++] = (byte)strtol(digits, null, 16);
                  i += 2;
               }
               else
                  addedPath[len++] = string[i];
               addedPath[len] = '\0';
            }

            strcpy(path, contentPath);
            if(!strstr(addedPath, "..") && !strstr(addedPath, ":"))
               PathCat(path, addedPath+1);

            attribs = FileExists(path);

            if(attribs.isDirectory)
            {
               if(addedPath[len-1] != '/')
               {
                  strcpy(reply, "HTTP/1.1 301 Moved Permantently\r\n");

                  strcat(reply, "Location: ");
                  strcat(reply, addedPath);
                  strcat(reply, "/\r\n");
                  strcat(reply, "Content-Length: 0\r\n\r\n");
               }
               else
               {
                  int i;
                  char indexFile[MAX_LOCATION];
                  for(i = 0; i<NUM_INDEX; i++)
                  {
                     strcpy(indexFile, path);
                     PathCat(indexFile, indexNames[i]);
                     if(FileExists(indexFile).isFile)
                     {
                        f = FileOpen(indexFile, read);
                        break;
                     }
                  }
                  // List contents if we didn't find an index
                  if(i == NUM_INDEX)
                  {
                     f = TempFile {};
                     if(f)
                     {
                        CreateDirectoryListing(f, path);
                        f.Seek(0, start);
                     }
                  }
               }
            }
            else if(attribs.isFile)
               f = FileOpen(path, read);
            else
               strcpy(reply, "HTTP/1.1 404 Not Found\r\nContent-Length: 0\r\n\r\n");

            if(f)
            {
               char extension[MAX_EXTENSION];
               uint size = (uint)f.GetSize();
               sprintf(reply, "HTTP/1.1 200 OK\r\n");

               GetExtension(addedPath, extension);
               if(attribs.isDirectory || !strcmp(extension, "html") || !strcmp(extension, "htm"))
                  strcat(reply, "Content-Type: text/html\r\n");
               else if(!strcmp(extension, "wasm"))
                  strcat(reply, "Content-Type: application/wasm\r\n");
               else if(!strcmp(extension, "data"))
                  strcat(reply, "Content-Type: application/octet-stream\r\n");
               else
                  strcat(reply, "Content-Type: text/plain\r\n");
               strcat(reply, "Access-Control-Allow-Origin: *\r\n");
               sprintf(strchr(reply, 0), "Content-Length: %d\r\n\r\n", size);
            }
            SendString(reply);
         }
         return c+2;
      }
      return count;
   }
}

class HTTPServer : Service
{
   void OnAccept()
   {
      HTTPClient { this };
   }
}

class HTTPApplication : GuiApplication
{
   bool Init()
   {
      httpServer.Start();
      if(argc > 1)
         strcpy(contentPath, argv[1]);
      return true;
   }

   bool Cycle(bool idle)
   {
      bool result = true;
      HTTPClient client, next;
      for(client = (HTTPClient)httpServer.firstClient; client; client = next)
      {
         next = (HTTPClient)client.next;
         if(client.f)
         {
            #define PACKETSIZE      65536

            static byte buffer[PACKETSIZE];
            int read = client.f.Read(buffer, 1, PACKETSIZE);

            if(read)
               client.Send(buffer, read);
            if(client.f.Eof())
            {
               delete client.f;
               if(client.close)
                  client.Disconnect(0);
            }

            result = true;
         }
      }
      return result;
   }
}

HTTPServer httpServer { port = 8080 };

Window serverWindow { size = Size { 320, 200 }, text = "ECERE HTTP Server", hasMinimize = true, hasClose = true };
