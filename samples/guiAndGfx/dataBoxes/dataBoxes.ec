import "ecere"

class ColorFun : Window
{
   text = "Fun With Colors and Data Boxes";
   background = activeBorder;
   borderStyle = sizable;
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
   nativeDecorations = true;
   tabCycle = true;
   size = { 640, 480 };

   Color color;
   color = activeBorder;
   SavingDataBox colorBox
   {
      this, size = { 116, 20 }, position = { 176, 104 }; data = &color; type = class(Color);

      bool NotifyChanged(DataBox dataBox, bool closingDropDown)
      {
         background = color;
         return true;
      }
   };

   Date date;
   DateTime now;
   date = (now.GetLocalTime(), Date { now.year, now.month, now.day });
   SavingDataBox dateBox
   {
      this, size = { 200, 20 }, position = { 376, 104 }; data = &date; type = class(Date);
   };

   DateTime dateTime;
   dateTime = now;
   SavingDataBox dateTimeBox
   {
      this, size = { 200, 20 }, position = { 376, 304 }; data = &dateTime; type = class(DateTime);
   };

   double d;
   d = Pi;
   SavingDataBox doubleBox
   {
      this, size = { 116, 20 }, position = { 176, 204 }; data = &d; type = class(double);
   };
}

ColorFun form {};
