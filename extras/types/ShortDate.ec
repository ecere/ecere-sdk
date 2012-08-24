#ifdef ECERE_STATIC
public import static "ecere"
#else
public import "ecere"
#endif

static Array<String> shortMonths
{ [
   $"Jan", $"Feb", $"Mar", $"Apr", $"May", $"Jun", $"Jul", $"Aug", $"Sep", $"Oct", $"Nov", $"Dec"
] };

public struct ShortDate : Date
{
   char * OnGetString(char * stringOutput, void * fieldData, bool * needClass)
   {
      if(day || month || year)
      {
         if(month >= january && month <= december)
            sprintf(stringOutput, "%s %d, %d", shortMonths[month], day, year);
         else
            strcpy(stringOutput, $"Invalid date");
      }
      else
         stringOutput[0] = 0;
      return stringOutput;
   }
};
