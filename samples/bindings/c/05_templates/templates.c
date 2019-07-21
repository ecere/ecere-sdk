#include "ecere.h"

Class * CO(Array, ColorAlpha);
Class * CO(Array, double);
Class * CO(Foo);
Class * CO(Foo, double);
Class * CO(Foo, String);
typedef Array T(Array, ColorAlpha);
typedef Array T(Array, double);
typedef Map T(Map, String, ColorAlpha);
typedef Instance Foo;
typedef uint64_t TP(Foo, A);

struct CM(Foo) { int foo; };
bool Foo_constructor(Foo this)
{
   struct CM(Foo) * self = IPTR(this, Foo);
   self->foo = 5;
   return true;
}
void Foo_destructor(Foo this) { }

#define FOO_TP_A_INDEX 0

void Foo_add(Foo this, TP(Foo, A) value)
{
   ClassTemplateArgument * tArgs = this->_class->templateArgs;
   int tCount = this->_class->templateParams.count;
   int baseParam = this->_class->numParams - tCount;
   ClassTemplateArgument * tArg = tArgs ? &tArgs[baseParam + FOO_TP_A_INDEX] : null;
   Class * c = null;
   void * p;
   DataValue dv;
   if(tArg)
   {
      if(!tArg->dataTypeClass)
         tArg->dataTypeClass = eC_findClass(this->_class->module, tArg->dataTypeString);
      c = tArg->dataTypeClass;
   }
   if(!c) c = CO(int);
   switch(c->type)
   {
      case ClassType_noHeadClass: case ClassType_normalClass:
      case ClassType_structClass: case ClassType_unionClass:
         p = pTA(void, value);
         break;
      case ClassType_bitClass: case ClassType_unitClass:
      case ClassType_enumClass: case ClassType_systemClass:
      {
         Class * dc = c;
         if(c->type != ClassType_systemClass)
         {
            // NOTE: Storing Class in dataType here because we don't have a 'dataTypeClass', since Type is only used by eC compiler
            if(!c->dataType)
               c->dataType = (Type *) eC_findClass(c->module, c->dataTypeString);
            if(c->dataType)
               dc = (Class *)c->dataType;
         }
              if(dc == CO(double))     dv.d =       dTA(value), p = &dv.d;
         else if(dc == CO(float))      dv.f =       fTA(value), p = &dv.f;
         else if(dc == CO(char))       dv.c =       cTA(value), p = &dv.c;
         else if(dc == CO(byte))       dv.uc =      bTA(value), p = &dv.uc;
         else if(dc == CO(short))      dv.s =       sTA(value), p = &dv.s;
         else if(dc == CO(uint16))     dv.us =     usTA(value), p = &dv.us;
         else if(dc == CO(int))        dv.i =       iTA(value), p = &dv.i;
         else if(dc == CO(uint))       dv.ui =     uiTA(value), p = &dv.ui;
         else /* if(c == CO(int64)) */ dv.ui64 = ui64TA(value), p = &dv.ui64;
         break;
      }
   }
   printLn(c, p, null);
}

int main(int argc, char *argv[])
{
   Application module = eC_init(null, true, false, argc, argv);
   //C(Window) win = newi(Window);
   double d;
   Foo foo;

   ecere_init(module);

   T(Array, ColorAlpha) a;
   T(Array, double) ad;
   //T(Map, String, ColorAlpha) m;

   CO(Array, ColorAlpha) = eC_findClass(module, "Array<ColorAlpha>");
   a = newi(Array, ColorAlpha);
   Container_add(a, ColorAlpha_from_Color(DefinedColor_red));
   //Container_add(a, COLORALPHA(255, red));
   printLn(a->_class, a, null);

   CO(Array, double) = eC_findClass(module, "Array<double>");
   ad = newi(Array, double);
   Container_add(ad, TAd(3.14159));
   printLn(ad->_class, ad, null);

   d = ((double *)IPTR(ad, Array)->array)[0];
   printLn(CO(double), &d, null);

   // CO(Foo) = registerClass(module, Foo, Instance);
   CO(Foo) = registerClass(module, Foo, Map<String, int>);
   Class_addTemplateParameter(CO(Foo), "A", TemplateParameterType_type, null, null);
   Class_doneAddingTemplateParameters(CO(Foo));
   addMethod(CO(Foo), "add", Foo_add);

   CO(Foo, double) = eC_findClass(module, "Foo<A = double>");
   foo = newi(Foo, double);
   Foo_add(foo, TAd(3.14159));

   CO(Foo, String) = eC_findClass(module, "Foo<String>");
   foo = newi(Foo, String);
   Foo_add(foo, TAp("Hello, Templates in C!"));
   return 0;
}
