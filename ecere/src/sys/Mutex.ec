
#if defined(__ANDROID__)
#include <android/log.h>

#define printf(...)  ((void)__android_log_print(ANDROID_LOG_VERBOSE, "ecere-app", __VA_ARGS__))
#endif

namespace sys;

#undef _GNU_SOURCE
#undef __USE_UNIX98
#define _GNU_SOURCE
#define __USE_UNIX98
// Platform includes
#define uint _uint
#define set _set
#define String _String
#if defined(__WIN32__) && !defined(__EMSCRIPTEN__)
#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#else
#include <pthread.h>
#endif
#undef uint
#undef set
#undef String

import "instance"

// Moved this here from Thread.ec to make compiling ecereCOM in Debug easier
public int64 GetCurrentThreadID()
{
#if defined(__WIN32__)
   return (int64)GetCurrentThreadId();
#else
   return (int64)pthread_self();
#endif
}

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
   int64 owningThread;
#endif
   int lockCount;

   Mutex()
   {
#if defined(__WIN32__) && !defined(__EMSCRIPTEN__)
#ifdef _DEBUG
      mutex = CreateMutex(null, FALSE, null);
#else
      InitializeCriticalSection(&mutex);
#endif
#else
      pthread_mutexattr_t attr;
      pthread_mutexattr_init(&attr);

      // settype is available on Linux now, and hopefully _GNU_SOURCE should ensure it is
#if 0 // def __linux__
      pthread_mutexattr_setkind_np(&attr, PTHREAD_MUTEX_RECURSIVE_NP);
#else
      pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_RECURSIVE);
#endif

      pthread_mutex_init(&mutex, &attr);
      pthread_mutexattr_destroy(&attr);
#endif
      lockCount = 0;
#ifdef _DEBUG
      owningThread = 0;
#endif
      return true;
   }

   ~Mutex()
   {
#if defined(__WIN32__) && !defined(__EMSCRIPTEN__)
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
            printf("[%d] Waiting on Mutex %x\n", (int)GetCurrentThreadID(), this);
         */
#if defined(__WIN32__) && !defined(__EMSCRIPTEN__)
#ifdef _DEBUG
         if(WaitForSingleObject(mutex, INFINITE /*2000*/) == WAIT_TIMEOUT)
            PrintLn("Deadlock?");
#else
         EnterCriticalSection(&mutex);
#endif
#else
#ifdef _DEBUG
         {
            int e;
            e = pthread_mutex_lock(&mutex);
            if(e)
               PrintLn("pthread_mutex_lock returned ", e);
         }
#else
         pthread_mutex_lock(&mutex);
#endif
#endif

#ifdef _DEBUG
         owningThread = GetCurrentThreadID();
#endif
         lockCount++;
      }
   }

   void Release(void)
   {
      if(this)
      {
         /*
         if(this == globalSystem.fileMonitorMutex)
            printf("[%d] Releasing Mutex %x\n", (int)GetCurrentThreadID(), this);
         */
#ifdef _DEBUG
         if(lockCount && owningThread != GetCurrentThreadID())
            PrintLn("WARNING: Not in owning thread!!");
#endif

         if(!--lockCount)
#ifdef _DEBUG
            owningThread = 0;
#else
            ;
#endif
#if defined(__WIN32__) && !defined(__EMSCRIPTEN__)
#ifdef _DEBUG
         ReleaseMutex(mutex);
#else
         LeaveCriticalSection(&mutex);
#endif
#else
#ifdef _DEBUG
         {
            int e;
            e = pthread_mutex_unlock(&mutex);
            if(e)
               PrintLn("pthread_mutex_unlock returned ", e);
         }
#else
         pthread_mutex_unlock(&mutex);
#endif
#endif
#ifdef _DEBUG
         if(lockCount < 0)
            PrintLn("WARNING: lockCount < 0");
#endif
      }
   }

   property int lockCount { get { return lockCount; } }
};
