import "ecere"

class ProcessingThread : Thread
{
   ProcessingTask activeTask;
   ProcessingStage stage;
   int number;

   bool terminate;
   bool canceled;

   unsigned int Main()
   {
      ProcessingStage stage = this.stage;
      while(!terminate)
         if(!stage.performTask(this))
            stage.semaphore.Wait();
      return 0;
   }
}

class ProcessingTaskStatus : uint32
{
public:
   int stage:8;
   int threadID:16;
   bool active:1;
   bool ready:1;
}

class ProcessingTask : ListItem
{
   ProcessingTaskStatus status;
   int priority;
}

class ProcessingStage
{
   ThreadedProcessing processing;
   Array<ProcessingThread> threads { size = 1 };
   LinkList<ProcessingTask> tasks { };
   LinkList<ProcessingTask> readyTasks { };
   Mutex mutex { };
   Semaphore semaphore { };

   bool performTask(ProcessingThread thread)
   {
      bool result = false;
      ProcessingTask task;

      if(!thread)
      {
         thread = threads[0];
         if(!thread)
         {
            thread = threads[0] = { stage = this };
            incref threads[0];
         }
      }

      // PrintLn("Thread ", thread.number, " working!");

      mutex.Wait();
      task = tasks.first;
      if(task)
      {
         ProcessingAction action;
         thread.activeTask = task;
         task.status.active = true;
         tasks.Remove(task);
         task.status.threadID = thread.number;

         mutex.Release();
         action = processing.onPerformTask(task);
         mutex.Wait();

         task.status.threadID = 0;
         task.status.active = false;
         thread.activeTask = null;
         if(thread.terminate) action = clear;

         if(!thread.canceled)
         {
            switch(action)
            {
               case awaitProcessing:
                  task.status.ready = true;
                  readyTasks.Add(task);
                  break;
               case clear:
                  processing.onTaskCleared(task);
                  break;
               default:
                  mutex.Release();
                  processing.stages[action-1].addTask(task, task.priority);
                  mutex.Wait();
                  break;
            }
         }
         thread.canceled = false;
         result = true;
      }
      mutex.Release();
      return result;
   }

   bool processTasks(int maxTasks)
   {
      bool result = true;
      int i;

      for(i = 0; !maxTasks || i < maxTasks; i++)
      {
         ProcessingTask task = null;

         mutex.Wait();
         task = readyTasks.first;
         if(task)
         {
            ProcessingAction action;

            readyTasks.Remove(task);
            task.status.active = true;

            mutex.Release();
            action = processing.onProcess(task);
            mutex.Wait();

            task.status.active = false;
            switch(action)
            {
               case awaitProcessing:   // error to mark for processing again...
               case clear:
                  processing.onTaskCleared(task);
                  break;
               default:
                  mutex.Release();
                  processing.addTask(task, action, task.priority);
                  mutex.Wait();
            }

            result = true;
         }
         mutex.Release();
         if(!task) break;
      }
      return result;
   }

   void init(int numThreads)
   {
      int i;

      threads.size = numThreads;
      for(i = 0; i < numThreads; i++)
      {
         if(!threads[i])
         {
            threads[i] = { stage = this, number = i+1 };
            incref threads[i];
         }
         threads[i].Create();
      }
   }

   void terminate()
   {
      int i;

      for(i = 0; i < threads.count; i++)
      {
         threads[i].terminate = true;
         semaphore.Release();
      }
      for(i = 0; i < threads.count; i++)
      {
         semaphore.Release();
         threads[i].Wait();
         delete threads[i];
      }
      threads.size = 1;

      cancelAllTasks();
   }

   void addTask(ProcessingTask task, int priority)
   {
      //ProcessingTask t;

      mutex.Wait();
      task.priority = priority;
      tasks.Insert(tasks.last, task);
      semaphore.Release();
      mutex.Release();
   }

   void cancelTask(ProcessingTask task)
   {
      mutex.Wait();

      while(task.status.active)
      {
         mutex.Release();
         Sleep(0.01);
         mutex.Wait();
      }
      if(task.status.ready)
         readyTasks.Remove(task);
      else
         tasks.Remove(task);
      processing.onTaskCleared(task);
      mutex.Release();
   }

