namespace gui;

import "Window"

public class Timer
{
public:
   property void * userData { set { window = value; } get { return window; } };
   property Seconds delay { set { _delay = value; } get { return _delay; } };
   property bool started { set { if(value) Start(); else Stop(); } get { return started; } };

   ~Timer()
   {
      Stop();
   }

   void Start()
   {
      if(!started)
      {
         incref this;
         guiApp.windowTimers.Add(this);
         lastTime = GetTime();
         started = true;
      }
   }

   void Stop()
   {
      if(started)
      {
         started = false;
         guiApp.windowTimers.Remove(this);
         delete this;
      }
   }
   virtual bool any_object::DelayExpired(void);

private:
   Timer prev, next;
   public Seconds _delay;  // NOTE: Made public for Emscripten alignment issues
   Time lastTime;
   Window window;
   bool dispatched;
   bool started;
};
