package com.ecere.hello;

public class hello extends android.app.NativeActivity
{
   static
   {
      System.loadLibrary("ecere");
      System.loadLibrary("hello");
   }
}