   void cancelAllTasks()
   {
      ProcessingTask task;

      mutex.Wait();
      while((task = tasks.first))
      {
         while(task.status.active)
         {
            mutex.Release();
            Sleep(0.01);
            mutex.Wait();
         }
         tasks.Remove(task);
         processing.onTaskCleared(task);
      }
      while((task = readyTasks.first))
      {
         readyTasks.Remove(task);
         processing.onTaskCleared(task);
      }
      mutex.Release();
   }

   void prioritizeTask(ProcessingTask task, int priority)
   {
      mutex.Wait();
      task.priority = priority;
      tasks.Move(task, null);
      mutex.Release();
   }

   ~ProcessingStage()
   {
      terminate();
   }
}

enum ProcessingAction : int
{
   clear = -1,
   awaitProcessing = 0,
   stage1 = 1,
   stage2 = 2,
   stage3 = 3,
   stage4 = 4
};

// - Once added, the task must remain alive until performTask() or process() has been called and 'clear' has been returned,
//   or until cancelTask() has been called and returned.
// - cancelTask() and prioritizeTask() must be called on previously added tasks still held by processing system
class ThreadedProcessing
{
public:
   Array<ProcessingStage> stages { };

   void setup(int stage, int numThreads)
   {
      if(stage)
      {
         if(stage > stages.count)
            stages.size = stage;
         if(!stages[stage-1])
            stages[stage-1] = { processing = this };
         if(numThreads >= stages[stage-1].threads.count)
            stages[stage-1].init(numThreads);
      }
   }

   void terminate()
   {
      stages.Free();
   }

   ~ThreadedProcessing()
   {
      terminate();
   }

   void addTask(ProcessingTask task, int stage, int priority)
   {
      if(stage-1 >= stages.count)
         setup(stage, 0);
      task.status = { stage };
      stages[stage-1].addTask(task, priority);
   }

   void cancelTask(ProcessingTask task)
   {
      stages[task.status.stage-1].cancelTask(task);
   }

   void cancelAllTasks(int stage)
   {
      int s;
      for(s = stage ? stage - 1 : 0; s < stages.count; s++)
      {
         stages[s].cancelAllTasks();
         if(stage) break;
      }
   }

   void prioritizeTask(ProcessingTask task, int priority)
   {
      stages[task.status.stage-1].prioritizeTask(task, priority);
   }

   bool processTasks(int stage, int maxTasks)
   {
      bool result = true;
      int s;
      // Process all tasks marked as 'ready' for a given stage
      for(s = stage ? stage - 1 : 0; s < stages.count; s++)
      {
         result |= stages[s].processTasks(maxTasks);
         if(stage) break;
      }
      return result;
   }

   // Perform tasks of a given stage in calling thread
   bool performTasks(int stage, int maxTasks)
   {
      bool result = false;
      int s;
      int t = 0;
      for(s = stage ? stage - 1 : 0; s < stages.count; s++)
      {
         while(true)
         {
            bool r = stages[s].performTask(null);
            result |= r;
            if(!r || (maxTasks && ++t >= maxTasks))
               break;
         }
         if(stage) break;
      }
      return result;
   }

   // Wait for all tasks of a given stage to be cleared or ready
   void wait(int stage)
   {
      int s;
      for(s = stage ? stage - 1 : 0; s < stages.count; s++)
      {
         ProcessingStage ps = stages[s];
         while(ps.tasks.count)
         {
            onProgress(s+1, ps.tasks.count);
            Sleep(0.01);
         }
         if(stage) break;
      }
   }

   // Called back from wait() with how many tasks still queued on that stage
   virtual bool onProgress(int stage, int tasksQueued) { return true; }

   // onPerformTask() is called back from the stage threads
   virtual ProcessingAction onPerformTask(ProcessingTask task) { return clear; }

   // onProcess() is invoked for each awaiting processing tasks from within processTasks()
   virtual ProcessingAction onProcess(ProcessingTask task) { return clear; }

   // onTaskCleared() is called after returning clear from onProcess() or onPerformTasks(),
   // as well as from cancelTask(), cancelAllTasks(), terminate()
   virtual void onTaskCleared(ProcessingTask task);
}
