#define _Noreturn

namespace sys;

#define set _set
#define uint _uint
// Platform includes
#if defined(__WIN32__)
#define WIN32_LEAN_AND_MEAN
#define String String_
#define Thread Thread_
#include <windows.h>
#undef String
#undef Thread
#else
#include <pthread.h>
#if !defined(__ANDROID__)
#include <signal.h>
#endif
#endif
#undef uint
#undef set

import "instance"

#if !defined(__WIN32__)
import "Semaphore"
#endif

public enum ThreadPriority
{
   normal = 0,
   aboveNormal = 1,
   belowNormal = -1,
   highest = 2,
   lowest = -2,
   idle = -15,
   timeCritical = 15
};

public class Thread
{
   ~Thread()
   {
#if defined(__WIN32__)
      if(handle)
         CloseHandle(handle);
#endif
   }

#if defined(__WIN32__)
   HANDLE handle;
   uint id;
#elif !defined(__EMSCRIPTEN__)
   pthread_t id;
   bool dontDetach;
   Semaphore sem { };
#else
   uint id;
#endif

   uint returnCode;
   bool started;

#if !defined(__EMSCRIPTEN__)
#if defined(__WIN32__)
   uint ThreadCallBack()
#else
   void * ThreadCallBack()
#endif
   {
      uint returnCode = this.returnCode = Main();
      started = false;
#if defined(__WIN32__)
      CloseHandle(handle);
      handle = null;
#else
      if(!dontDetach)
         pthread_detach(id);
      sem.Release();

#endif
      delete this;
#if defined(__WIN32__)
      return returnCode;
#else
      return (void *)(uintptr_t)returnCode;
#endif
   }
#endif

public:
   virtual uint Main(void);

   void Create()
   {
      incref this;
      if(!started)
      {
#if !defined(__WIN32__) && !defined(__EMSCRIPTEN__)
         sem.TryWait();
#endif
         started = true;
         // printf("Creating %s thread\n", _class.name);
#if !defined(__EMSCRIPTEN__)
#if defined(__WIN32__)
         if(!handle)
         {
            DWORD tID;
            handle = CreateThread(NULL, 0, (LPTHREAD_START_ROUTINE)ThreadCallBack, this, 0, &tID);
            id = (uint)tID;
         }
#else
         {
            int error;
            /*pthread_attr_t attr;
            pthread_attr_init(&attr);
            pthread_attr_setdetachstate(&attr, PTHREAD_CREATE_JOINABLE);*/  // Default attribute ???
            error = pthread_create(&id, null /*&attr*/, ThreadCallBack, this);
            if(error)
               printf("Error %d creating a thread\n", error);
         }
#endif
#endif
      }
   }

   void Kill()
   {
#if !defined(__EMSCRIPTEN__)
#if defined(__WIN32__)
      if(handle)
      {
         TerminateThread(handle, 0);
         handle = null;
      }
#else
      if(started)
         pthread_kill(id, SIGQUIT);
#endif
#endif
      if(started)
      {
         started = false;
         delete this;
      }
   }

   void Wait()
   {
#if !defined(__EMSCRIPTEN__)
#if defined(__WIN32__)
      if(WaitForSingleObject(handle, INFINITE /*2000*/) == WAIT_TIMEOUT)
         PrintLn("Thread not returning?\n");
#else

      /*dontDetach = true;
      if(started)
         pthread_join(id, NULL);*/

      if(started)
         sem.Wait();
#endif
#endif
   }

   void SetPriority(ThreadPriority priority)
   {
#if !defined(__EMSCRIPTEN__)
#if defined(__WIN32__)
      SetThreadPriority(handle, priority);
#else
      /*
      struct sched_param param;
      int policy = (priority > 0) ? SCHED_RR : SCHED_OTHER;
      param.sched_priority = (priority > 0) ? (priority * 99 / 15) : 0;
      pthread_setschedparam(id, policy, &param);
      */
#endif
#endif
   }

   property bool created { get { return started; } };
}

