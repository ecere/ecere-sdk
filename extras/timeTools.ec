#ifdef ECERE_STATIC
public import static "ecere"
#else
public import "ecere"
#endif

Time QuickTime()
{
   DateTime time, t;
   time.GetLocalTime();
   return time.hour * 60 * 60 + time.minute * 60 + time.second;
}

public class TimeGate
{
private:
   Time from;
public:
   Time delay;

   property bool elapsed
   {
      get
      {
         Time time = GetTime();
         if(!from || time - from > delay)
         {
            from = time;
            return true;
         }
         return false;
      }
   }
}

