namespace gui;

import "Window"

define GridSnap = 8;

class FormDesigner : ClassDesignerBase
{
   opacity = 0;
   //background = Blue;
   drawBehind = true;
   inactive = true;
   stayOnTop = true;
   // clickThrough = true;

   Window selected;
   Window form;
   Window moved;
   int xClicked, yClicked;
   int resizeX, resizeY;
   int wBefore, hBefore;
   int xBefore, yBefore;
   Window parentBefore;
   bool onBorder;

   // CLASS EDITOR METHODS
   void SelectObject(ObjectInfo object, Window control)
   {
      if((object && form != object.oClass.instance) || !object)
      {
         if(form)
            form.visible = false;

         form = (Window)(object ? object.oClass.instance : null);

         if(form)
            form.visible = true;
      }

      selected = control;
      Update(null);
      //activeDesigner.Update(null);
   }

   void ::CreateObject(DesignerBase designer, Window instance, ObjectInfo object, bool isClass, Window _class)
   {
      instance.object = object;
      instance.formDesigner = true;
      LockControls(instance, instance);
      if(isClass)
      {
         // TESTING THIS IN POST... instance.visible = false;
         instance.parent = designer;
         instance.OnRedraw = DrawGrid;
         //instance.OnLeftButtonUp = ecere::OnLeftButtonUp;
         //instance.OnLeftButtonDown = ecere::OnLeftButtonDown;
         //instance.OnLeftDoubleClick = ecere::OnLeftDoubleClick;
         instance.OnSysKeyDown = ecere::gui::OnKeyDown;
         //instance.Create();
      }
      else
      {
         // instance.parent = _class;
      }
   }

   void ::PostCreateObject(Window instance, ObjectInfo object, bool isClass, Window _class)
   {
      if(instance.displayDriver && !strcmp(instance.displayDriver, "LFB")) return;
      instance.setVisible = instance.visible;
      if(isClass)
      {
         instance.visible = false;
         instance.Create();
      }
      else if(instance.parent == guiApp.desktop)   // TOCHECK: Verify if there's 2 guiApp/desktop's to be worried about
         instance.autoCreate = false;
      else
         instance.visible = true;
   }

   void ::DroppedObject(Window instance, ObjectInfo object, bool isClass, Window _class)
   {
      instance.parent = _class;
      instance.caption = object.name;
      instance.Create();
   }

   void AddObject()
   {
      if(form)
      {
         AddControl(form, GridSnap, GridSnap);
         if(visible)
            Activate();
      }
   }

   void ::ListClasses(DesignerBase designer, Class _class)
   {
      //OldLink link;
      if(eClass_GetProperty(_class, "icon"))
         designer.AddToolBoxClass(_class);
      /*
      for(link = _class.derivatives.first; link; link = link.next)
         designer.AddToolBoxClass(link.data);
      */
   }

   void ListToolBoxClasses(DesignerBase designer)
   {
      OldLink link;
      Class commonControlClass = eSystem_FindClass(_class.module, "CommonControl");
      for(link = commonControlClass.derivatives.first; link; link = link.next)
      {
         ListSubClasses(designer, link.data);
      }
   }

   void ::ListSubClasses(DesignerBase designer, Class c)
   {
      OldLink link;
      ListClasses(designer, c);
      for(link = c.derivatives.first; link; link = link.next)
         ListSubClasses(designer, link.data);
   }

   void ::PrepareTestObject(DesignerBase designer, Window test)
   {
      test.parent = designer;
   }

   void ::DestroyObject(Window window)
   {
      // Better way to safeguard this? Still needed?
      // if(eInstance_FindMethod(window, "Destroy"))
         window.Destroy(0);
   }

   void Reset()
   {
      form = null;
      FreeMouseRange();
      moved = null;
      selected = null;
   }

