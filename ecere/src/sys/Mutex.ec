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

#ifdef _DEBUG
int GetCurrentThreadID();
#endif

public class Mutex : struct
{
//   class_fixed
#if defined(__WIN32__)
#ifdef _DEBUG
   HANDLE mutex;
#else
   CRITICAL_SECTION mutex;
#endif
#else
   pthread_mutex_t mutex;
#endif

#ifdef _DEBUG
   int owningThread;
   int lockCount;
#endif

   Mutex()
   {
#if defined(__WIN32__)
#ifdef _DEBUG
      mutex = CreateMutex(null, FALSE, null);
#else
      InitializeCriticalSection(&mutex);
#endif
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
#ifdef _DEBUG
      lockCount = 0;
      owningThread = 0;
#endif
      return true;
   }

   ~Mutex()
   {
#if defined(__WIN32__)
#ifdef _DEBUG
      CloseHandle(mutex);
#else
      DeleteCriticalSection(&mutex);
#endif
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
#ifdef _DEBUG
         if(WaitForSingleObject(mutex, INFINITE /*2000*/) == WAIT_TIMEOUT)
            PrintLn("Deadlock?");
#else
         EnterCriticalSection(&mutex);
#endif
#else
         pthread_mutex_lock(&mutex);
#endif

#ifdef _DEBUG
         owningThread = GetCurrentThreadID();
         lockCount++;
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

#ifdef _DEBUG
         if(!--lockCount)
            owningThread = 0;
#endif
#if defined(__WIN32__)
#ifdef _DEBUG
         ReleaseMutex(mutex);
#else
         LeaveCriticalSection(&mutex);
#endif
#else
         pthread_mutex_unlock(&mutex);
#endif
      }
   }
};
