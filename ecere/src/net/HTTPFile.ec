#include <stdio.h>

import "List"

#if !defined(ECERE_NONET) && !defined(__ANDROID__) // Curl / OpenSSL not set up right now for Android builds

import "network"
#ifndef ECERE_NOSSL
import "SSLSocket"
#endif

#include <curl/curl.h>

#undef CompareString

#include <string.h>
#ifndef WIN32
#  include <sys/time.h>
#endif
#include <stdlib.h>
#include <errno.h>

namespace net;

static intsize writeMemoryCallback(void *contents, intsize size, intsize nmemb, HTTPFile file)
{
  intsize count = size * nmemb;

  file.memory = renew file.memory byte[file.size + count];
  if(!file.memory)
     return 0;
  memcpy(file.memory + file.size, contents, count);
  file.size += count;
  return count;
}

public class HTTPFile : File
{
   bool reuseConnection;
   long httpCode;

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

   property int httpCode
   {
      get { return (int)httpCode; }
   }

   bool OpenURL(const char * name, const char * referer, char * relocation)
   {
      bool result = false;
      static bool curlInited;
      CURLcode res;

      if(!curlInited)
      {
         curl_global_init(CURL_GLOBAL_ALL);
         curlInited = true;
      }
      curl_handle = curl_easy_init();
      curl_easy_setopt(curl_handle, CURLOPT_ACCEPT_ENCODING, /*"br, */ "gzip, deflate");
      curl_easy_setopt(curl_handle, CURLOPT_URL, name);
      curl_easy_setopt(curl_handle, CURLOPT_WRITEFUNCTION, writeMemoryCallback);
      curl_easy_setopt(curl_handle, CURLOPT_WRITEDATA, this);
      curl_easy_setopt(curl_handle, CURLOPT_USERAGENT, "libcurl-agent/1.0");
      res = curl_easy_perform(curl_handle);
      if(res != CURLE_OK)
         fprintf(stderr, "curl_easy_perform() failed: %s\n", curl_easy_strerror(res));
      else
      {
         curl_easy_getinfo(curl_handle, CURLINFO_RESPONSE_CODE, &httpCode);
         result = true;
      }
      return result;
   }

private:

   ~HTTPFile()
   {
      delete memory;
      curl_easy_cleanup(curl_handle);
      // curl_global_cleanup();
   }

   uintsize Read(byte * buffer, uintsize size, uintsize count)
   {
      int read = Max(0, Min(this.size - pos, count * size));
      memcpy(buffer, memory + pos, read);
      pos += read;
      return read / size;
   }

   uintsize Write(const byte * buffer, uintsize size, uintsize count)
   {
      return 0;
   }

   bool Getc(char * ch)
   {
      uintsize read = Read(ch, 1, 1);
      return read != 0;
   }

   bool Putc(char ch)
   {
      return false;
   }

   bool Puts(const char * string)
   {
      return false;
   }

   bool Seek(int64 pos, FileSeekMode mode)
   {
      if(mode == start) // && bufferPos == 0 && pos <= bufferCount && pos >= 0)
      {
         this.pos = Min(size, pos);
         return true;
      }
      else if(mode == current) // && bufferPos == 0 && ((int)position + pos) <= bufferCount && ((int)position + pos) >= 0)
      {
         this.pos += pos;
         if(this.pos > size) this.pos = size;
         return true;
      }
      else if(mode == end) // && totalSizeSet && bufferPos == 0 && bufferCount == totalSize && ((int)totalSize - pos) <= bufferCount && ((int)totalSize - pos) >= 0)
      {
         this.pos = size - pos;
         if(this.pos < 0) this.pos = 0;
         return true;
      }
      return false;
   }

   uint64 Tell()
   {
      return pos;
   }

   bool Eof()
   {
      return pos >= size;
   }

   uint64 GetSize()
   {
      return size;
   }

   void Abort()
   {
      //aborted = true;
   }
private:

   String contentType;
   String contentDisposition;

   char *memory;
   intsize pos, size;
   CURL *curl_handle;
}

public HTTPFile FileOpenURL(const char * name)
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
#else

namespace net;

public HTTPFile FileOpenURL(const char * name)
{
   return null;
}

#endif
