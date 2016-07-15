#if defined(BUILDING_ECERE_COM)
//#if !defined(__EMSCRIPTEN__)
import "Semaphore"
//#else
//import "ecere"
//#endif
#else
import "ecere"
#endif

namespace sys;

#if !defined(__EMSCRIPTEN__)

public class Condition : struct
{
   const char * name;
   Mutex lock { };
   int waiting;
   int signals;
   Semaphore waitSem { };
   Semaphore waitDone { };

public:
   property const char * name
   {
      set { name = value; }
      get { return name; }
   }

   void Signal()
   {
      lock.Wait();
      if (waiting > signals)
      {
         signals++;
         waitSem.Release();
         lock.Release();
         waitDone.Wait();
      }
      else
         lock.Release();
   }

   void Wait(Mutex mutex)
   {
      lock.Wait();
      waiting++;
      lock.Release();

      mutex.Release();

      waitSem.Wait();

      lock.Wait();
      if(signals > 0)
      {
         waitDone.Release();
         signals--;
      }
      waiting--;
      lock.Release();

      mutex.Wait();
   }
}

#endif // !defined(__EMSCRIPTEN__)