   void ::FixProperty(Property prop, Window object)
   {
      FormDesigner designer = (FormDesigner)activeDesigner.classDesigner;

      if(!strcmp(prop.name, "parent"))
      {
         if(object.parent == guiApp.desktop)
            object.parent = designer.form;

         if(object.parent == designer.form)
         {
            ObjectInfo previous = object.object;
            while((previous = previous.prev) && ((Window)previous.instance).parent != designer.form);
            if(previous)
               object.parent.children.Move(object, (Window)previous.instance);
         }
      }

      if(!strcmp(prop.name, "master") && !object.master)
         object.master = designer.form;

      if(!strcmp(prop.name, "visible"))
      {
         object.setVisible = !object.style.hidden;
         object.visible = true;
      }
   }

   void ::CreateNew(EditBox editBox, Size clientSize, const char * name, const char * inherit)
   {
      int w = 632, h = 438;
      if(clientSize.w - 40 -200 < w)
      {
         w = (clientSize.w - 40 - 200);
         w -= w % GridSnap;
         h = h * w / 632;
         h -= h % GridSnap;
         w = Max(w, 304);
         h = Max(h, 304);
      }

      editBox.Home();
      editBox.Printf("import \"ecere\"\n\n");
      editBox.Printf("class %s : %s\n", name, inherit);
      editBox.Printf("{\n");

      editBox.Printf("   caption = $\"%s\";\n", name);
      //editBox.Printf("   background = Color { 212, 208, 200 };\n");

      editBox.Printf("   background = formColor;\n");
      editBox.Printf("   borderStyle = sizable;\n");
      editBox.Printf("   hasMaximize = true;\n");
      editBox.Printf("   hasMinimize = true;\n");
      editBox.Printf("   hasClose = true;\n");
      //editBox.Printf("   position = { 20, 20 };\n");
      editBox.Printf("   clientSize = { %d, %d };\n", w, h);


      //editBox.Printf("   Button ok { parent = this, position = { 100, 100 }, size = { 80, 20 } };\n");

      //editBox.Printf("\n   Button ok\n   {\n      parent = this;\n\n      bool NotifyClicked()\n      {\n      }\n   };\n");
      editBox.Printf("}\n");

      /*
      editBox.Printf("class %s : %s\n", "SecondForm", inherit);
      editBox.Printf("{\n");
      editBox.Printf("   caption = \"%s\";\n", "SecondForm");
      editBox.Printf("   background = Color { 100, 90, 120 };\n");
      editBox.Printf("   borderStyle = sizable;\n");
      editBox.Printf("   hasMaximize = true;\n");
      editBox.Printf("   hasMinimize = true;\n");
      editBox.Printf("   hasClose = true;\n");
      editBox.Printf("   position = { 20, 20 };\n");
      editBox.Printf("   size = { %d, %d };\n", 320, 200);
      editBox.Printf("   Button ok { parent = this, caption = \"OK\", position = { A_RIGHT|10, A_RIGHT|10 }, size = { 80, 20 } };\n");
      editBox.Printf("}\n");
      */
   }

   // WINDOW METHODS
   void OnRedraw(Surface surface)
   {
      DrawSelection(master, surface);
   }

