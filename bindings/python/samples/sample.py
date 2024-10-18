# -*- coding: utf-8 -*-
from pyEcere import *
app = GuiApplication()
printLn("Testing Variadic Functions!\n", 1, " + ", 2, " = ", 1+2)
printLn("Pi = ", 3.141592653589)

class MyForm(Window):
   def __init__(self):
      Window.__init__(self,
         displayDriver = "OpenGL",
         caption = I18N("Hello, Python!!"),
         hasClose = True,
         hasMaximize = True,
         hasMinimize = True,
         borderStyle = BorderStyle.sizable,
         clientSize = Size(640, 480),
         background = Color(b = 255),
         foreground = Color(r = 235, b = 115, g = 200),
         font = FontResource("Merriweather", 30, outlineSize = 4.0, outlineFade = 0.2) )

      def myOnRedraw(self, surface):
         surface.writeTextf(20, 20, I18N("Writing Stuff on the wall!!"))
      self.onRedraw = myOnRedraw

      def button1Clicked(self, button, x, y, mods):
         printLn("I got pushed! (master is ", self.caption, ")")
         self.background = Color(b = 255, g = 192, r = 64)
         MessageBox(caption = I18N("Hello, Python!"), contents = I18N("Python is pretty nifty.")).modal()
         return True

      self.button1 = Button(
            parent = self,
            caption = "Push It!",
            position = Point(80,80),
            font = FontResource("Merriweather", 30),
            notifyClicked = button1Clicked )

MyForm()

Window(
   caption = "Bindings are cool, 詠春 too!",
   hasClose = True,
   clientSize = Size(320, 200),
   background = Color(255) )

app.main()
