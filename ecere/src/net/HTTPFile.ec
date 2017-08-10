#ifndef ECERE_NONET

#include <stdio.h>

import "List"
import "network"
#ifndef ECERE_NOSSL
import "SSLSocket"
#endif

#include <curl/curl.h>

#undef CompareString


#include <stdio.h>
#include <string.h>
#ifndef WIN32
#  include <sys/time.h>
#endif
#include <stdlib.h>
#include <errno.h>

enum fcurl_type_e
{
  CFTYPE_NONE=0,
  CFTYPE_FILE=1,
  CFTYPE_CURL=2
};

struct URL_FILE
{
  CURLM *multi_handle;
  fcurl_type_e type;     /* type of handle */
  union {
    CURL *curl;
    FILE *file;
  };                   /* handle */

  char *buffer;               /* buffer to store cached data*/
  size_t buffer_len;          /* currently allocated buffers length */
  size_t buffer_pos;          /* end of data in buffer*/
  int still_running;          /* Is background url fetch still in progress */
};

/* we use a global one for convenience */
// CURLM *multi_handle;

/* curl calls this routine to get more data */
static size_t write_callback(char *buffer,
                             size_t size,
                             size_t nitems,
                             void *userp)
{
  char *newbuff;
  size_t rembuff;

  URL_FILE *url = (URL_FILE *)userp;
  size *= nitems;

  rembuff=url->buffer_len - url->buffer_pos; /* remaining space in buffer */

  if(size > rembuff) {
    /* not enough space in buffer */
    newbuff=realloc(url->buffer, url->buffer_len + (size - rembuff));
    if(newbuff==NULL) {
      fprintf(stderr, "callback buffer grow failed\n");
      size=rembuff;
    }
    else {
      /* realloc succeeded increase buffer size*/
      url->buffer_len+=size - rembuff;
      url->buffer=newbuff;
    }
  }

  memcpy(&url->buffer[url->buffer_pos], buffer, size);
  url->buffer_pos += size;

  return size;
}

/* use to attempt to fill the read buffer up to requested number of bytes */
static int fill_buffer(URL_FILE *file, size_t want)
{
  fd_set fdread;
  fd_set fdwrite;
  fd_set fdexcep;
  struct timeval timeout;
  int rc;
  CURLMcode mc; /* curl_multi_fdset() return code */

  /* only attempt to fill buffer if transactions still running and buffer
   * doesn't exceed required size already
   */
  if((!file->still_running) || (file->buffer_pos > want))
    return 0;

  /* attempt to fill buffer */
  do {
    int maxfd = -1;
    long curl_timeo = -1;

    FD_ZERO(&fdread);
    FD_ZERO(&fdwrite);
    FD_ZERO(&fdexcep);

    /* set a suitable timeout to fail on */
    timeout.tv_sec = 60; /* 1 minute */
    timeout.tv_usec = 0;

    curl_multi_timeout(file->multi_handle, &curl_timeo);
    if(curl_timeo >= 0) {
      timeout.tv_sec = curl_timeo / 1000;
      if(timeout.tv_sec > 1)
        timeout.tv_sec = 1;
      else
        timeout.tv_usec = (curl_timeo % 1000) * 1000;
    }

    /* get file descriptors from the transfers */
    mc = curl_multi_fdset(file->multi_handle, &fdread, &fdwrite, &fdexcep, &maxfd);

    if(mc != CURLM_OK) {
      fprintf(stderr, "curl_multi_fdset() failed, code %d.\n", mc);
      break;
    }

    /* On success the value of maxfd is guaranteed to be >= -1. We call
       select(maxfd + 1, ...); specially in case of (maxfd == -1) there are
       no fds ready yet so we call select(0, ...) --or Sleep() on Windows--
       to sleep 100ms, which is the minimum suggested value in the
       curl_multi_fdset() doc. */

    if(maxfd == -1) {
#ifdef _WIN32
      ecere::sys::Sleep(0.01);
      rc = 0;
#else
      /* Portable sleep for platforms other than Windows. */
      struct timeval wait = { 0, 100 * 1000 }; /* 100ms */
      rc = select(0, NULL, NULL, NULL, &wait);
#endif
    }
    else {
      /* Note that on some platforms 'timeout' may be modified by select().
         If you need access to the original value save a copy beforehand. */
      rc = select(maxfd+1, &fdread, &fdwrite, &fdexcep, &timeout);
    }

    switch(rc) {
    case -1:
      /* select error */
      break;

    case 0:
    default:
      /* timeout or readable/writable sockets */
      curl_multi_perform(file->multi_handle, &file->still_running);
      break;
    }
  } while(file->still_running && (file->buffer_pos < want));
  return 1;
}

/* use to remove want bytes from the front of a files buffer */
static int use_buffer(URL_FILE *file, size_t want)
{
  /* sort out buffer */
  if((file->buffer_pos - want) <=0) {
    /* ditch buffer - write will recreate */
    free(file->buffer);
    file->buffer=NULL;
    file->buffer_pos=0;
    file->buffer_len=0;
  }
  else {
    /* move rest down make it available for later */
    memmove(file->buffer,
            &file->buffer[want],
            (file->buffer_pos - want));

    file->buffer_pos -= want;
  }
  return 0;
}