   bool OnMouseMove(int x, int y, Modifiers mods)
   {
      if(mods.isSideEffect)
         return true;

      if(x >= 0 && y >=0 && x < clientSize.w && y < clientSize.h)
      {
         // Capture();
         if(moved)
         {
            Window parent = FindWindow(form, master, moved, x,y, true, null, null);
            Window curParent = moved.parent;

            int dx = x - xClicked;
            int dy = y - yClicked;

            if(resizeX || resizeY)
               parent = curParent;
            if(!parent)
               parent = (moved == form) ? master : form;
            {
               int w = moved.size.w;
               int h = moved.size.h;
               Box box;
               Anchor anchor = moved.anchor;

               x = xBefore + parentBefore.absPosition.x - curParent.absPosition.x + parentBefore.clientStart.x - curParent.clientStart.x;
               y = yBefore + parentBefore.absPosition.y - curParent.absPosition.y + parentBefore.clientStart.y - curParent.clientStart.y;

               box.left = moved.absPosition.x - absPosition.x - clientStart.x;
               box.top  = moved.absPosition.y - absPosition.y - clientStart.y;
               box.right = box.left + moved.size.w - 1;
               box.bottom= box.top  + moved.size.h - 1;

               dx -= dx % GridSnap;
               dy -= dy % GridSnap;

               if(resizeX || resizeY)
               {
                  w = wBefore;
                  h = hBefore;
                  if(resizeX < 0)
                  {
                     x += dx;
                     w -= dx;
                  }
                  else if(resizeX > 0)
                  {
                     w += dx;
                  }

                  if(resizeY < 0)
                  {
                     y += dy;
                     h -= dy;
                  }
                  else if(resizeY > 0)
                  {
                     h += dy;
                  }
                  if(resizeX)
                  {
                     w = Max(w, GridSnap);
                     moved.size.w = w;
                  }
                  if(resizeY)
                  {
                     h = Max(h, GridSnap);
                     moved.size.h = h;
                  }
                  if(resizeX < 0) x -= x % GridSnap;
                  if(resizeY < 0) y -= y % GridSnap;
               }
               else
               {
                  x += dx;
                  y += dy;
                  if(parent != curParent)
                  {
                     Window master = moved.master;

                     x += curParent.absPosition.x - parent.absPosition.x + curParent.clientStart.x - parent.clientStart.x;
                     y += curParent.absPosition.y - parent.absPosition.y + curParent.clientStart.y - parent.clientStart.y;

                     moved.parent = parent;
                     if(parent == form)
                     {
                        ObjectInfo previous = moved.object;
                        while((previous = previous.prev) && ((Window)previous.instance).parent != form);
                        if(previous)
                           moved.parent.children.Move(moved, (Window)previous.instance);
                     }
                     if(master == form)
                        moved.master = master;
                  }
                  x -= x % GridSnap;
                  y -= y % GridSnap;
               }

               activeDesigner.ModifyCode();

               moved.Move(x, y, w, h);

               if(resizeX < 0 || resizeY < 0)
               {
                  if(resizeX < 0)
                  {
                     w = moved.size.w;
                     x = Min(x, xBefore + wBefore - w);
                  }
                  if(resizeY < 0)
                  {
                     h = moved.size.h;
                     y = Min(y, yBefore + hBefore - h);
                  }
                  moved.Move(x, y, w, h);
               }

               {
                  int vpw, vph;

                  // Fix Anchor
                  x = moved.position.x;
                  y = moved.position.y;
                  w = moved.size.w;
                  h = moved.size.h;

                  vpw = parent.clientSize.w;
                  vph = parent.clientSize.h;
                  if(moved.nonClient)
                  {
                     vpw = parent.size.w;
                     vph = parent.size.h;
                  }
                  else if(moved.style.fixed) // TOFIX: moved.borderStyle.fixed
                  {
                     if(!moved.dontScrollHorz && parent.scrollArea.w) vpw = parent.scrollArea.w;
                     if(!moved.dontScrollVert && parent.scrollArea.h) vph = parent.scrollArea.h;
                  }

                  if(anchor.left.type == offset) anchor.left.distance = x;
                  else if(anchor.left.type == relative) anchor.left.percent = (float)x / vpw;
                  if(anchor.top.type == offset) anchor.top.distance = y;
                  else if(anchor.top.type == relative) anchor.top.percent = (float)y / vph;
                  if(anchor.right.type == offset) anchor.right.distance = vpw - (x + w);
                  //else if(anchor.right.type == relative) anchor.right.percent = (float) (x + w) / vpw;
                  else if(anchor.right.type == relative) anchor.right.percent = (float) (vpw - (x + w)) / vpw;
                  if(anchor.bottom.type == offset) anchor.bottom.distance = vph - (y + h);
                  //else if(anchor.bottom.type == relative) anchor.bottom.percent = (float) (y + h) / vph;
                  else if(anchor.bottom.type == relative) anchor.bottom.percent = (float) (vph - (y + h)) / vph;

                  if(!anchor.left.type && !anchor.right.type)
                  {
                     anchor.horz.distance = (x + w / 2) - (vpw / 2);
                     //anchor.horz.type = anchor.horz.distance ? offset : 0;
                  }
                  else if(anchor.horz.type == middleRelative) anchor.horz.percent = (float) ((x + w / 2) - (vpw / 2)) / vpw;
                  if(!anchor.top.type && !anchor.bottom.type)
                  {
                     anchor.vert.distance = (y + h / 2) - (vph / 2);
                     //anchor.vert.type = anchor.vert.distance ? offset : 0;
                  }
                  else if(anchor.vert.type == middleRelative) anchor.vert.percent = (float)((y + h / 2) - (vph / 2)) / vph;

                  moved.anchor = anchor;
               }

               x = moved.position.x;
               y = moved.position.y;
               w = moved.size.w;
               h = moved.size.h;

               box.left = Min(box.left, moved.absPosition.x - absPosition.x - clientStart.x);
               box.top  = Min(box.top, moved.absPosition.y - absPosition.y - clientStart.y);
               box.right = Max(box.right, moved.absPosition.x - absPosition.x - clientStart.x + moved.size.w - 1);
               box.bottom= Max(box.bottom, moved.absPosition.y - absPosition.y - clientStart.y + moved.size.h - 1);

               box.left -= 7;
               box.top -= 7;
               box.right += 7;
               box.bottom += 7;

               Update(box);
               //activeDesigner.Update(box);

               activeDesigner.UpdateProperties();
            }
         }
      }
      /*else
         ReleaseCapture();*/
      return true;
   }

