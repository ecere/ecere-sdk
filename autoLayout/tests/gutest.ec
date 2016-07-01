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
   CUxA e1 { this, caption = "e1" };
   CUxA e2 { this, caption = "e2" };
   CUxA e3 { this, caption = "e3" };
   CUxA e4 { this, caption = "e4" };
   CUxA e5 { this, caption = "e5" };
   CUxA e6 { this, caption = "e6" };
   CUxA e7 { this, caption = "e7" };
   CUxA e8 { this, caption = "e8" };
}

class CUxA : Ux
{
   margin = 4;
   border = { 2, black };
   bgColor = beige;
   padding = 2;
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
