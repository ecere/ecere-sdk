import "ecere"
#include "jni.h"
//#include "com_ecere_hello_HelloWorld.h"

// contains wrapper functions

void eCFunction ()
{
   printf("Hello world from eC!\n");
}

//static void JNICALL Java_com_ecere_hello_HelloWorld_sayHello(JNIEnv * env, jobject instance)
//JNIEXPORT void JNICALL Java_com_ecere_hello_HelloWorld_sayHello(JNIEnv * env, jobject instance)
void JNICALL jni_HelloWorld_sayHello(JNIEnv * env, jobject instance)
{
  printf ("Hello world!\n");

  /* We are calling function from another source */
  eCFunction ();
  /*
  jclass cls = (*env)->GetObjectClass(env, instance);
   jmethodID getImplID = (*env)->GetMethodID(env, cls, "getImpl", "()J");
   jlong impl = (*env)->CallLongMethod(env, instance, getImplID);
   MyObject object = (MyObject)(uintptr)impl;
   object.doSOmething(env, instance);
  */
}

void JNICALL Java_com_ecere_hello_HelloWindow_button_notifyClicked(JNIEnv * env, jobject instance)
{
   jclass cls = (*env)->GetObjectClass(env, instance);
   jmethodID getImplID = (*env)->GetMethodID(env, cls, "getImpl", "()J");
   jlong impl = (*env)->CallLongMethod(env, instance, getImplID);
   //MyObject object = (MyObject)(uintptr)impl;
   //object.doSOmething(env, instance);
}
// jclass myclass = env->FindClass("com/ecere/hello/HelloWindow");
// jmethodID cnstrctr1 = env->GetMethodID(myclass, "<init>", "(Lcom/ecere/hello/HelloWindow;)V");