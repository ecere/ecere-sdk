default:
#include <errno.h>
private:

namespace sys;

#define uint _uint
// Platform includes
#if defined(__WIN32__)
#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#elif defined(__APPLE__)
#define set _set
#include <mach/mach.h>
#include <mach/task.h>
#include <mach/semaphore.h>
#undef set
#else
#include <semaphore.h>
#endif
#undef uint

import "System"

public class Semaphore : struct
{
#if defined(__WIN32__)
   HANDLE handle;
#elif defined(__APPLE__)
   semaphore_t semaphore;
   int count;
   Mutex mutex { };
#else   
   sem_t semaphore;
#endif

   int initCount, maxCount;

   Semaphore()
   {
#if defined(__WIN32__)
      handle = CreateSemaphore(null, 0, 1, null);
#elif defined(__APPLE__)
      semaphore_create(mach_task_self(), &semaphore, SYNC_POLICY_FIFO, 0);
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
#elif defined(__APPLE__)
      semaphore_destroy(mach_task_self(), semaphore);
#else
      sem_destroy(&semaphore);
#endif
   }

public:
   void TryWait(void)
   {
#if defined(__WIN32__)
      WaitForSingleObject(handle, 0);
#elif defined(__APPLE__)
      bool wait = false;
      mutex.Wait();
      if(count > 0)
      {
         count--;
         wait = true;
      }
      mutex.Release();
      if(wait)
         semaphore_wait(semaphore);
#else
      sem_trywait(&semaphore);
#endif
   }

   void Wait(void)
   {
#if defined(__WIN32__)
      if(WaitForSingleObject(handle, INFINITE /*2000*/) == WAIT_TIMEOUT)
         PrintLn("Semaphore not released?");
#elif defined(__APPLE__)
      mutex.Wait();
      count--;
      mutex.Release();
      semaphore_wait(semaphore);
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
#elif defined(__APPLE__)
      mutex.Wait();
      count++;
      mutex.Release();
      semaphore_signal(semaphore);
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
         handle = CreateSemaphore(null, initCount, value, null);
#elif defined(__APPLE__)
         semaphore_destroy(mach_task_self(), semaphore);
         semaphore_create(mach_task_self(), &semaphore, SYNC_POLICY_FIFO, 0);
         count = value;
#else
         sem_destroy(&semaphore);
         sem_init(&semaphore, 0, initCount);
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
         handle = CreateSemaphore(null, value, maxCount, null);
#endif
         maxCount = value;
      }
      get { return maxCount; }
   };
};