   bool OnMouseOver(int x, int y, Modifiers mods)
   {
      x += absPosition.x - activeDesigner.absPosition.x + clientStart.x - activeDesigner.clientStart.x;
      y += absPosition.y - activeDesigner.absPosition.y + clientStart.y - activeDesigner.clientStart.y;

      if(x >= 0 && y >=0 && x < activeDesigner.clientSize.w && y < activeDesigner.clientSize.h)
      {
         if(activeDesigner.isDragging && !mods.isSideEffect)
            activeDesigner.Activate();

         // Capture();
      }
      return true;
   }

   bool OnMouseLeave(Modifiers mods)
   {
      // activeDesigner.classDesigner.ReleaseCapture();
      return true;
   }

   bool OnLeftButtonDown(int x, int y, Modifiers mods)
   {
      const char * objectClass = activeDesigner.objectClass;

      if(!objectClass && selected)
      {
         Window control = FindWindow(form, master, null, x, y, false, null, null);
         bool onBorder = false;
         //Window parent = selected.parent;
         //if(control && (parent == control || parent == control.parent))
         {
            int cx = selected.absPosition.x - absPosition.x - clientStart.x;
            int cy = selected.absPosition.y - absPosition.y - clientStart.y;
            int cw = selected.size.w;
            int ch = selected.size.h;

            onBorder = true;

            // Top Row
            if(x >= cx - 7 && x < cx + cw + 6 && y >= cy - 7 && y < cy)
            {
               // Top Left
               if(x >= cx - 7 && x < cx)
               {
                  resizeX = -1;
                  resizeY = -1;
               }
               // Top Center
               else if(x >= cx + cw/2 - 3 && x < cx + cw/2 + 3)
               {
                  resizeX = 0;
                  resizeY = -1;
               }
               // Top Right
               else if(x >= cx + cw && x < cx + cw + 6)
               {
                  resizeX = 1;
                  resizeY = -1;
               }
            }
            // Bottom row
            else if(x >= cx - 7 && x < cx + cw + 6 && y >= cy + ch && y < cy + ch + 6)
            {
               // Bottom Left
               if(x >= cx - 7 && x < cx && y >= cy + ch && y < cy + ch + 6)
               {
                  resizeX = -1;
                  resizeY = 1;
               }
               // Bottom Center
               else if(x >= cx + cw/2 - 3 && x < cx + cw/2 + 3 && y >= cy + ch && y < cy + ch + 6)
               {
                  resizeX = 0;
                  resizeY = 1;
               }
               // Bottom Right
               else if(x >= cx + cw && x < cx + cw + 6 && y >= cy + ch && y < cy + ch + 6)
               {
                  resizeX = 1;
                  resizeY = 1;
               }
            }
            // Left Border
            else if(x >= cx - 7 && x < cx && y >= cy - 7 && y < cy + ch + 6)
            {
               // Middle Left
               if(y >= cy + ch/2 - 3 && y < cy + ch/2 + 3)
               {
                  resizeX = -1;
                  resizeY = 0;
               }
            }
            // Right border
            else if(x >= cx + cw && x < cx + cw + 6 && y >= cy - 7 && y < cy + ch + 6)
            {
               // Middle Right
               if(y >= cy + ch / 2 - 3 && y < cy + ch/2 + 3)
               {
                  resizeX = 1;
                  resizeY = 0;
               }
            }
            else
               onBorder = false;
         }
         if(onBorder)
         {
            control = selected;
         }

         if(control)
         {
            Window parent = control.parent;

            if(parent.nonClient)
               ((control == form) ? (Window)this : form).SetMouseRangeToWindow();
            else
               ((control == form) ? (Window)this : form).SetMouseRangeToClient();

            xClicked = x;
            yClicked = y;

            if(selected != control)
               activeDesigner.SelectObjectFromDesigner(control.object);

            Update(null);
            //activeDesigner.Update(null);

            moved = control;
            xBefore = control.position.x;
            yBefore = control.position.y;
            parentBefore = control.parent;
            this.onBorder = onBorder;
            wBefore = control.size.w;
            hBefore = control.size.h;
         }
      }
      return true;
   }

