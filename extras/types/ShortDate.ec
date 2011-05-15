#ifdef ECERE_STATIC
public import static "ecere"
#else
public import "ecere"
#endif

public struct ShortDate : Date
{
   char * OnGetString(char * stringOutput, void * fieldData, bool * needClass)
   {
      static const char months[12][4] = 
      {
         "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
      };
      if(day || month || year)
         sprintf(stringOutput, "%s %d, %d", months[month], day, year);
      else
         stringOutput[0] = 0;
      return stringOutput;
   }
};
