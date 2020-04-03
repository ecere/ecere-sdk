import "threadedProcessing"

class HelloTask : ProcessingTask
{
   String msg;

   void OnFree()
   {
      delete msg;
   }
}

class HelloTP : ThreadedProcessing
{
   ProcessingAction onPerformTask(ProcessingTask t)
   {
      HelloTask task = (HelloTask)t;
      PrintLn(task.msg, " (running on thread ", t.status.threadID, ")");
      return clear;
   }

   void onTaskCleared(ProcessingTask t)
   {
      HelloTask task = (HelloTask)t;
      task.OnFree();
   }
}

HelloTP tp { };

class App : Application
{
   void Main()
   {
      int i;

      tp.setup(1, 4);
      for(i = 0; i < 100; i++)
         tp.addTask(HelloTask { msg = PrintString("Hello Task #", i) }, 1, 1);
      tp.wait(0);
   }
}