   void AddControl(Window parent, int x, int y)
   {
      const char * objectClass = activeDesigner.objectClass;
      ObjectInfo object;
      Window control;
      Class c = eSystem_FindClass(form._class.module, objectClass);
      if(!c)
         c = eSystem_FindClass(form._class.module.application, objectClass);
      if(c)
      {
         control = (Window)eInstance_New(c);

         activeDesigner.CodeAddObject(control, &object);

         while(!parent.name)
         {
            x += parent.position.x + parent.clientStart.x;
            y += parent.position.y + parent.clientStart.y;
            parent = parent.parent;
         }

         control.object = object;

         control.parent = parent;
         control.master = form;

         x -= x % GridSnap;
         y -= y % GridSnap;

         control.position.x = x;
         control.position.y = y;
         control.caption = object.name;

         LockControls(control, control);

         control.Create();
         if(parent == form)
         {
            ObjectInfo previous = control.object;
            while((previous = previous.prev) && ((Window)previous.instance).parent != form);
            if(previous)
               control.parent.children.Move(control, (Window)previous.instance);
         }

         activeDesigner.SheetAddObject(object);

         //selected = control;
         //activeDesigner.Update(null);
         Update(null);
      }
   }

   bool OnLeftButtonUp(int x, int y, Modifiers mods)
   {
      if(moved)
      {
         moved = null;
         resizeX = resizeY = 0;
         FreeMouseRange();
      }
      else
      {
         const char * objectClass = activeDesigner.objectClass;
         if(objectClass)
         {
            Window parent = FindWindow(form, activeDesigner, null, x, y, true, &x, &y);
            if(parent)
               AddControl(parent, x, y);
         }
      }
      return true;
   }

