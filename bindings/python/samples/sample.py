# -*- coding: utf-8 -*-
from pyEcere import *
app = GuiApplication()
printLn("Testing Variadic Functions!\n", 1, " + ", 2, " = ", 1+2)
printLn("Pi = ", 3.141592653589)

Window(
   caption = "Hello, Python!!",
   hasClose = True,
   clientSize = Size(640, 480),
   background = Color(b = 255))
Window(
   caption = "Bindings are cool, 詠春 too!",
   hasClose = True,
   clientSize = Size(320, 200),
   background = Color(255))

app.main()
