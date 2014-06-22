import "ecere"

class Form1 : Window
{
   text = "Form1";
   background = activeBorder;
   borderStyle = sizable;
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
   size = Size { 640, 480 };

   ListBox listBox1 { fullRowSelect = false, collapseControl = true, treeBranches = true, rootCollapseButton = true, parent = this, text = "listBox1", size = Size { 306, 432 }, anchor = Anchor { left = 10, top = 10, right = 0.5, bottom = 10 } };

   void ListDirectory(DataRow addTo, const char *path)
   {
      static int maxDepth = 0;
      FileListing listing { path };
      maxDepth++;
      while(maxDepth < 5 && listing.Find())
      {
         DataRow row = addTo.AddString(listing.name);
         row.collapsed = true;
         if(listing.stats.attribs.isDirectory)
            ListDirectory(row, listing.path);
      }
      maxDepth--;
   }

   bool OnCreate()
   {
      const String rootDir = (GetRuntimePlatform() == win32) ? "c:" : getenv("HOME");
      DataRow row = listBox1.AddString(rootDir);
      ListDirectory(row, rootDir);
      return true;
   }
}

Form1 form1 {};
