#ifdef ECERE_STATIC
public import static "ecere"
#else
public import "ecere"
#endif

default:

static void _WorkAround()
{
   int a;
   a.OnGetDataFromString(null);
}
extern int __ecereVMethodID_class_OnGetDataFromString;

private:

public class Currency : double
{
   char * OnGetString(char * tempString, void * fieldData, bool * needClass)
   {
      char number[256];
      int len;
      int c = 0;
      int pos = 2;
      bool firstGroup = true;

      sprintf(number, "%.2f", this);
      len = strlen(number);

      sprintf(tempString, "$ ");
      if(number[c] == '-')
      {
         c++;
         tempString[pos++] = '-';
      }

      while(true)
      {
         int numDigits = len - c - 3;
         if(numDigits > 3)
         {
            if(firstGroup)
            {
               numDigits = (len - c - 3) % 3;
               if(!numDigits) numDigits = 3;
               firstGroup = false;
            }
            else
               numDigits = 3;
         }
         memcpy(tempString + pos, number + c, numDigits);
         c += numDigits;
         pos += numDigits;
         if(c == len - 3)
            break;
         tempString[pos++] = ',';
      }
      strcpy(tempString + pos, number + c);
      return tempString;
   }

   bool OnGetDataFromString(char * string)
   {
      int c;
      char ch;
      char number[256] = "";
      int len = 0;
      bool gotDot = false;
      int numDecimals = 0;
      for(c = 0; (ch = string[c]) && !isdigit(ch) && ch != '.'; c++);
      for(; (ch = string[c]) && (isdigit(ch) || ch == '.' || ch == ',' || ch == ' '); c++)
      {
         if(ch != ',' && ch != ' ')
         {
            if(ch == '.') gotDot = true;
            else if(gotDot)
               numDecimals++;
            number[len++] = ch;
            if(numDecimals == 2)
               break;
         }
      }
      number[len] = 0;
      return ((bool (*)(void *, void *, const char *))(void *)class(double)._vTbl[__ecereVMethodID_class_OnGetDataFromString])(class(double), &this, number);
   }
}
