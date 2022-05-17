import "ecere"

public class eTest
{
public:
   const String inputPath;  inputPath = "/test_data";
   const String outputPath;

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
            if(argc > 2) ut.inputPath = argv[2];
            if(argc > 3)
               ut.outputPath = argv[3];
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
               PrintLn($"Test preparation ", result ? $"succeeded" : $"failed", ".");
               if(!result)
                  exitCode = 1;
            }
         }
         delete ut;
      }

      if(exitCode)
         PrintLn($"\nSome tests or preparation FAILED.");
      else
         PrintLn($"\nAll tests PASSED successfully.");
   }
}

define app = (TestApp)__thisModule.application;
