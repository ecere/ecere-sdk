import "ecere"

enum EquaError : uint16 { noError, solutionFound, divideByZero, methodNotComplete, errorInMethod, logError, sqrtError, trigonometry, huge };

struct Equation
{
   float var[27];

   EquaError solve(const char * method, uint16 num, float x, float * y)
   {
      char str[256], *fn;
      uint16 s, p, c=0;
      float space[26], *dest, source;
      short neg=1;

      *y=0;

      while(method[c])
      {
         for(p=0; ((method[c]!=';')&&(method[c]!='\\')&&method[c]); p++, c++)
            str[p]=method[c];
         str[p]=0; p=0; if(method[c]=='\\')c++;
         if(!str[0]&&(method[c]==';')) return solutionFound;

         //Destination
         if((str[p]>='a')&&(str[p]<='z'))
         {
            s=(uint16)(str[p]-'a'); if(s>25) return errorInMethod;
            if(str[1]==':')
            {
               if(s==num) dest=y; else continue;
            }
            else
               dest=&space[s];
         }
         else if((str[p]>='A')&&(str[p]<='Z'))
         {
            s=(uint16)(str[p]-'A'); if(s>25) return errorInMethod;
            dest=&var[s];
         }
         p+=2;

         //Source if not a function
         if(str[p]=='-') {neg=-1; p++;} else neg=1;
         if(str[p]=='#')
            source=x;
         else if((str[p]>='a')&&(str[p]<='z'))
         {
            s=(uint16)(str[p]-'a'); if(s>25) return errorInMethod;
            source=space[s];
         }
         else if((str[p]>='A')&&(str[p]<='Z'))
         {
            s=(uint16)(str[p]-'A'); if(s>25) return errorInMethod;
            source=var[s];
         }
         else
            source=(float)strtod(str+2, null);
         switch(str[1])
         {
            case ':': case '=': *dest =neg*source; break;
            case '+': *dest+=neg*source; break;
            case '-': *dest-=neg*source; break;
            case '*': *dest*=neg*source; break;
            case '/':
               if(!source) return divideByZero;
               *dest/=neg*source; break;
            case '_':
               fn=strstr(str+2,"_")+1;
               //***************************************
               //           MATHS FUNCTIONS           //
               //***************************************
               if(!strcmp(fn,"abs"))
               {
                  *dest=(float)fabs(*dest);
               }
               if(!strcmp(fn,"mod"))
               {
                  if(!source)return divideByZero;
                  *dest=(float)fmod(*dest, source);
               }
               if(!strcmp(fn,"pow"))
               {
                  if(source==0.5)
                  {
                     if(*dest<0) return sqrtError;
                     *dest=(float)sqrt(*dest);
                  }
                  else
                     *dest=(float)pow(*dest,source);
               }
               if(!strcmp(fn,"sqrt"))
               {
                  if(*dest<0) return sqrtError;
                  *dest=(float)sqrt(*dest);
               }
               if(!strcmp(fn,"log"))
               {
                  if(*dest<=0) return logError;
                  if((source<=0)||(source==1))
                     return logError;
                  *dest=(float)(log10(*dest)/log10(source));
               }
               if(!strcmp(fn,"sin"))
               {
                  *dest=(float)sin(*dest);
               }
               if(!strcmp(fn,"cos"))
               {
                  *dest=(float)cos(*dest);
               }
               if(!strcmp(fn,"tan"))
               {
                  *dest=(float)tan(*dest);
               }
               if(!strcmp(fn,"asin"))
               {
                  if((*dest<-1)||(*dest>1)) return trigonometry;
                  *dest=(float)asin(*dest);
               }
               if(!strcmp(fn,"acos"))
               {
                  if((*dest<-1)||(*dest>1)) return trigonometry;
                  *dest=(float)acos(*dest);
               }
               if(!strcmp(fn,"atan"))
               {
                  *dest=(float)atan(*dest);
               }
               break;
         }
         if(method[c]==';')
         {
            if(Abs(*dest)>32767) return huge; else return solutionFound;
         }
      }
      return methodNotComplete;
   }

   void graph(Surface surface, char * method, uint16 numSolutions, float scaleX, float scaleY, byte graph, byte color, ColorAlpha * palette)
   {
      uint16 s;
      float ex,ey;
      float x,y;

      surface.SetForeground(palette[graph]);
      surface.HLine(0,surface.width-1,surface.height/2);
      surface.VLine(0,surface.height-1,surface.width/2);
      for(x=scaleX; x<surface.width; x+=scaleX)
         surface.VLine(surface.height/2-1,surface.height/2+1,(int)x);
      for(y=scaleY; y<surface.height; y+=scaleY)
         surface.HLine(surface.width/2-1,surface.width/2+1,(int)y);
      surface.DrawLine(
         surface.width/2,         0,
         surface.width/2-(int)scaleY/2,(int)scaleY/2);
      surface.DrawLine(
         surface.width/2,         0,
         surface.width/2+(int)scaleY/2,(int)scaleY/2);
      surface.DrawLine(
         surface.width-1,          surface.height/2,
         surface.width-1-(int)scaleX/2, surface.height/2-(int)scaleX/2);
      surface.DrawLine(
         surface.width-1,          surface.height/2,
         surface.width-1-(int)scaleX/2, surface.height/2+(int)scaleX/2);

      surface.foreground = palette[color];
      for(x=0; x<surface.width; x+=0.1)
      {
         ex=(x-surface.width/2)/scaleX;
         for(s = 0; s < numSolutions; s++)
         {
            if(solve(method,s,ex,&ey)==solutionFound)
            {
               y=-ey*scaleY+surface.height/2;
               if((y<surface.height)&&(y>=0))
                  surface.PutPixel((int)x,(int)y);
            }
         }
      }
   }
};
