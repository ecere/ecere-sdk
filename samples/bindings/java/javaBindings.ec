// move this ec file where?

import "ecere"
#include <jni.h>

class BindingsCallback
{
   jobject javaInstance;
   jobject bindingsInst;

   // Add data members as needed...

   void onConfigured(JNIEnv * env, jobject bindings)
   {
      // write some eC code here...
	  this.bindingsInst = (*env)->NewGlobalRef(env, bindings);
   }
}

default:

static jlong JNICALL jni_construct(JNIEnv * env, jobject instance)
{
   BindingsCallback myBindingsCallback { javaInstance = instance }; // Take a reference here?
   incref myBindingsCallback;
   return (jlong)(uintptr)myBindingsCallback;
}
static void JNICALL jni_destruct(JNIEnv * env, jobject instance, jlong eCinst)
{
   BindingsCallback myBindingsCallback = (BindingsCallback)(uintptr)eCinst;
   myBindingsCallback.javaInstance = null;
   delete myBindingsCallback;
}

private:

static JNINativeMethod methods[] = {
    {"construct",       "()J",                                          (void *)&jni_construct},
    {"destruct",        "(J)V",                                         (void *)&jni_destruct}
};

jclass * jcBindingsCallback;

bool registerNativesCSC(JNIEnv * env)
{
   jcBindingsCallback = (*env)->FindClass(env,"com/ecere/hello/BindingsCallback");
   if(jcBindingsCallback)
   {
      jcBindingsCallback = (*env)->NewGlobalRef(env, jcBindingsCallback);
      (*env)->RegisterNatives(env, jcBindingsCallback, methods, sizeof(methods)/sizeof(methods[0]));
   }
   return true;
}
