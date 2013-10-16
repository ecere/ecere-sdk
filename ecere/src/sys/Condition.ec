#if defined(BUILDING_ECERE_COM)
import "Semaphore"
#else
import "ecere"
#endif

public class Condition : struct
{
   char * name;
   Mutex lock { };
   int waiting;
   int signals;
   Semaphore waitSem { };
   Semaphore waitDone { };

public:
   property char * name
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