   bool OnLeftDoubleClick(int x, int y, Modifiers mods)
   {
      Window control = FindWindow(form, activeDesigner, null, x, y, false, &x, &y);
      if(control && selected == control)
      {
         activeDesigner.AddDefaultMethod(control, form);
         return false; // Prevent OnLeftButtonDown to be sent to the activated code editor
      }
      return true;
   }

   void ::LockControls(Window window, Window control)
   {
      Window child;

      if(window == control)
      {
         ObjectInfo object = window.object;
         window.OnDestroy = ecere::gui::OnDestroy;
         window.OnSysKeyDown = ecere::gui::OnSysKey;
         window.OnSysKeyHit = ecere::gui::OnSysKey;
         window.OnSysKeyUp = ecere::gui::OnSysKey;

         if(object != object.oClass)
         {
            window.OnActivate = Control_OnActivate;
            window.OnClose = null;
         }
      }

      window.control = control;
      for(child = window.firstChild; child; child = child.next)
      {
         LockControls(child, control);
      }
   }

   void DrawSelection(Window window, Surface surface)
   {
      Window control;
      for(control = window.lastChild; control; control = control.prev)
      {
         if(selected == control)
         {
            //Window parent = selected.parent;
            int x;
            int y;
            int w = selected.size.w;
            int h = selected.size.h;

            x = selected.absPosition.x - absPosition.x - clientStart.x;
            y = selected.absPosition.y - absPosition.y - clientStart.y;

            surface.SetBackground(Color {170, 170, 170});
            surface.Area(x - 7, y - 7, x + w - 1 + 7, y-1);
            surface.Area(x - 7, y + h, x + w - 1 + 7, y + h - 1 + 7);
            surface.Area(x - 7, y - 7, x - 1, y + h - 1 + 7);
            surface.Area(x + w, y - 7 , x + w - 1 + 7, y + h - 1 + 7);

            surface.SetBackground(white);

            surface.Area(x - 6, y - 6, x-1, y-1);
            surface.Area(x + w/2 - 2, y - 6, x + w/2 + 2, y - 1);
            surface.Area(x + w + 1, y - 6, x + w-1 + 6, y-1);

            surface.Area(x - 6, y + h + 1, x-1, y + h - 1 + 6);
            surface.Area(x + w/2 - 2, y + h + 1, x + w/2 + 2, y + h - 1 + 6);
            surface.Area(x + w + 1, y + h + 1, x + w-1 + 6, y + h - 1 + 6);

            surface.Area(x - 6, y + h/2 - 2, x-1, y + h /2 + 2);
            surface.Area(x + w, y + h/2 - 2, x + w-1 + 6, y + h /2 + 2);

            surface.SetForeground(black);

            surface.Rectangle(x - 7, y - 7, x-1, y-1);
            surface.Rectangle(x + w/2 - 3, y - 7, x + w/2 + 3, y - 1);
            surface.Rectangle(x + w, y - 7, x + w-1 + 7, y-1);

            surface.Rectangle(x - 7, y + h, x-1, y + h - 1 + 7);
            surface.Rectangle(x + w/2 - 3, y + h, x + w/2 + 3, y + h - 1 + 7);
            surface.Rectangle(x + w, y + h, x + w-1 + 7, y + h - 1 + 7);

            surface.Rectangle(x - 7, y + h/2 - 3, x-1, y + h /2 + 3);
            surface.Rectangle(x + w, y + h/2 - 3, x + w-1 + 7, y + h /2 + 3);
         }
         DrawSelection(control, surface);
      }
   }
}

