import "threadedProcessing"

class HelloTask : ProcessingTask
{
   String msg;

   ~HelloTask()
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
      delete task;
   }
}

HelloTP tp { };

class App : Application
{
   void Main()
   {
      int i;
      for(i = 0; i < 100; i++)
         tp.addTask(HelloTask { msg = PrintString("Hello Task #", i) }, 1, 1);
      tp.setup(1, 4);
      tp.wait(0);
   }
}
