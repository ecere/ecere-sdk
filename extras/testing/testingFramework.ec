import "ecere"

public class eTest
{
public:
   const String inputPath;  inputPath = "/test_data";
   const String outputPath;
   Map<String, String> parameters;

   void pass(const String testID, const String testCase)
   {
      PrintLn("*PASSED*  [", _class.name, ":", testID, testCase ? ":" : "", testCase ? testCase : "", "]", $" successfully.");
   }

   void skip(const String testID, const String testCase, const String reason)
   {
      PrintLn("(SKIPPED) [", _class.name, ":", testID, testCase ? ":" : "", testCase ? testCase : "", "]", $" because ", reason, ".");
   }

   void fail(const String testID, const String testCase, const String reason)
   {
      PrintLn("!FAILED!  [", _class.name, ":", testID, testCase ? ":" : "", testCase ? testCase : "", "]", $" because ", reason, ".");
      app.exitCode = 1;
   }

   ~eTest()
   {
      if(parameters) parameters.Free(), delete parameters;
   }

   virtual bool prepareTests();
   virtual void executeTests();
   virtual void cleanTests();
}

enum TestAction { test, prepare, clean, keep };

class TestApp : GuiApplication
{
   void Main()
   {
      OldLink d;
      TestAction action = test;

      if(argc > 1)
      {
         const String sAction = argv[1];
              if(!strcmpi(sAction, "test"));
         else if(!strcmpi(sAction, "prepare")) action = prepare;
         else if(!strcmpi(sAction, "clean"))   action = clean;
         else if(!strcmpi(sAction, "keep"))    action = keep;
         else
         {
            PrintLn($"Syntax: ", argv[0], $" [[[test | prepare | clean] <inputs dir> [<outputs dir>]]]");
            exitCode = 1;
            return;
         }
      }

      for(d = class(eTest).derivatives.first; d; d = d.next)
      {
         subclass(eTest) c = d.data;
         eTest ut = eInstance_New(c);
         char outputDir[MAX_LOCATION];

         if(ut)
         {
            int c, numOptions = 0;
            const String currentOption = null;
            if(argc > 2)
            {
               for(c = 2; c<argc; c++)
               {
                  const char * arg = argv[c];
                  if(arg[0] == '-')
                  {
                     if(!ut.parameters) ut.parameters = {};
                     currentOption = arg+1;//CopyString(arg+1);
                     if(currentOption != null)
                        numOptions++;
                  }
                  else if(currentOption != null)
                  {
                     ut.parameters[currentOption] = CopyString(arg);
                     currentOption = null;
                  }
                  else
                  {
                     int index = 2 + (numOptions *2);
                     if(c == index)
                        ut.inputPath = CopyString(arg);
                     else if(c > index)
                        ut.outputPath = CopyString(arg);
                  }
               }
               if(argc <= 3)
               {
                  sprintf(outputDir, "output_%s", ut._class.name);
                  ut.outputPath = outputDir;
               }
            }
            else
            {
               sprintf(outputDir, "output_%s", ut._class.name);
               ut.outputPath = outputDir;
            }
         }

         if(action == clean)
            ut.cleanTests();
         else
         {
            bool result = ut.prepareTests();
            if(result && (action == test || action == keep))
            {
               PrintLn($"Preparation suceeded; cleaning any previous test outputs.");
               ut.cleanTests();

               PrintLn($"Executing tests.");
               ut.executeTests();
               if(action != keep)
               {
                  PrintLn($"Cleaning test outputs (re-run with 'keep' to keep them).");
                  ut.cleanTests();
               }
               else
                  PrintLn($"Keeping test outputs in ", outputDir, ".");
            }
            else
            {
               PrintLn($"Test preparation ", result ? $"succeeded" : $"failed", $" for ", ut._class.name, ".");
               if(!result)
                  exitCode = 1;
            }
         }
         delete ut;
      }

      if(exitCode)
         PrintLn($"\nSome tests or preparation FAILED.");
      else if(action == prepare)
         PrintLn($"\nAll tests prepared successfully.");
      else if(action == clean)
         PrintLn($"\nAll tests cleaned successfully.");
      else
         PrintLn($"\nAll tests PASSED successfully.");
   }
}

define app = (TestApp)__thisModule.application;
