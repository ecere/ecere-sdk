import "test"

class TestGuhix1 : TestGuhixWindow
{
   caption = $"Hix | Gu";
   background = lightGray;//clWindwow;
   borderStyle = sizable;
   hasClose = true;
   hasMaximize = true;
   hasMinimize = true;
   showInTaskBar = true;
   nativeDecorations = true;
   clientSize = { 480, 220 };
   minClientSize = { 320, 140 };

   ux = UxTestStackedEntries { };
}

class UxTestStackedEntries : Ux
{
   maxSize = { 1.0 };
   Ux e1 { this, caption = "e1" };
   Ux e2 { this, caption = "e2" };
   Ux e3 { this, caption = "e3" };
   Ux e4 { this, caption = "e4" };
   Ux e5 { this, caption = "e5" };
   Ux e6 { this, caption = "e6" };
   Ux e7 { this, caption = "e7" };
   Ux e8 { this, caption = "e8" };
}

//TestTextList tTextList { };
//TestInfiniteContainerList tInfiniteContainerList { };

Array<const String> hello { [ "hello1", "hello2", "hello3", "hello4", "hello5", "hello6", "hello8", "hello7", "hello9", "hello4", "hello1", "hello8", "hello3" ] };
class TestTextList : TestGuhixWindow
{
   caption = $"Hix | Old Frank";
   background = lightGray;//clWindwow;
   borderStyle = sizable;
   hasClose = true;
   hasMaximize = true;
   hasMinimize = true;
   showInTaskBar = true;
   nativeDecorations = true;
   clientSize = { 480, 220 };
   minClientSize = { 320, 140 };

   //ux = ddd
   lx = hello;
}
