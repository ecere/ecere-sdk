package com.ecere.hello;

/*
public class HelloWorld {
   static
   {
      //System.loadLibrary("ecere");
      System.loadLibrary("hello");
   }

   public static void main(String[] args) {
        new HelloWorld().sayHello();
   }

   private native void sayHello();
}*/

public class HelloWindow {

   static
   {
      System.loadLibrary("helloWorld");
   }

   public static native void HelloWindow_onRedraw();
   public static native bool HelloWindow_button_notifyClicked()
   {
      MessageBox msgBox = new MessageBox();
      Window_set_caption(msgBox, $("Hello!"));
      MessageBox_set_contents(msgBox, $("C Bindings!"));
      Window_modal(msgBox);
      return true;
   };

   public static native bool HelloWindow_constructor()
   {
      Window_set_caption(this, "My Second Ecere/C Bindings App");
      Window_set_borderStyle(this, BorderStyle_sizable);
      Window_set_clientSize(this, { 640, 480 });
      Window_set_hasClose(this, true);
      Window_set_hasMaximize(this, true);
      Window_set_hasMinimize(this, true);
      Window_set_background(this, SystemColor_formColor);

      this.button = new Button();
      Window_set_parent(this.button, this);
      Window_set_position(this.button, { 200, 200 });
      Window_set_caption(this.button, "Yay!!");
      Instance_setMethod(this.button, "NotifyClicked", HelloWindow_button_notifyClicked);
      return true;
   };

   public static native void HelloWindow_destructor();

   public static void main(String[] args) {

      HelloWindow w = new HelloWindow();

   }

   /*GUIAPP_INTRO
   {
      CO(HelloWindow) = registerClass(app, HelloWindow, Window);
      addMethod(CO(HelloWindow), "OnRedraw", HelloWindow_onRedraw);

      HelloWindow hello = newi(HelloWindow);

      Application_main(app);

      deletei(hello);
   }
   //ECERE_APP_OUTRO*/
}