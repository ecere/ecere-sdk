namespace sys;

// Platform includes
#define uint _uint
#if defined(__WIN32__)
#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#else
#include <pthread.h>
#endif
#undef uint

import "instance"

public class Mutex : struct
{
//   class_fixed
#if defined(__WIN32__)
   CRITICAL_SECTION mutex;
#else
   pthread_mutex_t mutex;
#endif

   Mutex()
   {
#if defined(__WIN32__)
      InitializeCriticalSection(&mutex);
#else
      pthread_mutexattr_t attr;
      pthread_mutexattr_init(&attr);

#ifdef __linux__
      pthread_mutexattr_setkind_np(&attr, PTHREAD_MUTEX_RECURSIVE_NP);
#else
      pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_RECURSIVE);
#endif

      pthread_mutex_init(&mutex, &attr);
      pthread_mutexattr_destroy(&attr);
#endif
      return true;
   }

   ~Mutex()
   {
#if defined(__WIN32__)
      DeleteCriticalSection(&mutex);
#else
      pthread_mutex_destroy(&mutex);
#endif
   }

public:
   void Wait(void)
   {
      if(this)
      {
         /*
         if(this == globalSystem.fileMonitorMutex)
            printf("[%d] Waiting on Mutex %x\n", GetCurrentThreadID(), this);
         */
#if defined(__WIN32__)
         EnterCriticalSection(&mutex);
#else
         pthread_mutex_lock(&mutex);
#endif
      }
   }

   void Release(void)
   {
      if(this)
      {
         /*
         if(this == globalSystem.fileMonitorMutex)
            printf("[%d] Releasing Mutex %x\n", GetCurrentThreadID(), this);
         */

#if defined(__WIN32__)
         LeaveCriticalSection(&mutex);
#else
         pthread_mutex_unlock(&mutex);
#endif
      }
   }
};
