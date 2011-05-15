import "ecere"

/*
public enum CaseStyle { lower, upper, proper };
public enum WordStyle { letter, abreviation, full };
public enum StringStyle { simple, normal, detailed };
public enum TimeStyle {  };
*/

/*
class Months
class Years
class Decade
class Century
class Millenia
*/

// Placing public class Minutes : Seconds or any other here crashes ecc

//public class Seconds : Time { public property Time {} };

class Minutes : Seconds { public property Seconds { set { return value /        60            ; } get { return this *        60            ; } }
   public void ToString(char * output, Class smallUnit) //, int digits, StringStyle style)
   {
      if(smallUnit == class(Seconds))
      {
         Seconds seconds = this;
         int m = (int)this;
         int s = (int)seconds % 60;
         sprintf(output, "%dm %ds", m, s);
      }
      else
      {
         int m = (int)this;
         sprintf(output, "%dm", m);
      }
   }
};
class Hours : Seconds { public property Seconds { set { return value /      3600            ; } get { return this *      3600            ; } } };
class Days : Seconds { public property Seconds { set { return value /     86400            ; } get { return this *     86400            ; } } };


