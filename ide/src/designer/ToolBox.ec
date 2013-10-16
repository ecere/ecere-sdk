import "ide"

extern int __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnLeftButtonUp;

static void Dummy()
{
   Window a;
   a.OnLeftButtonUp(0,0,0);
}

class ToolBox : Window
{
   text = $"Toolbox";
   background = formColor;
   borderStyle = sizable;
   hasClose = true;
   //size = { 200, 500 };
   size = { 150, 300 };
   anchor = { right = 0 };
   //anchor = { right = 0, top = 0, bottom = 0 };
   hasVertScroll = true;
   menu = Menu { };

   /* isRemote = true;
   inactive = true;
   stayOnTop = true; */

   char className[1024];
   int controlY;
   Button arrowControl;
   ObjectInfo selectedClass;
   CodeEditor codeEditor;
   char * selectedControl;
   int numControls;

   Menu viewMenu { menu, $"View" };
   MenuItem { viewMenu, $"View Toolbox" };

   ~ToolBox()
   {
      delete arrowControl;
   }
   property char * controlClass
   {
      set
      {
         arrowControl.checked = true;
         className[0] = 0;
         ((Designer)GetActiveDesigner()).objectClass = null;
      }
      get
      {
         return (char *)className;
      }
   }
   property CodeEditor codeEditor
   {
      set { this.codeEditor = value; }
   }
   property ObjectInfo selectedClass
   {
      set
      {
         if(value != selectedClass ||
            (value && value.instance && (!selectedClass.instance || selectedClass.instance._class != value.instance._class)))
         {
            Button control, next;

            selectedControl = null;

            selectedClass = value;

            for(control = (Button)firstChild; control; control = next)
            {
               next = (Button)control.next;
               if(control != arrowControl && !control.nonClient)
               {
                  if(control.checked)
                     selectedControl = (char *)control.id;
                  control.Destroy(0);
               }
            }
            // TOFIX: It seems the virtual space does not get adjusted by only destroying the buttons?
            scrollArea = { 0, 0 };

            //className = null;      // Had to drag twice on code...
            arrowControl.checked = true;

            if(value && value.instance)
            {
               controlY = 25;
               numControls = 1;
               ((Designer)GetActiveDesigner()).FillToolBox();
            }
         }
      }
   }

   bool OnClose(bool parentClosing)
   {
      visible = false;
      if(!parentClosing)
         ide.RepositionWindows(false);
      return parentClosing;
   }

   bool OnKeyDown(Key key, unichar ch)
   {
      if(key == escape)
      {
         if(ide.activeClient) ide.activeClient.Activate();
         //Destroy(0);
      }
      return true;
   }

   void AddControl(Class _class)
   {
      Button control = CreateControl(&controlY, (char *)eClass_GetProperty(_class, "icon"), _class.name, _class.name);
      numControls++;
      if(selectedControl && !strcmp(selectedControl, _class.name))
      {
         control.checked = true;
         strcpy(className, _class.name);
         ((Designer)GetActiveDesigner()).objectClass = className;
      }
   }

   ToolBox()
   {
      int y = 5;
      arrowControl = CreateControl(&y, ":others/mousePointer.png", $"Pointer", null);
      arrowControl.checked = true;
      incref arrowControl;
   }

   bool OnLeftButtonUp(int x, int y, Modifiers mods)
   {
      Designer designer = (Designer)GetActiveDesigner();
      if(designer && designer.isDragging)
      {
         ((Designer)GetActiveDesigner()).isDragging = false;
         ReleaseCapture();
         return rootWindow.MouseMessage(__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnLeftButtonUp,
            x + absPosition.x + clientStart.x, y + absPosition.y + clientStart.y, &mods, false, false);
      }
      return true;
   }

   Button CreateControl(int * y, char * bitmapFile, char * text, void * id)
   {
      Button control
      {
         this;
         bevelOver = true;
         isRadio = true;
         text = text;
         minClientSize.w = 120;
         size.h = 20;
         anchor = Anchor { left = 5, top = *y, right = 5 };
         alignment = left;
         bitmap = { bitmapFile };
         id = (int64)id;

         bool NotifyPushed(Button control, int x, int y, Modifiers mods)
         {
            control.checked = true;
            strcpy(className, control.text); //id;
            if((Designer)GetActiveDesigner())
            {
               ((Designer)GetActiveDesigner()).objectClass = control.id ? className : null; //(char *)control.text; //id;
               ((Designer)GetActiveDesigner()).isDragging = true;
               control.ReleaseCapture();
               Capture();
               cursor = ((GuiApplication)__thisModule.application).GetCursor(arrow);
            }
            return true;
         }

         bool NotifyDoubleClick(Button control, int x, int y, Modifiers mods)
         {
            if(control != arrowControl)
               codeEditor.AddControl();
            return false;
         }

         bool NotifyReleased(Button control, int x, int y, Modifiers mods)
         {
            // ((Designer)GetActiveDesigner()).isDragging = false;
            return true;
         }
      };
      control.Create();
      *y += 20;
      return control;
   }
}
