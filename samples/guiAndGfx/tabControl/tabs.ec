import "ecere"

class MainDialog : Window
{
   text = "Tab Sample";
   nativeDecorations = true;
   borderStyle = sizable;
   background = activeBorder;
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
   size = { 640, 480 };

   TabControl tabControl { this, anchor = { left = 0, top = 0, right = 0, bottom = 0 } };
   Tab1 tab1Form { tabControl };
   Tab2 tab2Form { tabControl };
}

class Tab1 : Tab
{
   text = "Tab 1";
   int p;

   Timer timer1
   {
      this, delay = 0.01;
      bool DelayExpired()
      {
         if(p < 1000)
            progressBar1.progress = ++p;
         return true;
      }
   };

   bool OnCreate()
   {
      timer1.started = true;
      return true;
   }

   Button button1 { this, text = "button1" };
   ProgressBar progressBar1 { this, text = "progressBar1", range = 1000 };
};

class Tab2 : Tab
{
   text = "Tab 2";

   EditBox editBox1 { this, text = "editBox1" };
};

MainDialog dialog { };
