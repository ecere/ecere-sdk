namespace sys;

#define uint _uint
// Platform includes
#if defined(__WIN32__)
#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#else
#include <pthread.h>
#include <sys/signal.h>
#endif
#undef uint

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

public int GetCurrentThreadID()
{
#if defined(__WIN32__)
   return (int)GetCurrentThreadId();
#else
   return pthread_self();
#endif
}

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
#else
   pthread_t id;
   bool dontDetach;
   Semaphore sem { };
#endif

   uint returnCode;
   bool started;

   uint ThreadCallBack()
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
      return returnCode;
   }

public:
   virtual uint Main(void);

   void Create()
   {
      incref this;
      if(!started)
      {
#if !defined(__WIN32__)
         sem.TryWait();
#endif
         started = true;
         // printf("Creating %s thread\n", _class.name);
#if defined(__WIN32__)
         if(!handle)
            handle = CreateThread(NULL, 0, (LPTHREAD_START_ROUTINE)ThreadCallBack, this, 0, &id);
#else
         {
            int error;
            /*pthread_attr_t attr;
            pthread_attr_init(&attr);
            pthread_attr_setdetachstate(&attr, PTHREAD_CREATE_JOINABLE);*/  // Default attribute ???
            error = pthread_create(&id, null /*&attr*/, (void *)ThreadCallBack, this);
            if(error)
               printf("Error %d creating a thread\n", error);
          }
#endif
      }
   }

   void Kill()
   {
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
      if(started)
      {
         started = false;
         delete this;
      }
   }

   void Wait()
   {
#if defined(__WIN32__)
      WaitForSingleObject(handle, INFINITE);
#else
      
      /*dontDetach = true;
      if(started)
         pthread_join(id, NULL);*/

      if(started)
         sem.Wait();
#endif
   }

   void SetPriority(ThreadPriority priority)
   {
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
   }

   property bool created { get { return started; } };
}