URL_FILE *url_fopen(const char *url, const char *operation)
{
  /* this code could check for URLs or types in the 'url' and
     basically use the real fopen() for standard files */

  URL_FILE *file;
  (void)operation;

  file = malloc(sizeof(URL_FILE));
  if(!file)
    return NULL;

  memset(file, 0, sizeof(URL_FILE));

  if((file->file=fopen(url, operation)))
    file->type = CFTYPE_FILE; /* marked as URL */

  else {
    file->type = CFTYPE_CURL; /* marked as URL */
    file->curl = curl_easy_init();

    curl_easy_setopt(file->curl, CURLOPT_URL, url);
    curl_easy_setopt(file->curl, CURLOPT_WRITEDATA, file);
    curl_easy_setopt(file->curl, CURLOPT_VERBOSE, 0L);
    curl_easy_setopt(file->curl, CURLOPT_SSL_VERIFYPEER, 0L);
    curl_easy_setopt(file->curl, CURLOPT_WRITEFUNCTION, write_callback);
    curl_easy_setopt(file->curl, CURLOPT_ACCEPT_ENCODING, "");
    curl_easy_setopt(file->curl, CURLOPT_USE_SSL, CURLUSESSL_TRY);
    // curl_easy_setopt(file->curl, CURLOPT_USE_SSL, CURLUSESSL_ALL);

    if(!file->multi_handle)
      file->multi_handle = curl_multi_init();

    curl_multi_add_handle(file->multi_handle, file->curl);

    /* lets start the fetch */
    curl_multi_perform(file->multi_handle, &file->still_running);

    if((file->buffer_pos == 0) && (!file->still_running)) {
      /* if still_running is 0 now, we should return NULL */

      /* make sure the easy handle is not in the multi handle anymore */
      curl_multi_remove_handle(file->multi_handle, file->curl);

      /* cleanup */
      curl_easy_cleanup(file->curl);

      free(file);

      file = NULL;
    }
  }
  return file;
}

int url_fclose(URL_FILE *file)
{
  int ret=0;/* default is good return */

  switch(file->type) {
  case CFTYPE_FILE:
    ret=fclose(file->file); /* passthrough */
    break;

  case CFTYPE_CURL:
    /* make sure the easy handle is not in the multi handle anymore */
    curl_multi_remove_handle(file->multi_handle, file->curl);

    /* cleanup */
    curl_easy_cleanup(file->curl);
    break;

  default: /* unknown or supported type - oh dear */
    ret=EOF;
    errno=EBADF;
    break;
  }

  free(file->buffer);/* free any allocated buffer space */
  free(file);

  return ret;
}

int url_feof(URL_FILE *file)
{
  int ret=0;

  switch(file->type) {
  case CFTYPE_FILE:
    ret=feof(file->file);
    break;

  case CFTYPE_CURL:
    if((file->buffer_pos == 0) && (!file->still_running))
      ret = 1;
    break;

  default: /* unknown or supported type - oh dear */
    ret=-1;
    errno=EBADF;
    break;
  }
  return ret;
}

size_t url_fread(void *ptr, size_t size, size_t nmemb, URL_FILE *file)
{
  size_t want;

  switch(file->type) {
  case CFTYPE_FILE:
    want=fread(ptr, size, nmemb, file->file);
    break;

  case CFTYPE_CURL:
    want = nmemb * size;

    fill_buffer(file, want);

    /* check if theres data in the buffer - if not fill_buffer()
     * either errored or EOF */
    if(!file->buffer_pos)
      return 0;

    /* ensure only available data is considered */
    if(file->buffer_pos < want)
      want = file->buffer_pos;

    /* xfer data to caller */
    memcpy(ptr, file->buffer, want);

    use_buffer(file, want);

    want = want / size;     /* number of items */
    break;

  default: /* unknown or supported type - oh dear */
    want=0;
    errno=EBADF;
    break;

  }
  return want;
}

namespace net;

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

   bool OpenURL(const char * name, const char * referer, char * relocation)
   {
      f = url_fopen(name, "rb");
      return f != null;
   }

private:

   ~HTTPFile()
   {
      if(f)
         url_fclose(f);
   }

   uintsize Read(byte * buffer, uintsize size, uintsize count)
   {
      return url_fread(buffer, size, count, f);
   }

   uintsize Write(const byte * buffer, uintsize size, uintsize count)
   {
      return 0;
   }

   bool Getc(char * ch)
   {
      uintsize read = Read(ch, 1, 1);
      return !url_feof(f) && read != 0;
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
         //bufferPos = pos;
         return true;
      }
      else if(mode == current) // && bufferPos == 0 && ((int)position + pos) <= bufferCount && ((int)position + pos) >= 0)
      {
         //bufferPos = position + pos;
         return true;
      }
      else if(mode == end) // && totalSizeSet && bufferPos == 0 && bufferCount == totalSize && ((int)totalSize - pos) <= bufferCount && ((int)totalSize - pos) >= 0)
      {
         //bufferPos = totalSize - pos;
         return true;
      }
      return false;
   }

   uint64 Tell()
   {
      return 0; //position;
   }

   bool Eof()
   {
      return (bool)url_feof(f);
   }

   uint64 GetSize()
   {
      return 0; //totalSize;
   }

   void Abort()
   {
      //aborted = true;
   }
private:

   String contentType;
   String contentDisposition;

   URL_FILE * f;
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

#endif
