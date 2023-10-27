import "ecere"

public class eTest
{
public:
   const String inputPath;
   const String outputPath;
   Map<String, const String> arguments;

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
      Map<String, const String> options = null;
      char outputDir[MAX_LOCATION];
      const String inputPath = "/test_data", outputPath = null;
      int a;
      const String currentOption = null;
      bool inOptions = false, syntaxError = false;

      for(a = 1; !syntaxError && a < argc; a++)
      {
         const char * arg = argv[a];
         if(arg[0] == '-')
         {
            if(!options) options = {};
            currentOption = arg + 1;
            inOptions = true;
         }
         else if(currentOption)
         {
            options[currentOption] = arg;
            currentOption = null;
         }
         else if(!inOptions)
         {
            if(a == 1 && argc > 2 && argv[2][0] != '-')
               syntaxError = !action.OnGetDataFromString(arg);
            else if(a == 1 || a == 2)
               inputPath = arg;
            else if(a == 3)
               outputPath = arg;
         }
         else
            syntaxError = true;
      }
      if(syntaxError)
      {
         PrintLn($"Syntax: ", argv[0], $" [[[test | prepare | clean] <inputs dir> [<outputs dir>]]]");
         exitCode = 1;
         delete options;
         return;
      }

      for(d = class(eTest).derivatives.first; d; d = d.next)
      {
         subclass(eTest) c = d.data;
         eTest ut = eInstance_New(c);

         ut.inputPath = inputPath;

         if(outputPath)
            ut.outputPath = outputPath;
         else
         {
            sprintf(outputDir, "output_%s", ut._class.name);
            ut.outputPath = outputDir;
         }
         ut.arguments = options;

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

      delete options;

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
