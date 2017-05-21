#define MODULE_NAME  "HelloForm"

// #define __CONSOLE_APP__

#include "ecere.hpp"

GuiApplication app;

MAIN_DEFINITION;

class Foo : public Instance
{
public:
   int a, b;
   Foo(int a, int b) : Foo() { this->a = a, this->b = b; };

   CONSTRUCT(Foo, Instance)
   {
      onCopy = [](Foo & self, Foo & other)
      {
         printf("%d, %d\n", other.a, other.b);
         printf("self: %p\n", &self);
         self.a = other.a;
         self.b = other.b;
      };

      onCompare = [](Foo & self, Foo & other)
      {
         if(self.a > other.a) return  1;
         if(self.a < other.a) return -1;
         if(self.b > other.b) return  1;
         if(self.b < other.b) return -1;
         return 0;
      };

      /*onDisplay = [](Foo & self, Surface & s, int x , int y , int w, void * fd, Alignment a, DataDisplayFlags f)
      {
         printf("Meh\n");
      };
      */
   }

   REGISTER()
   {
      //Instance::class_registration(_class);
      register_onDisplay(_class, [](Foo & _self, Surface & s, int x , int y , int w, void * fd, Alignment a, DataDisplayFlags f) { printf("Meh\n"); });
   }
};
REGISTER_CLASS_DEF(Foo, Instance, app);

void testStuff();

class HelloForm2 : public Window
{
public:
   Button button;

   CONSTRUCT(HelloForm2, Window)
   {
      caption = $("My Second Ecere/C++ Bindings App");
      borderStyle = sizable;
      clientSize = { 640, 480 };
      hasClose = true;
      hasMaximize = true;
      hasMinimize = true;
      background = formColor;
      font = { "Arial", 30 };

      button.parent = this;
      button.position = { 200, 200 };
      button.caption = $("Yay!!");
      // button.onRedraw = [](Window & w, Surface s){ };
      button.notifyClicked = [](Window & owner, Button & btn, int x, int y, Modifiers mods)
      {
         double i = 3.14159265;
         char tmp[256];
         constString s = _onGetString(class_double, &i, tmp, null, null);
         //PrintLn(class_String, "Hello! -- ", class_String, s, null); // Need to terminate with a null!
         //HelloForm2 & self = (HelloForm2 &)owner;
         //MessageBox($("C++ Bindings!"), self.button.caption).modal();

         /*FontResource a("Arial", 20, true);
         FontResource b("Comic Sans MS", 20, true);
         FontResource c("Arial", 20, true);

         int ab = ((FontResource *)null)->onCompare(b);
         //bool ab = ((FontResource *)null)->onCompare(*(FontResource *)null);
         //bool ac = a.onCompare(c);
         int ac = a.onCompare(*(FontResource *)null);
         printf("a compare b = %d\n", ab);
         printf("a compare c = %d\n", ac);*/

         {
            Foo obj1 { 2, 3 };
            Foo obj2 { 2, 4 };
            Foo obj3 { 2, 3 };
            /*Foo obj4; obj4.onCopy(obj1);
            FontResource fr;
            fr.onCopy(a);
            printf("result: face = %s, size = %f, bold = %d\n",
               (constString)fr.faceName, (float)fr.size, (int)fr.bold);
            printf("after");
            */
            Surface s { };
            Foo * o = (Foo *)null; o->onDisplay(s, 0,0,0, null, (Alignment)0, (DataDisplayFlags)0);
            //((Foo *)&obj3)->onDisplay(Surface { }, 0,0,0, null, 0, 0);

            int r;
            r = obj1.onCompare(obj2); printf("result: %d\n", r);
            //r = obj2.onCompare(obj1); printf("result: %d\n", r);
            //r = obj1.onCompare(obj3); printf("result: %d\n", r);
            //printf("result: a = %d, b = %d\n", obj4.a, obj4.b);

            testStuff();
         }
         return true;
      };

      /*onCreate = [](Window & w)
      {
         MessageBox($("Cool"), $("Creation!")).modal();
         return true;
      };*/

      //onRedraw(Surface());
      //onCreate();
   }

   /*static void myOnRedraw(Window & w, Surface & surface)
   {
      surface.writeTextf(100, 100, $("Testing stuff!"));
      //surface.writeTextf(100, 100, "%d + %d = %d", 2, 3, 2+3);
   };*/

   REGISTER()
   {
      Window::class_registration(_class);
      register_onRedraw(_class, [](Window & w, Surface & surface)
      {
         surface.writeTextf(100, 100, $("Class Method!"));
         //surface.writeTextf(100, 100, "%d + %d = %d", 2, 3, 2+3);
      });
   }
};
REGISTER_CLASS_DEF(HelloForm2, Window, app);

void testStuff()
{
   //eC_Class * c = eC_findClass(app.impl, "HelloForm2");
   eC_Class * c = HelloForm2::_class.impl;
   ((HelloForm2 *)_INSTANCE(newi(c), c))->modal();
}

class HelloForm3 : public HelloForm2
{
public:
   CONSTRUCT(HelloForm3, HelloForm2)
   {
      background = 0x50B0F0;
      position = { 0, 0 };
      font = { "Monaco", 30, true };

      onRedraw = [](Window & w, Surface & surface)
      {
         surface.writeTextf(100, 100, $("Instance Method!"));
         //surface.writeTextf(100, 100, "%d + %d = %d", 2, 3, 2+3);
      };
   }
};
REGISTER_CLASS_DEF(HelloForm3, HelloForm2, app);

//HelloForm2 hello2;
HelloForm3 hello3;
