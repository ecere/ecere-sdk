#undef __BLOCKS__
#include <stdio.h>

import "List"

#if !defined(ECERE_NONET) && !defined(ECERE_NOCURL)//&& !defined(__ANDROID__) // Curl / OpenSSL not set up right now for Android builds

import "network"
#ifndef ECERE_NOSSL
import "SSLSocket"
#endif

// #if !defined(__EMSCRIPTEN__)
#define Size Size_
#define String String_
#define Interface Interface_
#define Socket Socket_
#define Alignment Alignment_
#define int64 int64_
#include <curl/curl.h>
#undef Size
#undef String
#undef Interface
#undef Socket
#undef Alignment
#undef int64
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
      return OpenURLEx(name, referer, relocation, null);
   }

   bool OpenURLEx(const char * name, const char * referer, char * relocation, const char * acceptHeader)
   {
      bool result = false;
      static bool curlInited;
      CURLcode res;
      struct curl_slist *hs = null;

      if(!curlInited)
      {
         curl_global_init(CURL_GLOBAL_ALL);
         curlInited = true;
      }
      curl_handle = curl_easy_init();
      if(acceptHeader)
      {
         String ct = PrintString("Accept: ", acceptHeader);
         hs = curl_slist_append(hs, ct);
         delete ct;
         if(hs)
            curl_easy_setopt(curl_handle, CURLOPT_HTTPHEADER, hs);
      }
      curl_easy_setopt(curl_handle, CURLOPT_ACCEPT_ENCODING, /*"br, */ "gzip, deflate");
      curl_easy_setopt(curl_handle, CURLOPT_URL, name);
      curl_easy_setopt(curl_handle, CURLOPT_WRITEFUNCTION, writeMemoryCallback);
      curl_easy_setopt(curl_handle, CURLOPT_WRITEDATA, this);
      curl_easy_setopt(curl_handle, CURLOPT_USERAGENT, "libcurl-agent/1.0");
      curl_easy_setopt(curl_handle, CURLOPT_SSL_OPTIONS, CURLSSLOPT_NATIVE_CA);
#if !defined(ECERE_NOSSL) && !defined(NOT_OPENSSL_CURL)
      SetCurlEmbeddedCA(curl_handle);
#endif
      res = curl_easy_perform(curl_handle);
      if(res != CURLE_OK)
         fprintf(stderr, "curl_easy_perform() failed (%s): %s\n", curl_easy_strerror(res), name);
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

#if defined(__WIN32__) && !defined(ECERE_NOSSL) && !defined(NOT_OPENSSL_CURL)

#define _Noreturn

#define byte _byte
#define int64 _int64
#define uint _uint
#define set _set
#include <openssl/ssl.h>
#if defined(__WIN32__) && OPENSSL_VERSION_NUMBER < 0x1010006fL
// #include <openssl/applink.c> // This is already in SSLSocket
#endif
#undef byte
#undef int64
#undef uint
#undef set

static CURLcode sslctx_function(CURL *curl, void *sslctx, void *certdata)
{
   BIO * bio = BIO_new_mem_buf((char *)certdata, -1);
   if(!bio)
      PrintLn("Error: BIO_new_mem_buf()");
   else
   {
      X509_STORE * store = SSL_CTX_get_cert_store((SSL_CTX *)sslctx);
      STACK_OF(X509_INFO) * certStack = PEM_X509_INFO_read_bio(bio, NULL, NULL, NULL);
      if(!certStack)
         PrintLn("Error: PEM_X509_INFO_read_bio()");
      else
      {
         int i;

         for(i = 0; i < sk_X509_INFO_num(certStack); i++)
         {
            X509_INFO *itmp = sk_X509_INFO_value(certStack, i);
            if(itmp->x509)
               if(!X509_STORE_add_cert(store, itmp->x509))
                  PrintLn("Error: X509_STORE_add_cert()");
            if(itmp->crl)
               X509_STORE_add_crl(store, itmp->crl);
         }
         sk_X509_INFO_pop_free(certStack, X509_INFO_free);
      }
   }
   BIO_free(bio);
   return CURLE_OK;
}

static char * sslCACert;

#endif

public bool SetCurlEmbeddedCA(void * curlHandle)
{
   bool result = false;

   // Things work out of the box on Linux...
#if defined(__WIN32__) && !defined(ECERE_NOSSL) && !defined(NOT_OPENSSL_CURL)
   if(!sslCACert)
   {
      const String fn = "<:ecere>mozilla-cacert.pem";
      if(FileExists(fn))
      {
         File f = FileOpen(fn, read);
         if(f)
         {
            int len = (int)f.GetSize();
            sslCACert = new char[len+1];

            f.Read(sslCACert, 1, len);
            sslCACert[len] = 0;
            delete f;
         }
      }
   }
   if(sslCACert)
   {
      curl_easy_setopt(curlHandle, CURLOPT_CAINFO, null);
      curl_easy_setopt(curlHandle, CURLOPT_CAPATH, null);
      curl_easy_setopt(curlHandle, CURLOPT_SSLCERTTYPE, "PEM");
      curl_easy_setopt(curlHandle, CURLOPT_SSL_VERIFYPEER, 1L);
      curl_easy_setopt(curlHandle, CURLOPT_SSL_CTX_FUNCTION, sslctx_function);
      curl_easy_setopt(curlHandle, CURLOPT_SSL_CTX_DATA, sslCACert);

      result = true;
   }
#endif
   return result;
}

#else

namespace net;

public HTTPFile FileOpenURL(const char * name)
{
   return null;
}

public bool SetCurlEmbeddedCA(void * curlHandle)
{
   return false;
}

#endif
