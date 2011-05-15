import "ecere"

class Form1 : Window
{
   text = "Form1";
   background = activeBorder;
   borderStyle = sizable;
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
   size = { 640, 480 };

   ListBox listBox1 { this, text = "listBox1", size = { 108, 132 }, position = { 144, 88 } };

   DataField field1 { dataType = "int", editable = false, alignment = center, width = 40, header = "MyInt1" };
   DataField field2 { dataType = "int", editable = false, alignment = center, width = 40, header = "MyInt2" };

   Form1()
   {
      DataRow row;

      listBox1.AddField( field1 );
      listBox1.AddField( field2 );
      
      listBox1.currentRow = listBox1.AddRow();
      listBox1.SetData( field1, 2 );

      row = listBox1.AddRow();
      row.SetData( field2, 4 );

      listBox1.AddRow();
      listBox1.AddRow();
   }
}

Form1 form1 {};
