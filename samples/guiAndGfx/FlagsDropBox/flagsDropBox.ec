import "ecere"

import "CountryCode"

class CustomDataTypesForm : Window
{
   text = "Custom Data Types";
   background = activeBorder;
   borderStyle = sizable;
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
   size = { 332, 112 };

   CountryCode country;

   FlagCollection flags { this };
   SavingDataBox dropBox
   {
      this, text = "Please Select Your Country", size = { 300, 24 }, position = { 16, 40 },
      data = &country, type = class(CountryCode), fieldData = flags
   };
   Label lblDropBox { this, font = { "Tahoma", 10, bold = true }, position = { 16, 16 }, labeledWindow = dropBox };
}

CustomDataTypesForm form {};
