# -*- coding: utf-8 -*-
from pyEcere import *
app = GuiApplication()
Window(caption = "Hello, Python!!", hasClose = True, clientSize = Size(640, 480), background = Color(b = 255))
Window(caption = "Bindings are cool", hasClose = True, clientSize = Size(320, 200), background = Color(255))
app.main()
