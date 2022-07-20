#ifdef ECERE_STATIC
public import static "ecere"
#else
public import "ecere"
#endif

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
         if(!stage.performTask(this) && !terminate)
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
   bool cancel:1;
   bool waitedOn:1;
}

public class ProcessingTask : ListItem
{
   class_no_expansion;
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
   int thisStage;

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

         if(thread.terminate || task.status.cancel)
         {
            action = clear;
            tasks.Remove(task);
         }
         else
         {
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
            if(thread.terminate || task.status.cancel)
               action = clear;
         }

         if(!thread.canceled)
         {
            switch(action)
            {
               case awaitProcessing:
                  task.status.ready = true;
                  readyTasks.Add(task);
                  break;
               case clear:
                  mutex.Release();
                  if(!(task.status.cancel && task.status.waitedOn))
                  {
                     processing.onTaskCleared(task);
                     delete task;
                  }
                  mutex.Wait();
                  // TO REVIEW: This was leaking?
                  break;
               default:
                  mutex.Release();
                  processing.addTask(task, action, task.priority);
                  /*
                  if(action > processing.stages.count)
                     processing.setup(action, 0);
                  task.status.stage = action;
                  processing.stages[action-1].addTask(task, task.priority);
                  */
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

   bool performSpecificTask(ProcessingTask task, ProcessingThread thread)
   {
      bool result = false;

      mutex.Wait();
      if(task && !task.status.active)
      {
         ProcessingAction action;

         if(task.status.cancel)
         {
            action = clear;
            tasks.Remove(task);
         }
         else
         {
            tasks.Remove(task);
            if(thread)
            {
               thread.activeTask = task;
               task.status.threadID = thread.number;
            }
            mutex.Release();

            action = processing.onPerformTask(task);
            mutex.Wait();
            if(thread)
               thread.activeTask = null;
            task.status.threadID = 0;
            task.status.active = false;
            if(task.status.cancel)
               action = clear;
         }

         switch(action)
         {
            case awaitProcessing:
               task.status.ready = true;
               readyTasks.Add(task);
               break;
            case clear:
               mutex.Release();
               // TO REVIEW: // if(task.status.waitedOn) This was leaking? -- turned this around completely?
               if(!task.status.cancel || !task.status.waitedOn)
               {
                  processing.onTaskCleared(task);
                  delete task;
               }
               mutex.Wait();
               break;
            default:
               mutex.Release();
               processing.addTask(task, action, task.priority);
               mutex.Wait();
               break;
         }
         result = true;
      }
      mutex.Release();
      return result;
   }

   bool processTasks(int maxTasks)
   {
      bool result = false;
      int i;

      for(i = 0; !maxTasks || i < maxTasks; i++)
      {
         ProcessingTask task = null;
         bool hadTask = false;

         mutex.Wait();
         task = readyTasks.first;
         if(task)
         {
            ProcessingAction action;

            hadTask = true;
            readyTasks.Remove(task);
            task.status.active = true;

            mutex.Release();
            action = processing.onProcess(task);
            mutex.Wait();

            task.status.active = false;
            if(task.status.cancel) action = clear;

            switch(action)
            {
               case awaitProcessing:   // error to mark for processing again...
               case clear:
                  if(!task.status.cancel || !task.status.waitedOn)
                  {
                     processing.onTaskCleared(task);
                     delete task;
                  }
                  break;
               default:
                  mutex.Release();
                  processing.addTask(task, action, task.priority);
                  mutex.Wait();
            }

            result = true;
         }
         mutex.Release();
         if(!hadTask) break;
      }
      return result;
   }

   void init(int numThreads)
   {
      int i;

      semaphore.maxCount = numThreads;
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
         ProcessingThread t = threads[i];
         if(t)
            t.terminate = true;
      }
      for(i = 0; i < threads.count; i++)
         semaphore.Release();

      for(i = 0; i < threads.count; i++)
      {
         ProcessingThread t = threads[i];
         if(t)
         {
            semaphore.Release();
            t.Wait();
            delete threads[i];
         }
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

   void cancelTask(ProcessingTask task, bool wait)
   {
      // Mutex is locked when coming in from ThreadedProcessing::cancelTask()
      //mutex.Wait();
      task.status.cancel = true;
      if(wait)
      {
         int lc = mutex.lockCount, i;
         bool wasActive = task.status.active;

         task.status.waitedOn = true;
         while(wait && task.status.active)
         {
            for(i = 0; i < lc; i++) mutex.Release();
            Sleep(0.01);
            for(i = 0; i < lc; i++) mutex.Wait();
         }

         if(!task.status.active)
         {
            if(task.status.ready)
               readyTasks.Remove(task);
            else
            {
               ProcessingTask t = task;
               if(wasActive)
               {
                  for(t = tasks.first; t; t = t.next)
                  {
                     if(t == task)
                        break;
                  }
               }
               if(t)
                  tasks.Remove(task);
               else
                  ; //PrintLn("NOTE: cancelTask() -- task not found");
            }
            for(i = 0; i < lc; i++) mutex.Release();
            processing.onTaskCleared(task);
            for(i = 0; i < lc; i++) mutex.Wait();
            delete task;
         }
      }

      //mutex.Release();
   }

   void cancelAllTasks()
   {
      ProcessingTask task;

      mutex.Wait();
      while((task = tasks.first))
      {
         task.status.cancel = true;
         task.status.waitedOn = true;
         while(task.status.active)
         {
            mutex.Release();
            Sleep(0.01);
            mutex.Wait();
         }
         tasks.Remove(task);
         mutex.Release();
         processing.onTaskCleared(task);
         mutex.Wait();

         delete task;
      }
      while((task = readyTasks.first))
      {
         readyTasks.Remove(task);
         mutex.Release();
         processing.onTaskCleared(task);
         mutex.Wait();
         delete task;
      }
      for(t : threads; t)
      {
         ProcessingThread thread = t;
         while(thread.activeTask)
         {
            mutex.Release();
            Sleep(0.01);
            mutex.Wait();
         }
      }
      mutex.Release();
   }

   void prioritizeTask(ProcessingTask task, int priority)
   {
      mutex.Wait();
      if(task.status.stage == thisStage)
      {
         task.priority = priority;

         if(task.status.ready)
         {
            if(priority < MAXINT)
            {
               if(task.prev || task == readyTasks.first)
                  readyTasks.Move(task, null);
            }
            else if(task.next)
               readyTasks.Move(task, readyTasks.last);
         }
         else
         {
            if(priority < MAXINT)
            {
               if(task.prev || task == tasks.first)   // What's with that extra == first check?
                  tasks.Move(task, null);
            }
            else if(task.next)
               tasks.Move(task, tasks.last);
         }
      }
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
            stages[stage-1] = { processing = this, thisStage = stage };
         if(numThreads >= stages[stage-1].threads.count || (numThreads && !stages[stage-1].threads[0]))
            stages[stage-1].init(numThreads);
      }
   }

   void terminate()
   {
      int s;
      for(s = 0; s < stages.count; s++)
      {
         ProcessingStage stage = stages[s];
         if(stage)
            stage.terminate();
         stages[s] = null;
         delete stage;
      }
   }

   ~ThreadedProcessing()
   {
      terminate();
   }

   bool addTask(ProcessingTask task, int stage, int priority)
   {
      bool result = false;
      if(stage > 0 && stages.count) // TODO: Should not come here if already destroyed
      {
         if(stage-1 >= stages.count)
            setup(stage, 0);
         if(stages[stage-1])
         {
            task.status = { stage };
            stages[stage-1].addTask(task, priority);
            result = true;
         }
#ifdef _DEBUG
         else
         {
            PrintLn("WARNING: Adding ", _class.name, " task to destroyed stage ", stage);
         }
#endif
      }
      return result;
   }

   void cancelTask(ProcessingTask task, bool wait)
   {
      if(task)
      {
         bool done = false;
         while(!done && !task.status.cancel)
         {
            int s = task.status.stage;
            ProcessingStage stage = s ? stages[s-1] : null;
            if(stage)
            {
               stage.mutex.Wait();
               if(task.status.stage == s)
               {
                  stage.cancelTask(task, wait);
                  done = true;
               }
               stage.mutex.Release();
            }
            else
               break;
         }
      }
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
#ifdef _DEBUG
      if(task.status.stage > 10)
         PrintLn("WARNING: Likely invalid task!!");
#endif
      if(task.status.stage)
         stages[task.status.stage-1].prioritizeTask(task, priority);
   }

   bool processTasks(int stage, int maxTasks)
   {
      bool result = false;
      int s;
      // Process all tasks marked as 'ready' for a given stage
      for(s = stage ? stage - 1 : 0; stages && s < stages.count; s++)
      {
         if(stages[s])
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

   // Migrate tasks to another stage
   bool performSpecificTask(int stage, ProcessingTask task, ProcessingThread thread)
   {
      bool result = false;
      if(!task.status.active && task.status.stage == stage)
         result = stages[stage-1].performSpecificTask(task, thread);
      return result;
   }

   // Wait for all tasks of a given stage to be cleared or ready
   void wait(int stage)
   {
      int s;
      for(s = stage ? stage - 1 : 0; s < stages.count; s++)
      {
         ProcessingStage ps = stages[s];
         while(true)
         {
            int count = ps.tasks.count;
            bool active = count > 0;

            onProgress(s+1, count);
            if(!active)
            {
               int t;
               for(t = 0; t < ps.threads.count; t++)
               {
                  if(ps.threads[t] && ps.threads[t].activeTask)
                  {
                     active = true;
                     break;
                  }
               }
               if(!active)
                  break;
            }

            Sleep(0.01);
         }
         if(stage) break;
      }
   }

   // Process tasks as they are ready while waiting for all tasks of a given stage to be cleared
   void processAndWait(int stage)
   {
      int s;
      for(s = stage ? stage - 1 : 0; s < stages.count; s++)
      {
         ProcessingStage ps = stages[s];
         while(true)
         {
            if(!processTasks(stage, 10))
            {
               bool active = (ps.tasks.count || ps.readyTasks.count);
               if(!active)
               {
                  int t;
                  for(t = 0; t < ps.threads.count; t++)
                  {
                     if(ps.threads[t] && ps.threads[t].activeTask)
                     {
                        active = true;
                        break;
                     }
                  }
                  if(!active)
                     break;
               }
               Sleep(0.01);
            }
         }
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