static bool Control_OnActivate(Window window, bool active, Window previous, bool * goOn, bool direct)
{
   if(active)
   {
      *goOn = true;
      return false;
   }
   return true;
}
/*
static Window GetWindow(Window window, int x, int y, int * rx, int * ry)
{
   Window result = null, control;
   for(control = window.lastChild; control; control = control.prev)
   {
      int cx = control.position.x;
      int cy = control.position.y;
      int cw = control.size.w;
      int ch = control.size.h;

      if(x >= cx && x < cx + cw && y >= cy && y < cy + ch)
      {
         x -= control.position.x + control.clientStart.x;
         y -= control.position.y + control.clientStart.y;
         result = GetWindow(control, x, y, rx, ry);
         if(!result)
         {
            *rx = x;
            *ry = y;
            result = control;
         }
         break;
      }
   }
   return result;
}
*/
static Window FindWindow(Window form, Window window, Window moved, int x, int y, bool asParent, int * dx, int * dy)
{
   Window result = null, control;
   for(control = window.lastChild; control; control = control.prev)
   {
      if(control != moved && control.control == control && (!asParent || control.name))
      {
         if(!form || control == form)
         {
            int cx = control.position.x - (asParent ? 0 : 7);
            int cy = control.position.y - (asParent ? 0 : 7);
            int cw = control.size.w + (asParent ? 0 : 14);
            int ch = control.size.h + (asParent ? 0 : 14);

            int sx = x - (control.position.x + control.clientStart.x);
            int sy = y - (control.position.y + control.clientStart.y);
            if((sx >= 0 && sy >= 0 && sx < control.clientSize.w && sy < control.clientSize.h) ||
               !(x >= cx && x < cx + cw && y >= cy && y < cy + ch))
               result = FindWindow(null, control, moved, sx, sy, asParent, dx, dy);
            if(result)
               break;
            else if(x >= cx && x < cx + cw && y >= cy && y < cy + ch)
            {
               if(dx) *dx = sx;
               if(dy) *dy = sy;
               result = control;
               break;
            }
         }
      }
   }
   return result;
}

static void OnDestroy(Window window)
{
   FormDesigner designer = activeDesigner ? (FormDesigner)activeDesigner.classDesigner : null;
   Class c = window._class;
   if(c.base.type != systemClass && c.base.base.type != systemClass)
   {
      while(c.base.base.base.type != systemClass)
         c = c.base;
      if(!strcmp(c.fullName, "ecere::gui::CommonControl"))
         CommonControl::OnDestroy((CommonControl)window);
   }

   if(designer && designer.form)
      activeDesigner.DeleteObject(window.object);
}

static bool OnSysKey(Window window, Key key, unichar ch)
{
   return false;
}

static void DrawGrid(Window window, Surface surface)
{
   int x, y;
   int w = window.clientSize.w;
   int h = window.clientSize.h;
   Color background = window.background;
   if(!surface) return;

   if(background.r > 128 || background.g > 128)
      surface.SetForeground(black);
   else
      surface.SetForeground(white);

   for(y = GridSnap; y < h; y += GridSnap)
      for(x = GridSnap; x < w; x += GridSnap)
         surface.PutPixel(x, y);
}

static bool OnKeyDown(Window window, Key key, unichar ch)
{
   FormDesigner designer = (FormDesigner)activeDesigner.classDesigner;
   if(key == del)
   {
      if(designer.selected && designer.selected != designer.form)
      {
         bool confirmation = activeDesigner.ObjectContainsCode(designer.selected.object);

         if(confirmation)
            confirmation = MessageBox { type = okCancel, master = window.master, caption = $"Deleting control with code", contents = $"Control contains code. Delete anyways?" }.Modal() != ok;

         // Confirmation if control contains other controls
         if(!confirmation)
         {
            Window child = designer.selected.firstChild;
            for( ; child; child = child.next)
            {
               if(child.control == child)
               {
                  confirmation = true;
                  break;
               }
            }

            if(confirmation)
               confirmation = MessageBox { type = okCancel, master = window.master, caption = $"Deleting control with children", contents = $"Control contains other controls. Delete control and children?"}.Modal() != ok;
         }

         if(!confirmation)
         {
            activeDesigner.ModifyCode();

            designer.selected.Destroy(0);
            //activeDesigner.Update(null);
            designer.Update(null);
         }
      }
   }
   return false;
}
