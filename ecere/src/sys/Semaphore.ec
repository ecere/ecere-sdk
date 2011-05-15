default:
#include <errno.h>
private:

namespace sys;

#define uint _uint
// Platform includes
#if defined(__WIN32__)
#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#else
#include <semaphore.h>
#endif
#undef uint

import "System"

public class Semaphore : struct
{
#if defined(__WIN32__)
   HANDLE handle;
#else   
   sem_t semaphore;
#endif

   int initCount, maxCount;

   Semaphore()
   {
#if defined(__WIN32__)
      handle = CreateSemaphore(null, 0, 1, null);
#else
      sem_init(&semaphore, 0, 0);
#endif
      maxCount = 1;
      initCount = 0;
   }

   ~Semaphore()
   {
#if defined(__WIN32__)
      if(handle) CloseHandle(handle);
#else
      sem_destroy(&semaphore);
#endif
   }

public:
   void TryWait(void)
   {
#if defined(__WIN32__)
      WaitForSingleObject(handle, 0);
#else
      sem_trywait(&semaphore);
#endif
   }

   void Wait(void)
   {
#if defined(__WIN32__)
      WaitForSingleObject(handle, INFINITE);
#else
#ifdef _DEBUG
      while(true)
      {
         if(!sem_wait(&semaphore) || errno != EINTR)
            break;
      }
#else
      sem_wait(&semaphore);
#endif
#endif
   }

   void Release(void)
   {
#if defined(__WIN32__)
      ReleaseSemaphore(handle, 1, null);
#else
      int count;
      sem_getvalue(&semaphore, &count);
      if(count < maxCount)
         sem_post(&semaphore);
#endif
   }

   property int initCount
   {
      set
      {
#if defined(__WIN32__)
         if(handle) CloseHandle(handle);
         handle = CreateSemaphore(null, value, maxCount, null);
#else
         /*
         sem_destroy(&semaphore);
         sem_init(&semaphore, false, 0);
         */
#endif
         initCount = value;
      }
      get { return initCount; }
   };
   property int maxCount
   {
      set
      {
#if defined(__WIN32__)
         if(handle) CloseHandle(handle);
         handle = CreateSemaphore(null, initCount, value, null);
#endif
         maxCount = value;
      }
      get { return maxCount; }
   };
};
