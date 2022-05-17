import "testingFramework"

import "testCSOtherFile"
import "testZLastFile"

struct tuintptr
{
public:
   uintptr a;
   uintptr b;
};

class BTemplatonKey:tuintptr;
class BTemplatonKey2:tuintptr2;
class BTemplatonKey3:tuintptr3;

struct TestCase
{
   const String id;
   Class c;
};

Array<TestCase> testsCases { [
   { "ClassType",   class(BTemplatonKey)  },
   { "CTOtherFile", class(BTemplatonKey2) },
   { "CTLastFile",  class(BTemplatonKey3) } // Whether base class was registered before or after derived class is important (FixDerivativesBase)
] };

class ClassStructTest : eTest
{
   void testCT(TestCase tCase)
   {
      if(tCase.c.type == noHeadClass)
         pass(tCase.id, null);
      else
         fail(tCase.id, null, "registered class is of wrong type");
   }

   void executeTests()
   {
      for(tc : testsCases)
         testCT(tc);
   }
}
