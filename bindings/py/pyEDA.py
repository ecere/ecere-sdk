from pyecere import *
from _pyEDA import *

class SQLCustomFunction(Instance):
   def __init__(self,
                method = None,
                returnType = None,
                args = None,
                rType = None,
                argTypes = None,
                cif = None,
                impl = None):
      Instance.__init__(self, impl = impl)
      if method is not None:     self.method = method
      if returnType is not None: self.returnType = returnType
      if args is not None:       self.args = args
      if rType is not None:      self.rType = rType
      if argTypes is not None:   self.argTypes = argTypes
      if cif is not None:        self.cif = cif

   @property
   def method(self): return Method(impl = IPTR(lib, ffi, self, SQLCustomFunction).method)
   @method.setter
   def method(self, value):
      if not isinstance(value, Method): value = Method(value)
      IPTR(lib, ffi, self, SQLCustomFunction).method = value.impl

   @property
   def returnType(self): return Class(impl = IPTR(lib, ffi, self, SQLCustomFunction).returnType)
   @returnType.setter
   def returnType(self, value):
      if not isinstance(value, Class): value = Class(value)
      IPTR(lib, ffi, self, SQLCustomFunction).returnType = value.impl

   @property
   def args(self): return Array(impl = IPTR(lib, ffi, self, SQLCustomFunction).args)
   @args.setter
   def args(self, value): IPTR(lib, ffi, self, SQLCustomFunction).args = value.impl

   @property
   def rType(self): return IPTR(lib, ffi, self, SQLCustomFunction).rType
   @rType.setter
   def rType(self, value): IPTR(lib, ffi, self, SQLCustomFunction).rType = value

   @property
   def argTypes(self): return Array(impl = IPTR(lib, ffi, self, SQLCustomFunction).argTypes)
   @argTypes.setter
   def argTypes(self, value): IPTR(lib, ffi, self, SQLCustomFunction).argTypes = value.impl

   @property
   def cif(self): return IPTR(lib, ffi, self, SQLCustomFunction).cif
   @cif.setter
   def cif(self, value): IPTR(lib, ffi, self, SQLCustomFunction).cif = value

@ffi.callback("void(ReportRender)")
def cb_ReportRender_getPageNumber(__r):
   reportrender = pyOrNewObject(ReportRender, __r)
   reportrender.fn_ReportRender_getPageNumber(reportrender)

@ffi.callback("void(ReportRender, ReportDestination, Report)")
def cb_ReportRender_render(__r, destination, report):
   reportrender = pyOrNewObject(ReportRender, __r)
   reportrender.fn_ReportRender_render(reportrender, pyOrNewObject(ReportDestination, destination), pyOrNewObject(Report, report))

class ReportRender(Instance):
   def __init__(self,
                getPageNumber = None,
                render = None,
                impl = None):
      Instance.__init__(self, impl = impl)
      if getPageNumber is not None: self.getPageNumber = getPageNumber
      if render is not None:        self.render = render

   def fn_unset_ReportRender_getPageNumber(self):
      return lib.ReportRender_getPageNumber(self.impl)

   @property
   def getPageNumber(self):
      if hasattr(self, 'fn_ReportRender_getPageNumber'): return self.fn_ReportRender_getPageNumber
      else: return self.fn_unset_ReportRender_getPageNumber
   @getPageNumber.setter
   def getPageNumber(self, value):
      self.fn_ReportRender_getPageNumber = value
      lib.Instance_setMethod(self.impl, "GetPageNumber".encode('utf8'), cb_ReportRender_getPageNumber)

   def fn_unset_ReportRender_render(self, destination, report):
      return lib.ReportRender_render(self.impl, ffi.NULL if destination is None else destination.impl, ffi.NULL if report is None else report.impl)

   @property
   def render(self):
      if hasattr(self, 'fn_ReportRender_render'): return self.fn_ReportRender_render
      else: return self.fn_unset_ReportRender_render
   @render.setter
   def render(self, value):
      self.fn_ReportRender_render = value
      lib.Instance_setMethod(self.impl, "Render".encode('utf8'), cb_ReportRender_render)

@ffi.callback("void(ReportDestination, Page)")
def cb_ReportDestination_addPage(__r, page):
   reportdestination = pyOrNewObject(ReportDestination, __r)
   reportdestination.fn_ReportDestination_addPage(reportdestination, pyOrNewObject(Page, page))

@ffi.callback("void(ReportDestination, Page)")
def cb_ReportDestination_endPage(__r, page):
   reportdestination = pyOrNewObject(ReportDestination, __r)
   reportdestination.fn_ReportDestination_endPage(reportdestination, pyOrNewObject(Page, page))

@ffi.callback("void(ReportDestination)")
def cb_ReportDestination_getReport(__r):
   reportdestination = pyOrNewObject(ReportDestination, __r)
   reportdestination.fn_ReportDestination_getReport(reportdestination)

class ReportDestination(Window):
   def __init__(self,
                parent = None,
                master = None,
                caption = None,
                hotKey = None,
                background = None,
                opacity = None,
                foreground = None,
                borderStyle = None,
                minClientSize = None,
                maxClientSize = None,
                hasMaximize = None,
                hasMinimize = None,
                hasClose = None,
                nonClient = None,
                inactive = None,
                clickThrough = None,
                isRemote = None,
                noCycle = None,
                isModal = None,
                interim = None,
                tabCycle = None,
                isDefault = None,
                drawBehind = None,
                hasMenuBar = None,
                hasStatusBar = None,
                stayOnTop = None,
                menu = None,
                font = None,
                sizeAnchor = None,
                size = None,
                clientSize = None,
                anchor = None,
                position = None,
                disabled = None,
                state = None,
                visible = None,
                isDocument = None,
                mergeMenus = None,
                hasHorzScroll = None,
                hasVertScroll = None,
                dontHideScroll = None,
                dontScrollVert = None,
                dontScrollHorz = None,
                snapVertScroll = None,
                snapHorzScroll = None,
                scroll = None,
                modifyVirtualArea = None,
                dontAutoScrollArea = None,
                fileName = None,
                id = None,
                modifiedDocument = None,
                showInTaskBar = None,
                saveDialog = None,
                isActiveClient = None,
                cursor = None,
                name = None,
                displayDriver = None,
                autoCreate = None,
                scrollArea = None,
                is3D = None,
                closing = None,
                fullRender = None,
                icon = None,
                moveable = None,
                alphaBlend = None,
                useSharedMemory = None,
                glCapabilities = None,
                creationActivation = None,
                nativeDecorations = None,
                manageDisplay = None,
                text = None,
                controller = None,
                noConsequential = None,
                report = None,
                getDecorationsSize = None,
                isInside = None,
                isMouseMoving = None,
                isMouseResizing = None,
                isOpaque = None,
                notifyActivate = None,
                notifyDestroyed = None,
                notifySaved = None,
                onActivate = None,
                onActivateClient = None,
                onApplyGraphics = None,
                onChildAddedOrRemoved = None,
                onChildResized = None,
                onChildVisibilityToggled = None,
                onClose = None,
                onCreate = None,
                onDestroy = None,
                onDestroyed = None,
                onDrawOverChildren = None,
                onFileModified = None,
                onHScroll = None,
                onKeyDown = None,
                onKeyHit = None,
                onKeyUp = None,
                onLeftButtonDown = None,
                onLeftButtonUp = None,
                onLeftDoubleClick = None,
                onLoadGraphics = None,
                onMiddleButtonDown = None,
                onMiddleButtonUp = None,
                onMiddleDoubleClick = None,
                onMouseCaptureLost = None,
                onMouseLeave = None,
                onMouseMove = None,
                onMouseOver = None,
                onMoving = None,
                onMultiTouch = None,
                onPosition = None,
                onPostCreate = None,
                onRedraw = None,
                onResize = None,
                onResizing = None,
                onRightButtonDown = None,
                onRightButtonUp = None,
                onRightDoubleClick = None,
                onSaveFile = None,
                onStateChange = None,
                onSysKeyDown = None,
                onSysKeyHit = None,
                onSysKeyUp = None,
                onUnloadGraphics = None,
                onVScroll = None,
                preShowDecorations = None,
                setBox = None,
                setWindowArea = None,
                setWindowMinimum = None,
                showDecorations = None,
                updateNonClient = None,
                addPage = None,
                endPage = None,
                getReport = None,
                impl = None):
      Window.__init__(self, impl = impl)
      if parent is not None:                   self.parent = parent
      if master is not None:                   self.master = master
      if caption is not None:                  self.caption = caption
      if hotKey is not None:                   self.hotKey = hotKey
      if background is not None:               self.background = background
      if opacity is not None:                  self.opacity = opacity
      if foreground is not None:               self.foreground = foreground
      if borderStyle is not None:              self.borderStyle = borderStyle
      if minClientSize is not None:            self.minClientSize = minClientSize
      if maxClientSize is not None:            self.maxClientSize = maxClientSize
      if hasMaximize is not None:              self.hasMaximize = hasMaximize
      if hasMinimize is not None:              self.hasMinimize = hasMinimize
      if hasClose is not None:                 self.hasClose = hasClose
      if nonClient is not None:                self.nonClient = nonClient
      if inactive is not None:                 self.inactive = inactive
      if clickThrough is not None:             self.clickThrough = clickThrough
      if isRemote is not None:                 self.isRemote = isRemote
      if noCycle is not None:                  self.noCycle = noCycle
      if isModal is not None:                  self.isModal = isModal
      if interim is not None:                  self.interim = interim
      if tabCycle is not None:                 self.tabCycle = tabCycle
      if isDefault is not None:                self.isDefault = isDefault
      if drawBehind is not None:               self.drawBehind = drawBehind
      if hasMenuBar is not None:               self.hasMenuBar = hasMenuBar
      if hasStatusBar is not None:             self.hasStatusBar = hasStatusBar
      if stayOnTop is not None:                self.stayOnTop = stayOnTop
      if menu is not None:                     self.menu = menu
      if font is not None:                     self.font = font
      if sizeAnchor is not None:               self.sizeAnchor = sizeAnchor
      if size is not None:                     self.size = size
      if clientSize is not None:               self.clientSize = clientSize
      if anchor is not None:                   self.anchor = anchor
      if position is not None:                 self.position = position
      if disabled is not None:                 self.disabled = disabled
      if state is not None:                    self.state = state
      if visible is not None:                  self.visible = visible
      if isDocument is not None:               self.isDocument = isDocument
      if mergeMenus is not None:               self.mergeMenus = mergeMenus
      if hasHorzScroll is not None:            self.hasHorzScroll = hasHorzScroll
      if hasVertScroll is not None:            self.hasVertScroll = hasVertScroll
      if dontHideScroll is not None:           self.dontHideScroll = dontHideScroll
      if dontScrollVert is not None:           self.dontScrollVert = dontScrollVert
      if dontScrollHorz is not None:           self.dontScrollHorz = dontScrollHorz
      if snapVertScroll is not None:           self.snapVertScroll = snapVertScroll
      if snapHorzScroll is not None:           self.snapHorzScroll = snapHorzScroll
      if scroll is not None:                   self.scroll = scroll
      if modifyVirtualArea is not None:        self.modifyVirtualArea = modifyVirtualArea
      if dontAutoScrollArea is not None:       self.dontAutoScrollArea = dontAutoScrollArea
      if fileName is not None:                 self.fileName = fileName
      if id is not None:                       self.id = id
      if modifiedDocument is not None:         self.modifiedDocument = modifiedDocument
      if showInTaskBar is not None:            self.showInTaskBar = showInTaskBar
      if saveDialog is not None:               self.saveDialog = saveDialog
      if isActiveClient is not None:           self.isActiveClient = isActiveClient
      if cursor is not None:                   self.cursor = cursor
      if name is not None:                     self.name = name
      if displayDriver is not None:            self.displayDriver = displayDriver
      if autoCreate is not None:               self.autoCreate = autoCreate
      if scrollArea is not None:               self.scrollArea = scrollArea
      if is3D is not None:                     self.is3D = is3D
      if closing is not None:                  self.closing = closing
      if fullRender is not None:               self.fullRender = fullRender
      if icon is not None:                     self.icon = icon
      if moveable is not None:                 self.moveable = moveable
      if alphaBlend is not None:               self.alphaBlend = alphaBlend
      if useSharedMemory is not None:          self.useSharedMemory = useSharedMemory
      if glCapabilities is not None:           self.glCapabilities = glCapabilities
      if creationActivation is not None:       self.creationActivation = creationActivation
      if nativeDecorations is not None:        self.nativeDecorations = nativeDecorations
      if manageDisplay is not None:            self.manageDisplay = manageDisplay
      if text is not None:                     self.text = text
      if controller is not None:               self.controller = controller
      if noConsequential is not None:          self.noConsequential = noConsequential
      if report is not None:                   self.report = report
      if getDecorationsSize is not None:       self.getDecorationsSize = getDecorationsSize
      if isInside is not None:                 self.isInside = isInside
      if isMouseMoving is not None:            self.isMouseMoving = isMouseMoving
      if isMouseResizing is not None:          self.isMouseResizing = isMouseResizing
      if isOpaque is not None:                 self.isOpaque = isOpaque
      if notifyActivate is not None:           self.notifyActivate = notifyActivate
      if notifyDestroyed is not None:          self.notifyDestroyed = notifyDestroyed
      if notifySaved is not None:              self.notifySaved = notifySaved
      if onActivate is not None:               self.onActivate = onActivate
      if onActivateClient is not None:         self.onActivateClient = onActivateClient
      if onApplyGraphics is not None:          self.onApplyGraphics = onApplyGraphics
      if onChildAddedOrRemoved is not None:    self.onChildAddedOrRemoved = onChildAddedOrRemoved
      if onChildResized is not None:           self.onChildResized = onChildResized
      if onChildVisibilityToggled is not None: self.onChildVisibilityToggled = onChildVisibilityToggled
      if onClose is not None:                  self.onClose = onClose
      if onCreate is not None:                 self.onCreate = onCreate
      if onDestroy is not None:                self.onDestroy = onDestroy
      if onDestroyed is not None:              self.onDestroyed = onDestroyed
      if onDrawOverChildren is not None:       self.onDrawOverChildren = onDrawOverChildren
      if onFileModified is not None:           self.onFileModified = onFileModified
      if onHScroll is not None:                self.onHScroll = onHScroll
      if onKeyDown is not None:                self.onKeyDown = onKeyDown
      if onKeyHit is not None:                 self.onKeyHit = onKeyHit
      if onKeyUp is not None:                  self.onKeyUp = onKeyUp
      if onLeftButtonDown is not None:         self.onLeftButtonDown = onLeftButtonDown
      if onLeftButtonUp is not None:           self.onLeftButtonUp = onLeftButtonUp
      if onLeftDoubleClick is not None:        self.onLeftDoubleClick = onLeftDoubleClick
      if onLoadGraphics is not None:           self.onLoadGraphics = onLoadGraphics
      if onMiddleButtonDown is not None:       self.onMiddleButtonDown = onMiddleButtonDown
      if onMiddleButtonUp is not None:         self.onMiddleButtonUp = onMiddleButtonUp
      if onMiddleDoubleClick is not None:      self.onMiddleDoubleClick = onMiddleDoubleClick
      if onMouseCaptureLost is not None:       self.onMouseCaptureLost = onMouseCaptureLost
      if onMouseLeave is not None:             self.onMouseLeave = onMouseLeave
      if onMouseMove is not None:              self.onMouseMove = onMouseMove
      if onMouseOver is not None:              self.onMouseOver = onMouseOver
      if onMoving is not None:                 self.onMoving = onMoving
      if onMultiTouch is not None:             self.onMultiTouch = onMultiTouch
      if onPosition is not None:               self.onPosition = onPosition
      if onPostCreate is not None:             self.onPostCreate = onPostCreate
      if onRedraw is not None:                 self.onRedraw = onRedraw
      if onResize is not None:                 self.onResize = onResize
      if onResizing is not None:               self.onResizing = onResizing
      if onRightButtonDown is not None:        self.onRightButtonDown = onRightButtonDown
      if onRightButtonUp is not None:          self.onRightButtonUp = onRightButtonUp
      if onRightDoubleClick is not None:       self.onRightDoubleClick = onRightDoubleClick
      if onSaveFile is not None:               self.onSaveFile = onSaveFile
      if onStateChange is not None:            self.onStateChange = onStateChange
      if onSysKeyDown is not None:             self.onSysKeyDown = onSysKeyDown
      if onSysKeyHit is not None:              self.onSysKeyHit = onSysKeyHit
      if onSysKeyUp is not None:               self.onSysKeyUp = onSysKeyUp
      if onUnloadGraphics is not None:         self.onUnloadGraphics = onUnloadGraphics
      if onVScroll is not None:                self.onVScroll = onVScroll
      if preShowDecorations is not None:       self.preShowDecorations = preShowDecorations
      if setBox is not None:                   self.setBox = setBox
      if setWindowArea is not None:            self.setWindowArea = setWindowArea
      if setWindowMinimum is not None:         self.setWindowMinimum = setWindowMinimum
      if showDecorations is not None:          self.showDecorations = showDecorations
      if updateNonClient is not None:          self.updateNonClient = updateNonClient
      if addPage is not None:                  self.addPage = addPage
      if endPage is not None:                  self.endPage = endPage
      if getReport is not None:                self.getReport = getReport

   @property
   def report(self): return pyOrNewObject(Report, lib.ReportDestination_get_report(self.impl))
   @report.setter
   def report(self, value):
      if not isinstance(value, Report): value = Report(value)
      lib.ReportDestination_set_report(self.impl, value.impl)

   def fn_unset_ReportDestination_addPage(self, page):
      return lib.ReportDestination_addPage(self.impl, ffi.NULL if page is None else page.impl)

   @property
   def addPage(self):
      if hasattr(self, 'fn_ReportDestination_addPage'): return self.fn_ReportDestination_addPage
      else: return self.fn_unset_ReportDestination_addPage
   @addPage.setter
   def addPage(self, value):
      self.fn_ReportDestination_addPage = value
      lib.Instance_setMethod(self.impl, "AddPage".encode('utf8'), cb_ReportDestination_addPage)

   def fn_unset_ReportDestination_endPage(self, page):
      return lib.ReportDestination_endPage(self.impl, ffi.NULL if page is None else page.impl)

   @property
   def endPage(self):
      if hasattr(self, 'fn_ReportDestination_endPage'): return self.fn_ReportDestination_endPage
      else: return self.fn_unset_ReportDestination_endPage
   @endPage.setter
   def endPage(self, value):
      self.fn_ReportDestination_endPage = value
      lib.Instance_setMethod(self.impl, "EndPage".encode('utf8'), cb_ReportDestination_endPage)

   def fn_unset_ReportDestination_getReport(self):
      return lib.ReportDestination_getReport(self.impl)

   @property
   def getReport(self):
      if hasattr(self, 'fn_ReportDestination_getReport'): return self.fn_ReportDestination_getReport
      else: return self.fn_unset_ReportDestination_getReport
   @getReport.setter
   def getReport(self, value):
      self.fn_ReportDestination_getReport = value
      lib.Instance_setMethod(self.impl, "GetReport".encode('utf8'), cb_ReportDestination_getReport)

class NoCaseAccent(SQLCustomFunction):
   def __init__(self,
                method = None,
                returnType = None,
                args = None,
                rType = None,
                argTypes = None,
                cif = None,
                impl = None):
      SQLCustomFunction.__init__(self, impl = impl)
      if method is not None:     self.method = method
      if returnType is not None: self.returnType = returnType
      if args is not None:       self.args = args
      if rType is not None:      self.rType = rType
      if argTypes is not None:   self.argTypes = argTypes
      if cif is not None:        self.cif = cif

   @property
   def method(self): return Method(impl = IPTR(lib, ffi, self, NoCaseAccent).method)
   @method.setter
   def method(self, value):
      if not isinstance(value, Method): value = Method(value)
      IPTR(lib, ffi, self, NoCaseAccent).method = value.impl

   @property
   def returnType(self): return Class(impl = IPTR(lib, ffi, self, NoCaseAccent).returnType)
   @returnType.setter
   def returnType(self, value):
      if not isinstance(value, Class): value = Class(value)
      IPTR(lib, ffi, self, NoCaseAccent).returnType = value.impl

   @property
   def args(self): return Array(impl = IPTR(lib, ffi, self, NoCaseAccent).args)
   @args.setter
   def args(self, value): IPTR(lib, ffi, self, NoCaseAccent).args = value.impl

   @property
   def rType(self): return IPTR(lib, ffi, self, NoCaseAccent).rType
   @rType.setter
   def rType(self, value): IPTR(lib, ffi, self, NoCaseAccent).rType = value

   @property
   def argTypes(self): return Array(impl = IPTR(lib, ffi, self, NoCaseAccent).argTypes)
   @argTypes.setter
   def argTypes(self, value): IPTR(lib, ffi, self, NoCaseAccent).argTypes = value.impl

   @property
   def cif(self): return IPTR(lib, ffi, self, NoCaseAccent).cif
   @cif.setter
   def cif(self, value): IPTR(lib, ffi, self, NoCaseAccent).cif = value

   def function(self, text):
      if text is not None and not isinstance(text, String): text = String(text)
      if text is None: text = ffi.NULL
      return pyOrNewObject(String, lib.NoCaseAccent_function(self.impl, text))

class IdList(Instance):
   def __init__(self,
                count = None,
                ids = None,
                impl = None):
      Instance.__init__(self, impl = impl)
      if count is not None: self.count = count
      if ids is not None:   self.ids = ids

   @property
   def count(self): return IPTR(lib, ffi, self, IdList).count
   @count.setter
   def count(self, value): IPTR(lib, ffi, self, IdList).count = value

   @property
   def ids(self): return IPTR(lib, ffi, self, IdList).ids
   @ids.setter
   def ids(self, value): IPTR(lib, ffi, self, IdList).ids = value

   def add(self, id):
      if id is not None and not isinstance(id, Id): id = Id(id)
      if id is None: id = ffi.NULL
      return lib.IdList_add(self.impl, id)

   def clear(self):
      lib.IdList_clear(self.impl)

   def delete(self, id):
      if id is not None and not isinstance(id, Id): id = Id(id)
      if id is None: id = ffi.NULL
      return lib.IdList_delete(self.impl, id)

   def includes(self, id):
      if id is not None and not isinstance(id, Id): id = Id(id)
      if id is None: id = ffi.NULL
      return lib.IdList_includes(self.impl, id)

class Group(Window):
   def __init__(self,
                parent = None,
                master = None,
                caption = None,
                hotKey = None,
                background = None,
                opacity = None,
                foreground = None,
                borderStyle = None,
                minClientSize = None,
                maxClientSize = None,
                hasMaximize = None,
                hasMinimize = None,
                hasClose = None,
                nonClient = None,
                inactive = None,
                clickThrough = None,
                isRemote = None,
                noCycle = None,
                isModal = None,
                interim = None,
                tabCycle = None,
                isDefault = None,
                drawBehind = None,
                hasMenuBar = None,
                hasStatusBar = None,
                stayOnTop = None,
                menu = None,
                font = None,
                sizeAnchor = None,
                size = None,
                clientSize = None,
                anchor = None,
                position = None,
                disabled = None,
                state = None,
                visible = None,
                isDocument = None,
                mergeMenus = None,
                hasHorzScroll = None,
                hasVertScroll = None,
                dontHideScroll = None,
                dontScrollVert = None,
                dontScrollHorz = None,
                snapVertScroll = None,
                snapHorzScroll = None,
                scroll = None,
                modifyVirtualArea = None,
                dontAutoScrollArea = None,
                fileName = None,
                id = None,
                modifiedDocument = None,
                showInTaskBar = None,
                saveDialog = None,
                isActiveClient = None,
                cursor = None,
                name = None,
                displayDriver = None,
                autoCreate = None,
                scrollArea = None,
                is3D = None,
                closing = None,
                fullRender = None,
                icon = None,
                moveable = None,
                alphaBlend = None,
                useSharedMemory = None,
                glCapabilities = None,
                creationActivation = None,
                nativeDecorations = None,
                manageDisplay = None,
                text = None,
                controller = None,
                noConsequential = None,
                title = None,
                getDecorationsSize = None,
                isInside = None,
                isMouseMoving = None,
                isMouseResizing = None,
                isOpaque = None,
                notifyActivate = None,
                notifyDestroyed = None,
                notifySaved = None,
                onActivate = None,
                onActivateClient = None,
                onApplyGraphics = None,
                onChildAddedOrRemoved = None,
                onChildResized = None,
                onChildVisibilityToggled = None,
                onClose = None,
                onCreate = None,
                onDestroy = None,
                onDestroyed = None,
                onDrawOverChildren = None,
                onFileModified = None,
                onHScroll = None,
                onKeyDown = None,
                onKeyHit = None,
                onKeyUp = None,
                onLeftButtonDown = None,
                onLeftButtonUp = None,
                onLeftDoubleClick = None,
                onLoadGraphics = None,
                onMiddleButtonDown = None,
                onMiddleButtonUp = None,
                onMiddleDoubleClick = None,
                onMouseCaptureLost = None,
                onMouseLeave = None,
                onMouseMove = None,
                onMouseOver = None,
                onMoving = None,
                onMultiTouch = None,
                onPosition = None,
                onPostCreate = None,
                onRedraw = None,
                onResize = None,
                onResizing = None,
                onRightButtonDown = None,
                onRightButtonUp = None,
                onRightDoubleClick = None,
                onSaveFile = None,
                onStateChange = None,
                onSysKeyDown = None,
                onSysKeyHit = None,
                onSysKeyUp = None,
                onUnloadGraphics = None,
                onVScroll = None,
                preShowDecorations = None,
                setBox = None,
                setWindowArea = None,
                setWindowMinimum = None,
                showDecorations = None,
                updateNonClient = None,
                impl = None):
      Window.__init__(self, impl = impl)
      if parent is not None:                   self.parent = parent
      if master is not None:                   self.master = master
      if caption is not None:                  self.caption = caption
      if hotKey is not None:                   self.hotKey = hotKey
      if background is not None:               self.background = background
      if opacity is not None:                  self.opacity = opacity
      if foreground is not None:               self.foreground = foreground
      if borderStyle is not None:              self.borderStyle = borderStyle
      if minClientSize is not None:            self.minClientSize = minClientSize
      if maxClientSize is not None:            self.maxClientSize = maxClientSize
      if hasMaximize is not None:              self.hasMaximize = hasMaximize
      if hasMinimize is not None:              self.hasMinimize = hasMinimize
      if hasClose is not None:                 self.hasClose = hasClose
      if nonClient is not None:                self.nonClient = nonClient
      if inactive is not None:                 self.inactive = inactive
      if clickThrough is not None:             self.clickThrough = clickThrough
      if isRemote is not None:                 self.isRemote = isRemote
      if noCycle is not None:                  self.noCycle = noCycle
      if isModal is not None:                  self.isModal = isModal
      if interim is not None:                  self.interim = interim
      if tabCycle is not None:                 self.tabCycle = tabCycle
      if isDefault is not None:                self.isDefault = isDefault
      if drawBehind is not None:               self.drawBehind = drawBehind
      if hasMenuBar is not None:               self.hasMenuBar = hasMenuBar
      if hasStatusBar is not None:             self.hasStatusBar = hasStatusBar
      if stayOnTop is not None:                self.stayOnTop = stayOnTop
      if menu is not None:                     self.menu = menu
      if font is not None:                     self.font = font
      if sizeAnchor is not None:               self.sizeAnchor = sizeAnchor
      if size is not None:                     self.size = size
      if clientSize is not None:               self.clientSize = clientSize
      if anchor is not None:                   self.anchor = anchor
      if position is not None:                 self.position = position
      if disabled is not None:                 self.disabled = disabled
      if state is not None:                    self.state = state
      if visible is not None:                  self.visible = visible
      if isDocument is not None:               self.isDocument = isDocument
      if mergeMenus is not None:               self.mergeMenus = mergeMenus
      if hasHorzScroll is not None:            self.hasHorzScroll = hasHorzScroll
      if hasVertScroll is not None:            self.hasVertScroll = hasVertScroll
      if dontHideScroll is not None:           self.dontHideScroll = dontHideScroll
      if dontScrollVert is not None:           self.dontScrollVert = dontScrollVert
      if dontScrollHorz is not None:           self.dontScrollHorz = dontScrollHorz
      if snapVertScroll is not None:           self.snapVertScroll = snapVertScroll
      if snapHorzScroll is not None:           self.snapHorzScroll = snapHorzScroll
      if scroll is not None:                   self.scroll = scroll
      if modifyVirtualArea is not None:        self.modifyVirtualArea = modifyVirtualArea
      if dontAutoScrollArea is not None:       self.dontAutoScrollArea = dontAutoScrollArea
      if fileName is not None:                 self.fileName = fileName
      if id is not None:                       self.id = id
      if modifiedDocument is not None:         self.modifiedDocument = modifiedDocument
      if showInTaskBar is not None:            self.showInTaskBar = showInTaskBar
      if saveDialog is not None:               self.saveDialog = saveDialog
      if isActiveClient is not None:           self.isActiveClient = isActiveClient
      if cursor is not None:                   self.cursor = cursor
      if name is not None:                     self.name = name
      if displayDriver is not None:            self.displayDriver = displayDriver
      if autoCreate is not None:               self.autoCreate = autoCreate
      if scrollArea is not None:               self.scrollArea = scrollArea
      if is3D is not None:                     self.is3D = is3D
      if closing is not None:                  self.closing = closing
      if fullRender is not None:               self.fullRender = fullRender
      if icon is not None:                     self.icon = icon
      if moveable is not None:                 self.moveable = moveable
      if alphaBlend is not None:               self.alphaBlend = alphaBlend
      if useSharedMemory is not None:          self.useSharedMemory = useSharedMemory
      if glCapabilities is not None:           self.glCapabilities = glCapabilities
      if creationActivation is not None:       self.creationActivation = creationActivation
      if nativeDecorations is not None:        self.nativeDecorations = nativeDecorations
      if manageDisplay is not None:            self.manageDisplay = manageDisplay
      if text is not None:                     self.text = text
      if controller is not None:               self.controller = controller
      if noConsequential is not None:          self.noConsequential = noConsequential
      if title is not None:                    self.title = title
      if getDecorationsSize is not None:       self.getDecorationsSize = getDecorationsSize
      if isInside is not None:                 self.isInside = isInside
      if isMouseMoving is not None:            self.isMouseMoving = isMouseMoving
      if isMouseResizing is not None:          self.isMouseResizing = isMouseResizing
      if isOpaque is not None:                 self.isOpaque = isOpaque
      if notifyActivate is not None:           self.notifyActivate = notifyActivate
      if notifyDestroyed is not None:          self.notifyDestroyed = notifyDestroyed
      if notifySaved is not None:              self.notifySaved = notifySaved
      if onActivate is not None:               self.onActivate = onActivate
      if onActivateClient is not None:         self.onActivateClient = onActivateClient
      if onApplyGraphics is not None:          self.onApplyGraphics = onApplyGraphics
      if onChildAddedOrRemoved is not None:    self.onChildAddedOrRemoved = onChildAddedOrRemoved
      if onChildResized is not None:           self.onChildResized = onChildResized
      if onChildVisibilityToggled is not None: self.onChildVisibilityToggled = onChildVisibilityToggled
      if onClose is not None:                  self.onClose = onClose
      if onCreate is not None:                 self.onCreate = onCreate
      if onDestroy is not None:                self.onDestroy = onDestroy
      if onDestroyed is not None:              self.onDestroyed = onDestroyed
      if onDrawOverChildren is not None:       self.onDrawOverChildren = onDrawOverChildren
      if onFileModified is not None:           self.onFileModified = onFileModified
      if onHScroll is not None:                self.onHScroll = onHScroll
      if onKeyDown is not None:                self.onKeyDown = onKeyDown
      if onKeyHit is not None:                 self.onKeyHit = onKeyHit
      if onKeyUp is not None:                  self.onKeyUp = onKeyUp
      if onLeftButtonDown is not None:         self.onLeftButtonDown = onLeftButtonDown
      if onLeftButtonUp is not None:           self.onLeftButtonUp = onLeftButtonUp
      if onLeftDoubleClick is not None:        self.onLeftDoubleClick = onLeftDoubleClick
      if onLoadGraphics is not None:           self.onLoadGraphics = onLoadGraphics
      if onMiddleButtonDown is not None:       self.onMiddleButtonDown = onMiddleButtonDown
      if onMiddleButtonUp is not None:         self.onMiddleButtonUp = onMiddleButtonUp
      if onMiddleDoubleClick is not None:      self.onMiddleDoubleClick = onMiddleDoubleClick
      if onMouseCaptureLost is not None:       self.onMouseCaptureLost = onMouseCaptureLost
      if onMouseLeave is not None:             self.onMouseLeave = onMouseLeave
      if onMouseMove is not None:              self.onMouseMove = onMouseMove
      if onMouseOver is not None:              self.onMouseOver = onMouseOver
      if onMoving is not None:                 self.onMoving = onMoving
      if onMultiTouch is not None:             self.onMultiTouch = onMultiTouch
      if onPosition is not None:               self.onPosition = onPosition
      if onPostCreate is not None:             self.onPostCreate = onPostCreate
      if onRedraw is not None:                 self.onRedraw = onRedraw
      if onResize is not None:                 self.onResize = onResize
      if onResizing is not None:               self.onResizing = onResizing
      if onRightButtonDown is not None:        self.onRightButtonDown = onRightButtonDown
      if onRightButtonUp is not None:          self.onRightButtonUp = onRightButtonUp
      if onRightDoubleClick is not None:       self.onRightDoubleClick = onRightDoubleClick
      if onSaveFile is not None:               self.onSaveFile = onSaveFile
      if onStateChange is not None:            self.onStateChange = onStateChange
      if onSysKeyDown is not None:             self.onSysKeyDown = onSysKeyDown
      if onSysKeyHit is not None:              self.onSysKeyHit = onSysKeyHit
      if onSysKeyUp is not None:               self.onSysKeyUp = onSysKeyUp
      if onUnloadGraphics is not None:         self.onUnloadGraphics = onUnloadGraphics
      if onVScroll is not None:                self.onVScroll = onVScroll
      if preShowDecorations is not None:       self.preShowDecorations = preShowDecorations
      if setBox is not None:                   self.setBox = setBox
      if setWindowArea is not None:            self.setWindowArea = setWindowArea
      if setWindowMinimum is not None:         self.setWindowMinimum = setWindowMinimum
      if showDecorations is not None:          self.showDecorations = showDecorations
      if updateNonClient is not None:          self.updateNonClient = updateNonClient

   @property
   def title(self): return Label(impl = IPTR(lib, ffi, self, Group).title)
   @title.setter
   def title(self, value):
      if not isinstance(value, Label): value = Label(value)
      IPTR(lib, ffi, self, Group).title = value.impl

class FieldType:
   integer = lib.FieldType_integer
   real    = lib.FieldType_real
   text    = lib.FieldType_text
   blob    = lib.FieldType_blob
   nil     = lib.FieldType_nil

@ffi.callback("void(FieldDataBox)")
def cb_FieldDataBox_save(__f):
   fielddatabox = pyOrNewObject(FieldDataBox, __f)
   fielddatabox.fn_FieldDataBox_save(fielddatabox)

class FieldDataBox(DataBox):
   def __init__(self,
                parent = None,
                master = None,
                caption = None,
                hotKey = None,
                background = None,
                opacity = None,
                foreground = None,
                borderStyle = None,
                minClientSize = None,
                maxClientSize = None,
                hasMaximize = None,
                hasMinimize = None,
                hasClose = None,
                nonClient = None,
                inactive = None,
                clickThrough = None,
                isRemote = None,
                noCycle = None,
                isModal = None,
                interim = None,
                tabCycle = None,
                isDefault = None,
                drawBehind = None,
                hasMenuBar = None,
                hasStatusBar = None,
                stayOnTop = None,
                menu = None,
                font = None,
                sizeAnchor = None,
                size = None,
                clientSize = None,
                anchor = None,
                position = None,
                disabled = None,
                state = None,
                visible = None,
                isDocument = None,
                mergeMenus = None,
                hasHorzScroll = None,
                hasVertScroll = None,
                dontHideScroll = None,
                dontScrollVert = None,
                dontScrollHorz = None,
                snapVertScroll = None,
                snapHorzScroll = None,
                scroll = None,
                modifyVirtualArea = None,
                dontAutoScrollArea = None,
                fileName = None,
                id = None,
                modifiedDocument = None,
                showInTaskBar = None,
                saveDialog = None,
                isActiveClient = None,
                cursor = None,
                name = None,
                displayDriver = None,
                autoCreate = None,
                scrollArea = None,
                is3D = None,
                closing = None,
                fullRender = None,
                icon = None,
                moveable = None,
                alphaBlend = None,
                useSharedMemory = None,
                glCapabilities = None,
                creationActivation = None,
                nativeDecorations = None,
                manageDisplay = None,
                text = None,
                controller = None,
                noConsequential = None,
                toolTip = None,
                type = None,
                data = None,
                fieldData = None,
                editor = None,
                readOnly = None,
                keepEditor = None,
                autoSize = None,
                needUpdate = None,
                stringValue = None,
                row = None,
                field = None,
                getDecorationsSize = None,
                isInside = None,
                isMouseMoving = None,
                isMouseResizing = None,
                isOpaque = None,
                notifyActivate = None,
                notifyDestroyed = None,
                notifySaved = None,
                onActivate = None,
                onActivateClient = None,
                onApplyGraphics = None,
                onChildAddedOrRemoved = None,
                onChildResized = None,
                onChildVisibilityToggled = None,
                onClose = None,
                onCreate = None,
                onDestroy = None,
                onDestroyed = None,
                onDrawOverChildren = None,
                onFileModified = None,
                onHScroll = None,
                onKeyDown = None,
                onKeyHit = None,
                onKeyUp = None,
                onLeftButtonDown = None,
                onLeftButtonUp = None,
                onLeftDoubleClick = None,
                onLoadGraphics = None,
                onMiddleButtonDown = None,
                onMiddleButtonUp = None,
                onMiddleDoubleClick = None,
                onMouseCaptureLost = None,
                onMouseLeave = None,
                onMouseMove = None,
                onMouseOver = None,
                onMoving = None,
                onMultiTouch = None,
                onPosition = None,
                onPostCreate = None,
                onRedraw = None,
                onResize = None,
                onResizing = None,
                onRightButtonDown = None,
                onRightButtonUp = None,
                onRightDoubleClick = None,
                onSaveFile = None,
                onStateChange = None,
                onSysKeyDown = None,
                onSysKeyHit = None,
                onSysKeyUp = None,
                onUnloadGraphics = None,
                onVScroll = None,
                preShowDecorations = None,
                setBox = None,
                setWindowArea = None,
                setWindowMinimum = None,
                showDecorations = None,
                updateNonClient = None,
                notifyChanged = None,
                notifyModified = None,
                onConfigure = None,
                setData = None,
                save = None,
                impl = None):
      DataBox.__init__(self, impl = impl)
      if parent is not None:                   self.parent = parent
      if master is not None:                   self.master = master
      if caption is not None:                  self.caption = caption
      if hotKey is not None:                   self.hotKey = hotKey
      if background is not None:               self.background = background
      if opacity is not None:                  self.opacity = opacity
      if foreground is not None:               self.foreground = foreground
      if borderStyle is not None:              self.borderStyle = borderStyle
      if minClientSize is not None:            self.minClientSize = minClientSize
      if maxClientSize is not None:            self.maxClientSize = maxClientSize
      if hasMaximize is not None:              self.hasMaximize = hasMaximize
      if hasMinimize is not None:              self.hasMinimize = hasMinimize
      if hasClose is not None:                 self.hasClose = hasClose
      if nonClient is not None:                self.nonClient = nonClient
      if inactive is not None:                 self.inactive = inactive
      if clickThrough is not None:             self.clickThrough = clickThrough
      if isRemote is not None:                 self.isRemote = isRemote
      if noCycle is not None:                  self.noCycle = noCycle
      if isModal is not None:                  self.isModal = isModal
      if interim is not None:                  self.interim = interim
      if tabCycle is not None:                 self.tabCycle = tabCycle
      if isDefault is not None:                self.isDefault = isDefault
      if drawBehind is not None:               self.drawBehind = drawBehind
      if hasMenuBar is not None:               self.hasMenuBar = hasMenuBar
      if hasStatusBar is not None:             self.hasStatusBar = hasStatusBar
      if stayOnTop is not None:                self.stayOnTop = stayOnTop
      if menu is not None:                     self.menu = menu
      if font is not None:                     self.font = font
      if sizeAnchor is not None:               self.sizeAnchor = sizeAnchor
      if size is not None:                     self.size = size
      if clientSize is not None:               self.clientSize = clientSize
      if anchor is not None:                   self.anchor = anchor
      if position is not None:                 self.position = position
      if disabled is not None:                 self.disabled = disabled
      if state is not None:                    self.state = state
      if visible is not None:                  self.visible = visible
      if isDocument is not None:               self.isDocument = isDocument
      if mergeMenus is not None:               self.mergeMenus = mergeMenus
      if hasHorzScroll is not None:            self.hasHorzScroll = hasHorzScroll
      if hasVertScroll is not None:            self.hasVertScroll = hasVertScroll
      if dontHideScroll is not None:           self.dontHideScroll = dontHideScroll
      if dontScrollVert is not None:           self.dontScrollVert = dontScrollVert
      if dontScrollHorz is not None:           self.dontScrollHorz = dontScrollHorz
      if snapVertScroll is not None:           self.snapVertScroll = snapVertScroll
      if snapHorzScroll is not None:           self.snapHorzScroll = snapHorzScroll
      if scroll is not None:                   self.scroll = scroll
      if modifyVirtualArea is not None:        self.modifyVirtualArea = modifyVirtualArea
      if dontAutoScrollArea is not None:       self.dontAutoScrollArea = dontAutoScrollArea
      if fileName is not None:                 self.fileName = fileName
      if id is not None:                       self.id = id
      if modifiedDocument is not None:         self.modifiedDocument = modifiedDocument
      if showInTaskBar is not None:            self.showInTaskBar = showInTaskBar
      if saveDialog is not None:               self.saveDialog = saveDialog
      if isActiveClient is not None:           self.isActiveClient = isActiveClient
      if cursor is not None:                   self.cursor = cursor
      if name is not None:                     self.name = name
      if displayDriver is not None:            self.displayDriver = displayDriver
      if autoCreate is not None:               self.autoCreate = autoCreate
      if scrollArea is not None:               self.scrollArea = scrollArea
      if is3D is not None:                     self.is3D = is3D
      if closing is not None:                  self.closing = closing
      if fullRender is not None:               self.fullRender = fullRender
      if icon is not None:                     self.icon = icon
      if moveable is not None:                 self.moveable = moveable
      if alphaBlend is not None:               self.alphaBlend = alphaBlend
      if useSharedMemory is not None:          self.useSharedMemory = useSharedMemory
      if glCapabilities is not None:           self.glCapabilities = glCapabilities
      if creationActivation is not None:       self.creationActivation = creationActivation
      if nativeDecorations is not None:        self.nativeDecorations = nativeDecorations
      if manageDisplay is not None:            self.manageDisplay = manageDisplay
      if text is not None:                     self.text = text
      if controller is not None:               self.controller = controller
      if noConsequential is not None:          self.noConsequential = noConsequential
      if toolTip is not None:                  self.toolTip = toolTip
      if type is not None:                     self.type = type
      if data is not None:                     self.data = data
      if fieldData is not None:                self.fieldData = fieldData
      if editor is not None:                   self.editor = editor
      if readOnly is not None:                 self.readOnly = readOnly
      if keepEditor is not None:               self.keepEditor = keepEditor
      if autoSize is not None:                 self.autoSize = autoSize
      if needUpdate is not None:               self.needUpdate = needUpdate
      if stringValue is not None:              self.stringValue = stringValue
      if row is not None:                      self.row = row
      if field is not None:                    self.field = field
      if getDecorationsSize is not None:       self.getDecorationsSize = getDecorationsSize
      if isInside is not None:                 self.isInside = isInside
      if isMouseMoving is not None:            self.isMouseMoving = isMouseMoving
      if isMouseResizing is not None:          self.isMouseResizing = isMouseResizing
      if isOpaque is not None:                 self.isOpaque = isOpaque
      if notifyActivate is not None:           self.notifyActivate = notifyActivate
      if notifyDestroyed is not None:          self.notifyDestroyed = notifyDestroyed
      if notifySaved is not None:              self.notifySaved = notifySaved
      if onActivate is not None:               self.onActivate = onActivate
      if onActivateClient is not None:         self.onActivateClient = onActivateClient
      if onApplyGraphics is not None:          self.onApplyGraphics = onApplyGraphics
      if onChildAddedOrRemoved is not None:    self.onChildAddedOrRemoved = onChildAddedOrRemoved
      if onChildResized is not None:           self.onChildResized = onChildResized
      if onChildVisibilityToggled is not None: self.onChildVisibilityToggled = onChildVisibilityToggled
      if onClose is not None:                  self.onClose = onClose
      if onCreate is not None:                 self.onCreate = onCreate
      if onDestroy is not None:                self.onDestroy = onDestroy
      if onDestroyed is not None:              self.onDestroyed = onDestroyed
      if onDrawOverChildren is not None:       self.onDrawOverChildren = onDrawOverChildren
      if onFileModified is not None:           self.onFileModified = onFileModified
      if onHScroll is not None:                self.onHScroll = onHScroll
      if onKeyDown is not None:                self.onKeyDown = onKeyDown
      if onKeyHit is not None:                 self.onKeyHit = onKeyHit
      if onKeyUp is not None:                  self.onKeyUp = onKeyUp
      if onLeftButtonDown is not None:         self.onLeftButtonDown = onLeftButtonDown
      if onLeftButtonUp is not None:           self.onLeftButtonUp = onLeftButtonUp
      if onLeftDoubleClick is not None:        self.onLeftDoubleClick = onLeftDoubleClick
      if onLoadGraphics is not None:           self.onLoadGraphics = onLoadGraphics
      if onMiddleButtonDown is not None:       self.onMiddleButtonDown = onMiddleButtonDown
      if onMiddleButtonUp is not None:         self.onMiddleButtonUp = onMiddleButtonUp
      if onMiddleDoubleClick is not None:      self.onMiddleDoubleClick = onMiddleDoubleClick
      if onMouseCaptureLost is not None:       self.onMouseCaptureLost = onMouseCaptureLost
      if onMouseLeave is not None:             self.onMouseLeave = onMouseLeave
      if onMouseMove is not None:              self.onMouseMove = onMouseMove
      if onMouseOver is not None:              self.onMouseOver = onMouseOver
      if onMoving is not None:                 self.onMoving = onMoving
      if onMultiTouch is not None:             self.onMultiTouch = onMultiTouch
      if onPosition is not None:               self.onPosition = onPosition
      if onPostCreate is not None:             self.onPostCreate = onPostCreate
      if onRedraw is not None:                 self.onRedraw = onRedraw
      if onResize is not None:                 self.onResize = onResize
      if onResizing is not None:               self.onResizing = onResizing
      if onRightButtonDown is not None:        self.onRightButtonDown = onRightButtonDown
      if onRightButtonUp is not None:          self.onRightButtonUp = onRightButtonUp
      if onRightDoubleClick is not None:       self.onRightDoubleClick = onRightDoubleClick
      if onSaveFile is not None:               self.onSaveFile = onSaveFile
      if onStateChange is not None:            self.onStateChange = onStateChange
      if onSysKeyDown is not None:             self.onSysKeyDown = onSysKeyDown
      if onSysKeyHit is not None:              self.onSysKeyHit = onSysKeyHit
      if onSysKeyUp is not None:               self.onSysKeyUp = onSysKeyUp
      if onUnloadGraphics is not None:         self.onUnloadGraphics = onUnloadGraphics
      if onVScroll is not None:                self.onVScroll = onVScroll
      if preShowDecorations is not None:       self.preShowDecorations = preShowDecorations
      if setBox is not None:                   self.setBox = setBox
      if setWindowArea is not None:            self.setWindowArea = setWindowArea
      if setWindowMinimum is not None:         self.setWindowMinimum = setWindowMinimum
      if showDecorations is not None:          self.showDecorations = showDecorations
      if updateNonClient is not None:          self.updateNonClient = updateNonClient
      if notifyChanged is not None:            self.notifyChanged = notifyChanged
      if notifyModified is not None:           self.notifyModified = notifyModified
      if onConfigure is not None:              self.onConfigure = onConfigure
      if setData is not None:                  self.setData = setData
      if save is not None:                     self.save = save

   @property
   def type(self): return Class(impl = IPTR(lib, ffi, self, FieldDataBox).type)
   @type.setter
   def type(self, value):
      if not isinstance(value, Class): value = Class(value)
      IPTR(lib, ffi, self, FieldDataBox).type = value.impl

   @property
   def data(self): return IPTR(lib, ffi, self, FieldDataBox).data
   @data.setter
   def data(self, value): IPTR(lib, ffi, self, FieldDataBox).data = value

   @property
   def fieldData(self): return IPTR(lib, ffi, self, FieldDataBox).fieldData
   @fieldData.setter
   def fieldData(self, value): IPTR(lib, ffi, self, FieldDataBox).fieldData = value

   @property
   def editor(self): return Window(impl = IPTR(lib, ffi, self, FieldDataBox).editor)
   @editor.setter
   def editor(self, value):
      if not isinstance(value, Window): value = Window(value)
      IPTR(lib, ffi, self, FieldDataBox).editor = value.impl

   @property
   def readOnly(self): return IPTR(lib, ffi, self, FieldDataBox).readOnly
   @readOnly.setter
   def readOnly(self, value): IPTR(lib, ffi, self, FieldDataBox).readOnly = value

   @property
   def keepEditor(self): return IPTR(lib, ffi, self, FieldDataBox).keepEditor
   @keepEditor.setter
   def keepEditor(self, value): IPTR(lib, ffi, self, FieldDataBox).keepEditor = value

   @property
   def autoSize(self): return IPTR(lib, ffi, self, FieldDataBox).autoSize
   @autoSize.setter
   def autoSize(self, value): IPTR(lib, ffi, self, FieldDataBox).autoSize = value

   @property
   def needUpdate(self): return IPTR(lib, ffi, self, FieldDataBox).needUpdate
   @needUpdate.setter
   def needUpdate(self, value): IPTR(lib, ffi, self, FieldDataBox).needUpdate = value

   @property
   def stringValue(self): return String(impl = IPTR(lib, ffi, self, FieldDataBox).stringValue)
   @stringValue.setter
   def stringValue(self, value):
      if not isinstance(value, String): value = String(value)
      IPTR(lib, ffi, self, FieldDataBox).stringValue = value.impl

   @property
   def row(self): return pyOrNewObject(Row, lib.FieldDataBox_get_row(self.impl))
   @row.setter
   def row(self, value):
      if not isinstance(value, Row): value = Row(value)
      lib.FieldDataBox_set_row(self.impl, value.impl)

   @property
   def field(self): return None
   @field.setter
   def field(self, value):
      if not isinstance(value, Field): value = Field(value)
      lib.FieldDataBox_set_field(self.impl, value.impl)

   def clear(self):
      lib.FieldDataBox_clear(self.impl)

   def init(self):
      lib.FieldDataBox_init(self.impl)

   def load(self):
      lib.FieldDataBox_load(self.impl)

   def fn_unset_FieldDataBox_save(self):
      return lib.FieldDataBox_save(self.impl)

   @property
   def save(self):
      if hasattr(self, 'fn_FieldDataBox_save'): return self.fn_FieldDataBox_save
      else: return self.fn_unset_FieldDataBox_save
   @save.setter
   def save(self, value):
      self.fn_FieldDataBox_save = value
      lib.Instance_setMethod(self.impl, "Save".encode('utf8'), cb_FieldDataBox_save)

@ffi.callback("void(TableDropBox)")
def cb_FieldDropDataBox_refillFunction(__t):
   fielddropdatabox = pyOrNewObject(FieldDropDataBox, fielddropdatabox)
   fielddropdatabox.fn_FieldDropDataBox_refillFunction(pyOrNewObject(FieldDropDataBox, __t))

class FieldDropDataBox(FieldDataBox):
   def __init__(self,
                parent = None,
                master = None,
                caption = None,
                hotKey = None,
                background = None,
                opacity = None,
                foreground = None,
                borderStyle = None,
                minClientSize = None,
                maxClientSize = None,
                hasMaximize = None,
                hasMinimize = None,
                hasClose = None,
                nonClient = None,
                inactive = None,
                clickThrough = None,
                isRemote = None,
                noCycle = None,
                isModal = None,
                interim = None,
                tabCycle = None,
                isDefault = None,
                drawBehind = None,
                hasMenuBar = None,
                hasStatusBar = None,
                stayOnTop = None,
                menu = None,
                font = None,
                sizeAnchor = None,
                size = None,
                clientSize = None,
                anchor = None,
                position = None,
                disabled = None,
                state = None,
                visible = None,
                isDocument = None,
                mergeMenus = None,
                hasHorzScroll = None,
                hasVertScroll = None,
                dontHideScroll = None,
                dontScrollVert = None,
                dontScrollHorz = None,
                snapVertScroll = None,
                snapHorzScroll = None,
                scroll = None,
                modifyVirtualArea = None,
                dontAutoScrollArea = None,
                fileName = None,
                id = None,
                modifiedDocument = None,
                showInTaskBar = None,
                saveDialog = None,
                isActiveClient = None,
                cursor = None,
                name = None,
                displayDriver = None,
                autoCreate = None,
                scrollArea = None,
                is3D = None,
                closing = None,
                fullRender = None,
                icon = None,
                moveable = None,
                alphaBlend = None,
                useSharedMemory = None,
                glCapabilities = None,
                creationActivation = None,
                nativeDecorations = None,
                manageDisplay = None,
                text = None,
                controller = None,
                noConsequential = None,
                toolTip = None,
                type = None,
                data = None,
                fieldData = None,
                editor = None,
                readOnly = None,
                keepEditor = None,
                autoSize = None,
                needUpdate = None,
                stringValue = None,
                row = None,
                field = None,
                filter = None,
                filtered = None,
                exclusion = None,
                filterField = None,
                nameField = None,
                showNone = None,
                getDecorationsSize = None,
                isInside = None,
                isMouseMoving = None,
                isMouseResizing = None,
                isOpaque = None,
                notifyActivate = None,
                notifyDestroyed = None,
                notifySaved = None,
                onActivate = None,
                onActivateClient = None,
                onApplyGraphics = None,
                onChildAddedOrRemoved = None,
                onChildResized = None,
                onChildVisibilityToggled = None,
                onClose = None,
                onCreate = None,
                onDestroy = None,
                onDestroyed = None,
                onDrawOverChildren = None,
                onFileModified = None,
                onHScroll = None,
                onKeyDown = None,
                onKeyHit = None,
                onKeyUp = None,
                onLeftButtonDown = None,
                onLeftButtonUp = None,
                onLeftDoubleClick = None,
                onLoadGraphics = None,
                onMiddleButtonDown = None,
                onMiddleButtonUp = None,
                onMiddleDoubleClick = None,
                onMouseCaptureLost = None,
                onMouseLeave = None,
                onMouseMove = None,
                onMouseOver = None,
                onMoving = None,
                onMultiTouch = None,
                onPosition = None,
                onPostCreate = None,
                onRedraw = None,
                onResize = None,
                onResizing = None,
                onRightButtonDown = None,
                onRightButtonUp = None,
                onRightDoubleClick = None,
                onSaveFile = None,
                onStateChange = None,
                onSysKeyDown = None,
                onSysKeyHit = None,
                onSysKeyUp = None,
                onUnloadGraphics = None,
                onVScroll = None,
                preShowDecorations = None,
                setBox = None,
                setWindowArea = None,
                setWindowMinimum = None,
                showDecorations = None,
                updateNonClient = None,
                notifyChanged = None,
                notifyModified = None,
                onConfigure = None,
                setData = None,
                save = None,
                refillFunction = None,
                impl = None):
      FieldDataBox.__init__(self, impl = impl)
      if parent is not None:                   self.parent = parent
      if master is not None:                   self.master = master
      if caption is not None:                  self.caption = caption
      if hotKey is not None:                   self.hotKey = hotKey
      if background is not None:               self.background = background
      if opacity is not None:                  self.opacity = opacity
      if foreground is not None:               self.foreground = foreground
      if borderStyle is not None:              self.borderStyle = borderStyle
      if minClientSize is not None:            self.minClientSize = minClientSize
      if maxClientSize is not None:            self.maxClientSize = maxClientSize
      if hasMaximize is not None:              self.hasMaximize = hasMaximize
      if hasMinimize is not None:              self.hasMinimize = hasMinimize
      if hasClose is not None:                 self.hasClose = hasClose
      if nonClient is not None:                self.nonClient = nonClient
      if inactive is not None:                 self.inactive = inactive
      if clickThrough is not None:             self.clickThrough = clickThrough
      if isRemote is not None:                 self.isRemote = isRemote
      if noCycle is not None:                  self.noCycle = noCycle
      if isModal is not None:                  self.isModal = isModal
      if interim is not None:                  self.interim = interim
      if tabCycle is not None:                 self.tabCycle = tabCycle
      if isDefault is not None:                self.isDefault = isDefault
      if drawBehind is not None:               self.drawBehind = drawBehind
      if hasMenuBar is not None:               self.hasMenuBar = hasMenuBar
      if hasStatusBar is not None:             self.hasStatusBar = hasStatusBar
      if stayOnTop is not None:                self.stayOnTop = stayOnTop
      if menu is not None:                     self.menu = menu
      if font is not None:                     self.font = font
      if sizeAnchor is not None:               self.sizeAnchor = sizeAnchor
      if size is not None:                     self.size = size
      if clientSize is not None:               self.clientSize = clientSize
      if anchor is not None:                   self.anchor = anchor
      if position is not None:                 self.position = position
      if disabled is not None:                 self.disabled = disabled
      if state is not None:                    self.state = state
      if visible is not None:                  self.visible = visible
      if isDocument is not None:               self.isDocument = isDocument
      if mergeMenus is not None:               self.mergeMenus = mergeMenus
      if hasHorzScroll is not None:            self.hasHorzScroll = hasHorzScroll
      if hasVertScroll is not None:            self.hasVertScroll = hasVertScroll
      if dontHideScroll is not None:           self.dontHideScroll = dontHideScroll
      if dontScrollVert is not None:           self.dontScrollVert = dontScrollVert
      if dontScrollHorz is not None:           self.dontScrollHorz = dontScrollHorz
      if snapVertScroll is not None:           self.snapVertScroll = snapVertScroll
      if snapHorzScroll is not None:           self.snapHorzScroll = snapHorzScroll
      if scroll is not None:                   self.scroll = scroll
      if modifyVirtualArea is not None:        self.modifyVirtualArea = modifyVirtualArea
      if dontAutoScrollArea is not None:       self.dontAutoScrollArea = dontAutoScrollArea
      if fileName is not None:                 self.fileName = fileName
      if id is not None:                       self.id = id
      if modifiedDocument is not None:         self.modifiedDocument = modifiedDocument
      if showInTaskBar is not None:            self.showInTaskBar = showInTaskBar
      if saveDialog is not None:               self.saveDialog = saveDialog
      if isActiveClient is not None:           self.isActiveClient = isActiveClient
      if cursor is not None:                   self.cursor = cursor
      if name is not None:                     self.name = name
      if displayDriver is not None:            self.displayDriver = displayDriver
      if autoCreate is not None:               self.autoCreate = autoCreate
      if scrollArea is not None:               self.scrollArea = scrollArea
      if is3D is not None:                     self.is3D = is3D
      if closing is not None:                  self.closing = closing
      if fullRender is not None:               self.fullRender = fullRender
      if icon is not None:                     self.icon = icon
      if moveable is not None:                 self.moveable = moveable
      if alphaBlend is not None:               self.alphaBlend = alphaBlend
      if useSharedMemory is not None:          self.useSharedMemory = useSharedMemory
      if glCapabilities is not None:           self.glCapabilities = glCapabilities
      if creationActivation is not None:       self.creationActivation = creationActivation
      if nativeDecorations is not None:        self.nativeDecorations = nativeDecorations
      if manageDisplay is not None:            self.manageDisplay = manageDisplay
      if text is not None:                     self.text = text
      if controller is not None:               self.controller = controller
      if noConsequential is not None:          self.noConsequential = noConsequential
      if toolTip is not None:                  self.toolTip = toolTip
      if type is not None:                     self.type = type
      if data is not None:                     self.data = data
      if fieldData is not None:                self.fieldData = fieldData
      if editor is not None:                   self.editor = editor
      if readOnly is not None:                 self.readOnly = readOnly
      if keepEditor is not None:               self.keepEditor = keepEditor
      if autoSize is not None:                 self.autoSize = autoSize
      if needUpdate is not None:               self.needUpdate = needUpdate
      if stringValue is not None:              self.stringValue = stringValue
      if row is not None:                      self.row = row
      if field is not None:                    self.field = field
      if filter is not None:                   self.filter = filter
      if filtered is not None:                 self.filtered = filtered
      if exclusion is not None:                self.exclusion = exclusion
      if filterField is not None:              self.filterField = filterField
      if nameField is not None:                self.nameField = nameField
      if showNone is not None:                 self.showNone = showNone
      if getDecorationsSize is not None:       self.getDecorationsSize = getDecorationsSize
      if isInside is not None:                 self.isInside = isInside
      if isMouseMoving is not None:            self.isMouseMoving = isMouseMoving
      if isMouseResizing is not None:          self.isMouseResizing = isMouseResizing
      if isOpaque is not None:                 self.isOpaque = isOpaque
      if notifyActivate is not None:           self.notifyActivate = notifyActivate
      if notifyDestroyed is not None:          self.notifyDestroyed = notifyDestroyed
      if notifySaved is not None:              self.notifySaved = notifySaved
      if onActivate is not None:               self.onActivate = onActivate
      if onActivateClient is not None:         self.onActivateClient = onActivateClient
      if onApplyGraphics is not None:          self.onApplyGraphics = onApplyGraphics
      if onChildAddedOrRemoved is not None:    self.onChildAddedOrRemoved = onChildAddedOrRemoved
      if onChildResized is not None:           self.onChildResized = onChildResized
      if onChildVisibilityToggled is not None: self.onChildVisibilityToggled = onChildVisibilityToggled
      if onClose is not None:                  self.onClose = onClose
      if onCreate is not None:                 self.onCreate = onCreate
      if onDestroy is not None:                self.onDestroy = onDestroy
      if onDestroyed is not None:              self.onDestroyed = onDestroyed
      if onDrawOverChildren is not None:       self.onDrawOverChildren = onDrawOverChildren
      if onFileModified is not None:           self.onFileModified = onFileModified
      if onHScroll is not None:                self.onHScroll = onHScroll
      if onKeyDown is not None:                self.onKeyDown = onKeyDown
      if onKeyHit is not None:                 self.onKeyHit = onKeyHit
      if onKeyUp is not None:                  self.onKeyUp = onKeyUp
      if onLeftButtonDown is not None:         self.onLeftButtonDown = onLeftButtonDown
      if onLeftButtonUp is not None:           self.onLeftButtonUp = onLeftButtonUp
      if onLeftDoubleClick is not None:        self.onLeftDoubleClick = onLeftDoubleClick
      if onLoadGraphics is not None:           self.onLoadGraphics = onLoadGraphics
      if onMiddleButtonDown is not None:       self.onMiddleButtonDown = onMiddleButtonDown
      if onMiddleButtonUp is not None:         self.onMiddleButtonUp = onMiddleButtonUp
      if onMiddleDoubleClick is not None:      self.onMiddleDoubleClick = onMiddleDoubleClick
      if onMouseCaptureLost is not None:       self.onMouseCaptureLost = onMouseCaptureLost
      if onMouseLeave is not None:             self.onMouseLeave = onMouseLeave
      if onMouseMove is not None:              self.onMouseMove = onMouseMove
      if onMouseOver is not None:              self.onMouseOver = onMouseOver
      if onMoving is not None:                 self.onMoving = onMoving
      if onMultiTouch is not None:             self.onMultiTouch = onMultiTouch
      if onPosition is not None:               self.onPosition = onPosition
      if onPostCreate is not None:             self.onPostCreate = onPostCreate
      if onRedraw is not None:                 self.onRedraw = onRedraw
      if onResize is not None:                 self.onResize = onResize
      if onResizing is not None:               self.onResizing = onResizing
      if onRightButtonDown is not None:        self.onRightButtonDown = onRightButtonDown
      if onRightButtonUp is not None:          self.onRightButtonUp = onRightButtonUp
      if onRightDoubleClick is not None:       self.onRightDoubleClick = onRightDoubleClick
      if onSaveFile is not None:               self.onSaveFile = onSaveFile
      if onStateChange is not None:            self.onStateChange = onStateChange
      if onSysKeyDown is not None:             self.onSysKeyDown = onSysKeyDown
      if onSysKeyHit is not None:              self.onSysKeyHit = onSysKeyHit
      if onSysKeyUp is not None:               self.onSysKeyUp = onSysKeyUp
      if onUnloadGraphics is not None:         self.onUnloadGraphics = onUnloadGraphics
      if onVScroll is not None:                self.onVScroll = onVScroll
      if preShowDecorations is not None:       self.preShowDecorations = preShowDecorations
      if setBox is not None:                   self.setBox = setBox
      if setWindowArea is not None:            self.setWindowArea = setWindowArea
      if setWindowMinimum is not None:         self.setWindowMinimum = setWindowMinimum
      if showDecorations is not None:          self.showDecorations = showDecorations
      if updateNonClient is not None:          self.updateNonClient = updateNonClient
      if notifyChanged is not None:            self.notifyChanged = notifyChanged
      if notifyModified is not None:           self.notifyModified = notifyModified
      if onConfigure is not None:              self.onConfigure = onConfigure
      if setData is not None:                  self.setData = setData
      if save is not None:                     self.save = save
      if refillFunction is not None:           self.refillFunction = refillFunction

   @property
   def type(self): return Class(impl = IPTR(lib, ffi, self, FieldDropDataBox).type)
   @type.setter
   def type(self, value):
      if not isinstance(value, Class): value = Class(value)
      IPTR(lib, ffi, self, FieldDropDataBox).type = value.impl

   @property
   def data(self): return IPTR(lib, ffi, self, FieldDropDataBox).data
   @data.setter
   def data(self, value): IPTR(lib, ffi, self, FieldDropDataBox).data = value

   @property
   def fieldData(self): return IPTR(lib, ffi, self, FieldDropDataBox).fieldData
   @fieldData.setter
   def fieldData(self, value): IPTR(lib, ffi, self, FieldDropDataBox).fieldData = value

   @property
   def editor(self): return Window(impl = IPTR(lib, ffi, self, FieldDropDataBox).editor)
   @editor.setter
   def editor(self, value):
      if not isinstance(value, Window): value = Window(value)
      IPTR(lib, ffi, self, FieldDropDataBox).editor = value.impl

   @property
   def readOnly(self): return IPTR(lib, ffi, self, FieldDropDataBox).readOnly
   @readOnly.setter
   def readOnly(self, value): IPTR(lib, ffi, self, FieldDropDataBox).readOnly = value

   @property
   def keepEditor(self): return IPTR(lib, ffi, self, FieldDropDataBox).keepEditor
   @keepEditor.setter
   def keepEditor(self, value): IPTR(lib, ffi, self, FieldDropDataBox).keepEditor = value

   @property
   def autoSize(self): return IPTR(lib, ffi, self, FieldDropDataBox).autoSize
   @autoSize.setter
   def autoSize(self, value): IPTR(lib, ffi, self, FieldDropDataBox).autoSize = value

   @property
   def needUpdate(self): return IPTR(lib, ffi, self, FieldDropDataBox).needUpdate
   @needUpdate.setter
   def needUpdate(self, value): IPTR(lib, ffi, self, FieldDropDataBox).needUpdate = value

   @property
   def stringValue(self): return String(impl = IPTR(lib, ffi, self, FieldDropDataBox).stringValue)
   @stringValue.setter
   def stringValue(self, value):
      if not isinstance(value, String): value = String(value)
      IPTR(lib, ffi, self, FieldDropDataBox).stringValue = value.impl

   @property
   def filter(self): return Id(lib.FieldDropDataBox_get_filter(self.impl))
   @filter.setter
   def filter(self, value):
      if not isinstance(value, Id): value = Id(value)
      lib.FieldDropDataBox_set_filter(self.impl, value.impl)

   @property
   def filtered(self): return None
   @filtered.setter
   def filtered(self, value):
      lib.FieldDropDataBox_set_filtered(self.impl, value)

   @property
   def exclusion(self): return None
   @exclusion.setter
   def exclusion(self, value):
      if not isinstance(value, Id): value = Id(value)
      lib.FieldDropDataBox_set_exclusion(self.impl, value.impl)

   @property
   def filterField(self): return None
   @filterField.setter
   def filterField(self, value):
      if not isinstance(value, Field): value = Field(value)
      lib.FieldDropDataBox_set_filterField(self.impl, value.impl)

   @property
   def nameField(self): return None
   @nameField.setter
   def nameField(self, value):
      if not isinstance(value, Field): value = Field(value)
      lib.FieldDropDataBox_set_nameField(self.impl, value.impl)

   @property
   def showNone(self): return None
   @showNone.setter
   def showNone(self, value):
      lib.FieldDropDataBox_set_showNone(self.impl, value)

   def refill(self):
      lib.FieldDropDataBox_refill(self.impl)

   def fn_unset_FieldDropDataBox_refillFunction(self, _tabledropbox):
      return lib.FieldDropDataBox_refillFunction(self.impl, _tabledropbox.impl)

   @property
   def refillFunction(self):
      if hasattr(self, 'fn_FieldDropDataBox_refillFunction'): return self.fn_FieldDropDataBox_refillFunction
      else: return self.fn_unset_FieldDropDataBox_refillFunction
   @refillFunction.setter
   def refillFunction(self, value):
      self.fn_FieldDropDataBox_refillFunction = value
      lib.Instance_setMethod(self.impl, "RefillFunction".encode('utf8'), cb_FieldDropDataBox_refillFunction)

@ffi.callback("void(TableDropBox)")
def cb_DropDataBox_refillFunction(__t):
   dropdatabox = pyOrNewObject(DropDataBox, dropdatabox)
   dropdatabox.fn_DropDataBox_refillFunction(pyOrNewObject(DropDataBox, __t))

class DropDataBox(DataBox):
   def __init__(self,
                parent = None,
                master = None,
                caption = None,
                hotKey = None,
                background = None,
                opacity = None,
                foreground = None,
                borderStyle = None,
                minClientSize = None,
                maxClientSize = None,
                hasMaximize = None,
                hasMinimize = None,
                hasClose = None,
                nonClient = None,
                inactive = None,
                clickThrough = None,
                isRemote = None,
                noCycle = None,
                isModal = None,
                interim = None,
                tabCycle = None,
                isDefault = None,
                drawBehind = None,
                hasMenuBar = None,
                hasStatusBar = None,
                stayOnTop = None,
                menu = None,
                font = None,
                sizeAnchor = None,
                size = None,
                clientSize = None,
                anchor = None,
                position = None,
                disabled = None,
                state = None,
                visible = None,
                isDocument = None,
                mergeMenus = None,
                hasHorzScroll = None,
                hasVertScroll = None,
                dontHideScroll = None,
                dontScrollVert = None,
                dontScrollHorz = None,
                snapVertScroll = None,
                snapHorzScroll = None,
                scroll = None,
                modifyVirtualArea = None,
                dontAutoScrollArea = None,
                fileName = None,
                id = None,
                modifiedDocument = None,
                showInTaskBar = None,
                saveDialog = None,
                isActiveClient = None,
                cursor = None,
                name = None,
                displayDriver = None,
                autoCreate = None,
                scrollArea = None,
                is3D = None,
                closing = None,
                fullRender = None,
                icon = None,
                moveable = None,
                alphaBlend = None,
                useSharedMemory = None,
                glCapabilities = None,
                creationActivation = None,
                nativeDecorations = None,
                manageDisplay = None,
                text = None,
                controller = None,
                noConsequential = None,
                toolTip = None,
                type = None,
                data = None,
                fieldData = None,
                editor = None,
                readOnly = None,
                keepEditor = None,
                autoSize = None,
                needUpdate = None,
                stringValue = None,
                filter = None,
                filtered = None,
                exclusion = None,
                filterField = None,
                nameField = None,
                showNone = None,
                getDecorationsSize = None,
                isInside = None,
                isMouseMoving = None,
                isMouseResizing = None,
                isOpaque = None,
                notifyActivate = None,
                notifyDestroyed = None,
                notifySaved = None,
                onActivate = None,
                onActivateClient = None,
                onApplyGraphics = None,
                onChildAddedOrRemoved = None,
                onChildResized = None,
                onChildVisibilityToggled = None,
                onClose = None,
                onCreate = None,
                onDestroy = None,
                onDestroyed = None,
                onDrawOverChildren = None,
                onFileModified = None,
                onHScroll = None,
                onKeyDown = None,
                onKeyHit = None,
                onKeyUp = None,
                onLeftButtonDown = None,
                onLeftButtonUp = None,
                onLeftDoubleClick = None,
                onLoadGraphics = None,
                onMiddleButtonDown = None,
                onMiddleButtonUp = None,
                onMiddleDoubleClick = None,
                onMouseCaptureLost = None,
                onMouseLeave = None,
                onMouseMove = None,
                onMouseOver = None,
                onMoving = None,
                onMultiTouch = None,
                onPosition = None,
                onPostCreate = None,
                onRedraw = None,
                onResize = None,
                onResizing = None,
                onRightButtonDown = None,
                onRightButtonUp = None,
                onRightDoubleClick = None,
                onSaveFile = None,
                onStateChange = None,
                onSysKeyDown = None,
                onSysKeyHit = None,
                onSysKeyUp = None,
                onUnloadGraphics = None,
                onVScroll = None,
                preShowDecorations = None,
                setBox = None,
                setWindowArea = None,
                setWindowMinimum = None,
                showDecorations = None,
                updateNonClient = None,
                notifyChanged = None,
                notifyModified = None,
                onConfigure = None,
                setData = None,
                refillFunction = None,
                impl = None):
      DataBox.__init__(self, impl = impl)
      if parent is not None:                   self.parent = parent
      if master is not None:                   self.master = master
      if caption is not None:                  self.caption = caption
      if hotKey is not None:                   self.hotKey = hotKey
      if background is not None:               self.background = background
      if opacity is not None:                  self.opacity = opacity
      if foreground is not None:               self.foreground = foreground
      if borderStyle is not None:              self.borderStyle = borderStyle
      if minClientSize is not None:            self.minClientSize = minClientSize
      if maxClientSize is not None:            self.maxClientSize = maxClientSize
      if hasMaximize is not None:              self.hasMaximize = hasMaximize
      if hasMinimize is not None:              self.hasMinimize = hasMinimize
      if hasClose is not None:                 self.hasClose = hasClose
      if nonClient is not None:                self.nonClient = nonClient
      if inactive is not None:                 self.inactive = inactive
      if clickThrough is not None:             self.clickThrough = clickThrough
      if isRemote is not None:                 self.isRemote = isRemote
      if noCycle is not None:                  self.noCycle = noCycle
      if isModal is not None:                  self.isModal = isModal
      if interim is not None:                  self.interim = interim
      if tabCycle is not None:                 self.tabCycle = tabCycle
      if isDefault is not None:                self.isDefault = isDefault
      if drawBehind is not None:               self.drawBehind = drawBehind
      if hasMenuBar is not None:               self.hasMenuBar = hasMenuBar
      if hasStatusBar is not None:             self.hasStatusBar = hasStatusBar
      if stayOnTop is not None:                self.stayOnTop = stayOnTop
      if menu is not None:                     self.menu = menu
      if font is not None:                     self.font = font
      if sizeAnchor is not None:               self.sizeAnchor = sizeAnchor
      if size is not None:                     self.size = size
      if clientSize is not None:               self.clientSize = clientSize
      if anchor is not None:                   self.anchor = anchor
      if position is not None:                 self.position = position
      if disabled is not None:                 self.disabled = disabled
      if state is not None:                    self.state = state
      if visible is not None:                  self.visible = visible
      if isDocument is not None:               self.isDocument = isDocument
      if mergeMenus is not None:               self.mergeMenus = mergeMenus
      if hasHorzScroll is not None:            self.hasHorzScroll = hasHorzScroll
      if hasVertScroll is not None:            self.hasVertScroll = hasVertScroll
      if dontHideScroll is not None:           self.dontHideScroll = dontHideScroll
      if dontScrollVert is not None:           self.dontScrollVert = dontScrollVert
      if dontScrollHorz is not None:           self.dontScrollHorz = dontScrollHorz
      if snapVertScroll is not None:           self.snapVertScroll = snapVertScroll
      if snapHorzScroll is not None:           self.snapHorzScroll = snapHorzScroll
      if scroll is not None:                   self.scroll = scroll
      if modifyVirtualArea is not None:        self.modifyVirtualArea = modifyVirtualArea
      if dontAutoScrollArea is not None:       self.dontAutoScrollArea = dontAutoScrollArea
      if fileName is not None:                 self.fileName = fileName
      if id is not None:                       self.id = id
      if modifiedDocument is not None:         self.modifiedDocument = modifiedDocument
      if showInTaskBar is not None:            self.showInTaskBar = showInTaskBar
      if saveDialog is not None:               self.saveDialog = saveDialog
      if isActiveClient is not None:           self.isActiveClient = isActiveClient
      if cursor is not None:                   self.cursor = cursor
      if name is not None:                     self.name = name
      if displayDriver is not None:            self.displayDriver = displayDriver
      if autoCreate is not None:               self.autoCreate = autoCreate
      if scrollArea is not None:               self.scrollArea = scrollArea
      if is3D is not None:                     self.is3D = is3D
      if closing is not None:                  self.closing = closing
      if fullRender is not None:               self.fullRender = fullRender
      if icon is not None:                     self.icon = icon
      if moveable is not None:                 self.moveable = moveable
      if alphaBlend is not None:               self.alphaBlend = alphaBlend
      if useSharedMemory is not None:          self.useSharedMemory = useSharedMemory
      if glCapabilities is not None:           self.glCapabilities = glCapabilities
      if creationActivation is not None:       self.creationActivation = creationActivation
      if nativeDecorations is not None:        self.nativeDecorations = nativeDecorations
      if manageDisplay is not None:            self.manageDisplay = manageDisplay
      if text is not None:                     self.text = text
      if controller is not None:               self.controller = controller
      if noConsequential is not None:          self.noConsequential = noConsequential
      if toolTip is not None:                  self.toolTip = toolTip
      if type is not None:                     self.type = type
      if data is not None:                     self.data = data
      if fieldData is not None:                self.fieldData = fieldData
      if editor is not None:                   self.editor = editor
      if readOnly is not None:                 self.readOnly = readOnly
      if keepEditor is not None:               self.keepEditor = keepEditor
      if autoSize is not None:                 self.autoSize = autoSize
      if needUpdate is not None:               self.needUpdate = needUpdate
      if stringValue is not None:              self.stringValue = stringValue
      if filter is not None:                   self.filter = filter
      if filtered is not None:                 self.filtered = filtered
      if exclusion is not None:                self.exclusion = exclusion
      if filterField is not None:              self.filterField = filterField
      if nameField is not None:                self.nameField = nameField
      if showNone is not None:                 self.showNone = showNone
      if getDecorationsSize is not None:       self.getDecorationsSize = getDecorationsSize
      if isInside is not None:                 self.isInside = isInside
      if isMouseMoving is not None:            self.isMouseMoving = isMouseMoving
      if isMouseResizing is not None:          self.isMouseResizing = isMouseResizing
      if isOpaque is not None:                 self.isOpaque = isOpaque
      if notifyActivate is not None:           self.notifyActivate = notifyActivate
      if notifyDestroyed is not None:          self.notifyDestroyed = notifyDestroyed
      if notifySaved is not None:              self.notifySaved = notifySaved
      if onActivate is not None:               self.onActivate = onActivate
      if onActivateClient is not None:         self.onActivateClient = onActivateClient
      if onApplyGraphics is not None:          self.onApplyGraphics = onApplyGraphics
      if onChildAddedOrRemoved is not None:    self.onChildAddedOrRemoved = onChildAddedOrRemoved
      if onChildResized is not None:           self.onChildResized = onChildResized
      if onChildVisibilityToggled is not None: self.onChildVisibilityToggled = onChildVisibilityToggled
      if onClose is not None:                  self.onClose = onClose
      if onCreate is not None:                 self.onCreate = onCreate
      if onDestroy is not None:                self.onDestroy = onDestroy
      if onDestroyed is not None:              self.onDestroyed = onDestroyed
      if onDrawOverChildren is not None:       self.onDrawOverChildren = onDrawOverChildren
      if onFileModified is not None:           self.onFileModified = onFileModified
      if onHScroll is not None:                self.onHScroll = onHScroll
      if onKeyDown is not None:                self.onKeyDown = onKeyDown
      if onKeyHit is not None:                 self.onKeyHit = onKeyHit
      if onKeyUp is not None:                  self.onKeyUp = onKeyUp
      if onLeftButtonDown is not None:         self.onLeftButtonDown = onLeftButtonDown
      if onLeftButtonUp is not None:           self.onLeftButtonUp = onLeftButtonUp
      if onLeftDoubleClick is not None:        self.onLeftDoubleClick = onLeftDoubleClick
      if onLoadGraphics is not None:           self.onLoadGraphics = onLoadGraphics
      if onMiddleButtonDown is not None:       self.onMiddleButtonDown = onMiddleButtonDown
      if onMiddleButtonUp is not None:         self.onMiddleButtonUp = onMiddleButtonUp
      if onMiddleDoubleClick is not None:      self.onMiddleDoubleClick = onMiddleDoubleClick
      if onMouseCaptureLost is not None:       self.onMouseCaptureLost = onMouseCaptureLost
      if onMouseLeave is not None:             self.onMouseLeave = onMouseLeave
      if onMouseMove is not None:              self.onMouseMove = onMouseMove
      if onMouseOver is not None:              self.onMouseOver = onMouseOver
      if onMoving is not None:                 self.onMoving = onMoving
      if onMultiTouch is not None:             self.onMultiTouch = onMultiTouch
      if onPosition is not None:               self.onPosition = onPosition
      if onPostCreate is not None:             self.onPostCreate = onPostCreate
      if onRedraw is not None:                 self.onRedraw = onRedraw
      if onResize is not None:                 self.onResize = onResize
      if onResizing is not None:               self.onResizing = onResizing
      if onRightButtonDown is not None:        self.onRightButtonDown = onRightButtonDown
      if onRightButtonUp is not None:          self.onRightButtonUp = onRightButtonUp
      if onRightDoubleClick is not None:       self.onRightDoubleClick = onRightDoubleClick
      if onSaveFile is not None:               self.onSaveFile = onSaveFile
      if onStateChange is not None:            self.onStateChange = onStateChange
      if onSysKeyDown is not None:             self.onSysKeyDown = onSysKeyDown
      if onSysKeyHit is not None:              self.onSysKeyHit = onSysKeyHit
      if onSysKeyUp is not None:               self.onSysKeyUp = onSysKeyUp
      if onUnloadGraphics is not None:         self.onUnloadGraphics = onUnloadGraphics
      if onVScroll is not None:                self.onVScroll = onVScroll
      if preShowDecorations is not None:       self.preShowDecorations = preShowDecorations
      if setBox is not None:                   self.setBox = setBox
      if setWindowArea is not None:            self.setWindowArea = setWindowArea
      if setWindowMinimum is not None:         self.setWindowMinimum = setWindowMinimum
      if showDecorations is not None:          self.showDecorations = showDecorations
      if updateNonClient is not None:          self.updateNonClient = updateNonClient
      if notifyChanged is not None:            self.notifyChanged = notifyChanged
      if notifyModified is not None:           self.notifyModified = notifyModified
      if onConfigure is not None:              self.onConfigure = onConfigure
      if setData is not None:                  self.setData = setData
      if refillFunction is not None:           self.refillFunction = refillFunction

   @property
   def type(self): return Class(impl = IPTR(lib, ffi, self, DropDataBox).type)
   @type.setter
   def type(self, value):
      if not isinstance(value, Class): value = Class(value)
      IPTR(lib, ffi, self, DropDataBox).type = value.impl

   @property
   def data(self): return IPTR(lib, ffi, self, DropDataBox).data
   @data.setter
   def data(self, value): IPTR(lib, ffi, self, DropDataBox).data = value

   @property
   def fieldData(self): return IPTR(lib, ffi, self, DropDataBox).fieldData
   @fieldData.setter
   def fieldData(self, value): IPTR(lib, ffi, self, DropDataBox).fieldData = value

   @property
   def editor(self): return Window(impl = IPTR(lib, ffi, self, DropDataBox).editor)
   @editor.setter
   def editor(self, value):
      if not isinstance(value, Window): value = Window(value)
      IPTR(lib, ffi, self, DropDataBox).editor = value.impl

   @property
   def readOnly(self): return IPTR(lib, ffi, self, DropDataBox).readOnly
   @readOnly.setter
   def readOnly(self, value): IPTR(lib, ffi, self, DropDataBox).readOnly = value

   @property
   def keepEditor(self): return IPTR(lib, ffi, self, DropDataBox).keepEditor
   @keepEditor.setter
   def keepEditor(self, value): IPTR(lib, ffi, self, DropDataBox).keepEditor = value

   @property
   def autoSize(self): return IPTR(lib, ffi, self, DropDataBox).autoSize
   @autoSize.setter
   def autoSize(self, value): IPTR(lib, ffi, self, DropDataBox).autoSize = value

   @property
   def needUpdate(self): return IPTR(lib, ffi, self, DropDataBox).needUpdate
   @needUpdate.setter
   def needUpdate(self, value): IPTR(lib, ffi, self, DropDataBox).needUpdate = value

   @property
   def stringValue(self): return String(impl = IPTR(lib, ffi, self, DropDataBox).stringValue)
   @stringValue.setter
   def stringValue(self, value):
      if not isinstance(value, String): value = String(value)
      IPTR(lib, ffi, self, DropDataBox).stringValue = value.impl

   @property
   def filter(self): return Id(lib.DropDataBox_get_filter(self.impl))
   @filter.setter
   def filter(self, value):
      if not isinstance(value, Id): value = Id(value)
      lib.DropDataBox_set_filter(self.impl, value.impl)

   @property
   def filtered(self): return None
   @filtered.setter
   def filtered(self, value):
      lib.DropDataBox_set_filtered(self.impl, value)

   @property
   def exclusion(self): return None
   @exclusion.setter
   def exclusion(self, value):
      if not isinstance(value, Id): value = Id(value)
      lib.DropDataBox_set_exclusion(self.impl, value.impl)

   @property
   def filterField(self): return None
   @filterField.setter
   def filterField(self, value):
      if not isinstance(value, Field): value = Field(value)
      lib.DropDataBox_set_filterField(self.impl, value.impl)

   @property
   def nameField(self): return None
   @nameField.setter
   def nameField(self, value):
      if not isinstance(value, Field): value = Field(value)
      lib.DropDataBox_set_nameField(self.impl, value.impl)

   @property
   def showNone(self): return None
   @showNone.setter
   def showNone(self, value):
      lib.DropDataBox_set_showNone(self.impl, value)

   def refill(self):
      lib.DropDataBox_refill(self.impl)

   def fn_unset_DropDataBox_refillFunction(self, _tabledropbox):
      return lib.DropDataBox_refillFunction(self.impl, _tabledropbox.impl)

   @property
   def refillFunction(self):
      if hasattr(self, 'fn_DropDataBox_refillFunction'): return self.fn_DropDataBox_refillFunction
      else: return self.fn_unset_DropDataBox_refillFunction
   @refillFunction.setter
   def refillFunction(self, value):
      self.fn_DropDataBox_refillFunction = value
      lib.Instance_setMethod(self.impl, "RefillFunction".encode('utf8'), cb_DropDataBox_refillFunction)

@ffi.callback("void(DataSourceDriver, DataSource)")
def cb_DataSourceDriver_buildLocator(__d, ds):
   datasourcedriver = pyOrNewObject(DataSourceDriver, __d)
   datasourcedriver.fn_DataSourceDriver_buildLocator(datasourcedriver, pyOrNewObject(DataSource, ds))

@ffi.callback("void(DataSourceDriver, constString)")
def cb_DataSourceDriver_connect(__d, locator):
   datasourcedriver = pyOrNewObject(DataSourceDriver, __d)
   datasourcedriver.fn_DataSourceDriver_connect(datasourcedriver, locator)

@ffi.callback("void(DataSourceDriver, constString)")
def cb_DataSourceDriver_deleteDatabase(__d, name):
   datasourcedriver = pyOrNewObject(DataSourceDriver, __d)
   datasourcedriver.fn_DataSourceDriver_deleteDatabase(datasourcedriver, name)

@ffi.callback("void(DataSourceDriver)")
def cb_DataSourceDriver_getDatabases(__d):
   datasourcedriver = pyOrNewObject(DataSourceDriver, __d)
   datasourcedriver.fn_DataSourceDriver_getDatabases(datasourcedriver)

@ffi.callback("void(DataSourceDriver)")
def cb_DataSourceDriver_getDatabasesCount(__d):
   datasourcedriver = pyOrNewObject(DataSourceDriver, __d)
   datasourcedriver.fn_DataSourceDriver_getDatabasesCount(datasourcedriver)

@ffi.callback("void(DataSourceDriver, constString, CreateOptions, DataSource)")
def cb_DataSourceDriver_openDatabase(__d, name, create, ds):
   datasourcedriver = pyOrNewObject(DataSourceDriver, __d)
   datasourcedriver.fn_DataSourceDriver_openDatabase(datasourcedriver, name, CreateOptions(impl = create), pyOrNewObject(DataSource, ds))

@ffi.callback("void(DataSourceDriver, constString, constString)")
def cb_DataSourceDriver_renameDatabase(__d, name, rename):
   datasourcedriver = pyOrNewObject(DataSourceDriver, __d)
   datasourcedriver.fn_DataSourceDriver_renameDatabase(datasourcedriver, name, rename)

@ffi.callback("void(DataSourceDriver)")
def cb_DataSourceDriver_status(__d):
   datasourcedriver = pyOrNewObject(DataSourceDriver, __d)
   datasourcedriver.fn_DataSourceDriver_status(datasourcedriver)

class DataSourceDriver(Instance):
   def __init__(self,
                buildLocator = None,
                connect = None,
                deleteDatabase = None,
                getDatabases = None,
                getDatabasesCount = None,
                openDatabase = None,
                renameDatabase = None,
                status = None,
                impl = None):
      Instance.__init__(self, impl = impl)
      if buildLocator is not None:      self.buildLocator = buildLocator
      if connect is not None:           self.connect = connect
      if deleteDatabase is not None:    self.deleteDatabase = deleteDatabase
      if getDatabases is not None:      self.getDatabases = getDatabases
      if getDatabasesCount is not None: self.getDatabasesCount = getDatabasesCount
      if openDatabase is not None:      self.openDatabase = openDatabase
      if renameDatabase is not None:    self.renameDatabase = renameDatabase
      if status is not None:            self.status = status

   def fn_unset_DataSourceDriver_buildLocator(self, ds):
      return lib.DataSourceDriver_buildLocator(self.impl, ffi.NULL if ds is None else ds.impl)

   @property
   def buildLocator(self):
      if hasattr(self, 'fn_DataSourceDriver_buildLocator'): return self.fn_DataSourceDriver_buildLocator
      else: return self.fn_unset_DataSourceDriver_buildLocator
   @buildLocator.setter
   def buildLocator(self, value):
      self.fn_DataSourceDriver_buildLocator = value
      lib.Instance_setMethod(self.impl, "BuildLocator".encode('utf8'), cb_DataSourceDriver_buildLocator)

   def fn_unset_DataSourceDriver_connect(self, locator):
      return lib.DataSourceDriver_connect(self.impl, ffi.NULL if locator is None else locator.impl)

   @property
   def connect(self):
      if hasattr(self, 'fn_DataSourceDriver_connect'): return self.fn_DataSourceDriver_connect
      else: return self.fn_unset_DataSourceDriver_connect
   @connect.setter
   def connect(self, value):
      self.fn_DataSourceDriver_connect = value
      lib.Instance_setMethod(self.impl, "Connect".encode('utf8'), cb_DataSourceDriver_connect)

   def fn_unset_DataSourceDriver_deleteDatabase(self, name):
      return lib.DataSourceDriver_deleteDatabase(self.impl, ffi.NULL if name is None else name.impl)

   @property
   def deleteDatabase(self):
      if hasattr(self, 'fn_DataSourceDriver_deleteDatabase'): return self.fn_DataSourceDriver_deleteDatabase
      else: return self.fn_unset_DataSourceDriver_deleteDatabase
   @deleteDatabase.setter
   def deleteDatabase(self, value):
      self.fn_DataSourceDriver_deleteDatabase = value
      lib.Instance_setMethod(self.impl, "DeleteDatabase".encode('utf8'), cb_DataSourceDriver_deleteDatabase)

   def fn_unset_DataSourceDriver_getDatabases(self):
      return lib.DataSourceDriver_getDatabases(self.impl)

   @property
   def getDatabases(self):
      if hasattr(self, 'fn_DataSourceDriver_getDatabases'): return self.fn_DataSourceDriver_getDatabases
      else: return self.fn_unset_DataSourceDriver_getDatabases
   @getDatabases.setter
   def getDatabases(self, value):
      self.fn_DataSourceDriver_getDatabases = value
      lib.Instance_setMethod(self.impl, "GetDatabases".encode('utf8'), cb_DataSourceDriver_getDatabases)

   def fn_unset_DataSourceDriver_getDatabasesCount(self):
      return lib.DataSourceDriver_getDatabasesCount(self.impl)

   @property
   def getDatabasesCount(self):
      if hasattr(self, 'fn_DataSourceDriver_getDatabasesCount'): return self.fn_DataSourceDriver_getDatabasesCount
      else: return self.fn_unset_DataSourceDriver_getDatabasesCount
   @getDatabasesCount.setter
   def getDatabasesCount(self, value):
      self.fn_DataSourceDriver_getDatabasesCount = value
      lib.Instance_setMethod(self.impl, "GetDatabasesCount".encode('utf8'), cb_DataSourceDriver_getDatabasesCount)

   def fn_unset_DataSourceDriver_openDatabase(self, name, create, ds):
      return lib.DataSourceDriver_openDatabase(self.impl, ffi.NULL if name is None else name.impl, create, ffi.NULL if ds is None else ds.impl)

   @property
   def openDatabase(self):
      if hasattr(self, 'fn_DataSourceDriver_openDatabase'): return self.fn_DataSourceDriver_openDatabase
      else: return self.fn_unset_DataSourceDriver_openDatabase
   @openDatabase.setter
   def openDatabase(self, value):
      self.fn_DataSourceDriver_openDatabase = value
      lib.Instance_setMethod(self.impl, "OpenDatabase".encode('utf8'), cb_DataSourceDriver_openDatabase)

   def fn_unset_DataSourceDriver_renameDatabase(self, name, rename):
      return lib.DataSourceDriver_renameDatabase(self.impl, ffi.NULL if name is None else name.impl, ffi.NULL if rename is None else rename.impl)

   @property
   def renameDatabase(self):
      if hasattr(self, 'fn_DataSourceDriver_renameDatabase'): return self.fn_DataSourceDriver_renameDatabase
      else: return self.fn_unset_DataSourceDriver_renameDatabase
   @renameDatabase.setter
   def renameDatabase(self, value):
      self.fn_DataSourceDriver_renameDatabase = value
      lib.Instance_setMethod(self.impl, "RenameDatabase".encode('utf8'), cb_DataSourceDriver_renameDatabase)

   def fn_unset_DataSourceDriver_status(self):
      return lib.DataSourceDriver_status(self.impl)

   @property
   def status(self):
      if hasattr(self, 'fn_DataSourceDriver_status'): return self.fn_DataSourceDriver_status
      else: return self.fn_unset_DataSourceDriver_status
   @status.setter
   def status(self, value):
      self.fn_DataSourceDriver_status = value
      lib.Instance_setMethod(self.impl, "Status".encode('utf8'), cb_DataSourceDriver_status)

class AccessOptions:
   integral = lib.AccessOptions_integral
   random   = lib.AccessOptions_random

class ButtonStyle(Button):
   def __init__(self,
                parent = None,
                master = None,
                caption = None,
                hotKey = None,
                background = None,
                opacity = None,
                foreground = None,
                borderStyle = None,
                minClientSize = None,
                maxClientSize = None,
                hasMaximize = None,
                hasMinimize = None,
                hasClose = None,
                nonClient = None,
                inactive = None,
                clickThrough = None,
                isRemote = None,
                noCycle = None,
                isModal = None,
                interim = None,
                tabCycle = None,
                isDefault = None,
                drawBehind = None,
                hasMenuBar = None,
                hasStatusBar = None,
                stayOnTop = None,
                menu = None,
                font = None,
                sizeAnchor = None,
                size = None,
                clientSize = None,
                anchor = None,
                position = None,
                disabled = None,
                state = None,
                visible = None,
                isDocument = None,
                mergeMenus = None,
                hasHorzScroll = None,
                hasVertScroll = None,
                dontHideScroll = None,
                dontScrollVert = None,
                dontScrollHorz = None,
                snapVertScroll = None,
                snapHorzScroll = None,
                scroll = None,
                modifyVirtualArea = None,
                dontAutoScrollArea = None,
                fileName = None,
                id = None,
                modifiedDocument = None,
                showInTaskBar = None,
                saveDialog = None,
                isActiveClient = None,
                cursor = None,
                name = None,
                displayDriver = None,
                autoCreate = None,
                scrollArea = None,
                is3D = None,
                closing = None,
                fullRender = None,
                icon = None,
                moveable = None,
                alphaBlend = None,
                useSharedMemory = None,
                glCapabilities = None,
                creationActivation = None,
                nativeDecorations = None,
                manageDisplay = None,
                text = None,
                controller = None,
                noConsequential = None,
                toolTip = None,
                isRadio = None,
                isCheckbox = None,
                bevel = None,
                bevelOver = None,
                toggle = None,
                checked = None,
                alignment = None,
                bitmap = None,
                stayUp = None,
                scaleBitmap = None,
                keyRepeat = None,
                symbol = None,
                ellipsis = None,
                stayDown = None,
                offset = None,
                buttonState = None,
                bitmapAlignment = None,
                getDecorationsSize = None,
                isInside = None,
                isMouseMoving = None,
                isMouseResizing = None,
                isOpaque = None,
                notifyActivate = None,
                notifyDestroyed = None,
                notifySaved = None,
                onActivate = None,
                onActivateClient = None,
                onApplyGraphics = None,
                onChildAddedOrRemoved = None,
                onChildResized = None,
                onChildVisibilityToggled = None,
                onClose = None,
                onCreate = None,
                onDestroy = None,
                onDestroyed = None,
                onDrawOverChildren = None,
                onFileModified = None,
                onHScroll = None,
                onKeyDown = None,
                onKeyHit = None,
                onKeyUp = None,
                onLeftButtonDown = None,
                onLeftButtonUp = None,
                onLeftDoubleClick = None,
                onLoadGraphics = None,
                onMiddleButtonDown = None,
                onMiddleButtonUp = None,
                onMiddleDoubleClick = None,
                onMouseCaptureLost = None,
                onMouseLeave = None,
                onMouseMove = None,
                onMouseOver = None,
                onMoving = None,
                onMultiTouch = None,
                onPosition = None,
                onPostCreate = None,
                onRedraw = None,
                onResize = None,
                onResizing = None,
                onRightButtonDown = None,
                onRightButtonUp = None,
                onRightDoubleClick = None,
                onSaveFile = None,
                onStateChange = None,
                onSysKeyDown = None,
                onSysKeyHit = None,
                onSysKeyUp = None,
                onUnloadGraphics = None,
                onVScroll = None,
                preShowDecorations = None,
                setBox = None,
                setWindowArea = None,
                setWindowMinimum = None,
                showDecorations = None,
                updateNonClient = None,
                notifyClicked = None,
                notifyDoubleClick = None,
                notifyMouseLeave = None,
                notifyMouseMove = None,
                notifyMouseOver = None,
                notifyPushed = None,
                notifyReleased = None,
                impl = None):
      Button.__init__(self, impl = impl)
      if parent is not None:                   self.parent = parent
      if master is not None:                   self.master = master
      if caption is not None:                  self.caption = caption
      if hotKey is not None:                   self.hotKey = hotKey
      if background is not None:               self.background = background
      if opacity is not None:                  self.opacity = opacity
      if foreground is not None:               self.foreground = foreground
      if borderStyle is not None:              self.borderStyle = borderStyle
      if minClientSize is not None:            self.minClientSize = minClientSize
      if maxClientSize is not None:            self.maxClientSize = maxClientSize
      if hasMaximize is not None:              self.hasMaximize = hasMaximize
      if hasMinimize is not None:              self.hasMinimize = hasMinimize
      if hasClose is not None:                 self.hasClose = hasClose
      if nonClient is not None:                self.nonClient = nonClient
      if inactive is not None:                 self.inactive = inactive
      if clickThrough is not None:             self.clickThrough = clickThrough
      if isRemote is not None:                 self.isRemote = isRemote
      if noCycle is not None:                  self.noCycle = noCycle
      if isModal is not None:                  self.isModal = isModal
      if interim is not None:                  self.interim = interim
      if tabCycle is not None:                 self.tabCycle = tabCycle
      if isDefault is not None:                self.isDefault = isDefault
      if drawBehind is not None:               self.drawBehind = drawBehind
      if hasMenuBar is not None:               self.hasMenuBar = hasMenuBar
      if hasStatusBar is not None:             self.hasStatusBar = hasStatusBar
      if stayOnTop is not None:                self.stayOnTop = stayOnTop
      if menu is not None:                     self.menu = menu
      if font is not None:                     self.font = font
      if sizeAnchor is not None:               self.sizeAnchor = sizeAnchor
      if size is not None:                     self.size = size
      if clientSize is not None:               self.clientSize = clientSize
      if anchor is not None:                   self.anchor = anchor
      if position is not None:                 self.position = position
      if disabled is not None:                 self.disabled = disabled
      if state is not None:                    self.state = state
      if visible is not None:                  self.visible = visible
      if isDocument is not None:               self.isDocument = isDocument
      if mergeMenus is not None:               self.mergeMenus = mergeMenus
      if hasHorzScroll is not None:            self.hasHorzScroll = hasHorzScroll
      if hasVertScroll is not None:            self.hasVertScroll = hasVertScroll
      if dontHideScroll is not None:           self.dontHideScroll = dontHideScroll
      if dontScrollVert is not None:           self.dontScrollVert = dontScrollVert
      if dontScrollHorz is not None:           self.dontScrollHorz = dontScrollHorz
      if snapVertScroll is not None:           self.snapVertScroll = snapVertScroll
      if snapHorzScroll is not None:           self.snapHorzScroll = snapHorzScroll
      if scroll is not None:                   self.scroll = scroll
      if modifyVirtualArea is not None:        self.modifyVirtualArea = modifyVirtualArea
      if dontAutoScrollArea is not None:       self.dontAutoScrollArea = dontAutoScrollArea
      if fileName is not None:                 self.fileName = fileName
      if id is not None:                       self.id = id
      if modifiedDocument is not None:         self.modifiedDocument = modifiedDocument
      if showInTaskBar is not None:            self.showInTaskBar = showInTaskBar
      if saveDialog is not None:               self.saveDialog = saveDialog
      if isActiveClient is not None:           self.isActiveClient = isActiveClient
      if cursor is not None:                   self.cursor = cursor
      if name is not None:                     self.name = name
      if displayDriver is not None:            self.displayDriver = displayDriver
      if autoCreate is not None:               self.autoCreate = autoCreate
      if scrollArea is not None:               self.scrollArea = scrollArea
      if is3D is not None:                     self.is3D = is3D
      if closing is not None:                  self.closing = closing
      if fullRender is not None:               self.fullRender = fullRender
      if icon is not None:                     self.icon = icon
      if moveable is not None:                 self.moveable = moveable
      if alphaBlend is not None:               self.alphaBlend = alphaBlend
      if useSharedMemory is not None:          self.useSharedMemory = useSharedMemory
      if glCapabilities is not None:           self.glCapabilities = glCapabilities
      if creationActivation is not None:       self.creationActivation = creationActivation
      if nativeDecorations is not None:        self.nativeDecorations = nativeDecorations
      if manageDisplay is not None:            self.manageDisplay = manageDisplay
      if text is not None:                     self.text = text
      if controller is not None:               self.controller = controller
      if noConsequential is not None:          self.noConsequential = noConsequential
      if toolTip is not None:                  self.toolTip = toolTip
      if isRadio is not None:                  self.isRadio = isRadio
      if isCheckbox is not None:               self.isCheckbox = isCheckbox
      if bevel is not None:                    self.bevel = bevel
      if bevelOver is not None:                self.bevelOver = bevelOver
      if toggle is not None:                   self.toggle = toggle
      if checked is not None:                  self.checked = checked
      if alignment is not None:                self.alignment = alignment
      if bitmap is not None:                   self.bitmap = bitmap
      if stayUp is not None:                   self.stayUp = stayUp
      if scaleBitmap is not None:              self.scaleBitmap = scaleBitmap
      if keyRepeat is not None:                self.keyRepeat = keyRepeat
      if symbol is not None:                   self.symbol = symbol
      if ellipsis is not None:                 self.ellipsis = ellipsis
      if stayDown is not None:                 self.stayDown = stayDown
      if offset is not None:                   self.offset = offset
      if buttonState is not None:              self.buttonState = buttonState
      if bitmapAlignment is not None:          self.bitmapAlignment = bitmapAlignment
      if getDecorationsSize is not None:       self.getDecorationsSize = getDecorationsSize
      if isInside is not None:                 self.isInside = isInside
      if isMouseMoving is not None:            self.isMouseMoving = isMouseMoving
      if isMouseResizing is not None:          self.isMouseResizing = isMouseResizing
      if isOpaque is not None:                 self.isOpaque = isOpaque
      if notifyActivate is not None:           self.notifyActivate = notifyActivate
      if notifyDestroyed is not None:          self.notifyDestroyed = notifyDestroyed
      if notifySaved is not None:              self.notifySaved = notifySaved
      if onActivate is not None:               self.onActivate = onActivate
      if onActivateClient is not None:         self.onActivateClient = onActivateClient
      if onApplyGraphics is not None:          self.onApplyGraphics = onApplyGraphics
      if onChildAddedOrRemoved is not None:    self.onChildAddedOrRemoved = onChildAddedOrRemoved
      if onChildResized is not None:           self.onChildResized = onChildResized
      if onChildVisibilityToggled is not None: self.onChildVisibilityToggled = onChildVisibilityToggled
      if onClose is not None:                  self.onClose = onClose
      if onCreate is not None:                 self.onCreate = onCreate
      if onDestroy is not None:                self.onDestroy = onDestroy
      if onDestroyed is not None:              self.onDestroyed = onDestroyed
      if onDrawOverChildren is not None:       self.onDrawOverChildren = onDrawOverChildren
      if onFileModified is not None:           self.onFileModified = onFileModified
      if onHScroll is not None:                self.onHScroll = onHScroll
      if onKeyDown is not None:                self.onKeyDown = onKeyDown
      if onKeyHit is not None:                 self.onKeyHit = onKeyHit
      if onKeyUp is not None:                  self.onKeyUp = onKeyUp
      if onLeftButtonDown is not None:         self.onLeftButtonDown = onLeftButtonDown
      if onLeftButtonUp is not None:           self.onLeftButtonUp = onLeftButtonUp
      if onLeftDoubleClick is not None:        self.onLeftDoubleClick = onLeftDoubleClick
      if onLoadGraphics is not None:           self.onLoadGraphics = onLoadGraphics
      if onMiddleButtonDown is not None:       self.onMiddleButtonDown = onMiddleButtonDown
      if onMiddleButtonUp is not None:         self.onMiddleButtonUp = onMiddleButtonUp
      if onMiddleDoubleClick is not None:      self.onMiddleDoubleClick = onMiddleDoubleClick
      if onMouseCaptureLost is not None:       self.onMouseCaptureLost = onMouseCaptureLost
      if onMouseLeave is not None:             self.onMouseLeave = onMouseLeave
      if onMouseMove is not None:              self.onMouseMove = onMouseMove
      if onMouseOver is not None:              self.onMouseOver = onMouseOver
      if onMoving is not None:                 self.onMoving = onMoving
      if onMultiTouch is not None:             self.onMultiTouch = onMultiTouch
      if onPosition is not None:               self.onPosition = onPosition
      if onPostCreate is not None:             self.onPostCreate = onPostCreate
      if onRedraw is not None:                 self.onRedraw = onRedraw
      if onResize is not None:                 self.onResize = onResize
      if onResizing is not None:               self.onResizing = onResizing
      if onRightButtonDown is not None:        self.onRightButtonDown = onRightButtonDown
      if onRightButtonUp is not None:          self.onRightButtonUp = onRightButtonUp
      if onRightDoubleClick is not None:       self.onRightDoubleClick = onRightDoubleClick
      if onSaveFile is not None:               self.onSaveFile = onSaveFile
      if onStateChange is not None:            self.onStateChange = onStateChange
      if onSysKeyDown is not None:             self.onSysKeyDown = onSysKeyDown
      if onSysKeyHit is not None:              self.onSysKeyHit = onSysKeyHit
      if onSysKeyUp is not None:               self.onSysKeyUp = onSysKeyUp
      if onUnloadGraphics is not None:         self.onUnloadGraphics = onUnloadGraphics
      if onVScroll is not None:                self.onVScroll = onVScroll
      if preShowDecorations is not None:       self.preShowDecorations = preShowDecorations
      if setBox is not None:                   self.setBox = setBox
      if setWindowArea is not None:            self.setWindowArea = setWindowArea
      if setWindowMinimum is not None:         self.setWindowMinimum = setWindowMinimum
      if showDecorations is not None:          self.showDecorations = showDecorations
      if updateNonClient is not None:          self.updateNonClient = updateNonClient
      if notifyClicked is not None:            self.notifyClicked = notifyClicked
      if notifyDoubleClick is not None:        self.notifyDoubleClick = notifyDoubleClick
      if notifyMouseLeave is not None:         self.notifyMouseLeave = notifyMouseLeave
      if notifyMouseMove is not None:          self.notifyMouseMove = notifyMouseMove
      if notifyMouseOver is not None:          self.notifyMouseOver = notifyMouseOver
      if notifyPushed is not None:             self.notifyPushed = notifyPushed
      if notifyReleased is not None:           self.notifyReleased = notifyReleased

class CSVReport(ReportDestination):
   def __init__(self,
                parent = None,
                master = None,
                caption = None,
                hotKey = None,
                background = None,
                opacity = None,
                foreground = None,
                borderStyle = None,
                minClientSize = None,
                maxClientSize = None,
                hasMaximize = None,
                hasMinimize = None,
                hasClose = None,
                nonClient = None,
                inactive = None,
                clickThrough = None,
                isRemote = None,
                noCycle = None,
                isModal = None,
                interim = None,
                tabCycle = None,
                isDefault = None,
                drawBehind = None,
                hasMenuBar = None,
                hasStatusBar = None,
                stayOnTop = None,
                menu = None,
                font = None,
                sizeAnchor = None,
                size = None,
                clientSize = None,
                anchor = None,
                position = None,
                disabled = None,
                state = None,
                visible = None,
                isDocument = None,
                mergeMenus = None,
                hasHorzScroll = None,
                hasVertScroll = None,
                dontHideScroll = None,
                dontScrollVert = None,
                dontScrollHorz = None,
                snapVertScroll = None,
                snapHorzScroll = None,
                scroll = None,
                modifyVirtualArea = None,
                dontAutoScrollArea = None,
                fileName = None,
                id = None,
                modifiedDocument = None,
                showInTaskBar = None,
                saveDialog = None,
                isActiveClient = None,
                cursor = None,
                name = None,
                displayDriver = None,
                autoCreate = None,
                scrollArea = None,
                is3D = None,
                closing = None,
                fullRender = None,
                icon = None,
                moveable = None,
                alphaBlend = None,
                useSharedMemory = None,
                glCapabilities = None,
                creationActivation = None,
                nativeDecorations = None,
                manageDisplay = None,
                text = None,
                controller = None,
                noConsequential = None,
                report = None,
                getDecorationsSize = None,
                isInside = None,
                isMouseMoving = None,
                isMouseResizing = None,
                isOpaque = None,
                notifyActivate = None,
                notifyDestroyed = None,
                notifySaved = None,
                onActivate = None,
                onActivateClient = None,
                onApplyGraphics = None,
                onChildAddedOrRemoved = None,
                onChildResized = None,
                onChildVisibilityToggled = None,
                onClose = None,
                onCreate = None,
                onDestroy = None,
                onDestroyed = None,
                onDrawOverChildren = None,
                onFileModified = None,
                onHScroll = None,
                onKeyDown = None,
                onKeyHit = None,
                onKeyUp = None,
                onLeftButtonDown = None,
                onLeftButtonUp = None,
                onLeftDoubleClick = None,
                onLoadGraphics = None,
                onMiddleButtonDown = None,
                onMiddleButtonUp = None,
                onMiddleDoubleClick = None,
                onMouseCaptureLost = None,
                onMouseLeave = None,
                onMouseMove = None,
                onMouseOver = None,
                onMoving = None,
                onMultiTouch = None,
                onPosition = None,
                onPostCreate = None,
                onRedraw = None,
                onResize = None,
                onResizing = None,
                onRightButtonDown = None,
                onRightButtonUp = None,
                onRightDoubleClick = None,
                onSaveFile = None,
                onStateChange = None,
                onSysKeyDown = None,
                onSysKeyHit = None,
                onSysKeyUp = None,
                onUnloadGraphics = None,
                onVScroll = None,
                preShowDecorations = None,
                setBox = None,
                setWindowArea = None,
                setWindowMinimum = None,
                showDecorations = None,
                updateNonClient = None,
                addPage = None,
                endPage = None,
                getReport = None,
                impl = None):
      ReportDestination.__init__(self, impl = impl)
      if parent is not None:                   self.parent = parent
      if master is not None:                   self.master = master
      if caption is not None:                  self.caption = caption
      if hotKey is not None:                   self.hotKey = hotKey
      if background is not None:               self.background = background
      if opacity is not None:                  self.opacity = opacity
      if foreground is not None:               self.foreground = foreground
      if borderStyle is not None:              self.borderStyle = borderStyle
      if minClientSize is not None:            self.minClientSize = minClientSize
      if maxClientSize is not None:            self.maxClientSize = maxClientSize
      if hasMaximize is not None:              self.hasMaximize = hasMaximize
      if hasMinimize is not None:              self.hasMinimize = hasMinimize
      if hasClose is not None:                 self.hasClose = hasClose
      if nonClient is not None:                self.nonClient = nonClient
      if inactive is not None:                 self.inactive = inactive
      if clickThrough is not None:             self.clickThrough = clickThrough
      if isRemote is not None:                 self.isRemote = isRemote
      if noCycle is not None:                  self.noCycle = noCycle
      if isModal is not None:                  self.isModal = isModal
      if interim is not None:                  self.interim = interim
      if tabCycle is not None:                 self.tabCycle = tabCycle
      if isDefault is not None:                self.isDefault = isDefault
      if drawBehind is not None:               self.drawBehind = drawBehind
      if hasMenuBar is not None:               self.hasMenuBar = hasMenuBar
      if hasStatusBar is not None:             self.hasStatusBar = hasStatusBar
      if stayOnTop is not None:                self.stayOnTop = stayOnTop
      if menu is not None:                     self.menu = menu
      if font is not None:                     self.font = font
      if sizeAnchor is not None:               self.sizeAnchor = sizeAnchor
      if size is not None:                     self.size = size
      if clientSize is not None:               self.clientSize = clientSize
      if anchor is not None:                   self.anchor = anchor
      if position is not None:                 self.position = position
      if disabled is not None:                 self.disabled = disabled
      if state is not None:                    self.state = state
      if visible is not None:                  self.visible = visible
      if isDocument is not None:               self.isDocument = isDocument
      if mergeMenus is not None:               self.mergeMenus = mergeMenus
      if hasHorzScroll is not None:            self.hasHorzScroll = hasHorzScroll
      if hasVertScroll is not None:            self.hasVertScroll = hasVertScroll
      if dontHideScroll is not None:           self.dontHideScroll = dontHideScroll
      if dontScrollVert is not None:           self.dontScrollVert = dontScrollVert
      if dontScrollHorz is not None:           self.dontScrollHorz = dontScrollHorz
      if snapVertScroll is not None:           self.snapVertScroll = snapVertScroll
      if snapHorzScroll is not None:           self.snapHorzScroll = snapHorzScroll
      if scroll is not None:                   self.scroll = scroll
      if modifyVirtualArea is not None:        self.modifyVirtualArea = modifyVirtualArea
      if dontAutoScrollArea is not None:       self.dontAutoScrollArea = dontAutoScrollArea
      if fileName is not None:                 self.fileName = fileName
      if id is not None:                       self.id = id
      if modifiedDocument is not None:         self.modifiedDocument = modifiedDocument
      if showInTaskBar is not None:            self.showInTaskBar = showInTaskBar
      if saveDialog is not None:               self.saveDialog = saveDialog
      if isActiveClient is not None:           self.isActiveClient = isActiveClient
      if cursor is not None:                   self.cursor = cursor
      if name is not None:                     self.name = name
      if displayDriver is not None:            self.displayDriver = displayDriver
      if autoCreate is not None:               self.autoCreate = autoCreate
      if scrollArea is not None:               self.scrollArea = scrollArea
      if is3D is not None:                     self.is3D = is3D
      if closing is not None:                  self.closing = closing
      if fullRender is not None:               self.fullRender = fullRender
      if icon is not None:                     self.icon = icon
      if moveable is not None:                 self.moveable = moveable
      if alphaBlend is not None:               self.alphaBlend = alphaBlend
      if useSharedMemory is not None:          self.useSharedMemory = useSharedMemory
      if glCapabilities is not None:           self.glCapabilities = glCapabilities
      if creationActivation is not None:       self.creationActivation = creationActivation
      if nativeDecorations is not None:        self.nativeDecorations = nativeDecorations
      if manageDisplay is not None:            self.manageDisplay = manageDisplay
      if text is not None:                     self.text = text
      if controller is not None:               self.controller = controller
      if noConsequential is not None:          self.noConsequential = noConsequential
      if report is not None:                   self.report = report
      if getDecorationsSize is not None:       self.getDecorationsSize = getDecorationsSize
      if isInside is not None:                 self.isInside = isInside
      if isMouseMoving is not None:            self.isMouseMoving = isMouseMoving
      if isMouseResizing is not None:          self.isMouseResizing = isMouseResizing
      if isOpaque is not None:                 self.isOpaque = isOpaque
      if notifyActivate is not None:           self.notifyActivate = notifyActivate
      if notifyDestroyed is not None:          self.notifyDestroyed = notifyDestroyed
      if notifySaved is not None:              self.notifySaved = notifySaved
      if onActivate is not None:               self.onActivate = onActivate
      if onActivateClient is not None:         self.onActivateClient = onActivateClient
      if onApplyGraphics is not None:          self.onApplyGraphics = onApplyGraphics
      if onChildAddedOrRemoved is not None:    self.onChildAddedOrRemoved = onChildAddedOrRemoved
      if onChildResized is not None:           self.onChildResized = onChildResized
      if onChildVisibilityToggled is not None: self.onChildVisibilityToggled = onChildVisibilityToggled
      if onClose is not None:                  self.onClose = onClose
      if onCreate is not None:                 self.onCreate = onCreate
      if onDestroy is not None:                self.onDestroy = onDestroy
      if onDestroyed is not None:              self.onDestroyed = onDestroyed
      if onDrawOverChildren is not None:       self.onDrawOverChildren = onDrawOverChildren
      if onFileModified is not None:           self.onFileModified = onFileModified
      if onHScroll is not None:                self.onHScroll = onHScroll
      if onKeyDown is not None:                self.onKeyDown = onKeyDown
      if onKeyHit is not None:                 self.onKeyHit = onKeyHit
      if onKeyUp is not None:                  self.onKeyUp = onKeyUp
      if onLeftButtonDown is not None:         self.onLeftButtonDown = onLeftButtonDown
      if onLeftButtonUp is not None:           self.onLeftButtonUp = onLeftButtonUp
      if onLeftDoubleClick is not None:        self.onLeftDoubleClick = onLeftDoubleClick
      if onLoadGraphics is not None:           self.onLoadGraphics = onLoadGraphics
      if onMiddleButtonDown is not None:       self.onMiddleButtonDown = onMiddleButtonDown
      if onMiddleButtonUp is not None:         self.onMiddleButtonUp = onMiddleButtonUp
      if onMiddleDoubleClick is not None:      self.onMiddleDoubleClick = onMiddleDoubleClick
      if onMouseCaptureLost is not None:       self.onMouseCaptureLost = onMouseCaptureLost
      if onMouseLeave is not None:             self.onMouseLeave = onMouseLeave
      if onMouseMove is not None:              self.onMouseMove = onMouseMove
      if onMouseOver is not None:              self.onMouseOver = onMouseOver
      if onMoving is not None:                 self.onMoving = onMoving
      if onMultiTouch is not None:             self.onMultiTouch = onMultiTouch
      if onPosition is not None:               self.onPosition = onPosition
      if onPostCreate is not None:             self.onPostCreate = onPostCreate
      if onRedraw is not None:                 self.onRedraw = onRedraw
      if onResize is not None:                 self.onResize = onResize
      if onResizing is not None:               self.onResizing = onResizing
      if onRightButtonDown is not None:        self.onRightButtonDown = onRightButtonDown
      if onRightButtonUp is not None:          self.onRightButtonUp = onRightButtonUp
      if onRightDoubleClick is not None:       self.onRightDoubleClick = onRightDoubleClick
      if onSaveFile is not None:               self.onSaveFile = onSaveFile
      if onStateChange is not None:            self.onStateChange = onStateChange
      if onSysKeyDown is not None:             self.onSysKeyDown = onSysKeyDown
      if onSysKeyHit is not None:              self.onSysKeyHit = onSysKeyHit
      if onSysKeyUp is not None:               self.onSysKeyUp = onSysKeyUp
      if onUnloadGraphics is not None:         self.onUnloadGraphics = onUnloadGraphics
      if onVScroll is not None:                self.onVScroll = onVScroll
      if preShowDecorations is not None:       self.preShowDecorations = preShowDecorations
      if setBox is not None:                   self.setBox = setBox
      if setWindowArea is not None:            self.setWindowArea = setWindowArea
      if setWindowMinimum is not None:         self.setWindowMinimum = setWindowMinimum
      if showDecorations is not None:          self.showDecorations = showDecorations
      if updateNonClient is not None:          self.updateNonClient = updateNonClient
      if addPage is not None:                  self.addPage = addPage
      if endPage is not None:                  self.endPage = endPage
      if getReport is not None:                self.getReport = getReport

class CheckBool(Bool):pass

class CreateOptions:
   no       = lib.CreateOptions_no
   create   = lib.CreateOptions_create
   readOnly = lib.CreateOptions_readOnly

class DataList(OldList):
   def __init__(self, first = None, last = None, count = 0, offset = 0, circ = None, impl = None):
      if impl is not None:
         self.impl = ffi.new("DataList *", impl)
      else:
         if isinstance(first, tuple):
            __tuple = first
            first = None
            if len(__tuple) > 0: first  = __tuple[0]
            if len(__tuple) > 1: last   = __tuple[1]
            if len(__tuple) > 2: count  = __tuple[2]
            if len(__tuple) > 3: offset = __tuple[3]
         self.impl = ffi.new("DataList *", { 'first' : first, 'last' : last, 'count' : count, 'offset' : offset, 'circ' : circ })

   @property
   def first(self): return self.impl.first
   @first.setter
   def first(self, value): self.impl.first = value

   @property
   def last(self): return self.impl.last
   @last.setter
   def last(self, value): self.impl.last = value

   @property
   def count(self): return self.impl.count
   @count.setter
   def count(self, value): self.impl.count = value

   @property
   def offset(self): return self.impl.offset
   @offset.setter
   def offset(self, value): self.impl.offset = value

   @property
   def circ(self): return self.impl.circ
   @circ.setter
   def circ(self, value): self.impl.circ = value

class DataSource(Instance):
   def __init__(self,
                driver = None,
                host = None,
                port = None,
                user = None,
                _pass = None,
                locator = None,
                impl = None):
      Instance.__init__(self, impl = impl)
      if driver is not None:  self.driver = driver
      if host is not None:    self.host = host
      if port is not None:    self.port = port
      if user is not None:    self.user = user
      if _pass is not None:   self._pass = _pass
      if locator is not None: self.locator = locator

   @property
   def driver(self): value = lib.DataSource_get_driver(self.impl) if self is not None and self.impl != ffi.NULL else ffi.NULL; return None if value == ffi.NULL else ffi.string(value).decode('utf8')
   @driver.setter
   def driver(self, value):
      if not isinstance(value, String): value = String(value)
      lib.DataSource_set_driver(self.impl, value.impl.encode('utf8'))

   @property
   def host(self): value = lib.DataSource_get_host(self.impl) if self is not None and self.impl != ffi.NULL else ffi.NULL; return None if value == ffi.NULL else ffi.string(value).decode('utf8')
   @host.setter
   def host(self, value):
      if not isinstance(value, String): value = String(value)
      lib.DataSource_set_host(self.impl, value.impl.encode('utf8'))

   @property
   def port(self): value = lib.DataSource_get_port(self.impl) if self is not None and self.impl != ffi.NULL else ffi.NULL; return None if value == ffi.NULL else ffi.string(value).decode('utf8')
   @port.setter
   def port(self, value):
      if not isinstance(value, String): value = String(value)
      lib.DataSource_set_port(self.impl, value.impl.encode('utf8'))

   @property
   def user(self): value = lib.DataSource_get_user(self.impl) if self is not None and self.impl != ffi.NULL else ffi.NULL; return None if value == ffi.NULL else ffi.string(value).decode('utf8')
   @user.setter
   def user(self, value):
      if not isinstance(value, String): value = String(value)
      lib.DataSource_set_user(self.impl, value.impl.encode('utf8'))

   @property
   def _pass(self): value = lib.DataSource_get_pass(self.impl) if self is not None and self.impl != ffi.NULL else ffi.NULL; return None if value == ffi.NULL else ffi.string(value).decode('utf8')
   @_pass.setter
   def _pass(self, value):
      if not isinstance(value, String): value = String(value)
      lib.DataSource_set_pass(self.impl, value.impl.encode('utf8'))

   @property
   def locator(self): value = lib.DataSource_get_locator(self.impl) if self is not None and self.impl != ffi.NULL else ffi.NULL; return None if value == ffi.NULL else ffi.string(value).decode('utf8')
   @locator.setter
   def locator(self, value):
      if not isinstance(value, String): value = String(value)
      lib.DataSource_set_locator(self.impl, value.impl.encode('utf8'))

   @property
   def databasesCount(self): return lib.DataSource_get_databasesCount(self.impl)

   @property
   def databases(self): return pyOrNewObject(Array, lib.DataSource_get_databases(self.impl))

   def connect(self):
      return lib.DataSource_connect(self.impl)

   def deleteDatabase(self, name = None):
      if name is not None and not isinstance(name, String): name = String(name)
      if name is None: name = ffi.NULL
      return lib.DataSource_deleteDatabase(self.impl, name)

   def openDatabase(self, name, create):
      if name is not None and not isinstance(name, String): name = String(name)
      if name is None: name = ffi.NULL
      return pyOrNewObject(Database, lib.DataSource_openDatabase(self.impl, name, create))

   def renameDatabase(self, name, rename = None):
      if name is not None and not isinstance(name, String): name = String(name)
      if name is None: name = ffi.NULL
      if rename is not None and not isinstance(rename, String): rename = String(rename)
      if rename is None: rename = ffi.NULL
      return lib.DataSource_renameDatabase(self.impl, name, rename)

   def status(self):
      lib.DataSource_status(self.impl)

@ffi.callback("void(Database)")
def cb_Database_begin(__d):
   database = pyOrNewObject(Database, __d)
   database.fn_Database_begin(database)

@ffi.callback("void(Database)")
def cb_Database_commit(__d):
   database = pyOrNewObject(Database, __d)
   database.fn_Database_commit(database)

@ffi.callback("void(Database, const char *, SQLCustomFunction)")
def cb_Database_createCustomFunction(__d, name, customFunction):
   database = pyOrNewObject(Database, __d)
   database.fn_Database_createCustomFunction(database, name.encode('utf8'), pyOrNewObject(SQLCustomFunction, customFunction))

@ffi.callback("void(Database, ObjectType, constString)")
def cb_Database_deleteObject(__d, type, name):
   database = pyOrNewObject(Database, __d)
   database.fn_Database_deleteObject(database, ObjectType(impl = type), name)

@ffi.callback("void(Database)")
def cb_Database_getName(__d):
   database = pyOrNewObject(Database, __d)
   database.fn_Database_getName(database)

@ffi.callback("void(Database)")
def cb_Database_getTables(__d):
   database = pyOrNewObject(Database, __d)
   database.fn_Database_getTables(database)

@ffi.callback("void(Database, ObjectType)")
def cb_Database_objectsCount(__d, type):
   database = pyOrNewObject(Database, __d)
   database.fn_Database_objectsCount(database, ObjectType(impl = type))

@ffi.callback("void(Database, constString, OpenOptions)")
def cb_Database_openTable(__d, name, open):
   database = pyOrNewObject(Database, __d)
   database.fn_Database_openTable(database, name, OpenOptions(impl = open))

@ffi.callback("void(Database, ObjectType, constString, constString)")
def cb_Database_renameObject(__d, type, name, rename):
   database = pyOrNewObject(Database, __d)
   database.fn_Database_renameObject(database, ObjectType(impl = type), name, rename)

class Database(Instance):
   def __init__(self,
                begin = None,
                commit = None,
                createCustomFunction = None,
                deleteObject = None,
                getName = None,
                getTables = None,
                objectsCount = None,
                openTable = None,
                renameObject = None,
                impl = None):
      Instance.__init__(self, impl = impl)
      if begin is not None:                self.begin = begin
      if commit is not None:               self.commit = commit
      if createCustomFunction is not None: self.createCustomFunction = createCustomFunction
      if deleteObject is not None:         self.deleteObject = deleteObject
      if getName is not None:              self.getName = getName
      if getTables is not None:            self.getTables = getTables
      if objectsCount is not None:         self.objectsCount = objectsCount
      if openTable is not None:            self.openTable = openTable
      if renameObject is not None:         self.renameObject = renameObject

   @property
   def name(self): value = lib.Database_get_name(self.impl) if self is not None and self.impl != ffi.NULL else ffi.NULL; return None if value == ffi.NULL else ffi.string(value).decode('utf8')

   @property
   def tablesCount(self): return lib.Database_get_tablesCount(self.impl)

   @property
   def viewsCount(self): return lib.Database_get_viewsCount(self.impl)

   @property
   def tables(self): return pyOrNewObject(Array, lib.Database_get_tables(self.impl))

   def fn_unset_Database_begin(self):
      return lib.Database_begin(self.impl)

   @property
   def begin(self):
      if hasattr(self, 'fn_Database_begin'): return self.fn_Database_begin
      else: return self.fn_unset_Database_begin
   @begin.setter
   def begin(self, value):
      self.fn_Database_begin = value
      lib.Instance_setMethod(self.impl, "Begin".encode('utf8'), cb_Database_begin)

   def fn_unset_Database_commit(self):
      return lib.Database_commit(self.impl)

   @property
   def commit(self):
      if hasattr(self, 'fn_Database_commit'): return self.fn_Database_commit
      else: return self.fn_unset_Database_commit
   @commit.setter
   def commit(self, value):
      self.fn_Database_commit = value
      lib.Instance_setMethod(self.impl, "Commit".encode('utf8'), cb_Database_commit)

   def fn_unset_Database_createCustomFunction(self, name, customFunction):
      return lib.Database_createCustomFunction(self.impl, name, ffi.NULL if customFunction is None else customFunction.impl)

   @property
   def createCustomFunction(self):
      if hasattr(self, 'fn_Database_createCustomFunction'): return self.fn_Database_createCustomFunction
      else: return self.fn_unset_Database_createCustomFunction
   @createCustomFunction.setter
   def createCustomFunction(self, value):
      self.fn_Database_createCustomFunction = value
      lib.Instance_setMethod(self.impl, "CreateCustomFunction".encode('utf8'), cb_Database_createCustomFunction)

   def fn_unset_Database_deleteObject(self, type, name):
      return lib.Database_deleteObject(self.impl, type, ffi.NULL if name is None else name.impl)

   @property
   def deleteObject(self):
      if hasattr(self, 'fn_Database_deleteObject'): return self.fn_Database_deleteObject
      else: return self.fn_unset_Database_deleteObject
   @deleteObject.setter
   def deleteObject(self, value):
      self.fn_Database_deleteObject = value
      lib.Instance_setMethod(self.impl, "DeleteObject".encode('utf8'), cb_Database_deleteObject)

   def fn_unset_Database_getName(self):
      return lib.Database_getName(self.impl)

   @property
   def getName(self):
      if hasattr(self, 'fn_Database_getName'): return self.fn_Database_getName
      else: return self.fn_unset_Database_getName
   @getName.setter
   def getName(self, value):
      self.fn_Database_getName = value
      lib.Instance_setMethod(self.impl, "GetName".encode('utf8'), cb_Database_getName)

   def fn_unset_Database_getTables(self):
      return lib.Database_getTables(self.impl)

   @property
   def getTables(self):
      if hasattr(self, 'fn_Database_getTables'): return self.fn_Database_getTables
      else: return self.fn_unset_Database_getTables
   @getTables.setter
   def getTables(self, value):
      self.fn_Database_getTables = value
      lib.Instance_setMethod(self.impl, "GetTables".encode('utf8'), cb_Database_getTables)

   def linkTable(self, tbl):
      if tbl is not None and not isinstance(tbl, Table): tbl = Table(tbl)
      if tbl is None: tbl = ffi.NULL
      lib.Database_linkTable(self.impl, tbl)

   def fn_unset_Database_objectsCount(self, type):
      return lib.Database_objectsCount(self.impl, type)

   @property
   def objectsCount(self):
      if hasattr(self, 'fn_Database_objectsCount'): return self.fn_Database_objectsCount
      else: return self.fn_unset_Database_objectsCount
   @objectsCount.setter
   def objectsCount(self, value):
      self.fn_Database_objectsCount = value
      lib.Instance_setMethod(self.impl, "ObjectsCount".encode('utf8'), cb_Database_objectsCount)

   def fn_unset_Database_openTable(self, name, open):
      return lib.Database_openTable(self.impl, ffi.NULL if name is None else name.impl, open)

   @property
   def openTable(self):
      if hasattr(self, 'fn_Database_openTable'): return self.fn_Database_openTable
      else: return self.fn_unset_Database_openTable
   @openTable.setter
   def openTable(self, value):
      self.fn_Database_openTable = value
      lib.Instance_setMethod(self.impl, "OpenTable".encode('utf8'), cb_Database_openTable)

   def fn_unset_Database_renameObject(self, type, name, rename):
      return lib.Database_renameObject(self.impl, type, ffi.NULL if name is None else name.impl, ffi.NULL if rename is None else rename.impl)

   @property
   def renameObject(self):
      if hasattr(self, 'fn_Database_renameObject'): return self.fn_Database_renameObject
      else: return self.fn_unset_Database_renameObject
   @renameObject.setter
   def renameObject(self, value):
      self.fn_Database_renameObject = value
      lib.Instance_setMethod(self.impl, "RenameObject".encode('utf8'), cb_Database_renameObject)

class Detail(Window):
   def __init__(self,
                parent = None,
                master = None,
                caption = None,
                hotKey = None,
                background = None,
                opacity = None,
                foreground = None,
                borderStyle = None,
                minClientSize = None,
                maxClientSize = None,
                hasMaximize = None,
                hasMinimize = None,
                hasClose = None,
                nonClient = None,
                inactive = None,
                clickThrough = None,
                isRemote = None,
                noCycle = None,
                isModal = None,
                interim = None,
                tabCycle = None,
                isDefault = None,
                drawBehind = None,
                hasMenuBar = None,
                hasStatusBar = None,
                stayOnTop = None,
                menu = None,
                font = None,
                sizeAnchor = None,
                size = None,
                clientSize = None,
                anchor = None,
                position = None,
                disabled = None,
                state = None,
                visible = None,
                isDocument = None,
                mergeMenus = None,
                hasHorzScroll = None,
                hasVertScroll = None,
                dontHideScroll = None,
                dontScrollVert = None,
                dontScrollHorz = None,
                snapVertScroll = None,
                snapHorzScroll = None,
                scroll = None,
                modifyVirtualArea = None,
                dontAutoScrollArea = None,
                fileName = None,
                id = None,
                modifiedDocument = None,
                showInTaskBar = None,
                saveDialog = None,
                isActiveClient = None,
                cursor = None,
                name = None,
                displayDriver = None,
                autoCreate = None,
                scrollArea = None,
                is3D = None,
                closing = None,
                fullRender = None,
                icon = None,
                moveable = None,
                alphaBlend = None,
                useSharedMemory = None,
                glCapabilities = None,
                creationActivation = None,
                nativeDecorations = None,
                manageDisplay = None,
                text = None,
                controller = None,
                noConsequential = None,
                keepTogether = None,
                isLast = None,
                level = None,
                rowDetail = None,
                getDecorationsSize = None,
                isInside = None,
                isMouseMoving = None,
                isMouseResizing = None,
                isOpaque = None,
                notifyActivate = None,
                notifyDestroyed = None,
                notifySaved = None,
                onActivate = None,
                onActivateClient = None,
                onApplyGraphics = None,
                onChildAddedOrRemoved = None,
                onChildResized = None,
                onChildVisibilityToggled = None,
                onClose = None,
                onCreate = None,
                onDestroy = None,
                onDestroyed = None,
                onDrawOverChildren = None,
                onFileModified = None,
                onHScroll = None,
                onKeyDown = None,
                onKeyHit = None,
                onKeyUp = None,
                onLeftButtonDown = None,
                onLeftButtonUp = None,
                onLeftDoubleClick = None,
                onLoadGraphics = None,
                onMiddleButtonDown = None,
                onMiddleButtonUp = None,
                onMiddleDoubleClick = None,
                onMouseCaptureLost = None,
                onMouseLeave = None,
                onMouseMove = None,
                onMouseOver = None,
                onMoving = None,
                onMultiTouch = None,
                onPosition = None,
                onPostCreate = None,
                onRedraw = None,
                onResize = None,
                onResizing = None,
                onRightButtonDown = None,
                onRightButtonUp = None,
                onRightDoubleClick = None,
                onSaveFile = None,
                onStateChange = None,
                onSysKeyDown = None,
                onSysKeyHit = None,
                onSysKeyUp = None,
                onUnloadGraphics = None,
                onVScroll = None,
                preShowDecorations = None,
                setBox = None,
                setWindowArea = None,
                setWindowMinimum = None,
                showDecorations = None,
                updateNonClient = None,
                impl = None):
      Window.__init__(self, impl = impl)
      if parent is not None:                   self.parent = parent
      if master is not None:                   self.master = master
      if caption is not None:                  self.caption = caption
      if hotKey is not None:                   self.hotKey = hotKey
      if background is not None:               self.background = background
      if opacity is not None:                  self.opacity = opacity
      if foreground is not None:               self.foreground = foreground
      if borderStyle is not None:              self.borderStyle = borderStyle
      if minClientSize is not None:            self.minClientSize = minClientSize
      if maxClientSize is not None:            self.maxClientSize = maxClientSize
      if hasMaximize is not None:              self.hasMaximize = hasMaximize
      if hasMinimize is not None:              self.hasMinimize = hasMinimize
      if hasClose is not None:                 self.hasClose = hasClose
      if nonClient is not None:                self.nonClient = nonClient
      if inactive is not None:                 self.inactive = inactive
      if clickThrough is not None:             self.clickThrough = clickThrough
      if isRemote is not None:                 self.isRemote = isRemote
      if noCycle is not None:                  self.noCycle = noCycle
      if isModal is not None:                  self.isModal = isModal
      if interim is not None:                  self.interim = interim
      if tabCycle is not None:                 self.tabCycle = tabCycle
      if isDefault is not None:                self.isDefault = isDefault
      if drawBehind is not None:               self.drawBehind = drawBehind
      if hasMenuBar is not None:               self.hasMenuBar = hasMenuBar
      if hasStatusBar is not None:             self.hasStatusBar = hasStatusBar
      if stayOnTop is not None:                self.stayOnTop = stayOnTop
      if menu is not None:                     self.menu = menu
      if font is not None:                     self.font = font
      if sizeAnchor is not None:               self.sizeAnchor = sizeAnchor
      if size is not None:                     self.size = size
      if clientSize is not None:               self.clientSize = clientSize
      if anchor is not None:                   self.anchor = anchor
      if position is not None:                 self.position = position
      if disabled is not None:                 self.disabled = disabled
      if state is not None:                    self.state = state
      if visible is not None:                  self.visible = visible
      if isDocument is not None:               self.isDocument = isDocument
      if mergeMenus is not None:               self.mergeMenus = mergeMenus
      if hasHorzScroll is not None:            self.hasHorzScroll = hasHorzScroll
      if hasVertScroll is not None:            self.hasVertScroll = hasVertScroll
      if dontHideScroll is not None:           self.dontHideScroll = dontHideScroll
      if dontScrollVert is not None:           self.dontScrollVert = dontScrollVert
      if dontScrollHorz is not None:           self.dontScrollHorz = dontScrollHorz
      if snapVertScroll is not None:           self.snapVertScroll = snapVertScroll
      if snapHorzScroll is not None:           self.snapHorzScroll = snapHorzScroll
      if scroll is not None:                   self.scroll = scroll
      if modifyVirtualArea is not None:        self.modifyVirtualArea = modifyVirtualArea
      if dontAutoScrollArea is not None:       self.dontAutoScrollArea = dontAutoScrollArea
      if fileName is not None:                 self.fileName = fileName
      if id is not None:                       self.id = id
      if modifiedDocument is not None:         self.modifiedDocument = modifiedDocument
      if showInTaskBar is not None:            self.showInTaskBar = showInTaskBar
      if saveDialog is not None:               self.saveDialog = saveDialog
      if isActiveClient is not None:           self.isActiveClient = isActiveClient
      if cursor is not None:                   self.cursor = cursor
      if name is not None:                     self.name = name
      if displayDriver is not None:            self.displayDriver = displayDriver
      if autoCreate is not None:               self.autoCreate = autoCreate
      if scrollArea is not None:               self.scrollArea = scrollArea
      if is3D is not None:                     self.is3D = is3D
      if closing is not None:                  self.closing = closing
      if fullRender is not None:               self.fullRender = fullRender
      if icon is not None:                     self.icon = icon
      if moveable is not None:                 self.moveable = moveable
      if alphaBlend is not None:               self.alphaBlend = alphaBlend
      if useSharedMemory is not None:          self.useSharedMemory = useSharedMemory
      if glCapabilities is not None:           self.glCapabilities = glCapabilities
      if creationActivation is not None:       self.creationActivation = creationActivation
      if nativeDecorations is not None:        self.nativeDecorations = nativeDecorations
      if manageDisplay is not None:            self.manageDisplay = manageDisplay
      if text is not None:                     self.text = text
      if controller is not None:               self.controller = controller
      if noConsequential is not None:          self.noConsequential = noConsequential
      if keepTogether is not None:             self.keepTogether = keepTogether
      if isLast is not None:                   self.isLast = isLast
      if level is not None:                    self.level = level
      if rowDetail is not None:                self.rowDetail = rowDetail
      if getDecorationsSize is not None:       self.getDecorationsSize = getDecorationsSize
      if isInside is not None:                 self.isInside = isInside
      if isMouseMoving is not None:            self.isMouseMoving = isMouseMoving
      if isMouseResizing is not None:          self.isMouseResizing = isMouseResizing
      if isOpaque is not None:                 self.isOpaque = isOpaque
      if notifyActivate is not None:           self.notifyActivate = notifyActivate
      if notifyDestroyed is not None:          self.notifyDestroyed = notifyDestroyed
      if notifySaved is not None:              self.notifySaved = notifySaved
      if onActivate is not None:               self.onActivate = onActivate
      if onActivateClient is not None:         self.onActivateClient = onActivateClient
      if onApplyGraphics is not None:          self.onApplyGraphics = onApplyGraphics
      if onChildAddedOrRemoved is not None:    self.onChildAddedOrRemoved = onChildAddedOrRemoved
      if onChildResized is not None:           self.onChildResized = onChildResized
      if onChildVisibilityToggled is not None: self.onChildVisibilityToggled = onChildVisibilityToggled
      if onClose is not None:                  self.onClose = onClose
      if onCreate is not None:                 self.onCreate = onCreate
      if onDestroy is not None:                self.onDestroy = onDestroy
      if onDestroyed is not None:              self.onDestroyed = onDestroyed
      if onDrawOverChildren is not None:       self.onDrawOverChildren = onDrawOverChildren
      if onFileModified is not None:           self.onFileModified = onFileModified
      if onHScroll is not None:                self.onHScroll = onHScroll
      if onKeyDown is not None:                self.onKeyDown = onKeyDown
      if onKeyHit is not None:                 self.onKeyHit = onKeyHit
      if onKeyUp is not None:                  self.onKeyUp = onKeyUp
      if onLeftButtonDown is not None:         self.onLeftButtonDown = onLeftButtonDown
      if onLeftButtonUp is not None:           self.onLeftButtonUp = onLeftButtonUp
      if onLeftDoubleClick is not None:        self.onLeftDoubleClick = onLeftDoubleClick
      if onLoadGraphics is not None:           self.onLoadGraphics = onLoadGraphics
      if onMiddleButtonDown is not None:       self.onMiddleButtonDown = onMiddleButtonDown
      if onMiddleButtonUp is not None:         self.onMiddleButtonUp = onMiddleButtonUp
      if onMiddleDoubleClick is not None:      self.onMiddleDoubleClick = onMiddleDoubleClick
      if onMouseCaptureLost is not None:       self.onMouseCaptureLost = onMouseCaptureLost
      if onMouseLeave is not None:             self.onMouseLeave = onMouseLeave
      if onMouseMove is not None:              self.onMouseMove = onMouseMove
      if onMouseOver is not None:              self.onMouseOver = onMouseOver
      if onMoving is not None:                 self.onMoving = onMoving
      if onMultiTouch is not None:             self.onMultiTouch = onMultiTouch
      if onPosition is not None:               self.onPosition = onPosition
      if onPostCreate is not None:             self.onPostCreate = onPostCreate
      if onRedraw is not None:                 self.onRedraw = onRedraw
      if onResize is not None:                 self.onResize = onResize
      if onResizing is not None:               self.onResizing = onResizing
      if onRightButtonDown is not None:        self.onRightButtonDown = onRightButtonDown
      if onRightButtonUp is not None:          self.onRightButtonUp = onRightButtonUp
      if onRightDoubleClick is not None:       self.onRightDoubleClick = onRightDoubleClick
      if onSaveFile is not None:               self.onSaveFile = onSaveFile
      if onStateChange is not None:            self.onStateChange = onStateChange
      if onSysKeyDown is not None:             self.onSysKeyDown = onSysKeyDown
      if onSysKeyHit is not None:              self.onSysKeyHit = onSysKeyHit
      if onSysKeyUp is not None:               self.onSysKeyUp = onSysKeyUp
      if onUnloadGraphics is not None:         self.onUnloadGraphics = onUnloadGraphics
      if onVScroll is not None:                self.onVScroll = onVScroll
      if preShowDecorations is not None:       self.preShowDecorations = preShowDecorations
      if setBox is not None:                   self.setBox = setBox
      if setWindowArea is not None:            self.setWindowArea = setWindowArea
      if setWindowMinimum is not None:         self.setWindowMinimum = setWindowMinimum
      if showDecorations is not None:          self.showDecorations = showDecorations
      if updateNonClient is not None:          self.updateNonClient = updateNonClient

   @property
   def keepTogether(self): return IPTR(lib, ffi, self, Detail).keepTogether
   @keepTogether.setter
   def keepTogether(self, value): IPTR(lib, ffi, self, Detail).keepTogether = value

   @property
   def isLast(self): return IPTR(lib, ffi, self, Detail).isLast
   @isLast.setter
   def isLast(self, value): IPTR(lib, ffi, self, Detail).isLast = value

   @property
   def level(self): return IPTR(lib, ffi, self, Detail).level
   @level.setter
   def level(self, value): IPTR(lib, ffi, self, Detail).level = value

   @property
   def rowDetail(self): return IPTR(lib, ffi, self, Detail).rowDetail
   @rowDetail.setter
   def rowDetail(self, value): IPTR(lib, ffi, self, Detail).rowDetail = value

@ffi.callback("void(DirFilesDataSourceDriver, const char *)")
def cb_DirFilesDataSourceDriver_isDatabaseFile(__d, fullPath):
   dirfilesdatasourcedriver = pyOrNewObject(DirFilesDataSourceDriver, __d)
   dirfilesdatasourcedriver.fn_DirFilesDataSourceDriver_isDatabaseFile(dirfilesdatasourcedriver, fullPath.encode('utf8'))

class DirFilesDataSourceDriver(DataSourceDriver):
   def __init__(self,
                path = None,
                databaseFileExt = None,
                tableFileExt = None,
                buildLocator = None,
                connect = None,
                deleteDatabase = None,
                getDatabases = None,
                getDatabasesCount = None,
                openDatabase = None,
                renameDatabase = None,
                status = None,
                isDatabaseFile = None,
                impl = None):
      DataSourceDriver.__init__(self, impl = impl)
      if path is not None:              self.path = path
      if databaseFileExt is not None:   self.databaseFileExt = databaseFileExt
      if tableFileExt is not None:      self.tableFileExt = tableFileExt
      if buildLocator is not None:      self.buildLocator = buildLocator
      if connect is not None:           self.connect = connect
      if deleteDatabase is not None:    self.deleteDatabase = deleteDatabase
      if getDatabases is not None:      self.getDatabases = getDatabases
      if getDatabasesCount is not None: self.getDatabasesCount = getDatabasesCount
      if openDatabase is not None:      self.openDatabase = openDatabase
      if renameDatabase is not None:    self.renameDatabase = renameDatabase
      if status is not None:            self.status = status
      if isDatabaseFile is not None:    self.isDatabaseFile = isDatabaseFile

   @property
   def path(self): return String(impl = IPTR(lib, ffi, self, DirFilesDataSourceDriver).path)
   @path.setter
   def path(self, value):
      if not isinstance(value, String): value = String(value)
      IPTR(lib, ffi, self, DirFilesDataSourceDriver).path = value.impl

   @property
   def databaseFileExt(self): return String(impl = IPTR(lib, ffi, self, DirFilesDataSourceDriver).databaseFileExt)
   @databaseFileExt.setter
   def databaseFileExt(self, value):
      if not isinstance(value, String): value = String(value)
      IPTR(lib, ffi, self, DirFilesDataSourceDriver).databaseFileExt = value.impl

   @property
   def tableFileExt(self): return String(impl = IPTR(lib, ffi, self, DirFilesDataSourceDriver).tableFileExt)
   @tableFileExt.setter
   def tableFileExt(self, value):
      if not isinstance(value, String): value = String(value)
      IPTR(lib, ffi, self, DirFilesDataSourceDriver).tableFileExt = value.impl

   def fn_unset_DirFilesDataSourceDriver_isDatabaseFile(self, fullPath):
      return lib.DirFilesDataSourceDriver_isDatabaseFile(self.impl, fullPath)

   @property
   def isDatabaseFile(self):
      if hasattr(self, 'fn_DirFilesDataSourceDriver_isDatabaseFile'): return self.fn_DirFilesDataSourceDriver_isDatabaseFile
      else: return self.fn_unset_DirFilesDataSourceDriver_isDatabaseFile
   @isDatabaseFile.setter
   def isDatabaseFile(self, value):
      self.fn_DirFilesDataSourceDriver_isDatabaseFile = value
      lib.Instance_setMethod(self.impl, "IsDatabaseFile".encode('utf8'), cb_DirFilesDataSourceDriver_isDatabaseFile)

   def makeDatabasePath(self, name = None):
      if name is not None and not isinstance(name, String): name = String(name)
      if name is None: name = ffi.NULL
      return pyOrNewObject(String, lib.DirFilesDataSourceDriver_makeDatabasePath(self.impl, name))

@ffi.callback("void(DriverRow, uint64)")
def cb_DriverRow_add(__d, id):
   driverrow = pyOrNewObject(DriverRow, __d)
   driverrow.fn_DriverRow_add(driverrow, id)

@ffi.callback("void(DriverRow, int, Field, Class *, void *)")
def cb_DriverRow_bindQueryData(__d, paramID, fld, value):
   driverrow = pyOrNewObject(DriverRow, __d)
   driverrow.fn_DriverRow_bindQueryData(driverrow, paramID, pyOrNewObject(Field, fld), typed_object(impl = value))

@ffi.callback("void(DriverRow)")
def cb_DriverRow_delete(__d):
   driverrow = pyOrNewObject(DriverRow, __d)
   driverrow.fn_DriverRow_delete(driverrow)

@ffi.callback("void(DriverRow, Field, MoveOptions, MatchOptions, Class *, void *)")
def cb_DriverRow_find(__d, fld, move, match, data):
   driverrow = pyOrNewObject(DriverRow, __d)
   driverrow.fn_DriverRow_find(driverrow, pyOrNewObject(Field, fld), MoveOptions(impl = move), MatchOptions(impl = match), typed_object(impl = data))

@ffi.callback("void(DriverRow, FieldFindData *, MoveOptions, int)")
def cb_DriverRow_findMultiple(__d, findData, move, numFields):
   driverrow = pyOrNewObject(DriverRow, __d)
   driverrow.fn_DriverRow_findMultiple(driverrow, findData, MoveOptions(impl = move), numFields)

@ffi.callback("void(DriverRow, int)")
def cb_DriverRow_getColumn(__d, paramID):
   driverrow = pyOrNewObject(DriverRow, __d)
   driverrow.fn_DriverRow_getColumn(driverrow, paramID)

@ffi.callback("void(DriverRow, Field, Class *, void *)")
def cb_DriverRow_getData(__d, fld, data):
   driverrow = pyOrNewObject(DriverRow, __d)
   driverrow.fn_DriverRow_getData(driverrow, pyOrNewObject(Field, fld), data)

@ffi.callback("void(DriverRow, Field, FieldValue *)")
def cb_DriverRow_getDataFieldValue(__d, fld, value):
   driverrow = pyOrNewObject(DriverRow, __d)
   driverrow.fn_DriverRow_getDataFieldValue(driverrow, pyOrNewObject(Field, fld), FieldValue(impl = value))

@ffi.callback("void(DriverRow, int, Field, Class *, void *)")
def cb_DriverRow_getQueryData(__d, paramID, fld, value):
   driverrow = pyOrNewObject(DriverRow, __d)
   driverrow.fn_DriverRow_getQueryData(driverrow, paramID, pyOrNewObject(Field, fld), value)

@ffi.callback("void(DriverRow)")
def cb_DriverRow_getRowData(__d):
   driverrow = pyOrNewObject(DriverRow, __d)
   driverrow.fn_DriverRow_getRowData(driverrow)

@ffi.callback("void(DriverRow)")
def cb_DriverRow_getSysID(__d):
   driverrow = pyOrNewObject(DriverRow, __d)
   driverrow.fn_DriverRow_getSysID(driverrow)

@ffi.callback("void(DriverRow, uint64)")
def cb_DriverRow_goToSysID(__d, id):
   driverrow = pyOrNewObject(DriverRow, __d)
   driverrow.fn_DriverRow_goToSysID(driverrow, id)

@ffi.callback("void(DriverRow)")
def cb_DriverRow_nil(__d):
   driverrow = pyOrNewObject(DriverRow, __d)
   driverrow.fn_DriverRow_nil(driverrow)

@ffi.callback("void(DriverRow, const char *)")
def cb_DriverRow_query(__d, queryString):
   driverrow = pyOrNewObject(DriverRow, __d)
   driverrow.fn_DriverRow_query(driverrow, queryString.encode('utf8'))

@ffi.callback("void(DriverRow, MoveOptions)")
def cb_DriverRow_select(__d, move):
   driverrow = pyOrNewObject(DriverRow, __d)
   driverrow.fn_DriverRow_select(driverrow, MoveOptions(impl = move))

@ffi.callback("void(DriverRow, Field, Class *, void *)")
def cb_DriverRow_setData(__d, fld, data):
   driverrow = pyOrNewObject(DriverRow, __d)
   driverrow.fn_DriverRow_setData(driverrow, pyOrNewObject(Field, fld), typed_object(impl = data))

@ffi.callback("void(DriverRow, int, int)")
def cb_DriverRow_setQueryParam(__d, paramID, value):
   driverrow = pyOrNewObject(DriverRow, __d)
   driverrow.fn_DriverRow_setQueryParam(driverrow, paramID, value)

@ffi.callback("void(DriverRow, int, int64)")
def cb_DriverRow_setQueryParam64(__d, paramID, value):
   driverrow = pyOrNewObject(DriverRow, __d)
   driverrow.fn_DriverRow_setQueryParam64(driverrow, paramID, value)

@ffi.callback("void(DriverRow, int, const void *, Class *)")
def cb_DriverRow_setQueryParamObject(__d, paramID, data, type):
   driverrow = pyOrNewObject(DriverRow, __d)
   driverrow.fn_DriverRow_setQueryParamObject(driverrow, paramID, data, Class(impl = type))

@ffi.callback("void(DriverRow, int, const char *)")
def cb_DriverRow_setQueryParamText(__d, paramID, value):
   driverrow = pyOrNewObject(DriverRow, __d)
   driverrow.fn_DriverRow_setQueryParamText(driverrow, paramID, value.encode('utf8'))

@ffi.callback("void(DriverRow, DriverRow)")
def cb_DriverRow_synch(__d, to):
   driverrow = pyOrNewObject(DriverRow, __d)
   driverrow.fn_DriverRow_synch(driverrow, pyOrNewObject(DriverRow, to))

class DriverRow(Instance):
   def __init__(self,
                add = None,
                bindQueryData = None,
                delete = None,
                find = None,
                findMultiple = None,
                getColumn = None,
                getData = None,
                getDataFieldValue = None,
                getQueryData = None,
                getRowData = None,
                getSysID = None,
                goToSysID = None,
                nil = None,
                query = None,
                select = None,
                setData = None,
                setQueryParam = None,
                setQueryParam64 = None,
                setQueryParamObject = None,
                setQueryParamText = None,
                synch = None,
                impl = None):
      Instance.__init__(self, impl = impl)
      if add is not None:                 self.add = add
      if bindQueryData is not None:       self.bindQueryData = bindQueryData
      if delete is not None:              self.delete = delete
      if find is not None:                self.find = find
      if findMultiple is not None:        self.findMultiple = findMultiple
      if getColumn is not None:           self.getColumn = getColumn
      if getData is not None:             self.getData = getData
      if getDataFieldValue is not None:   self.getDataFieldValue = getDataFieldValue
      if getQueryData is not None:        self.getQueryData = getQueryData
      if getRowData is not None:          self.getRowData = getRowData
      if getSysID is not None:            self.getSysID = getSysID
      if goToSysID is not None:           self.goToSysID = goToSysID
      if nil is not None:                 self.nil = nil
      if query is not None:               self.query = query
      if select is not None:              self.select = select
      if setData is not None:             self.setData = setData
      if setQueryParam is not None:       self.setQueryParam = setQueryParam
      if setQueryParam64 is not None:     self.setQueryParam64 = setQueryParam64
      if setQueryParamObject is not None: self.setQueryParamObject = setQueryParamObject
      if setQueryParamText is not None:   self.setQueryParamText = setQueryParamText
      if synch is not None:               self.synch = synch

   def fn_unset_DriverRow_add(self, id):
      return lib.DriverRow_add(self.impl, id)

   @property
   def add(self):
      if hasattr(self, 'fn_DriverRow_add'): return self.fn_DriverRow_add
      else: return self.fn_unset_DriverRow_add
   @add.setter
   def add(self, value):
      self.fn_DriverRow_add = value
      lib.Instance_setMethod(self.impl, "Add".encode('utf8'), cb_DriverRow_add)

   def fn_unset_DriverRow_bindQueryData(self, paramID, fld, value):
      return lib.DriverRow_bindQueryData(self.impl, paramID, ffi.NULL if fld is None else fld.impl, value)

   @property
   def bindQueryData(self):
      if hasattr(self, 'fn_DriverRow_bindQueryData'): return self.fn_DriverRow_bindQueryData
      else: return self.fn_unset_DriverRow_bindQueryData
   @bindQueryData.setter
   def bindQueryData(self, value):
      self.fn_DriverRow_bindQueryData = value
      lib.Instance_setMethod(self.impl, "BindQueryData".encode('utf8'), cb_DriverRow_bindQueryData)

   def fn_unset_DriverRow_delete(self):
      return lib.DriverRow_delete(self.impl)

   @property
   def delete(self):
      if hasattr(self, 'fn_DriverRow_delete'): return self.fn_DriverRow_delete
      else: return self.fn_unset_DriverRow_delete
   @delete.setter
   def delete(self, value):
      self.fn_DriverRow_delete = value
      lib.Instance_setMethod(self.impl, "Delete".encode('utf8'), cb_DriverRow_delete)

   def fn_unset_DriverRow_find(self, fld, move, match, data):
      return lib.DriverRow_find(self.impl, ffi.NULL if fld is None else fld.impl, move, match, data)

   @property
   def find(self):
      if hasattr(self, 'fn_DriverRow_find'): return self.fn_DriverRow_find
      else: return self.fn_unset_DriverRow_find
   @find.setter
   def find(self, value):
      self.fn_DriverRow_find = value
      lib.Instance_setMethod(self.impl, "Find".encode('utf8'), cb_DriverRow_find)

   def fn_unset_DriverRow_findMultiple(self, findData, move, numFields):
      return lib.DriverRow_findMultiple(self.impl, findData, move, numFields)

   @property
   def findMultiple(self):
      if hasattr(self, 'fn_DriverRow_findMultiple'): return self.fn_DriverRow_findMultiple
      else: return self.fn_unset_DriverRow_findMultiple
   @findMultiple.setter
   def findMultiple(self, value):
      self.fn_DriverRow_findMultiple = value
      lib.Instance_setMethod(self.impl, "FindMultiple".encode('utf8'), cb_DriverRow_findMultiple)

   def fn_unset_DriverRow_getColumn(self, paramID):
      return lib.DriverRow_getColumn(self.impl, paramID)

   @property
   def getColumn(self):
      if hasattr(self, 'fn_DriverRow_getColumn'): return self.fn_DriverRow_getColumn
      else: return self.fn_unset_DriverRow_getColumn
   @getColumn.setter
   def getColumn(self, value):
      self.fn_DriverRow_getColumn = value
      lib.Instance_setMethod(self.impl, "GetColumn".encode('utf8'), cb_DriverRow_getColumn)

   def fn_unset_DriverRow_getData(self, fld, data):
      return lib.DriverRow_getData(self.impl, ffi.NULL if fld is None else fld.impl, data)

   @property
   def getData(self):
      if hasattr(self, 'fn_DriverRow_getData'): return self.fn_DriverRow_getData
      else: return self.fn_unset_DriverRow_getData
   @getData.setter
   def getData(self, value):
      self.fn_DriverRow_getData = value
      lib.Instance_setMethod(self.impl, "GetData".encode('utf8'), cb_DriverRow_getData)

   def fn_unset_DriverRow_getDataFieldValue(self, fld, value):
      return lib.DriverRow_getDataFieldValue(self.impl, ffi.NULL if fld is None else fld.impl, ffi.NULL if value is None else value.impl)

   @property
   def getDataFieldValue(self):
      if hasattr(self, 'fn_DriverRow_getDataFieldValue'): return self.fn_DriverRow_getDataFieldValue
      else: return self.fn_unset_DriverRow_getDataFieldValue
   @getDataFieldValue.setter
   def getDataFieldValue(self, value):
      self.fn_DriverRow_getDataFieldValue = value
      lib.Instance_setMethod(self.impl, "GetDataFieldValue".encode('utf8'), cb_DriverRow_getDataFieldValue)

   def fn_unset_DriverRow_getQueryData(self, paramID, fld, value):
      return lib.DriverRow_getQueryData(self.impl, paramID, ffi.NULL if fld is None else fld.impl, value)

   @property
   def getQueryData(self):
      if hasattr(self, 'fn_DriverRow_getQueryData'): return self.fn_DriverRow_getQueryData
      else: return self.fn_unset_DriverRow_getQueryData
   @getQueryData.setter
   def getQueryData(self, value):
      self.fn_DriverRow_getQueryData = value
      lib.Instance_setMethod(self.impl, "GetQueryData".encode('utf8'), cb_DriverRow_getQueryData)

   def fn_unset_DriverRow_getRowData(self):
      return lib.DriverRow_getRowData(self.impl)

   @property
   def getRowData(self):
      if hasattr(self, 'fn_DriverRow_getRowData'): return self.fn_DriverRow_getRowData
      else: return self.fn_unset_DriverRow_getRowData
   @getRowData.setter
   def getRowData(self, value):
      self.fn_DriverRow_getRowData = value
      lib.Instance_setMethod(self.impl, "GetRowData".encode('utf8'), cb_DriverRow_getRowData)

   def fn_unset_DriverRow_getSysID(self):
      return lib.DriverRow_getSysID(self.impl)

   @property
   def getSysID(self):
      if hasattr(self, 'fn_DriverRow_getSysID'): return self.fn_DriverRow_getSysID
      else: return self.fn_unset_DriverRow_getSysID
   @getSysID.setter
   def getSysID(self, value):
      self.fn_DriverRow_getSysID = value
      lib.Instance_setMethod(self.impl, "GetSysID".encode('utf8'), cb_DriverRow_getSysID)

   def fn_unset_DriverRow_goToSysID(self, id):
      return lib.DriverRow_goToSysID(self.impl, id)

   @property
   def goToSysID(self):
      if hasattr(self, 'fn_DriverRow_goToSysID'): return self.fn_DriverRow_goToSysID
      else: return self.fn_unset_DriverRow_goToSysID
   @goToSysID.setter
   def goToSysID(self, value):
      self.fn_DriverRow_goToSysID = value
      lib.Instance_setMethod(self.impl, "GoToSysID".encode('utf8'), cb_DriverRow_goToSysID)

   def fn_unset_DriverRow_nil(self):
      return lib.DriverRow_nil(self.impl)

   @property
   def nil(self):
      if hasattr(self, 'fn_DriverRow_nil'): return self.fn_DriverRow_nil
      else: return self.fn_unset_DriverRow_nil
   @nil.setter
   def nil(self, value):
      self.fn_DriverRow_nil = value
      lib.Instance_setMethod(self.impl, "Nil".encode('utf8'), cb_DriverRow_nil)

   def fn_unset_DriverRow_query(self, queryString):
      return lib.DriverRow_query(self.impl, queryString)

   @property
   def query(self):
      if hasattr(self, 'fn_DriverRow_query'): return self.fn_DriverRow_query
      else: return self.fn_unset_DriverRow_query
   @query.setter
   def query(self, value):
      self.fn_DriverRow_query = value
      lib.Instance_setMethod(self.impl, "Query".encode('utf8'), cb_DriverRow_query)

   def fn_unset_DriverRow_select(self, move):
      return lib.DriverRow_select(self.impl, move)

   @property
   def select(self):
      if hasattr(self, 'fn_DriverRow_select'): return self.fn_DriverRow_select
      else: return self.fn_unset_DriverRow_select
   @select.setter
   def select(self, value):
      self.fn_DriverRow_select = value
      lib.Instance_setMethod(self.impl, "Select".encode('utf8'), cb_DriverRow_select)

   def fn_unset_DriverRow_setData(self, fld, data):
      return lib.DriverRow_setData(self.impl, ffi.NULL if fld is None else fld.impl, data)

   @property
   def setData(self):
      if hasattr(self, 'fn_DriverRow_setData'): return self.fn_DriverRow_setData
      else: return self.fn_unset_DriverRow_setData
   @setData.setter
   def setData(self, value):
      self.fn_DriverRow_setData = value
      lib.Instance_setMethod(self.impl, "SetData".encode('utf8'), cb_DriverRow_setData)

   def fn_unset_DriverRow_setQueryParam(self, paramID, value):
      return lib.DriverRow_setQueryParam(self.impl, paramID, value)

   @property
   def setQueryParam(self):
      if hasattr(self, 'fn_DriverRow_setQueryParam'): return self.fn_DriverRow_setQueryParam
      else: return self.fn_unset_DriverRow_setQueryParam
   @setQueryParam.setter
   def setQueryParam(self, value):
      self.fn_DriverRow_setQueryParam = value
      lib.Instance_setMethod(self.impl, "SetQueryParam".encode('utf8'), cb_DriverRow_setQueryParam)

   def fn_unset_DriverRow_setQueryParam64(self, paramID, value):
      return lib.DriverRow_setQueryParam64(self.impl, paramID, value)

   @property
   def setQueryParam64(self):
      if hasattr(self, 'fn_DriverRow_setQueryParam64'): return self.fn_DriverRow_setQueryParam64
      else: return self.fn_unset_DriverRow_setQueryParam64
   @setQueryParam64.setter
   def setQueryParam64(self, value):
      self.fn_DriverRow_setQueryParam64 = value
      lib.Instance_setMethod(self.impl, "SetQueryParam64".encode('utf8'), cb_DriverRow_setQueryParam64)

   def fn_unset_DriverRow_setQueryParamObject(self, paramID, data, type):
      return lib.DriverRow_setQueryParamObject(self.impl, paramID, data, ffi.NULL if type is None else type.impl)

   @property
   def setQueryParamObject(self):
      if hasattr(self, 'fn_DriverRow_setQueryParamObject'): return self.fn_DriverRow_setQueryParamObject
      else: return self.fn_unset_DriverRow_setQueryParamObject
   @setQueryParamObject.setter
   def setQueryParamObject(self, value):
      self.fn_DriverRow_setQueryParamObject = value
      lib.Instance_setMethod(self.impl, "SetQueryParamObject".encode('utf8'), cb_DriverRow_setQueryParamObject)

   def fn_unset_DriverRow_setQueryParamText(self, paramID, value):
      return lib.DriverRow_setQueryParamText(self.impl, paramID, value)

   @property
   def setQueryParamText(self):
      if hasattr(self, 'fn_DriverRow_setQueryParamText'): return self.fn_DriverRow_setQueryParamText
      else: return self.fn_unset_DriverRow_setQueryParamText
   @setQueryParamText.setter
   def setQueryParamText(self, value):
      self.fn_DriverRow_setQueryParamText = value
      lib.Instance_setMethod(self.impl, "SetQueryParamText".encode('utf8'), cb_DriverRow_setQueryParamText)

   def fn_unset_DriverRow_synch(self, to):
      return lib.DriverRow_synch(self.impl, ffi.NULL if to is None else to.impl)

   @property
   def synch(self):
      if hasattr(self, 'fn_DriverRow_synch'): return self.fn_DriverRow_synch
      else: return self.fn_unset_DriverRow_synch
   @synch.setter
   def synch(self, value):
      self.fn_DriverRow_synch = value
      lib.Instance_setMethod(self.impl, "Synch".encode('utf8'), cb_DriverRow_synch)

class EDBIndexOptions(pyBaseClass):
   def __init__(self, saveIndex = False, deleteIndex = False, impl = None):
      if impl is not None:
         self.impl = impl
      elif isinstance(saveIndex, EDBIndexOptions):
         self.impl = saveIndex.impl
      else:
         if isinstance(saveIndex, tuple):
            __tuple = saveIndex
            saveIndex = False
            if len(__tuple) > 0: saveIndex = __tuple[0]
            if len(__tuple) > 1: deleteIndex = __tuple[1]
         self.impl = (
            (saveIndex   << lib.EDBINDEXOPTIONS_saveIndex_SHIFT)   |
            (deleteIndex << lib.EDBINDEXOPTIONS_deleteIndex_SHIFT) )

   @property
   def saveIndex(self): return ((((self.impl)) & lib.EDBINDEXOPTIONS_saveIndex_MASK) >> lib.EDBINDEXOPTIONS_saveIndex_SHIFT)
   @saveIndex.setter
   def saveIndex(self, value): self.value = ((self.impl) & ~(lib.EDBINDEXOPTIONS_saveIndex_MASK)) | (((value)) << lib.EDBINDEXOPTIONS_saveIndex_SHIFT)

   @property
   def deleteIndex(self): return ((((self.impl)) & lib.EDBINDEXOPTIONS_deleteIndex_MASK) >> lib.EDBINDEXOPTIONS_deleteIndex_SHIFT)
   @deleteIndex.setter
   def deleteIndex(self, value): self.value = ((self.impl) & ~(lib.EDBINDEXOPTIONS_deleteIndex_MASK)) | (((value)) << lib.EDBINDEXOPTIONS_deleteIndex_SHIFT)

class EditDropDataBox(DropDataBox):
   def __init__(self,
                parent = None,
                master = None,
                caption = None,
                hotKey = None,
                background = None,
                opacity = None,
                foreground = None,
                borderStyle = None,
                minClientSize = None,
                maxClientSize = None,
                hasMaximize = None,
                hasMinimize = None,
                hasClose = None,
                nonClient = None,
                inactive = None,
                clickThrough = None,
                isRemote = None,
                noCycle = None,
                isModal = None,
                interim = None,
                tabCycle = None,
                isDefault = None,
                drawBehind = None,
                hasMenuBar = None,
                hasStatusBar = None,
                stayOnTop = None,
                menu = None,
                font = None,
                sizeAnchor = None,
                size = None,
                clientSize = None,
                anchor = None,
                position = None,
                disabled = None,
                state = None,
                visible = None,
                isDocument = None,
                mergeMenus = None,
                hasHorzScroll = None,
                hasVertScroll = None,
                dontHideScroll = None,
                dontScrollVert = None,
                dontScrollHorz = None,
                snapVertScroll = None,
                snapHorzScroll = None,
                scroll = None,
                modifyVirtualArea = None,
                dontAutoScrollArea = None,
                fileName = None,
                id = None,
                modifiedDocument = None,
                showInTaskBar = None,
                saveDialog = None,
                isActiveClient = None,
                cursor = None,
                name = None,
                displayDriver = None,
                autoCreate = None,
                scrollArea = None,
                is3D = None,
                closing = None,
                fullRender = None,
                icon = None,
                moveable = None,
                alphaBlend = None,
                useSharedMemory = None,
                glCapabilities = None,
                creationActivation = None,
                nativeDecorations = None,
                manageDisplay = None,
                text = None,
                controller = None,
                noConsequential = None,
                toolTip = None,
                type = None,
                data = None,
                fieldData = None,
                editor = None,
                readOnly = None,
                keepEditor = None,
                autoSize = None,
                needUpdate = None,
                stringValue = None,
                filter = None,
                filtered = None,
                exclusion = None,
                filterField = None,
                nameField = None,
                showNone = None,
                getDecorationsSize = None,
                isInside = None,
                isMouseMoving = None,
                isMouseResizing = None,
                isOpaque = None,
                notifyActivate = None,
                notifyDestroyed = None,
                notifySaved = None,
                onActivate = None,
                onActivateClient = None,
                onApplyGraphics = None,
                onChildAddedOrRemoved = None,
                onChildResized = None,
                onChildVisibilityToggled = None,
                onClose = None,
                onCreate = None,
                onDestroy = None,
                onDestroyed = None,
                onDrawOverChildren = None,
                onFileModified = None,
                onHScroll = None,
                onKeyDown = None,
                onKeyHit = None,
                onKeyUp = None,
                onLeftButtonDown = None,
                onLeftButtonUp = None,
                onLeftDoubleClick = None,
                onLoadGraphics = None,
                onMiddleButtonDown = None,
                onMiddleButtonUp = None,
                onMiddleDoubleClick = None,
                onMouseCaptureLost = None,
                onMouseLeave = None,
                onMouseMove = None,
                onMouseOver = None,
                onMoving = None,
                onMultiTouch = None,
                onPosition = None,
                onPostCreate = None,
                onRedraw = None,
                onResize = None,
                onResizing = None,
                onRightButtonDown = None,
                onRightButtonUp = None,
                onRightDoubleClick = None,
                onSaveFile = None,
                onStateChange = None,
                onSysKeyDown = None,
                onSysKeyHit = None,
                onSysKeyUp = None,
                onUnloadGraphics = None,
                onVScroll = None,
                preShowDecorations = None,
                setBox = None,
                setWindowArea = None,
                setWindowMinimum = None,
                showDecorations = None,
                updateNonClient = None,
                notifyChanged = None,
                notifyModified = None,
                onConfigure = None,
                setData = None,
                refillFunction = None,
                impl = None):
      DropDataBox.__init__(self, impl = impl)
      if parent is not None:                   self.parent = parent
      if master is not None:                   self.master = master
      if caption is not None:                  self.caption = caption
      if hotKey is not None:                   self.hotKey = hotKey
      if background is not None:               self.background = background
      if opacity is not None:                  self.opacity = opacity
      if foreground is not None:               self.foreground = foreground
      if borderStyle is not None:              self.borderStyle = borderStyle
      if minClientSize is not None:            self.minClientSize = minClientSize
      if maxClientSize is not None:            self.maxClientSize = maxClientSize
      if hasMaximize is not None:              self.hasMaximize = hasMaximize
      if hasMinimize is not None:              self.hasMinimize = hasMinimize
      if hasClose is not None:                 self.hasClose = hasClose
      if nonClient is not None:                self.nonClient = nonClient
      if inactive is not None:                 self.inactive = inactive
      if clickThrough is not None:             self.clickThrough = clickThrough
      if isRemote is not None:                 self.isRemote = isRemote
      if noCycle is not None:                  self.noCycle = noCycle
      if isModal is not None:                  self.isModal = isModal
      if interim is not None:                  self.interim = interim
      if tabCycle is not None:                 self.tabCycle = tabCycle
      if isDefault is not None:                self.isDefault = isDefault
      if drawBehind is not None:               self.drawBehind = drawBehind
      if hasMenuBar is not None:               self.hasMenuBar = hasMenuBar
      if hasStatusBar is not None:             self.hasStatusBar = hasStatusBar
      if stayOnTop is not None:                self.stayOnTop = stayOnTop
      if menu is not None:                     self.menu = menu
      if font is not None:                     self.font = font
      if sizeAnchor is not None:               self.sizeAnchor = sizeAnchor
      if size is not None:                     self.size = size
      if clientSize is not None:               self.clientSize = clientSize
      if anchor is not None:                   self.anchor = anchor
      if position is not None:                 self.position = position
      if disabled is not None:                 self.disabled = disabled
      if state is not None:                    self.state = state
      if visible is not None:                  self.visible = visible
      if isDocument is not None:               self.isDocument = isDocument
      if mergeMenus is not None:               self.mergeMenus = mergeMenus
      if hasHorzScroll is not None:            self.hasHorzScroll = hasHorzScroll
      if hasVertScroll is not None:            self.hasVertScroll = hasVertScroll
      if dontHideScroll is not None:           self.dontHideScroll = dontHideScroll
      if dontScrollVert is not None:           self.dontScrollVert = dontScrollVert
      if dontScrollHorz is not None:           self.dontScrollHorz = dontScrollHorz
      if snapVertScroll is not None:           self.snapVertScroll = snapVertScroll
      if snapHorzScroll is not None:           self.snapHorzScroll = snapHorzScroll
      if scroll is not None:                   self.scroll = scroll
      if modifyVirtualArea is not None:        self.modifyVirtualArea = modifyVirtualArea
      if dontAutoScrollArea is not None:       self.dontAutoScrollArea = dontAutoScrollArea
      if fileName is not None:                 self.fileName = fileName
      if id is not None:                       self.id = id
      if modifiedDocument is not None:         self.modifiedDocument = modifiedDocument
      if showInTaskBar is not None:            self.showInTaskBar = showInTaskBar
      if saveDialog is not None:               self.saveDialog = saveDialog
      if isActiveClient is not None:           self.isActiveClient = isActiveClient
      if cursor is not None:                   self.cursor = cursor
      if name is not None:                     self.name = name
      if displayDriver is not None:            self.displayDriver = displayDriver
      if autoCreate is not None:               self.autoCreate = autoCreate
      if scrollArea is not None:               self.scrollArea = scrollArea
      if is3D is not None:                     self.is3D = is3D
      if closing is not None:                  self.closing = closing
      if fullRender is not None:               self.fullRender = fullRender
      if icon is not None:                     self.icon = icon
      if moveable is not None:                 self.moveable = moveable
      if alphaBlend is not None:               self.alphaBlend = alphaBlend
      if useSharedMemory is not None:          self.useSharedMemory = useSharedMemory
      if glCapabilities is not None:           self.glCapabilities = glCapabilities
      if creationActivation is not None:       self.creationActivation = creationActivation
      if nativeDecorations is not None:        self.nativeDecorations = nativeDecorations
      if manageDisplay is not None:            self.manageDisplay = manageDisplay
      if text is not None:                     self.text = text
      if controller is not None:               self.controller = controller
      if noConsequential is not None:          self.noConsequential = noConsequential
      if toolTip is not None:                  self.toolTip = toolTip
      if type is not None:                     self.type = type
      if data is not None:                     self.data = data
      if fieldData is not None:                self.fieldData = fieldData
      if editor is not None:                   self.editor = editor
      if readOnly is not None:                 self.readOnly = readOnly
      if keepEditor is not None:               self.keepEditor = keepEditor
      if autoSize is not None:                 self.autoSize = autoSize
      if needUpdate is not None:               self.needUpdate = needUpdate
      if stringValue is not None:              self.stringValue = stringValue
      if filter is not None:                   self.filter = filter
      if filtered is not None:                 self.filtered = filtered
      if exclusion is not None:                self.exclusion = exclusion
      if filterField is not None:              self.filterField = filterField
      if nameField is not None:                self.nameField = nameField
      if showNone is not None:                 self.showNone = showNone
      if getDecorationsSize is not None:       self.getDecorationsSize = getDecorationsSize
      if isInside is not None:                 self.isInside = isInside
      if isMouseMoving is not None:            self.isMouseMoving = isMouseMoving
      if isMouseResizing is not None:          self.isMouseResizing = isMouseResizing
      if isOpaque is not None:                 self.isOpaque = isOpaque
      if notifyActivate is not None:           self.notifyActivate = notifyActivate
      if notifyDestroyed is not None:          self.notifyDestroyed = notifyDestroyed
      if notifySaved is not None:              self.notifySaved = notifySaved
      if onActivate is not None:               self.onActivate = onActivate
      if onActivateClient is not None:         self.onActivateClient = onActivateClient
      if onApplyGraphics is not None:          self.onApplyGraphics = onApplyGraphics
      if onChildAddedOrRemoved is not None:    self.onChildAddedOrRemoved = onChildAddedOrRemoved
      if onChildResized is not None:           self.onChildResized = onChildResized
      if onChildVisibilityToggled is not None: self.onChildVisibilityToggled = onChildVisibilityToggled
      if onClose is not None:                  self.onClose = onClose
      if onCreate is not None:                 self.onCreate = onCreate
      if onDestroy is not None:                self.onDestroy = onDestroy
      if onDestroyed is not None:              self.onDestroyed = onDestroyed
      if onDrawOverChildren is not None:       self.onDrawOverChildren = onDrawOverChildren
      if onFileModified is not None:           self.onFileModified = onFileModified
      if onHScroll is not None:                self.onHScroll = onHScroll
      if onKeyDown is not None:                self.onKeyDown = onKeyDown
      if onKeyHit is not None:                 self.onKeyHit = onKeyHit
      if onKeyUp is not None:                  self.onKeyUp = onKeyUp
      if onLeftButtonDown is not None:         self.onLeftButtonDown = onLeftButtonDown
      if onLeftButtonUp is not None:           self.onLeftButtonUp = onLeftButtonUp
      if onLeftDoubleClick is not None:        self.onLeftDoubleClick = onLeftDoubleClick
      if onLoadGraphics is not None:           self.onLoadGraphics = onLoadGraphics
      if onMiddleButtonDown is not None:       self.onMiddleButtonDown = onMiddleButtonDown
      if onMiddleButtonUp is not None:         self.onMiddleButtonUp = onMiddleButtonUp
      if onMiddleDoubleClick is not None:      self.onMiddleDoubleClick = onMiddleDoubleClick
      if onMouseCaptureLost is not None:       self.onMouseCaptureLost = onMouseCaptureLost
      if onMouseLeave is not None:             self.onMouseLeave = onMouseLeave
      if onMouseMove is not None:              self.onMouseMove = onMouseMove
      if onMouseOver is not None:              self.onMouseOver = onMouseOver
      if onMoving is not None:                 self.onMoving = onMoving
      if onMultiTouch is not None:             self.onMultiTouch = onMultiTouch
      if onPosition is not None:               self.onPosition = onPosition
      if onPostCreate is not None:             self.onPostCreate = onPostCreate
      if onRedraw is not None:                 self.onRedraw = onRedraw
      if onResize is not None:                 self.onResize = onResize
      if onResizing is not None:               self.onResizing = onResizing
      if onRightButtonDown is not None:        self.onRightButtonDown = onRightButtonDown
      if onRightButtonUp is not None:          self.onRightButtonUp = onRightButtonUp
      if onRightDoubleClick is not None:       self.onRightDoubleClick = onRightDoubleClick
      if onSaveFile is not None:               self.onSaveFile = onSaveFile
      if onStateChange is not None:            self.onStateChange = onStateChange
      if onSysKeyDown is not None:             self.onSysKeyDown = onSysKeyDown
      if onSysKeyHit is not None:              self.onSysKeyHit = onSysKeyHit
      if onSysKeyUp is not None:               self.onSysKeyUp = onSysKeyUp
      if onUnloadGraphics is not None:         self.onUnloadGraphics = onUnloadGraphics
      if onVScroll is not None:                self.onVScroll = onVScroll
      if preShowDecorations is not None:       self.preShowDecorations = preShowDecorations
      if setBox is not None:                   self.setBox = setBox
      if setWindowArea is not None:            self.setWindowArea = setWindowArea
      if setWindowMinimum is not None:         self.setWindowMinimum = setWindowMinimum
      if showDecorations is not None:          self.showDecorations = showDecorations
      if updateNonClient is not None:          self.updateNonClient = updateNonClient
      if notifyChanged is not None:            self.notifyChanged = notifyChanged
      if notifyModified is not None:           self.notifyModified = notifyModified
      if onConfigure is not None:              self.onConfigure = onConfigure
      if setData is not None:                  self.setData = setData
      if refillFunction is not None:           self.refillFunction = refillFunction

   @property
   def type(self): return Class(impl = IPTR(lib, ffi, self, EditDropDataBox).type)
   @type.setter
   def type(self, value):
      if not isinstance(value, Class): value = Class(value)
      IPTR(lib, ffi, self, EditDropDataBox).type = value.impl

   @property
   def data(self): return IPTR(lib, ffi, self, EditDropDataBox).data
   @data.setter
   def data(self, value): IPTR(lib, ffi, self, EditDropDataBox).data = value

   @property
   def fieldData(self): return IPTR(lib, ffi, self, EditDropDataBox).fieldData
   @fieldData.setter
   def fieldData(self, value): IPTR(lib, ffi, self, EditDropDataBox).fieldData = value

   @property
   def editor(self): return Window(impl = IPTR(lib, ffi, self, EditDropDataBox).editor)
   @editor.setter
   def editor(self, value):
      if not isinstance(value, Window): value = Window(value)
      IPTR(lib, ffi, self, EditDropDataBox).editor = value.impl

   @property
   def readOnly(self): return IPTR(lib, ffi, self, EditDropDataBox).readOnly
   @readOnly.setter
   def readOnly(self, value): IPTR(lib, ffi, self, EditDropDataBox).readOnly = value

   @property
   def keepEditor(self): return IPTR(lib, ffi, self, EditDropDataBox).keepEditor
   @keepEditor.setter
   def keepEditor(self, value): IPTR(lib, ffi, self, EditDropDataBox).keepEditor = value

   @property
   def autoSize(self): return IPTR(lib, ffi, self, EditDropDataBox).autoSize
   @autoSize.setter
   def autoSize(self, value): IPTR(lib, ffi, self, EditDropDataBox).autoSize = value

   @property
   def needUpdate(self): return IPTR(lib, ffi, self, EditDropDataBox).needUpdate
   @needUpdate.setter
   def needUpdate(self, value): IPTR(lib, ffi, self, EditDropDataBox).needUpdate = value

   @property
   def stringValue(self): return String(impl = IPTR(lib, ffi, self, EditDropDataBox).stringValue)
   @stringValue.setter
   def stringValue(self, value):
      if not isinstance(value, String): value = String(value)
      IPTR(lib, ffi, self, EditDropDataBox).stringValue = value.impl

@ffi.callback("void(EditFieldDropDataBox, Row, TableDropBox, const char *)")
def cb_EditFieldDropDataBox_onAddTextEntry(__e, row, dropBox, entry):
   editfielddropdatabox = pyOrNewObject(EditFieldDropDataBox, __e)
   editfielddropdatabox.fn_EditFieldDropDataBox_onAddTextEntry(editfielddropdatabox, pyOrNewObject(Row, row), pyOrNewObject(TableDropBox, dropBox), entry.encode('utf8'))

class EditFieldDropDataBox(FieldDropDataBox):
   def __init__(self,
                parent = None,
                master = None,
                caption = None,
                hotKey = None,
                background = None,
                opacity = None,
                foreground = None,
                borderStyle = None,
                minClientSize = None,
                maxClientSize = None,
                hasMaximize = None,
                hasMinimize = None,
                hasClose = None,
                nonClient = None,
                inactive = None,
                clickThrough = None,
                isRemote = None,
                noCycle = None,
                isModal = None,
                interim = None,
                tabCycle = None,
                isDefault = None,
                drawBehind = None,
                hasMenuBar = None,
                hasStatusBar = None,
                stayOnTop = None,
                menu = None,
                font = None,
                sizeAnchor = None,
                size = None,
                clientSize = None,
                anchor = None,
                position = None,
                disabled = None,
                state = None,
                visible = None,
                isDocument = None,
                mergeMenus = None,
                hasHorzScroll = None,
                hasVertScroll = None,
                dontHideScroll = None,
                dontScrollVert = None,
                dontScrollHorz = None,
                snapVertScroll = None,
                snapHorzScroll = None,
                scroll = None,
                modifyVirtualArea = None,
                dontAutoScrollArea = None,
                fileName = None,
                id = None,
                modifiedDocument = None,
                showInTaskBar = None,
                saveDialog = None,
                isActiveClient = None,
                cursor = None,
                name = None,
                displayDriver = None,
                autoCreate = None,
                scrollArea = None,
                is3D = None,
                closing = None,
                fullRender = None,
                icon = None,
                moveable = None,
                alphaBlend = None,
                useSharedMemory = None,
                glCapabilities = None,
                creationActivation = None,
                nativeDecorations = None,
                manageDisplay = None,
                text = None,
                controller = None,
                noConsequential = None,
                toolTip = None,
                type = None,
                data = None,
                fieldData = None,
                editor = None,
                readOnly = None,
                keepEditor = None,
                autoSize = None,
                needUpdate = None,
                stringValue = None,
                row = None,
                field = None,
                filter = None,
                filtered = None,
                exclusion = None,
                filterField = None,
                nameField = None,
                showNone = None,
                getDecorationsSize = None,
                isInside = None,
                isMouseMoving = None,
                isMouseResizing = None,
                isOpaque = None,
                notifyActivate = None,
                notifyDestroyed = None,
                notifySaved = None,
                onActivate = None,
                onActivateClient = None,
                onApplyGraphics = None,
                onChildAddedOrRemoved = None,
                onChildResized = None,
                onChildVisibilityToggled = None,
                onClose = None,
                onCreate = None,
                onDestroy = None,
                onDestroyed = None,
                onDrawOverChildren = None,
                onFileModified = None,
                onHScroll = None,
                onKeyDown = None,
                onKeyHit = None,
                onKeyUp = None,
                onLeftButtonDown = None,
                onLeftButtonUp = None,
                onLeftDoubleClick = None,
                onLoadGraphics = None,
                onMiddleButtonDown = None,
                onMiddleButtonUp = None,
                onMiddleDoubleClick = None,
                onMouseCaptureLost = None,
                onMouseLeave = None,
                onMouseMove = None,
                onMouseOver = None,
                onMoving = None,
                onMultiTouch = None,
                onPosition = None,
                onPostCreate = None,
                onRedraw = None,
                onResize = None,
                onResizing = None,
                onRightButtonDown = None,
                onRightButtonUp = None,
                onRightDoubleClick = None,
                onSaveFile = None,
                onStateChange = None,
                onSysKeyDown = None,
                onSysKeyHit = None,
                onSysKeyUp = None,
                onUnloadGraphics = None,
                onVScroll = None,
                preShowDecorations = None,
                setBox = None,
                setWindowArea = None,
                setWindowMinimum = None,
                showDecorations = None,
                updateNonClient = None,
                notifyChanged = None,
                notifyModified = None,
                onConfigure = None,
                setData = None,
                save = None,
                refillFunction = None,
                onAddTextEntry = None,
                impl = None):
      FieldDropDataBox.__init__(self, impl = impl)
      if parent is not None:                   self.parent = parent
      if master is not None:                   self.master = master
      if caption is not None:                  self.caption = caption
      if hotKey is not None:                   self.hotKey = hotKey
      if background is not None:               self.background = background
      if opacity is not None:                  self.opacity = opacity
      if foreground is not None:               self.foreground = foreground
      if borderStyle is not None:              self.borderStyle = borderStyle
      if minClientSize is not None:            self.minClientSize = minClientSize
      if maxClientSize is not None:            self.maxClientSize = maxClientSize
      if hasMaximize is not None:              self.hasMaximize = hasMaximize
      if hasMinimize is not None:              self.hasMinimize = hasMinimize
      if hasClose is not None:                 self.hasClose = hasClose
      if nonClient is not None:                self.nonClient = nonClient
      if inactive is not None:                 self.inactive = inactive
      if clickThrough is not None:             self.clickThrough = clickThrough
      if isRemote is not None:                 self.isRemote = isRemote
      if noCycle is not None:                  self.noCycle = noCycle
      if isModal is not None:                  self.isModal = isModal
      if interim is not None:                  self.interim = interim
      if tabCycle is not None:                 self.tabCycle = tabCycle
      if isDefault is not None:                self.isDefault = isDefault
      if drawBehind is not None:               self.drawBehind = drawBehind
      if hasMenuBar is not None:               self.hasMenuBar = hasMenuBar
      if hasStatusBar is not None:             self.hasStatusBar = hasStatusBar
      if stayOnTop is not None:                self.stayOnTop = stayOnTop
      if menu is not None:                     self.menu = menu
      if font is not None:                     self.font = font
      if sizeAnchor is not None:               self.sizeAnchor = sizeAnchor
      if size is not None:                     self.size = size
      if clientSize is not None:               self.clientSize = clientSize
      if anchor is not None:                   self.anchor = anchor
      if position is not None:                 self.position = position
      if disabled is not None:                 self.disabled = disabled
      if state is not None:                    self.state = state
      if visible is not None:                  self.visible = visible
      if isDocument is not None:               self.isDocument = isDocument
      if mergeMenus is not None:               self.mergeMenus = mergeMenus
      if hasHorzScroll is not None:            self.hasHorzScroll = hasHorzScroll
      if hasVertScroll is not None:            self.hasVertScroll = hasVertScroll
      if dontHideScroll is not None:           self.dontHideScroll = dontHideScroll
      if dontScrollVert is not None:           self.dontScrollVert = dontScrollVert
      if dontScrollHorz is not None:           self.dontScrollHorz = dontScrollHorz
      if snapVertScroll is not None:           self.snapVertScroll = snapVertScroll
      if snapHorzScroll is not None:           self.snapHorzScroll = snapHorzScroll
      if scroll is not None:                   self.scroll = scroll
      if modifyVirtualArea is not None:        self.modifyVirtualArea = modifyVirtualArea
      if dontAutoScrollArea is not None:       self.dontAutoScrollArea = dontAutoScrollArea
      if fileName is not None:                 self.fileName = fileName
      if id is not None:                       self.id = id
      if modifiedDocument is not None:         self.modifiedDocument = modifiedDocument
      if showInTaskBar is not None:            self.showInTaskBar = showInTaskBar
      if saveDialog is not None:               self.saveDialog = saveDialog
      if isActiveClient is not None:           self.isActiveClient = isActiveClient
      if cursor is not None:                   self.cursor = cursor
      if name is not None:                     self.name = name
      if displayDriver is not None:            self.displayDriver = displayDriver
      if autoCreate is not None:               self.autoCreate = autoCreate
      if scrollArea is not None:               self.scrollArea = scrollArea
      if is3D is not None:                     self.is3D = is3D
      if closing is not None:                  self.closing = closing
      if fullRender is not None:               self.fullRender = fullRender
      if icon is not None:                     self.icon = icon
      if moveable is not None:                 self.moveable = moveable
      if alphaBlend is not None:               self.alphaBlend = alphaBlend
      if useSharedMemory is not None:          self.useSharedMemory = useSharedMemory
      if glCapabilities is not None:           self.glCapabilities = glCapabilities
      if creationActivation is not None:       self.creationActivation = creationActivation
      if nativeDecorations is not None:        self.nativeDecorations = nativeDecorations
      if manageDisplay is not None:            self.manageDisplay = manageDisplay
      if text is not None:                     self.text = text
      if controller is not None:               self.controller = controller
      if noConsequential is not None:          self.noConsequential = noConsequential
      if toolTip is not None:                  self.toolTip = toolTip
      if type is not None:                     self.type = type
      if data is not None:                     self.data = data
      if fieldData is not None:                self.fieldData = fieldData
      if editor is not None:                   self.editor = editor
      if readOnly is not None:                 self.readOnly = readOnly
      if keepEditor is not None:               self.keepEditor = keepEditor
      if autoSize is not None:                 self.autoSize = autoSize
      if needUpdate is not None:               self.needUpdate = needUpdate
      if stringValue is not None:              self.stringValue = stringValue
      if row is not None:                      self.row = row
      if field is not None:                    self.field = field
      if filter is not None:                   self.filter = filter
      if filtered is not None:                 self.filtered = filtered
      if exclusion is not None:                self.exclusion = exclusion
      if filterField is not None:              self.filterField = filterField
      if nameField is not None:                self.nameField = nameField
      if showNone is not None:                 self.showNone = showNone
      if getDecorationsSize is not None:       self.getDecorationsSize = getDecorationsSize
      if isInside is not None:                 self.isInside = isInside
      if isMouseMoving is not None:            self.isMouseMoving = isMouseMoving
      if isMouseResizing is not None:          self.isMouseResizing = isMouseResizing
      if isOpaque is not None:                 self.isOpaque = isOpaque
      if notifyActivate is not None:           self.notifyActivate = notifyActivate
      if notifyDestroyed is not None:          self.notifyDestroyed = notifyDestroyed
      if notifySaved is not None:              self.notifySaved = notifySaved
      if onActivate is not None:               self.onActivate = onActivate
      if onActivateClient is not None:         self.onActivateClient = onActivateClient
      if onApplyGraphics is not None:          self.onApplyGraphics = onApplyGraphics
      if onChildAddedOrRemoved is not None:    self.onChildAddedOrRemoved = onChildAddedOrRemoved
      if onChildResized is not None:           self.onChildResized = onChildResized
      if onChildVisibilityToggled is not None: self.onChildVisibilityToggled = onChildVisibilityToggled
      if onClose is not None:                  self.onClose = onClose
      if onCreate is not None:                 self.onCreate = onCreate
      if onDestroy is not None:                self.onDestroy = onDestroy
      if onDestroyed is not None:              self.onDestroyed = onDestroyed
      if onDrawOverChildren is not None:       self.onDrawOverChildren = onDrawOverChildren
      if onFileModified is not None:           self.onFileModified = onFileModified
      if onHScroll is not None:                self.onHScroll = onHScroll
      if onKeyDown is not None:                self.onKeyDown = onKeyDown
      if onKeyHit is not None:                 self.onKeyHit = onKeyHit
      if onKeyUp is not None:                  self.onKeyUp = onKeyUp
      if onLeftButtonDown is not None:         self.onLeftButtonDown = onLeftButtonDown
      if onLeftButtonUp is not None:           self.onLeftButtonUp = onLeftButtonUp
      if onLeftDoubleClick is not None:        self.onLeftDoubleClick = onLeftDoubleClick
      if onLoadGraphics is not None:           self.onLoadGraphics = onLoadGraphics
      if onMiddleButtonDown is not None:       self.onMiddleButtonDown = onMiddleButtonDown
      if onMiddleButtonUp is not None:         self.onMiddleButtonUp = onMiddleButtonUp
      if onMiddleDoubleClick is not None:      self.onMiddleDoubleClick = onMiddleDoubleClick
      if onMouseCaptureLost is not None:       self.onMouseCaptureLost = onMouseCaptureLost
      if onMouseLeave is not None:             self.onMouseLeave = onMouseLeave
      if onMouseMove is not None:              self.onMouseMove = onMouseMove
      if onMouseOver is not None:              self.onMouseOver = onMouseOver
      if onMoving is not None:                 self.onMoving = onMoving
      if onMultiTouch is not None:             self.onMultiTouch = onMultiTouch
      if onPosition is not None:               self.onPosition = onPosition
      if onPostCreate is not None:             self.onPostCreate = onPostCreate
      if onRedraw is not None:                 self.onRedraw = onRedraw
      if onResize is not None:                 self.onResize = onResize
      if onResizing is not None:               self.onResizing = onResizing
      if onRightButtonDown is not None:        self.onRightButtonDown = onRightButtonDown
      if onRightButtonUp is not None:          self.onRightButtonUp = onRightButtonUp
      if onRightDoubleClick is not None:       self.onRightDoubleClick = onRightDoubleClick
      if onSaveFile is not None:               self.onSaveFile = onSaveFile
      if onStateChange is not None:            self.onStateChange = onStateChange
      if onSysKeyDown is not None:             self.onSysKeyDown = onSysKeyDown
      if onSysKeyHit is not None:              self.onSysKeyHit = onSysKeyHit
      if onSysKeyUp is not None:               self.onSysKeyUp = onSysKeyUp
      if onUnloadGraphics is not None:         self.onUnloadGraphics = onUnloadGraphics
      if onVScroll is not None:                self.onVScroll = onVScroll
      if preShowDecorations is not None:       self.preShowDecorations = preShowDecorations
      if setBox is not None:                   self.setBox = setBox
      if setWindowArea is not None:            self.setWindowArea = setWindowArea
      if setWindowMinimum is not None:         self.setWindowMinimum = setWindowMinimum
      if showDecorations is not None:          self.showDecorations = showDecorations
      if updateNonClient is not None:          self.updateNonClient = updateNonClient
      if notifyChanged is not None:            self.notifyChanged = notifyChanged
      if notifyModified is not None:           self.notifyModified = notifyModified
      if onConfigure is not None:              self.onConfigure = onConfigure
      if setData is not None:                  self.setData = setData
      if save is not None:                     self.save = save
      if refillFunction is not None:           self.refillFunction = refillFunction
      if onAddTextEntry is not None:           self.onAddTextEntry = onAddTextEntry

   @property
   def type(self): return Class(impl = IPTR(lib, ffi, self, EditFieldDropDataBox).type)
   @type.setter
   def type(self, value):
      if not isinstance(value, Class): value = Class(value)
      IPTR(lib, ffi, self, EditFieldDropDataBox).type = value.impl

   @property
   def data(self): return IPTR(lib, ffi, self, EditFieldDropDataBox).data
   @data.setter
   def data(self, value): IPTR(lib, ffi, self, EditFieldDropDataBox).data = value

   @property
   def fieldData(self): return IPTR(lib, ffi, self, EditFieldDropDataBox).fieldData
   @fieldData.setter
   def fieldData(self, value): IPTR(lib, ffi, self, EditFieldDropDataBox).fieldData = value

   @property
   def editor(self): return Window(impl = IPTR(lib, ffi, self, EditFieldDropDataBox).editor)
   @editor.setter
   def editor(self, value):
      if not isinstance(value, Window): value = Window(value)
      IPTR(lib, ffi, self, EditFieldDropDataBox).editor = value.impl

   @property
   def readOnly(self): return IPTR(lib, ffi, self, EditFieldDropDataBox).readOnly
   @readOnly.setter
   def readOnly(self, value): IPTR(lib, ffi, self, EditFieldDropDataBox).readOnly = value

   @property
   def keepEditor(self): return IPTR(lib, ffi, self, EditFieldDropDataBox).keepEditor
   @keepEditor.setter
   def keepEditor(self, value): IPTR(lib, ffi, self, EditFieldDropDataBox).keepEditor = value

   @property
   def autoSize(self): return IPTR(lib, ffi, self, EditFieldDropDataBox).autoSize
   @autoSize.setter
   def autoSize(self, value): IPTR(lib, ffi, self, EditFieldDropDataBox).autoSize = value

   @property
   def needUpdate(self): return IPTR(lib, ffi, self, EditFieldDropDataBox).needUpdate
   @needUpdate.setter
   def needUpdate(self, value): IPTR(lib, ffi, self, EditFieldDropDataBox).needUpdate = value

   @property
   def stringValue(self): return String(impl = IPTR(lib, ffi, self, EditFieldDropDataBox).stringValue)
   @stringValue.setter
   def stringValue(self, value):
      if not isinstance(value, String): value = String(value)
      IPTR(lib, ffi, self, EditFieldDropDataBox).stringValue = value.impl

   def fn_unset_EditFieldDropDataBox_onAddTextEntry(self, row, dropBox, entry):
      return lib.EditFieldDropDataBox_onAddTextEntry(self.impl, ffi.NULL if row is None else row.impl, ffi.NULL if dropBox is None else dropBox.impl, entry)

   @property
   def onAddTextEntry(self):
      if hasattr(self, 'fn_EditFieldDropDataBox_onAddTextEntry'): return self.fn_EditFieldDropDataBox_onAddTextEntry
      else: return self.fn_unset_EditFieldDropDataBox_onAddTextEntry
   @onAddTextEntry.setter
   def onAddTextEntry(self, value):
      self.fn_EditFieldDropDataBox_onAddTextEntry = value
      lib.Instance_setMethod(self.impl, "OnAddTextEntry".encode('utf8'), cb_EditFieldDropDataBox_onAddTextEntry)

@ffi.callback("void(Window, EditSection)")
def cb_EditSection_notifyEditClear(__w, editSection):
   editSection = pyOrNewObject(EditSection, editSection)
   editSection.fn_EditSection_notifyEditClear(pyOrNewObject(EditSection, __w), editSection)

@ffi.callback("void(Window, EditSection)")
def cb_EditSection_notifyEditLoad(__w, editSection):
   editSection = pyOrNewObject(EditSection, editSection)
   editSection.fn_EditSection_notifyEditLoad(pyOrNewObject(EditSection, __w), editSection)

@ffi.callback("void(Window, EditSection, String)")
def cb_EditSection_notifyEditSave(__w, edit, name):
   edit = pyOrNewObject(EditSection, edit)
   edit.fn_EditSection_notifyEditSave(pyOrNewObject(EditSection, __w), edit, name)

@ffi.callback("void(Window, EditSection)")
def cb_EditSection_notifyInitFields(__w, editSection):
   editSection = pyOrNewObject(EditSection, editSection)
   editSection.fn_EditSection_notifyInitFields(pyOrNewObject(EditSection, __w), editSection)

class EditSection(Group):
   def __init__(self,
                parent = None,
                master = None,
                caption = None,
                hotKey = None,
                background = None,
                opacity = None,
                foreground = None,
                borderStyle = None,
                minClientSize = None,
                maxClientSize = None,
                hasMaximize = None,
                hasMinimize = None,
                hasClose = None,
                nonClient = None,
                inactive = None,
                clickThrough = None,
                isRemote = None,
                noCycle = None,
                isModal = None,
                interim = None,
                tabCycle = None,
                isDefault = None,
                drawBehind = None,
                hasMenuBar = None,
                hasStatusBar = None,
                stayOnTop = None,
                menu = None,
                font = None,
                sizeAnchor = None,
                size = None,
                clientSize = None,
                anchor = None,
                position = None,
                disabled = None,
                state = None,
                visible = None,
                isDocument = None,
                mergeMenus = None,
                hasHorzScroll = None,
                hasVertScroll = None,
                dontHideScroll = None,
                dontScrollVert = None,
                dontScrollHorz = None,
                snapVertScroll = None,
                snapHorzScroll = None,
                scroll = None,
                modifyVirtualArea = None,
                dontAutoScrollArea = None,
                fileName = None,
                id = None,
                modifiedDocument = None,
                showInTaskBar = None,
                saveDialog = None,
                isActiveClient = None,
                cursor = None,
                name = None,
                displayDriver = None,
                autoCreate = None,
                scrollArea = None,
                is3D = None,
                closing = None,
                fullRender = None,
                icon = None,
                moveable = None,
                alphaBlend = None,
                useSharedMemory = None,
                glCapabilities = None,
                creationActivation = None,
                nativeDecorations = None,
                manageDisplay = None,
                text = None,
                controller = None,
                noConsequential = None,
                title = None,
                list = None,
                table = None,
                editRow = None,
                listRow = None,
                editBoxes = None,
                editArea = None,
                btnSave = None,
                btnReload = None,
                getDecorationsSize = None,
                isInside = None,
                isMouseMoving = None,
                isMouseResizing = None,
                isOpaque = None,
                notifyActivate = None,
                notifyDestroyed = None,
                notifySaved = None,
                onActivate = None,
                onActivateClient = None,
                onApplyGraphics = None,
                onChildAddedOrRemoved = None,
                onChildResized = None,
                onChildVisibilityToggled = None,
                onClose = None,
                onCreate = None,
                onDestroy = None,
                onDestroyed = None,
                onDrawOverChildren = None,
                onFileModified = None,
                onHScroll = None,
                onKeyDown = None,
                onKeyHit = None,
                onKeyUp = None,
                onLeftButtonDown = None,
                onLeftButtonUp = None,
                onLeftDoubleClick = None,
                onLoadGraphics = None,
                onMiddleButtonDown = None,
                onMiddleButtonUp = None,
                onMiddleDoubleClick = None,
                onMouseCaptureLost = None,
                onMouseLeave = None,
                onMouseMove = None,
                onMouseOver = None,
                onMoving = None,
                onMultiTouch = None,
                onPosition = None,
                onPostCreate = None,
                onRedraw = None,
                onResize = None,
                onResizing = None,
                onRightButtonDown = None,
                onRightButtonUp = None,
                onRightDoubleClick = None,
                onSaveFile = None,
                onStateChange = None,
                onSysKeyDown = None,
                onSysKeyHit = None,
                onSysKeyUp = None,
                onUnloadGraphics = None,
                onVScroll = None,
                preShowDecorations = None,
                setBox = None,
                setWindowArea = None,
                setWindowMinimum = None,
                showDecorations = None,
                updateNonClient = None,
                notifyEditClear = None,
                notifyEditLoad = None,
                notifyEditSave = None,
                notifyInitFields = None,
                impl = None):
      Group.__init__(self, impl = impl)
      if parent is not None:                   self.parent = parent
      if master is not None:                   self.master = master
      if caption is not None:                  self.caption = caption
      if hotKey is not None:                   self.hotKey = hotKey
      if background is not None:               self.background = background
      if opacity is not None:                  self.opacity = opacity
      if foreground is not None:               self.foreground = foreground
      if borderStyle is not None:              self.borderStyle = borderStyle
      if minClientSize is not None:            self.minClientSize = minClientSize
      if maxClientSize is not None:            self.maxClientSize = maxClientSize
      if hasMaximize is not None:              self.hasMaximize = hasMaximize
      if hasMinimize is not None:              self.hasMinimize = hasMinimize
      if hasClose is not None:                 self.hasClose = hasClose
      if nonClient is not None:                self.nonClient = nonClient
      if inactive is not None:                 self.inactive = inactive
      if clickThrough is not None:             self.clickThrough = clickThrough
      if isRemote is not None:                 self.isRemote = isRemote
      if noCycle is not None:                  self.noCycle = noCycle
      if isModal is not None:                  self.isModal = isModal
      if interim is not None:                  self.interim = interim
      if tabCycle is not None:                 self.tabCycle = tabCycle
      if isDefault is not None:                self.isDefault = isDefault
      if drawBehind is not None:               self.drawBehind = drawBehind
      if hasMenuBar is not None:               self.hasMenuBar = hasMenuBar
      if hasStatusBar is not None:             self.hasStatusBar = hasStatusBar
      if stayOnTop is not None:                self.stayOnTop = stayOnTop
      if menu is not None:                     self.menu = menu
      if font is not None:                     self.font = font
      if sizeAnchor is not None:               self.sizeAnchor = sizeAnchor
      if size is not None:                     self.size = size
      if clientSize is not None:               self.clientSize = clientSize
      if anchor is not None:                   self.anchor = anchor
      if position is not None:                 self.position = position
      if disabled is not None:                 self.disabled = disabled
      if state is not None:                    self.state = state
      if visible is not None:                  self.visible = visible
      if isDocument is not None:               self.isDocument = isDocument
      if mergeMenus is not None:               self.mergeMenus = mergeMenus
      if hasHorzScroll is not None:            self.hasHorzScroll = hasHorzScroll
      if hasVertScroll is not None:            self.hasVertScroll = hasVertScroll
      if dontHideScroll is not None:           self.dontHideScroll = dontHideScroll
      if dontScrollVert is not None:           self.dontScrollVert = dontScrollVert
      if dontScrollHorz is not None:           self.dontScrollHorz = dontScrollHorz
      if snapVertScroll is not None:           self.snapVertScroll = snapVertScroll
      if snapHorzScroll is not None:           self.snapHorzScroll = snapHorzScroll
      if scroll is not None:                   self.scroll = scroll
      if modifyVirtualArea is not None:        self.modifyVirtualArea = modifyVirtualArea
      if dontAutoScrollArea is not None:       self.dontAutoScrollArea = dontAutoScrollArea
      if fileName is not None:                 self.fileName = fileName
      if id is not None:                       self.id = id
      if modifiedDocument is not None:         self.modifiedDocument = modifiedDocument
      if showInTaskBar is not None:            self.showInTaskBar = showInTaskBar
      if saveDialog is not None:               self.saveDialog = saveDialog
      if isActiveClient is not None:           self.isActiveClient = isActiveClient
      if cursor is not None:                   self.cursor = cursor
      if name is not None:                     self.name = name
      if displayDriver is not None:            self.displayDriver = displayDriver
      if autoCreate is not None:               self.autoCreate = autoCreate
      if scrollArea is not None:               self.scrollArea = scrollArea
      if is3D is not None:                     self.is3D = is3D
      if closing is not None:                  self.closing = closing
      if fullRender is not None:               self.fullRender = fullRender
      if icon is not None:                     self.icon = icon
      if moveable is not None:                 self.moveable = moveable
      if alphaBlend is not None:               self.alphaBlend = alphaBlend
      if useSharedMemory is not None:          self.useSharedMemory = useSharedMemory
      if glCapabilities is not None:           self.glCapabilities = glCapabilities
      if creationActivation is not None:       self.creationActivation = creationActivation
      if nativeDecorations is not None:        self.nativeDecorations = nativeDecorations
      if manageDisplay is not None:            self.manageDisplay = manageDisplay
      if text is not None:                     self.text = text
      if controller is not None:               self.controller = controller
      if noConsequential is not None:          self.noConsequential = noConsequential
      if title is not None:                    self.title = title
      if list is not None:                     self.list = list
      if table is not None:                    self.table = table
      if editRow is not None:                  self.editRow = editRow
      if listRow is not None:                  self.listRow = listRow
      if editBoxes is not None:                self.editBoxes = editBoxes
      if editArea is not None:                 self.editArea = editArea
      if btnSave is not None:                  self.btnSave = btnSave
      if btnReload is not None:                self.btnReload = btnReload
      if getDecorationsSize is not None:       self.getDecorationsSize = getDecorationsSize
      if isInside is not None:                 self.isInside = isInside
      if isMouseMoving is not None:            self.isMouseMoving = isMouseMoving
      if isMouseResizing is not None:          self.isMouseResizing = isMouseResizing
      if isOpaque is not None:                 self.isOpaque = isOpaque
      if notifyActivate is not None:           self.notifyActivate = notifyActivate
      if notifyDestroyed is not None:          self.notifyDestroyed = notifyDestroyed
      if notifySaved is not None:              self.notifySaved = notifySaved
      if onActivate is not None:               self.onActivate = onActivate
      if onActivateClient is not None:         self.onActivateClient = onActivateClient
      if onApplyGraphics is not None:          self.onApplyGraphics = onApplyGraphics
      if onChildAddedOrRemoved is not None:    self.onChildAddedOrRemoved = onChildAddedOrRemoved
      if onChildResized is not None:           self.onChildResized = onChildResized
      if onChildVisibilityToggled is not None: self.onChildVisibilityToggled = onChildVisibilityToggled
      if onClose is not None:                  self.onClose = onClose
      if onCreate is not None:                 self.onCreate = onCreate
      if onDestroy is not None:                self.onDestroy = onDestroy
      if onDestroyed is not None:              self.onDestroyed = onDestroyed
      if onDrawOverChildren is not None:       self.onDrawOverChildren = onDrawOverChildren
      if onFileModified is not None:           self.onFileModified = onFileModified
      if onHScroll is not None:                self.onHScroll = onHScroll
      if onKeyDown is not None:                self.onKeyDown = onKeyDown
      if onKeyHit is not None:                 self.onKeyHit = onKeyHit
      if onKeyUp is not None:                  self.onKeyUp = onKeyUp
      if onLeftButtonDown is not None:         self.onLeftButtonDown = onLeftButtonDown
      if onLeftButtonUp is not None:           self.onLeftButtonUp = onLeftButtonUp
      if onLeftDoubleClick is not None:        self.onLeftDoubleClick = onLeftDoubleClick
      if onLoadGraphics is not None:           self.onLoadGraphics = onLoadGraphics
      if onMiddleButtonDown is not None:       self.onMiddleButtonDown = onMiddleButtonDown
      if onMiddleButtonUp is not None:         self.onMiddleButtonUp = onMiddleButtonUp
      if onMiddleDoubleClick is not None:      self.onMiddleDoubleClick = onMiddleDoubleClick
      if onMouseCaptureLost is not None:       self.onMouseCaptureLost = onMouseCaptureLost
      if onMouseLeave is not None:             self.onMouseLeave = onMouseLeave
      if onMouseMove is not None:              self.onMouseMove = onMouseMove
      if onMouseOver is not None:              self.onMouseOver = onMouseOver
      if onMoving is not None:                 self.onMoving = onMoving
      if onMultiTouch is not None:             self.onMultiTouch = onMultiTouch
      if onPosition is not None:               self.onPosition = onPosition
      if onPostCreate is not None:             self.onPostCreate = onPostCreate
      if onRedraw is not None:                 self.onRedraw = onRedraw
      if onResize is not None:                 self.onResize = onResize
      if onResizing is not None:               self.onResizing = onResizing
      if onRightButtonDown is not None:        self.onRightButtonDown = onRightButtonDown
      if onRightButtonUp is not None:          self.onRightButtonUp = onRightButtonUp
      if onRightDoubleClick is not None:       self.onRightDoubleClick = onRightDoubleClick
      if onSaveFile is not None:               self.onSaveFile = onSaveFile
      if onStateChange is not None:            self.onStateChange = onStateChange
      if onSysKeyDown is not None:             self.onSysKeyDown = onSysKeyDown
      if onSysKeyHit is not None:              self.onSysKeyHit = onSysKeyHit
      if onSysKeyUp is not None:               self.onSysKeyUp = onSysKeyUp
      if onUnloadGraphics is not None:         self.onUnloadGraphics = onUnloadGraphics
      if onVScroll is not None:                self.onVScroll = onVScroll
      if preShowDecorations is not None:       self.preShowDecorations = preShowDecorations
      if setBox is not None:                   self.setBox = setBox
      if setWindowArea is not None:            self.setWindowArea = setWindowArea
      if setWindowMinimum is not None:         self.setWindowMinimum = setWindowMinimum
      if showDecorations is not None:          self.showDecorations = showDecorations
      if updateNonClient is not None:          self.updateNonClient = updateNonClient
      if notifyEditClear is not None:          self.notifyEditClear = notifyEditClear
      if notifyEditLoad is not None:           self.notifyEditLoad = notifyEditLoad
      if notifyEditSave is not None:           self.notifyEditSave = notifyEditSave
      if notifyInitFields is not None:         self.notifyInitFields = notifyInitFields

   @property
   def title(self): return Label(impl = IPTR(lib, ffi, self, EditSection).title)
   @title.setter
   def title(self, value):
      if not isinstance(value, Label): value = Label(value)
      IPTR(lib, ffi, self, EditSection).title = value.impl

   @property
   def list(self): return ListSection(impl = IPTR(lib, ffi, self, EditSection).list)
   @list.setter
   def list(self, value):
      if not isinstance(value, ListSection): value = ListSection(value)
      IPTR(lib, ffi, self, EditSection).list = value.impl

   @property
   def table(self): return None
   @table.setter
   def table(self, value):
      if not isinstance(value, Table): value = Table(value)
      lib.EditSection_set_table(self.impl, value.impl)

   @property
   def editRow(self): return Row(impl = IPTR(lib, ffi, self, EditSection).editRow)
   @editRow.setter
   def editRow(self, value):
      if not isinstance(value, Row): value = Row(value)
      IPTR(lib, ffi, self, EditSection).editRow = value.impl

   @property
   def listRow(self): return DataRow(impl = IPTR(lib, ffi, self, EditSection).listRow)
   @listRow.setter
   def listRow(self, value):
      if not isinstance(value, DataRow): value = DataRow(value)
      IPTR(lib, ffi, self, EditSection).listRow = value.impl

   @property
   def editBoxes(self): return OldList(impl = IPTR(lib, ffi, self, EditSection).editBoxes)
   @editBoxes.setter
   def editBoxes(self, value):
      if not isinstance(value, OldList): value = OldList(value)
      IPTR(lib, ffi, self, EditSection).editBoxes = value.impl

   @property
   def editArea(self): return Window(impl = IPTR(lib, ffi, self, EditSection).editArea)
   @editArea.setter
   def editArea(self, value):
      if not isinstance(value, Window): value = Window(value)
      IPTR(lib, ffi, self, EditSection).editArea = value.impl

   @property
   def btnSave(self): return ButtonStyle(impl = IPTR(lib, ffi, self, EditSection).btnSave)
   @btnSave.setter
   def btnSave(self, value):
      if not isinstance(value, ButtonStyle): value = ButtonStyle(value)
      IPTR(lib, ffi, self, EditSection).btnSave = value.impl

   @property
   def btnReload(self): return ButtonStyle(impl = IPTR(lib, ffi, self, EditSection).btnReload)
   @btnReload.setter
   def btnReload(self, value):
      if not isinstance(value, ButtonStyle): value = ButtonStyle(value)
      IPTR(lib, ffi, self, EditSection).btnReload = value.impl

   def addFieldEditor(self, box):
      if box is not None and not isinstance(box, FieldDataBox): box = FieldDataBox(box)
      if box is None: box = ffi.NULL
      lib.EditSection_addFieldEditor(self.impl, box)

   def editClear(self):
      lib.EditSection_editClear(self.impl)

   def editLoad(self):
      lib.EditSection_editLoad(self.impl)

   def editNew(self):
      lib.EditSection_editNew(self.impl)

   def editSave(self):
      lib.EditSection_editSave(self.impl)

   def initFields(self):
      lib.EditSection_initFields(self.impl)

   def fn_unset_EditSection_notifyEditClear(self, _window, editSection):
      return lib.EditSection_notifyEditClear(self.impl, _window.impl, ffi.NULL if editSection is None else editSection.impl)

   @property
   def notifyEditClear(self):
      if hasattr(self, 'fn_EditSection_notifyEditClear'): return self.fn_EditSection_notifyEditClear
      else: return self.fn_unset_EditSection_notifyEditClear
   @notifyEditClear.setter
   def notifyEditClear(self, value):
      self.fn_EditSection_notifyEditClear = value
      lib.Instance_setMethod(self.impl, "NotifyEditClear".encode('utf8'), cb_EditSection_notifyEditClear)

   def fn_unset_EditSection_notifyEditLoad(self, _window, editSection):
      return lib.EditSection_notifyEditLoad(self.impl, _window.impl, ffi.NULL if editSection is None else editSection.impl)

   @property
   def notifyEditLoad(self):
      if hasattr(self, 'fn_EditSection_notifyEditLoad'): return self.fn_EditSection_notifyEditLoad
      else: return self.fn_unset_EditSection_notifyEditLoad
   @notifyEditLoad.setter
   def notifyEditLoad(self, value):
      self.fn_EditSection_notifyEditLoad = value
      lib.Instance_setMethod(self.impl, "NotifyEditLoad".encode('utf8'), cb_EditSection_notifyEditLoad)

   def fn_unset_EditSection_notifyEditSave(self, _window, edit, name):
      return lib.EditSection_notifyEditSave(self.impl, _window.impl, ffi.NULL if edit is None else edit.impl, ffi.NULL if name is None else name.impl)

   @property
   def notifyEditSave(self):
      if hasattr(self, 'fn_EditSection_notifyEditSave'): return self.fn_EditSection_notifyEditSave
      else: return self.fn_unset_EditSection_notifyEditSave
   @notifyEditSave.setter
   def notifyEditSave(self, value):
      self.fn_EditSection_notifyEditSave = value
      lib.Instance_setMethod(self.impl, "NotifyEditSave".encode('utf8'), cb_EditSection_notifyEditSave)

   def fn_unset_EditSection_notifyInitFields(self, _window, editSection):
      return lib.EditSection_notifyInitFields(self.impl, _window.impl, ffi.NULL if editSection is None else editSection.impl)

   @property
   def notifyInitFields(self):
      if hasattr(self, 'fn_EditSection_notifyInitFields'): return self.fn_EditSection_notifyInitFields
      else: return self.fn_unset_EditSection_notifyInitFields
   @notifyInitFields.setter
   def notifyInitFields(self, value):
      self.fn_EditSection_notifyInitFields = value
      lib.Instance_setMethod(self.impl, "NotifyInitFields".encode('utf8'), cb_EditSection_notifyInitFields)

@ffi.callback("void(Field)")
def cb_Field_getLength(__f):
   field = pyOrNewObject(Field, __f)
   field.fn_Field_getLength(field)

@ffi.callback("void(Field)")
def cb_Field_getName(__f):
   field = pyOrNewObject(Field, __f)
   field.fn_Field_getName(field)

@ffi.callback("void(Field)")
def cb_Field_getNext(__f):
   field = pyOrNewObject(Field, __f)
   field.fn_Field_getNext(field)

@ffi.callback("void(Field)")
def cb_Field_getPrev(__f):
   field = pyOrNewObject(Field, __f)
   field.fn_Field_getPrev(field)

@ffi.callback("void(Field)")
def cb_Field_getTable(__f):
   field = pyOrNewObject(Field, __f)
   field.fn_Field_getTable(field)

@ffi.callback("void(Field)")
def cb_Field_getType(__f):
   field = pyOrNewObject(Field, __f)
   field.fn_Field_getType(field)

class Field(Instance):
   def __init__(self,
                getLength = None,
                getName = None,
                getNext = None,
                getPrev = None,
                getTable = None,
                getType = None,
                impl = None):
      Instance.__init__(self, impl = impl)
      if getLength is not None: self.getLength = getLength
      if getName is not None:   self.getName = getName
      if getNext is not None:   self.getNext = getNext
      if getPrev is not None:   self.getPrev = getPrev
      if getTable is not None:  self.getTable = getTable
      if getType is not None:   self.getType = getType

   @property
   def name(self): value = lib.Field_get_name(self.impl) if self is not None and self.impl != ffi.NULL else ffi.NULL; return None if value == ffi.NULL else ffi.string(value).decode('utf8')

   @property
   def type(self): return lib.Field_get_type(self.impl, value.impl)

   @property
   def length(self): return lib.Field_get_length(self.impl)

   @property
   def prev(self): return pyOrNewObject(Field, lib.Field_get_prev(self.impl))

   @property
   def next(self): return pyOrNewObject(Field, lib.Field_get_next(self.impl))

   @property
   def table(self): return pyOrNewObject(Table, lib.Field_get_table(self.impl))

   def getData(self, row, data):
      if row is not None and not isinstance(row, Row): row = Row(row)
      if row is None: row = ffi.NULL
      return lib.Field_getData(self.impl, row, data)

   def fn_unset_Field_getLength(self):
      return lib.Field_getLength(self.impl)

   @property
   def getLength(self):
      if hasattr(self, 'fn_Field_getLength'): return self.fn_Field_getLength
      else: return self.fn_unset_Field_getLength
   @getLength.setter
   def getLength(self, value):
      self.fn_Field_getLength = value
      lib.Instance_setMethod(self.impl, "GetLength".encode('utf8'), cb_Field_getLength)

   def fn_unset_Field_getName(self):
      return lib.Field_getName(self.impl)

   @property
   def getName(self):
      if hasattr(self, 'fn_Field_getName'): return self.fn_Field_getName
      else: return self.fn_unset_Field_getName
   @getName.setter
   def getName(self, value):
      self.fn_Field_getName = value
      lib.Instance_setMethod(self.impl, "GetName".encode('utf8'), cb_Field_getName)

   def fn_unset_Field_getNext(self):
      return lib.Field_getNext(self.impl)

   @property
   def getNext(self):
      if hasattr(self, 'fn_Field_getNext'): return self.fn_Field_getNext
      else: return self.fn_unset_Field_getNext
   @getNext.setter
   def getNext(self, value):
      self.fn_Field_getNext = value
      lib.Instance_setMethod(self.impl, "GetNext".encode('utf8'), cb_Field_getNext)

   def fn_unset_Field_getPrev(self):
      return lib.Field_getPrev(self.impl)

   @property
   def getPrev(self):
      if hasattr(self, 'fn_Field_getPrev'): return self.fn_Field_getPrev
      else: return self.fn_unset_Field_getPrev
   @getPrev.setter
   def getPrev(self, value):
      self.fn_Field_getPrev = value
      lib.Instance_setMethod(self.impl, "GetPrev".encode('utf8'), cb_Field_getPrev)

   def fn_unset_Field_getTable(self):
      return lib.Field_getTable(self.impl)

   @property
   def getTable(self):
      if hasattr(self, 'fn_Field_getTable'): return self.fn_Field_getTable
      else: return self.fn_unset_Field_getTable
   @getTable.setter
   def getTable(self, value):
      self.fn_Field_getTable = value
      lib.Instance_setMethod(self.impl, "GetTable".encode('utf8'), cb_Field_getTable)

   def fn_unset_Field_getType(self):
      return lib.Field_getType(self.impl)

   @property
   def getType(self):
      if hasattr(self, 'fn_Field_getType'): return self.fn_Field_getType
      else: return self.fn_unset_Field_getType
   @getType.setter
   def getType(self, value):
      self.fn_Field_getType = value
      lib.Instance_setMethod(self.impl, "GetType".encode('utf8'), cb_Field_getType)

   def setData(self, row, data):
      if row is not None and not isinstance(row, Row): row = Row(row)
      if row is None: row = ffi.NULL
      return lib.Field_setData(self.impl, row, data)

class FieldBox(DataBox):
   def __init__(self,
                parent = None,
                master = None,
                caption = None,
                hotKey = None,
                background = None,
                opacity = None,
                foreground = None,
                borderStyle = None,
                minClientSize = None,
                maxClientSize = None,
                hasMaximize = None,
                hasMinimize = None,
                hasClose = None,
                nonClient = None,
                inactive = None,
                clickThrough = None,
                isRemote = None,
                noCycle = None,
                isModal = None,
                interim = None,
                tabCycle = None,
                isDefault = None,
                drawBehind = None,
                hasMenuBar = None,
                hasStatusBar = None,
                stayOnTop = None,
                menu = None,
                font = None,
                sizeAnchor = None,
                size = None,
                clientSize = None,
                anchor = None,
                position = None,
                disabled = None,
                state = None,
                visible = None,
                isDocument = None,
                mergeMenus = None,
                hasHorzScroll = None,
                hasVertScroll = None,
                dontHideScroll = None,
                dontScrollVert = None,
                dontScrollHorz = None,
                snapVertScroll = None,
                snapHorzScroll = None,
                scroll = None,
                modifyVirtualArea = None,
                dontAutoScrollArea = None,
                fileName = None,
                id = None,
                modifiedDocument = None,
                showInTaskBar = None,
                saveDialog = None,
                isActiveClient = None,
                cursor = None,
                name = None,
                displayDriver = None,
                autoCreate = None,
                scrollArea = None,
                is3D = None,
                closing = None,
                fullRender = None,
                icon = None,
                moveable = None,
                alphaBlend = None,
                useSharedMemory = None,
                glCapabilities = None,
                creationActivation = None,
                nativeDecorations = None,
                manageDisplay = None,
                text = None,
                controller = None,
                noConsequential = None,
                toolTip = None,
                type = None,
                data = None,
                fieldData = None,
                editor = None,
                readOnly = None,
                keepEditor = None,
                autoSize = None,
                needUpdate = None,
                stringValue = None,
                field = None,
                getDecorationsSize = None,
                isInside = None,
                isMouseMoving = None,
                isMouseResizing = None,
                isOpaque = None,
                notifyActivate = None,
                notifyDestroyed = None,
                notifySaved = None,
                onActivate = None,
                onActivateClient = None,
                onApplyGraphics = None,
                onChildAddedOrRemoved = None,
                onChildResized = None,
                onChildVisibilityToggled = None,
                onClose = None,
                onCreate = None,
                onDestroy = None,
                onDestroyed = None,
                onDrawOverChildren = None,
                onFileModified = None,
                onHScroll = None,
                onKeyDown = None,
                onKeyHit = None,
                onKeyUp = None,
                onLeftButtonDown = None,
                onLeftButtonUp = None,
                onLeftDoubleClick = None,
                onLoadGraphics = None,
                onMiddleButtonDown = None,
                onMiddleButtonUp = None,
                onMiddleDoubleClick = None,
                onMouseCaptureLost = None,
                onMouseLeave = None,
                onMouseMove = None,
                onMouseOver = None,
                onMoving = None,
                onMultiTouch = None,
                onPosition = None,
                onPostCreate = None,
                onRedraw = None,
                onResize = None,
                onResizing = None,
                onRightButtonDown = None,
                onRightButtonUp = None,
                onRightDoubleClick = None,
                onSaveFile = None,
                onStateChange = None,
                onSysKeyDown = None,
                onSysKeyHit = None,
                onSysKeyUp = None,
                onUnloadGraphics = None,
                onVScroll = None,
                preShowDecorations = None,
                setBox = None,
                setWindowArea = None,
                setWindowMinimum = None,
                showDecorations = None,
                updateNonClient = None,
                notifyChanged = None,
                notifyModified = None,
                onConfigure = None,
                setData = None,
                impl = None):
      DataBox.__init__(self, impl = impl)
      if parent is not None:                   self.parent = parent
      if master is not None:                   self.master = master
      if caption is not None:                  self.caption = caption
      if hotKey is not None:                   self.hotKey = hotKey
      if background is not None:               self.background = background
      if opacity is not None:                  self.opacity = opacity
      if foreground is not None:               self.foreground = foreground
      if borderStyle is not None:              self.borderStyle = borderStyle
      if minClientSize is not None:            self.minClientSize = minClientSize
      if maxClientSize is not None:            self.maxClientSize = maxClientSize
      if hasMaximize is not None:              self.hasMaximize = hasMaximize
      if hasMinimize is not None:              self.hasMinimize = hasMinimize
      if hasClose is not None:                 self.hasClose = hasClose
      if nonClient is not None:                self.nonClient = nonClient
      if inactive is not None:                 self.inactive = inactive
      if clickThrough is not None:             self.clickThrough = clickThrough
      if isRemote is not None:                 self.isRemote = isRemote
      if noCycle is not None:                  self.noCycle = noCycle
      if isModal is not None:                  self.isModal = isModal
      if interim is not None:                  self.interim = interim
      if tabCycle is not None:                 self.tabCycle = tabCycle
      if isDefault is not None:                self.isDefault = isDefault
      if drawBehind is not None:               self.drawBehind = drawBehind
      if hasMenuBar is not None:               self.hasMenuBar = hasMenuBar
      if hasStatusBar is not None:             self.hasStatusBar = hasStatusBar
      if stayOnTop is not None:                self.stayOnTop = stayOnTop
      if menu is not None:                     self.menu = menu
      if font is not None:                     self.font = font
      if sizeAnchor is not None:               self.sizeAnchor = sizeAnchor
      if size is not None:                     self.size = size
      if clientSize is not None:               self.clientSize = clientSize
      if anchor is not None:                   self.anchor = anchor
      if position is not None:                 self.position = position
      if disabled is not None:                 self.disabled = disabled
      if state is not None:                    self.state = state
      if visible is not None:                  self.visible = visible
      if isDocument is not None:               self.isDocument = isDocument
      if mergeMenus is not None:               self.mergeMenus = mergeMenus
      if hasHorzScroll is not None:            self.hasHorzScroll = hasHorzScroll
      if hasVertScroll is not None:            self.hasVertScroll = hasVertScroll
      if dontHideScroll is not None:           self.dontHideScroll = dontHideScroll
      if dontScrollVert is not None:           self.dontScrollVert = dontScrollVert
      if dontScrollHorz is not None:           self.dontScrollHorz = dontScrollHorz
      if snapVertScroll is not None:           self.snapVertScroll = snapVertScroll
      if snapHorzScroll is not None:           self.snapHorzScroll = snapHorzScroll
      if scroll is not None:                   self.scroll = scroll
      if modifyVirtualArea is not None:        self.modifyVirtualArea = modifyVirtualArea
      if dontAutoScrollArea is not None:       self.dontAutoScrollArea = dontAutoScrollArea
      if fileName is not None:                 self.fileName = fileName
      if id is not None:                       self.id = id
      if modifiedDocument is not None:         self.modifiedDocument = modifiedDocument
      if showInTaskBar is not None:            self.showInTaskBar = showInTaskBar
      if saveDialog is not None:               self.saveDialog = saveDialog
      if isActiveClient is not None:           self.isActiveClient = isActiveClient
      if cursor is not None:                   self.cursor = cursor
      if name is not None:                     self.name = name
      if displayDriver is not None:            self.displayDriver = displayDriver
      if autoCreate is not None:               self.autoCreate = autoCreate
      if scrollArea is not None:               self.scrollArea = scrollArea
      if is3D is not None:                     self.is3D = is3D
      if closing is not None:                  self.closing = closing
      if fullRender is not None:               self.fullRender = fullRender
      if icon is not None:                     self.icon = icon
      if moveable is not None:                 self.moveable = moveable
      if alphaBlend is not None:               self.alphaBlend = alphaBlend
      if useSharedMemory is not None:          self.useSharedMemory = useSharedMemory
      if glCapabilities is not None:           self.glCapabilities = glCapabilities
      if creationActivation is not None:       self.creationActivation = creationActivation
      if nativeDecorations is not None:        self.nativeDecorations = nativeDecorations
      if manageDisplay is not None:            self.manageDisplay = manageDisplay
      if text is not None:                     self.text = text
      if controller is not None:               self.controller = controller
      if noConsequential is not None:          self.noConsequential = noConsequential
      if toolTip is not None:                  self.toolTip = toolTip
      if type is not None:                     self.type = type
      if data is not None:                     self.data = data
      if fieldData is not None:                self.fieldData = fieldData
      if editor is not None:                   self.editor = editor
      if readOnly is not None:                 self.readOnly = readOnly
      if keepEditor is not None:               self.keepEditor = keepEditor
      if autoSize is not None:                 self.autoSize = autoSize
      if needUpdate is not None:               self.needUpdate = needUpdate
      if stringValue is not None:              self.stringValue = stringValue
      if field is not None:                    self.field = field
      if getDecorationsSize is not None:       self.getDecorationsSize = getDecorationsSize
      if isInside is not None:                 self.isInside = isInside
      if isMouseMoving is not None:            self.isMouseMoving = isMouseMoving
      if isMouseResizing is not None:          self.isMouseResizing = isMouseResizing
      if isOpaque is not None:                 self.isOpaque = isOpaque
      if notifyActivate is not None:           self.notifyActivate = notifyActivate
      if notifyDestroyed is not None:          self.notifyDestroyed = notifyDestroyed
      if notifySaved is not None:              self.notifySaved = notifySaved
      if onActivate is not None:               self.onActivate = onActivate
      if onActivateClient is not None:         self.onActivateClient = onActivateClient
      if onApplyGraphics is not None:          self.onApplyGraphics = onApplyGraphics
      if onChildAddedOrRemoved is not None:    self.onChildAddedOrRemoved = onChildAddedOrRemoved
      if onChildResized is not None:           self.onChildResized = onChildResized
      if onChildVisibilityToggled is not None: self.onChildVisibilityToggled = onChildVisibilityToggled
      if onClose is not None:                  self.onClose = onClose
      if onCreate is not None:                 self.onCreate = onCreate
      if onDestroy is not None:                self.onDestroy = onDestroy
      if onDestroyed is not None:              self.onDestroyed = onDestroyed
      if onDrawOverChildren is not None:       self.onDrawOverChildren = onDrawOverChildren
      if onFileModified is not None:           self.onFileModified = onFileModified
      if onHScroll is not None:                self.onHScroll = onHScroll
      if onKeyDown is not None:                self.onKeyDown = onKeyDown
      if onKeyHit is not None:                 self.onKeyHit = onKeyHit
      if onKeyUp is not None:                  self.onKeyUp = onKeyUp
      if onLeftButtonDown is not None:         self.onLeftButtonDown = onLeftButtonDown
      if onLeftButtonUp is not None:           self.onLeftButtonUp = onLeftButtonUp
      if onLeftDoubleClick is not None:        self.onLeftDoubleClick = onLeftDoubleClick
      if onLoadGraphics is not None:           self.onLoadGraphics = onLoadGraphics
      if onMiddleButtonDown is not None:       self.onMiddleButtonDown = onMiddleButtonDown
      if onMiddleButtonUp is not None:         self.onMiddleButtonUp = onMiddleButtonUp
      if onMiddleDoubleClick is not None:      self.onMiddleDoubleClick = onMiddleDoubleClick
      if onMouseCaptureLost is not None:       self.onMouseCaptureLost = onMouseCaptureLost
      if onMouseLeave is not None:             self.onMouseLeave = onMouseLeave
      if onMouseMove is not None:              self.onMouseMove = onMouseMove
      if onMouseOver is not None:              self.onMouseOver = onMouseOver
      if onMoving is not None:                 self.onMoving = onMoving
      if onMultiTouch is not None:             self.onMultiTouch = onMultiTouch
      if onPosition is not None:               self.onPosition = onPosition
      if onPostCreate is not None:             self.onPostCreate = onPostCreate
      if onRedraw is not None:                 self.onRedraw = onRedraw
      if onResize is not None:                 self.onResize = onResize
      if onResizing is not None:               self.onResizing = onResizing
      if onRightButtonDown is not None:        self.onRightButtonDown = onRightButtonDown
      if onRightButtonUp is not None:          self.onRightButtonUp = onRightButtonUp
      if onRightDoubleClick is not None:       self.onRightDoubleClick = onRightDoubleClick
      if onSaveFile is not None:               self.onSaveFile = onSaveFile
      if onStateChange is not None:            self.onStateChange = onStateChange
      if onSysKeyDown is not None:             self.onSysKeyDown = onSysKeyDown
      if onSysKeyHit is not None:              self.onSysKeyHit = onSysKeyHit
      if onSysKeyUp is not None:               self.onSysKeyUp = onSysKeyUp
      if onUnloadGraphics is not None:         self.onUnloadGraphics = onUnloadGraphics
      if onVScroll is not None:                self.onVScroll = onVScroll
      if preShowDecorations is not None:       self.preShowDecorations = preShowDecorations
      if setBox is not None:                   self.setBox = setBox
      if setWindowArea is not None:            self.setWindowArea = setWindowArea
      if setWindowMinimum is not None:         self.setWindowMinimum = setWindowMinimum
      if showDecorations is not None:          self.showDecorations = showDecorations
      if updateNonClient is not None:          self.updateNonClient = updateNonClient
      if notifyChanged is not None:            self.notifyChanged = notifyChanged
      if notifyModified is not None:           self.notifyModified = notifyModified
      if onConfigure is not None:              self.onConfigure = onConfigure
      if setData is not None:                  self.setData = setData

   @property
   def type(self): return Class(impl = IPTR(lib, ffi, self, FieldBox).type)
   @type.setter
   def type(self, value):
      if not isinstance(value, Class): value = Class(value)
      IPTR(lib, ffi, self, FieldBox).type = value.impl

   @property
   def data(self): return IPTR(lib, ffi, self, FieldBox).data
   @data.setter
   def data(self, value): IPTR(lib, ffi, self, FieldBox).data = value

   @property
   def fieldData(self): return IPTR(lib, ffi, self, FieldBox).fieldData
   @fieldData.setter
   def fieldData(self, value): IPTR(lib, ffi, self, FieldBox).fieldData = value

   @property
   def editor(self): return Window(impl = IPTR(lib, ffi, self, FieldBox).editor)
   @editor.setter
   def editor(self, value):
      if not isinstance(value, Window): value = Window(value)
      IPTR(lib, ffi, self, FieldBox).editor = value.impl

   @property
   def readOnly(self): return IPTR(lib, ffi, self, FieldBox).readOnly
   @readOnly.setter
   def readOnly(self, value): IPTR(lib, ffi, self, FieldBox).readOnly = value

   @property
   def keepEditor(self): return IPTR(lib, ffi, self, FieldBox).keepEditor
   @keepEditor.setter
   def keepEditor(self, value): IPTR(lib, ffi, self, FieldBox).keepEditor = value

   @property
   def autoSize(self): return IPTR(lib, ffi, self, FieldBox).autoSize
   @autoSize.setter
   def autoSize(self, value): IPTR(lib, ffi, self, FieldBox).autoSize = value

   @property
   def needUpdate(self): return IPTR(lib, ffi, self, FieldBox).needUpdate
   @needUpdate.setter
   def needUpdate(self, value): IPTR(lib, ffi, self, FieldBox).needUpdate = value

   @property
   def stringValue(self): return String(impl = IPTR(lib, ffi, self, FieldBox).stringValue)
   @stringValue.setter
   def stringValue(self, value):
      if not isinstance(value, String): value = String(value)
      IPTR(lib, ffi, self, FieldBox).stringValue = value.impl

   @property
   def field(self): return None
   @field.setter
   def field(self, value):
      if not isinstance(value, Field): value = Field(value)
      lib.FieldBox_set_field(self.impl, value.impl)

class FieldCheckButton(FieldDataBox):
   def __init__(self,
                parent = None,
                master = None,
                caption = None,
                hotKey = None,
                background = None,
                opacity = None,
                foreground = None,
                borderStyle = None,
                minClientSize = None,
                maxClientSize = None,
                hasMaximize = None,
                hasMinimize = None,
                hasClose = None,
                nonClient = None,
                inactive = None,
                clickThrough = None,
                isRemote = None,
                noCycle = None,
                isModal = None,
                interim = None,
                tabCycle = None,
                isDefault = None,
                drawBehind = None,
                hasMenuBar = None,
                hasStatusBar = None,
                stayOnTop = None,
                menu = None,
                font = None,
                sizeAnchor = None,
                size = None,
                clientSize = None,
                anchor = None,
                position = None,
                disabled = None,
                state = None,
                visible = None,
                isDocument = None,
                mergeMenus = None,
                hasHorzScroll = None,
                hasVertScroll = None,
                dontHideScroll = None,
                dontScrollVert = None,
                dontScrollHorz = None,
                snapVertScroll = None,
                snapHorzScroll = None,
                scroll = None,
                modifyVirtualArea = None,
                dontAutoScrollArea = None,
                fileName = None,
                id = None,
                modifiedDocument = None,
                showInTaskBar = None,
                saveDialog = None,
                isActiveClient = None,
                cursor = None,
                name = None,
                displayDriver = None,
                autoCreate = None,
                scrollArea = None,
                is3D = None,
                closing = None,
                fullRender = None,
                icon = None,
                moveable = None,
                alphaBlend = None,
                useSharedMemory = None,
                glCapabilities = None,
                creationActivation = None,
                nativeDecorations = None,
                manageDisplay = None,
                text = None,
                controller = None,
                noConsequential = None,
                toolTip = None,
                type = None,
                data = None,
                fieldData = None,
                editor = None,
                readOnly = None,
                keepEditor = None,
                autoSize = None,
                needUpdate = None,
                stringValue = None,
                row = None,
                field = None,
                getDecorationsSize = None,
                isInside = None,
                isMouseMoving = None,
                isMouseResizing = None,
                isOpaque = None,
                notifyActivate = None,
                notifyDestroyed = None,
                notifySaved = None,
                onActivate = None,
                onActivateClient = None,
                onApplyGraphics = None,
                onChildAddedOrRemoved = None,
                onChildResized = None,
                onChildVisibilityToggled = None,
                onClose = None,
                onCreate = None,
                onDestroy = None,
                onDestroyed = None,
                onDrawOverChildren = None,
                onFileModified = None,
                onHScroll = None,
                onKeyDown = None,
                onKeyHit = None,
                onKeyUp = None,
                onLeftButtonDown = None,
                onLeftButtonUp = None,
                onLeftDoubleClick = None,
                onLoadGraphics = None,
                onMiddleButtonDown = None,
                onMiddleButtonUp = None,
                onMiddleDoubleClick = None,
                onMouseCaptureLost = None,
                onMouseLeave = None,
                onMouseMove = None,
                onMouseOver = None,
                onMoving = None,
                onMultiTouch = None,
                onPosition = None,
                onPostCreate = None,
                onRedraw = None,
                onResize = None,
                onResizing = None,
                onRightButtonDown = None,
                onRightButtonUp = None,
                onRightDoubleClick = None,
                onSaveFile = None,
                onStateChange = None,
                onSysKeyDown = None,
                onSysKeyHit = None,
                onSysKeyUp = None,
                onUnloadGraphics = None,
                onVScroll = None,
                preShowDecorations = None,
                setBox = None,
                setWindowArea = None,
                setWindowMinimum = None,
                showDecorations = None,
                updateNonClient = None,
                notifyChanged = None,
                notifyModified = None,
                onConfigure = None,
                setData = None,
                save = None,
                impl = None):
      FieldDataBox.__init__(self, impl = impl)
      if parent is not None:                   self.parent = parent
      if master is not None:                   self.master = master
      if caption is not None:                  self.caption = caption
      if hotKey is not None:                   self.hotKey = hotKey
      if background is not None:               self.background = background
      if opacity is not None:                  self.opacity = opacity
      if foreground is not None:               self.foreground = foreground
      if borderStyle is not None:              self.borderStyle = borderStyle
      if minClientSize is not None:            self.minClientSize = minClientSize
      if maxClientSize is not None:            self.maxClientSize = maxClientSize
      if hasMaximize is not None:              self.hasMaximize = hasMaximize
      if hasMinimize is not None:              self.hasMinimize = hasMinimize
      if hasClose is not None:                 self.hasClose = hasClose
      if nonClient is not None:                self.nonClient = nonClient
      if inactive is not None:                 self.inactive = inactive
      if clickThrough is not None:             self.clickThrough = clickThrough
      if isRemote is not None:                 self.isRemote = isRemote
      if noCycle is not None:                  self.noCycle = noCycle
      if isModal is not None:                  self.isModal = isModal
      if interim is not None:                  self.interim = interim
      if tabCycle is not None:                 self.tabCycle = tabCycle
      if isDefault is not None:                self.isDefault = isDefault
      if drawBehind is not None:               self.drawBehind = drawBehind
      if hasMenuBar is not None:               self.hasMenuBar = hasMenuBar
      if hasStatusBar is not None:             self.hasStatusBar = hasStatusBar
      if stayOnTop is not None:                self.stayOnTop = stayOnTop
      if menu is not None:                     self.menu = menu
      if font is not None:                     self.font = font
      if sizeAnchor is not None:               self.sizeAnchor = sizeAnchor
      if size is not None:                     self.size = size
      if clientSize is not None:               self.clientSize = clientSize
      if anchor is not None:                   self.anchor = anchor
      if position is not None:                 self.position = position
      if disabled is not None:                 self.disabled = disabled
      if state is not None:                    self.state = state
      if visible is not None:                  self.visible = visible
      if isDocument is not None:               self.isDocument = isDocument
      if mergeMenus is not None:               self.mergeMenus = mergeMenus
      if hasHorzScroll is not None:            self.hasHorzScroll = hasHorzScroll
      if hasVertScroll is not None:            self.hasVertScroll = hasVertScroll
      if dontHideScroll is not None:           self.dontHideScroll = dontHideScroll
      if dontScrollVert is not None:           self.dontScrollVert = dontScrollVert
      if dontScrollHorz is not None:           self.dontScrollHorz = dontScrollHorz
      if snapVertScroll is not None:           self.snapVertScroll = snapVertScroll
      if snapHorzScroll is not None:           self.snapHorzScroll = snapHorzScroll
      if scroll is not None:                   self.scroll = scroll
      if modifyVirtualArea is not None:        self.modifyVirtualArea = modifyVirtualArea
      if dontAutoScrollArea is not None:       self.dontAutoScrollArea = dontAutoScrollArea
      if fileName is not None:                 self.fileName = fileName
      if id is not None:                       self.id = id
      if modifiedDocument is not None:         self.modifiedDocument = modifiedDocument
      if showInTaskBar is not None:            self.showInTaskBar = showInTaskBar
      if saveDialog is not None:               self.saveDialog = saveDialog
      if isActiveClient is not None:           self.isActiveClient = isActiveClient
      if cursor is not None:                   self.cursor = cursor
      if name is not None:                     self.name = name
      if displayDriver is not None:            self.displayDriver = displayDriver
      if autoCreate is not None:               self.autoCreate = autoCreate
      if scrollArea is not None:               self.scrollArea = scrollArea
      if is3D is not None:                     self.is3D = is3D
      if closing is not None:                  self.closing = closing
      if fullRender is not None:               self.fullRender = fullRender
      if icon is not None:                     self.icon = icon
      if moveable is not None:                 self.moveable = moveable
      if alphaBlend is not None:               self.alphaBlend = alphaBlend
      if useSharedMemory is not None:          self.useSharedMemory = useSharedMemory
      if glCapabilities is not None:           self.glCapabilities = glCapabilities
      if creationActivation is not None:       self.creationActivation = creationActivation
      if nativeDecorations is not None:        self.nativeDecorations = nativeDecorations
      if manageDisplay is not None:            self.manageDisplay = manageDisplay
      if text is not None:                     self.text = text
      if controller is not None:               self.controller = controller
      if noConsequential is not None:          self.noConsequential = noConsequential
      if toolTip is not None:                  self.toolTip = toolTip
      if type is not None:                     self.type = type
      if data is not None:                     self.data = data
      if fieldData is not None:                self.fieldData = fieldData
      if editor is not None:                   self.editor = editor
      if readOnly is not None:                 self.readOnly = readOnly
      if keepEditor is not None:               self.keepEditor = keepEditor
      if autoSize is not None:                 self.autoSize = autoSize
      if needUpdate is not None:               self.needUpdate = needUpdate
      if stringValue is not None:              self.stringValue = stringValue
      if row is not None:                      self.row = row
      if field is not None:                    self.field = field
      if getDecorationsSize is not None:       self.getDecorationsSize = getDecorationsSize
      if isInside is not None:                 self.isInside = isInside
      if isMouseMoving is not None:            self.isMouseMoving = isMouseMoving
      if isMouseResizing is not None:          self.isMouseResizing = isMouseResizing
      if isOpaque is not None:                 self.isOpaque = isOpaque
      if notifyActivate is not None:           self.notifyActivate = notifyActivate
      if notifyDestroyed is not None:          self.notifyDestroyed = notifyDestroyed
      if notifySaved is not None:              self.notifySaved = notifySaved
      if onActivate is not None:               self.onActivate = onActivate
      if onActivateClient is not None:         self.onActivateClient = onActivateClient
      if onApplyGraphics is not None:          self.onApplyGraphics = onApplyGraphics
      if onChildAddedOrRemoved is not None:    self.onChildAddedOrRemoved = onChildAddedOrRemoved
      if onChildResized is not None:           self.onChildResized = onChildResized
      if onChildVisibilityToggled is not None: self.onChildVisibilityToggled = onChildVisibilityToggled
      if onClose is not None:                  self.onClose = onClose
      if onCreate is not None:                 self.onCreate = onCreate
      if onDestroy is not None:                self.onDestroy = onDestroy
      if onDestroyed is not None:              self.onDestroyed = onDestroyed
      if onDrawOverChildren is not None:       self.onDrawOverChildren = onDrawOverChildren
      if onFileModified is not None:           self.onFileModified = onFileModified
      if onHScroll is not None:                self.onHScroll = onHScroll
      if onKeyDown is not None:                self.onKeyDown = onKeyDown
      if onKeyHit is not None:                 self.onKeyHit = onKeyHit
      if onKeyUp is not None:                  self.onKeyUp = onKeyUp
      if onLeftButtonDown is not None:         self.onLeftButtonDown = onLeftButtonDown
      if onLeftButtonUp is not None:           self.onLeftButtonUp = onLeftButtonUp
      if onLeftDoubleClick is not None:        self.onLeftDoubleClick = onLeftDoubleClick
      if onLoadGraphics is not None:           self.onLoadGraphics = onLoadGraphics
      if onMiddleButtonDown is not None:       self.onMiddleButtonDown = onMiddleButtonDown
      if onMiddleButtonUp is not None:         self.onMiddleButtonUp = onMiddleButtonUp
      if onMiddleDoubleClick is not None:      self.onMiddleDoubleClick = onMiddleDoubleClick
      if onMouseCaptureLost is not None:       self.onMouseCaptureLost = onMouseCaptureLost
      if onMouseLeave is not None:             self.onMouseLeave = onMouseLeave
      if onMouseMove is not None:              self.onMouseMove = onMouseMove
      if onMouseOver is not None:              self.onMouseOver = onMouseOver
      if onMoving is not None:                 self.onMoving = onMoving
      if onMultiTouch is not None:             self.onMultiTouch = onMultiTouch
      if onPosition is not None:               self.onPosition = onPosition
      if onPostCreate is not None:             self.onPostCreate = onPostCreate
      if onRedraw is not None:                 self.onRedraw = onRedraw
      if onResize is not None:                 self.onResize = onResize
      if onResizing is not None:               self.onResizing = onResizing
      if onRightButtonDown is not None:        self.onRightButtonDown = onRightButtonDown
      if onRightButtonUp is not None:          self.onRightButtonUp = onRightButtonUp
      if onRightDoubleClick is not None:       self.onRightDoubleClick = onRightDoubleClick
      if onSaveFile is not None:               self.onSaveFile = onSaveFile
      if onStateChange is not None:            self.onStateChange = onStateChange
      if onSysKeyDown is not None:             self.onSysKeyDown = onSysKeyDown
      if onSysKeyHit is not None:              self.onSysKeyHit = onSysKeyHit
      if onSysKeyUp is not None:               self.onSysKeyUp = onSysKeyUp
      if onUnloadGraphics is not None:         self.onUnloadGraphics = onUnloadGraphics
      if onVScroll is not None:                self.onVScroll = onVScroll
      if preShowDecorations is not None:       self.preShowDecorations = preShowDecorations
      if setBox is not None:                   self.setBox = setBox
      if setWindowArea is not None:            self.setWindowArea = setWindowArea
      if setWindowMinimum is not None:         self.setWindowMinimum = setWindowMinimum
      if showDecorations is not None:          self.showDecorations = showDecorations
      if updateNonClient is not None:          self.updateNonClient = updateNonClient
      if notifyChanged is not None:            self.notifyChanged = notifyChanged
      if notifyModified is not None:           self.notifyModified = notifyModified
      if onConfigure is not None:              self.onConfigure = onConfigure
      if setData is not None:                  self.setData = setData
      if save is not None:                     self.save = save

   @property
   def type(self): return Class(impl = IPTR(lib, ffi, self, FieldCheckButton).type)
   @type.setter
   def type(self, value):
      if not isinstance(value, Class): value = Class(value)
      IPTR(lib, ffi, self, FieldCheckButton).type = value.impl

   @property
   def data(self): return IPTR(lib, ffi, self, FieldCheckButton).data
   @data.setter
   def data(self, value): IPTR(lib, ffi, self, FieldCheckButton).data = value

   @property
   def fieldData(self): return IPTR(lib, ffi, self, FieldCheckButton).fieldData
   @fieldData.setter
   def fieldData(self, value): IPTR(lib, ffi, self, FieldCheckButton).fieldData = value

   @property
   def editor(self): return Window(impl = IPTR(lib, ffi, self, FieldCheckButton).editor)
   @editor.setter
   def editor(self, value):
      if not isinstance(value, Window): value = Window(value)
      IPTR(lib, ffi, self, FieldCheckButton).editor = value.impl

   @property
   def readOnly(self): return IPTR(lib, ffi, self, FieldCheckButton).readOnly
   @readOnly.setter
   def readOnly(self, value): IPTR(lib, ffi, self, FieldCheckButton).readOnly = value

   @property
   def keepEditor(self): return IPTR(lib, ffi, self, FieldCheckButton).keepEditor
   @keepEditor.setter
   def keepEditor(self, value): IPTR(lib, ffi, self, FieldCheckButton).keepEditor = value

   @property
   def autoSize(self): return IPTR(lib, ffi, self, FieldCheckButton).autoSize
   @autoSize.setter
   def autoSize(self, value): IPTR(lib, ffi, self, FieldCheckButton).autoSize = value

   @property
   def needUpdate(self): return IPTR(lib, ffi, self, FieldCheckButton).needUpdate
   @needUpdate.setter
   def needUpdate(self, value): IPTR(lib, ffi, self, FieldCheckButton).needUpdate = value

   @property
   def stringValue(self): return String(impl = IPTR(lib, ffi, self, FieldCheckButton).stringValue)
   @stringValue.setter
   def stringValue(self, value):
      if not isinstance(value, String): value = String(value)
      IPTR(lib, ffi, self, FieldCheckButton).stringValue = value.impl

class FieldFindData:
   def __init__(self, field = None, value = None, impl = None):
      if impl is not None:
         self.impl = ffi.new("FieldFindData *", impl)
      else:
         if isinstance(field, tuple):
            __tuple = field
            field = None
            if len(__tuple) > 0: field = __tuple[0]
            if len(__tuple) > 1: value = __tuple[1]
         if field is not None:
            if not isinstance(field, Field): field = Field(field)
            field = field.impl
         else: field = ffi.NULL
         if value is not None:
            if not isinstance(value, DataValue): value = DataValue(value)
            value = value.impl
         self.impl = ffi.new("FieldFindData *", { 'field' : field, 'value' : value })

   @property
   def field(self): return pyOrNewObject(Field, self.impl.field)
   @field.setter
   def field(self, value):
      if not isinstance(value, Field): value = Field(value)
      self.impl.field = value

   @property
   def value(self): return DataValue(impl = self.impl.value)
   @value.setter
   def value(self, value):
      if not isinstance(value, DataValue): value = DataValue(value)
      self.impl.value = value.impl[0]

class FieldIndex:
   def __init__(self, field = None, order = None, memberField = None, memberTable = None, memberIdField = None, impl = None):
      if impl is not None:
         self.impl = ffi.new("FieldIndex *", impl)
      else:
         if isinstance(field, tuple):
            __tuple = field
            field = None
            if len(__tuple) > 0: field         = __tuple[0]
            if len(__tuple) > 1: order         = __tuple[1]
            if len(__tuple) > 2: memberField   = __tuple[2]
            if len(__tuple) > 3: memberTable   = __tuple[3]
         if field is not None:
            if not isinstance(field, Field): field = Field(field)
            field = field.impl
         else: field = ffi.NULL
         if memberField is not None:
            if not isinstance(memberField, Field): memberField = Field(memberField)
            memberField = memberField.impl
         else: memberField = ffi.NULL
         if memberTable is not None:
            if not isinstance(memberTable, Table): memberTable = Table(memberTable)
            memberTable = memberTable.impl
         else: memberTable = ffi.NULL
         if memberIdField is not None:
            if not isinstance(memberIdField, Field): memberIdField = Field(memberIdField)
            memberIdField = memberIdField.impl
         else: memberIdField = ffi.NULL
         self.impl = ffi.new("FieldIndex *", { 'field' : field, 'order' : order, 'memberField' : memberField, 'memberTable' : memberTable, 'memberIdField' : memberIdField })

   @property
   def field(self): return pyOrNewObject(Field, self.impl.field)
   @field.setter
   def field(self, value):
      if not isinstance(value, Field): value = Field(value)
      self.impl.field = value

   @property
   def order(self): return self.impl.order
   @order.setter
   def order(self, value): self.impl.order = value

   @property
   def memberField(self): return pyOrNewObject(Field, self.impl.memberField)
   @memberField.setter
   def memberField(self, value):
      if not isinstance(value, Field): value = Field(value)
      self.impl.memberField = value

   @property
   def memberTable(self): return pyOrNewObject(Table, self.impl.memberTable)
   @memberTable.setter
   def memberTable(self, value):
      if not isinstance(value, Table): value = Table(value)
      self.impl.memberTable = value

   @property
   def memberIdField(self): return pyOrNewObject(Field, self.impl.memberIdField)
   @memberIdField.setter
   def memberIdField(self, value):
      if not isinstance(value, Field): value = Field(value)
      self.impl.memberIdField = value

class FieldTypeEx(FieldType):
   def __init__(self, type = 0, mustFree = False, impl = None):
      if impl is not None:
         self.impl = impl
      elif isinstance(type, FieldTypeEx):
         self.impl = type.impl
      else:
         if isinstance(type, tuple):
            __tuple = type
            type = 0
            if len(__tuple) > 0: type = __tuple[0]
            if len(__tuple) > 1: mustFree = __tuple[1]
         self.impl = (
            (type     << lib.FIELDTYPEEX_type_SHIFT)     |
            (mustFree << lib.FIELDTYPEEX_mustFree_SHIFT) )

   @property
   def type(self): return ((((self.impl)) & lib.FIELDTYPEEX_type_MASK) >> lib.FIELDTYPEEX_type_SHIFT)
   @type.setter
   def type(self, value): self.value = ((self.impl) & ~(lib.FIELDTYPEEX_type_MASK)) | (((value)) << lib.FIELDTYPEEX_type_SHIFT)

   @property
   def mustFree(self): return ((((self.impl)) & lib.FIELDTYPEEX_mustFree_MASK) >> lib.FIELDTYPEEX_mustFree_SHIFT)
   @mustFree.setter
   def mustFree(self, value): self.value = ((self.impl) & ~(lib.FIELDTYPEEX_mustFree_MASK)) | (((value)) << lib.FIELDTYPEEX_mustFree_SHIFT)

class FieldValue:
   def __init__(self, type = None, i = None, r = None, s = None, b = None, impl = None):
      if impl is not None:
         self.impl = ffi.new("FieldValue *", impl)
      else:
         if isinstance(type, tuple):
            __tuple = type
            type = 0
            if len(__tuple) > 0: type = __tuple[0]
            if len(__tuple) > 1: i    = __tuple[1]
         if type is not None:
            if not isinstance(type, FieldTypeEx): type = FieldTypeEx(type)
         if s is not None:
            if not isinstance(s, String): s = String(s)
         else: s = ffi.NULL
         __members = { }
         if type is not None: __members['type'] = type.impl[0]
         if i is not None:    __members['i']    = i
         if r is not None:    __members['r']    = r
         if s is not None:    __members['s']    = s
         if b is not None:    __members['b']    = b
         self.impl = ffi.new("FieldValue *", __members)

   @property
   def type(self): return FieldTypeEx(impl = self.impl.type)
   @type.setter
   def type(self, value):
      if not isinstance(value, FieldTypeEx): value = FieldTypeEx(value)
      self.impl.type = value.impl

   @property
   def i(self): return self.impl.i
   @i.setter
   def i(self, value): self.impl.i = value

   @property
   def r(self): return self.impl.r
   @r.setter
   def r(self, value): self.impl.r = value

   @property
   def s(self): return String(self.impl.s)
   @s.setter
   def s(self, value):
      if not isinstance(value, String): value = String(value)
      self.impl.s = value.impl

   @property
   def b(self): return self.impl.b
   @b.setter
   def b(self, value): self.impl.b = value

   def compareInt(self, b):
      if b is not None and not isinstance(b, FieldValue): b = FieldValue(b)
      b = ffi.NULL if b is None else b.impl
      lib.FieldValue_compareInt(ffi.cast("FieldValue *", self.impl), ffi.cast("FieldValue *", b))

   def compareReal(self, b):
      if b is not None and not isinstance(b, FieldValue): b = FieldValue(b)
      b = ffi.NULL if b is None else b.impl
      lib.FieldValue_compareReal(ffi.cast("FieldValue *", self.impl), ffi.cast("FieldValue *", b))

   def compareText(self, b):
      if b is not None and not isinstance(b, FieldValue): b = FieldValue(b)
      b = ffi.NULL if b is None else b.impl
      lib.FieldValue_compareText(ffi.cast("FieldValue *", self.impl), ffi.cast("FieldValue *", b))

   def stringify(self):
      return pyOrNewObject(String, lib.FieldValue_stringify(self.impl))

class FixedMultiLineString(String):
   def __init__(self,
                impl = None):
      String.__init__(self, impl = impl)

class GetMemberString(NoCaseAccent):
   def __init__(self, templateParams = None,
                method = None,
                returnType = None,
                args = None,
                rType = None,
                argTypes = None,
                cif = None,
                impl = None):
      NoCaseAccent.__init__(self, templateParams, impl = impl)
      if method is not None:     self.method = method
      if returnType is not None: self.returnType = returnType
      if args is not None:       self.args = args
      if rType is not None:      self.rType = rType
      if argTypes is not None:   self.argTypes = argTypes
      if cif is not None:        self.cif = cif

   @property
   def method(self): return Method(impl = IPTR(lib, ffi, self, GetMemberString).method)
   @method.setter
   def method(self, value):
      if not isinstance(value, Method): value = Method(value)
      IPTR(lib, ffi, self, GetMemberString).method = value.impl

   @property
   def returnType(self): return Class(impl = IPTR(lib, ffi, self, GetMemberString).returnType)
   @returnType.setter
   def returnType(self, value):
      if not isinstance(value, Class): value = Class(value)
      IPTR(lib, ffi, self, GetMemberString).returnType = value.impl

   @property
   def args(self): return Array(impl = IPTR(lib, ffi, self, GetMemberString).args)
   @args.setter
   def args(self, value): IPTR(lib, ffi, self, GetMemberString).args = value.impl

   @property
   def rType(self): return IPTR(lib, ffi, self, GetMemberString).rType
   @rType.setter
   def rType(self, value): IPTR(lib, ffi, self, GetMemberString).rType = value

   @property
   def argTypes(self): return Array(impl = IPTR(lib, ffi, self, GetMemberString).argTypes)
   @argTypes.setter
   def argTypes(self, value): IPTR(lib, ffi, self, GetMemberString).argTypes = value.impl

   @property
   def cif(self): return IPTR(lib, ffi, self, GetMemberString).cif
   @cif.setter
   def cif(self, value): IPTR(lib, ffi, self, GetMemberString).cif = value

   def function(self, pn):
      return pyOrNewObject(String, lib.GetMemberString_function(self.impl, TA(pn)))

@ffi.callback("void(Grouping, Array, int, bool *)")
def cb_Grouping_advance(__g, groupings, level, dontAdvance):
   grouping = pyOrNewObject(Grouping, __g)
   grouping.fn_Grouping_advance(grouping, Array("<Grouping>", impl = groupings), level, dontAdvance)

@ffi.callback("void(Grouping)")
def cb_Grouping_shouldSkip(__g):
   grouping = pyOrNewObject(Grouping, __g)
   grouping.fn_Grouping_shouldSkip(grouping)

class Grouping(Instance):
   def __init__(self,
                groupId = None,
                row = None,
                field = None,
                fieldLink = None,
                filtered = None,
                filters = None,
                listFieldLink = None,
                reverseListFieldLink = None,
                reverseLink = None,
                activeOnly = None,
                activeField = None,
                rowsCount = None,
                header = None,
                continuation = None,
                footer = None,
                advance = None,
                shouldSkip = None,
                impl = None):
      Instance.__init__(self, impl = impl)
      if groupId is not None:              self.groupId = groupId
      if row is not None:                  self.row = row
      if field is not None:                self.field = field
      if fieldLink is not None:            self.fieldLink = fieldLink
      if filtered is not None:             self.filtered = filtered
      if filters is not None:              self.filters = filters
      if listFieldLink is not None:        self.listFieldLink = listFieldLink
      if reverseListFieldLink is not None: self.reverseListFieldLink = reverseListFieldLink
      if reverseLink is not None:          self.reverseLink = reverseLink
      if activeOnly is not None:           self.activeOnly = activeOnly
      if activeField is not None:          self.activeField = activeField
      if rowsCount is not None:            self.rowsCount = rowsCount
      if header is not None:               self.header = header
      if continuation is not None:         self.continuation = continuation
      if footer is not None:               self.footer = footer
      if advance is not None:              self.advance = advance
      if shouldSkip is not None:           self.shouldSkip = shouldSkip

   @property
   def groupId(self): return Id(impl = IPTR(lib, ffi, self, Grouping).groupId)
   @groupId.setter
   def groupId(self, value):
      if not isinstance(value, Id): value = Id(value)
      IPTR(lib, ffi, self, Grouping).groupId = value.impl

   @property
   def row(self): return Row(impl = IPTR(lib, ffi, self, Grouping).row)
   @row.setter
   def row(self, value):
      if not isinstance(value, Row): value = Row(value)
      IPTR(lib, ffi, self, Grouping).row = value.impl

   @property
   def field(self): return Field(impl = IPTR(lib, ffi, self, Grouping).field)
   @field.setter
   def field(self, value):
      if not isinstance(value, Field): value = Field(value)
      IPTR(lib, ffi, self, Grouping).field = value.impl

   @property
   def fieldLink(self): return Field(impl = IPTR(lib, ffi, self, Grouping).fieldLink)
   @fieldLink.setter
   def fieldLink(self, value):
      if not isinstance(value, Field): value = Field(value)
      IPTR(lib, ffi, self, Grouping).fieldLink = value.impl

   @property
   def filtered(self): return IPTR(lib, ffi, self, Grouping).filtered
   @filtered.setter
   def filtered(self, value): IPTR(lib, ffi, self, Grouping).filtered = value

   @property
   def filters(self): return Array(impl = IPTR(lib, ffi, self, Grouping).filters)
   @filters.setter
   def filters(self, value): IPTR(lib, ffi, self, Grouping).filters = value.impl

   @property
   def listFieldLink(self): return Field(impl = IPTR(lib, ffi, self, Grouping).listFieldLink)
   @listFieldLink.setter
   def listFieldLink(self, value):
      if not isinstance(value, Field): value = Field(value)
      IPTR(lib, ffi, self, Grouping).listFieldLink = value.impl

   @property
   def reverseListFieldLink(self): return Field(impl = IPTR(lib, ffi, self, Grouping).reverseListFieldLink)
   @reverseListFieldLink.setter
   def reverseListFieldLink(self, value):
      if not isinstance(value, Field): value = Field(value)
      IPTR(lib, ffi, self, Grouping).reverseListFieldLink = value.impl

   @property
   def reverseLink(self): return Grouping(impl = IPTR(lib, ffi, self, Grouping).reverseLink)
   @reverseLink.setter
   def reverseLink(self, value):
      if not isinstance(value, Grouping): value = Grouping(value)
      IPTR(lib, ffi, self, Grouping).reverseLink = value.impl

   @property
   def activeOnly(self): return IPTR(lib, ffi, self, Grouping).activeOnly
   @activeOnly.setter
   def activeOnly(self, value): IPTR(lib, ffi, self, Grouping).activeOnly = value

   @property
   def activeField(self): return Field(impl = IPTR(lib, ffi, self, Grouping).activeField)
   @activeField.setter
   def activeField(self, value):
      if not isinstance(value, Field): value = Field(value)
      IPTR(lib, ffi, self, Grouping).activeField = value.impl

   @property
   def rowsCount(self): return IPTR(lib, ffi, self, Grouping).rowsCount
   @rowsCount.setter
   def rowsCount(self, value): IPTR(lib, ffi, self, Grouping).rowsCount = value

   @property
   def header(self): return IPTR(lib, ffi, self, Grouping).header
   @header.setter
   def header(self, value): IPTR(lib, ffi, self, Grouping).header = value

   @property
   def continuation(self): return IPTR(lib, ffi, self, Grouping).continuation
   @continuation.setter
   def continuation(self, value): IPTR(lib, ffi, self, Grouping).continuation = value

   @property
   def footer(self): return IPTR(lib, ffi, self, Grouping).footer
   @footer.setter
   def footer(self, value): IPTR(lib, ffi, self, Grouping).footer = value

   def fn_unset_Grouping_advance(self, groupings, level, dontAdvance):
      if dontAdvance is None: dontAdvance = ffi.NULL
      return lib.Grouping_advance(self.impl, ffi.NULL if groupings is None else groupings.impl, level, dontAdvance)

   @property
   def advance(self):
      if hasattr(self, 'fn_Grouping_advance'): return self.fn_Grouping_advance
      else: return self.fn_unset_Grouping_advance
   @advance.setter
   def advance(self, value):
      self.fn_Grouping_advance = value
      lib.Instance_setMethod(self.impl, "Advance".encode('utf8'), cb_Grouping_advance)

   def fn_unset_Grouping_shouldSkip(self):
      return lib.Grouping_shouldSkip(self.impl)

   @property
   def shouldSkip(self):
      if hasattr(self, 'fn_Grouping_shouldSkip'): return self.fn_Grouping_shouldSkip
      else: return self.fn_unset_Grouping_shouldSkip
   @shouldSkip.setter
   def shouldSkip(self, value):
      self.fn_Grouping_shouldSkip = value
      lib.Instance_setMethod(self.impl, "ShouldSkip".encode('utf8'), cb_Grouping_shouldSkip)

class Id(pyBaseClass):
   def __init__(self, impl = 0):
      self.impl = impl

Id.buc = Id

class IdFilter:
   def __init__(self, id = None, field = None, impl = None):
      if impl is not None:
         self.impl = impl
      else:
         self.impl = ffi.cast("IdFilter *", lib.Instance_new(lib.class_IdFilter))
         if id is not None:    self.id    = id
         if field is not None: self.field = field

   @property
   def id(self): return Id(impl = self.impl.id)
   @id.setter
   def id(self, value):
      if not isinstance(value, Id): value = Id(value)
      self.impl.id = value.impl

   @property
   def field(self): return pyOrNewObject(Field, self.impl.field)
   @field.setter
   def field(self, value):
      if not isinstance(value, Field): value = Field(value)
      self.impl.field = value

   def rowMatch(self, row):
      if row is not None and not isinstance(row, Row): row = Row(row)
      if row is None: row = ffi.NULL
      return lib.IdFilter_rowMatch(self.impl, row)

class IdList32(IdList):
   def __init__(self,
                count = None,
                ids = None,
                impl = None):
      IdList.__init__(self, impl = impl)
      if count is not None: self.count = count
      if ids is not None:   self.ids = ids

   @property
   def count(self): return IPTR(lib, ffi, self, IdList32).count
   @count.setter
   def count(self, value): IPTR(lib, ffi, self, IdList32).count = value

   @property
   def ids(self): return IPTR(lib, ffi, self, IdList32).ids
   @ids.setter
   def ids(self, value): IPTR(lib, ffi, self, IdList32).ids = value

class IdList32Includes(SQLCustomFunction):
   def __init__(self,
                method = None,
                returnType = None,
                args = None,
                rType = None,
                argTypes = None,
                cif = None,
                impl = None):
      SQLCustomFunction.__init__(self, impl = impl)
      if method is not None:     self.method = method
      if returnType is not None: self.returnType = returnType
      if args is not None:       self.args = args
      if rType is not None:      self.rType = rType
      if argTypes is not None:   self.argTypes = argTypes
      if cif is not None:        self.cif = cif

   @property
   def method(self): return Method(impl = IPTR(lib, ffi, self, IdList32Includes).method)
   @method.setter
   def method(self, value):
      if not isinstance(value, Method): value = Method(value)
      IPTR(lib, ffi, self, IdList32Includes).method = value.impl

   @property
   def returnType(self): return Class(impl = IPTR(lib, ffi, self, IdList32Includes).returnType)
   @returnType.setter
   def returnType(self, value):
      if not isinstance(value, Class): value = Class(value)
      IPTR(lib, ffi, self, IdList32Includes).returnType = value.impl

   @property
   def args(self): return Array(impl = IPTR(lib, ffi, self, IdList32Includes).args)
   @args.setter
   def args(self, value): IPTR(lib, ffi, self, IdList32Includes).args = value.impl

   @property
   def rType(self): return IPTR(lib, ffi, self, IdList32Includes).rType
   @rType.setter
   def rType(self, value): IPTR(lib, ffi, self, IdList32Includes).rType = value

   @property
   def argTypes(self): return Array(impl = IPTR(lib, ffi, self, IdList32Includes).argTypes)
   @argTypes.setter
   def argTypes(self, value): IPTR(lib, ffi, self, IdList32Includes).argTypes = value.impl

   @property
   def cif(self): return IPTR(lib, ffi, self, IdList32Includes).cif
   @cif.setter
   def cif(self, value): IPTR(lib, ffi, self, IdList32Includes).cif = value

   def function(self, list, id):
      if list is not None and not isinstance(list, IdList32): list = IdList32(list)
      if list is None: list = ffi.NULL
      if id is not None and not isinstance(id, Id): id = Id(id)
      if id is None: id = ffi.NULL
      return lib.IdList32Includes_function(self.impl, list, id)

class IdListIncludes(SQLCustomFunction):
   def __init__(self,
                method = None,
                returnType = None,
                args = None,
                rType = None,
                argTypes = None,
                cif = None,
                impl = None):
      SQLCustomFunction.__init__(self, impl = impl)
      if method is not None:     self.method = method
      if returnType is not None: self.returnType = returnType
      if args is not None:       self.args = args
      if rType is not None:      self.rType = rType
      if argTypes is not None:   self.argTypes = argTypes
      if cif is not None:        self.cif = cif

   @property
   def method(self): return Method(impl = IPTR(lib, ffi, self, IdListIncludes).method)
   @method.setter
   def method(self, value):
      if not isinstance(value, Method): value = Method(value)
      IPTR(lib, ffi, self, IdListIncludes).method = value.impl

   @property
   def returnType(self): return Class(impl = IPTR(lib, ffi, self, IdListIncludes).returnType)
   @returnType.setter
   def returnType(self, value):
      if not isinstance(value, Class): value = Class(value)
      IPTR(lib, ffi, self, IdListIncludes).returnType = value.impl

   @property
   def args(self): return Array(impl = IPTR(lib, ffi, self, IdListIncludes).args)
   @args.setter
   def args(self, value): IPTR(lib, ffi, self, IdListIncludes).args = value.impl

   @property
   def rType(self): return IPTR(lib, ffi, self, IdListIncludes).rType
   @rType.setter
   def rType(self, value): IPTR(lib, ffi, self, IdListIncludes).rType = value

   @property
   def argTypes(self): return Array(impl = IPTR(lib, ffi, self, IdListIncludes).argTypes)
   @argTypes.setter
   def argTypes(self, value): IPTR(lib, ffi, self, IdListIncludes).argTypes = value.impl

   @property
   def cif(self): return IPTR(lib, ffi, self, IdListIncludes).cif
   @cif.setter
   def cif(self, value): IPTR(lib, ffi, self, IdListIncludes).cif = value

   def function(self, list, id):
      if list is not None and not isinstance(list, IdList): list = IdList(list)
      if list is None: list = ffi.NULL
      if id is not None and not isinstance(id, Id): id = Id(id)
      if id is None: id = ffi.NULL
      return lib.IdListIncludes_function(self.impl, list, id)

class IndexOrder:
   ascending  = lib.IndexOrder_ascending
   descending = lib.IndexOrder_descending

class ListField:
   def __init__(self, field = None, dataField = None, lookupFindField = None, lookupValueField = None, lookupFindIndex = None, CustomLookup = None, impl = None):
      if impl is not None:
         self.impl = impl
      else:
         self.impl = ffi.cast("ListField *", lib.Instance_new(lib.class_ListField))
         if field is not None:            self.field            = field
         if dataField is not None:        self.dataField        = dataField
         if lookupFindField is not None:  self.lookupFindField  = lookupFindField
         if lookupValueField is not None: self.lookupValueField = lookupValueField
         if lookupFindIndex is not None:  self.lookupFindIndex  = lookupFindIndex
         if CustomLookup is not None:     self.CustomLookup     = CustomLookup

   @property
   def field(self): return pyOrNewObject(Field, self.impl.field)
   @field.setter
   def field(self, value):
      if not isinstance(value, Field): value = Field(value)
      self.impl.field = value

   @property
   def dataField(self): return pyOrNewObject(DataField, self.impl.dataField)
   @dataField.setter
   def dataField(self, value):
      if not isinstance(value, DataField): value = DataField(value)
      self.impl.dataField = value

   @property
   def lookupFindField(self): return pyOrNewObject(Field, self.impl.lookupFindField)
   @lookupFindField.setter
   def lookupFindField(self, value):
      if not isinstance(value, Field): value = Field(value)
      self.impl.lookupFindField = value

   @property
   def lookupValueField(self): return pyOrNewObject(Field, self.impl.lookupValueField)
   @lookupValueField.setter
   def lookupValueField(self, value):
      if not isinstance(value, Field): value = Field(value)
      self.impl.lookupValueField = value

   @property
   def lookupFindIndex(self): return pyOrNewObject(Table, self.impl.lookupFindIndex)
   @lookupFindIndex.setter
   def lookupFindIndex(self, value):
      if not isinstance(value, Table): value = Table(value)
      self.impl.lookupFindIndex = value

   @property
   def CustomLookup(self): return self.impl.CustomLookup
   @CustomLookup.setter
   def CustomLookup(self, value): self.impl.CustomLookup = value

@ffi.callback("void(Window, ListSection)")
def cb_ListSection_notifyDeleteConfirmation(__w, listSection):
   listSection = pyOrNewObject(ListSection, listSection)
   listSection.fn_ListSection_notifyDeleteConfirmation(pyOrNewObject(ListSection, __w), listSection)

@ffi.callback("void(Window, ListSection)")
def cb_ListSection_notifyDeleted(__w, listSection):
   listSection = pyOrNewObject(ListSection, listSection)
   listSection.fn_ListSection_notifyDeleted(pyOrNewObject(ListSection, __w), listSection)

@ffi.callback("void(Window, ListSection)")
def cb_ListSection_notifyDeleting(__w, listSection):
   listSection = pyOrNewObject(ListSection, listSection)
   listSection.fn_ListSection_notifyDeleting(pyOrNewObject(ListSection, __w), listSection)

@ffi.callback("void(Window, ListSection, Row)")
def cb_ListSection_notifyNew(__w, listSection, r):
   listSection = pyOrNewObject(ListSection, listSection)
   listSection.fn_ListSection_notifyNew(pyOrNewObject(ListSection, __w), listSection, pyOrNewObject(Row, r))

@ffi.callback("void(Window, ListSection, Row)")
def cb_ListSection_notifyRefillList(__w, listSection, r):
   listSection = pyOrNewObject(ListSection, listSection)
   listSection.fn_ListSection_notifyRefillList(pyOrNewObject(ListSection, __w), listSection, pyOrNewObject(Row, r))

@ffi.callback("void(Window, ListSection)")
def cb_ListSection_notifySaveConfirmation(__w, listSection):
   listSection = pyOrNewObject(ListSection, listSection)
   listSection.fn_ListSection_notifySaveConfirmation(pyOrNewObject(ListSection, __w), listSection)

@ffi.callback("void(Window, ListSection, Id)")
def cb_ListSection_notifySelectListRow(__w, listSection, id):
   listSection = pyOrNewObject(ListSection, listSection)
   listSection.fn_ListSection_notifySelectListRow(pyOrNewObject(ListSection, __w), listSection, Id(impl = id))

class ListSection(Group):
   def __init__(self,
                parent = None,
                master = None,
                caption = None,
                hotKey = None,
                background = None,
                opacity = None,
                foreground = None,
                borderStyle = None,
                minClientSize = None,
                maxClientSize = None,
                hasMaximize = None,
                hasMinimize = None,
                hasClose = None,
                nonClient = None,
                inactive = None,
                clickThrough = None,
                isRemote = None,
                noCycle = None,
                isModal = None,
                interim = None,
                tabCycle = None,
                isDefault = None,
                drawBehind = None,
                hasMenuBar = None,
                hasStatusBar = None,
                stayOnTop = None,
                menu = None,
                font = None,
                sizeAnchor = None,
                size = None,
                clientSize = None,
                anchor = None,
                position = None,
                disabled = None,
                state = None,
                visible = None,
                isDocument = None,
                mergeMenus = None,
                hasHorzScroll = None,
                hasVertScroll = None,
                dontHideScroll = None,
                dontScrollVert = None,
                dontScrollHorz = None,
                snapVertScroll = None,
                snapHorzScroll = None,
                scroll = None,
                modifyVirtualArea = None,
                dontAutoScrollArea = None,
                fileName = None,
                id = None,
                modifiedDocument = None,
                showInTaskBar = None,
                saveDialog = None,
                isActiveClient = None,
                cursor = None,
                name = None,
                displayDriver = None,
                autoCreate = None,
                scrollArea = None,
                is3D = None,
                closing = None,
                fullRender = None,
                icon = None,
                moveable = None,
                alphaBlend = None,
                useSharedMemory = None,
                glCapabilities = None,
                creationActivation = None,
                nativeDecorations = None,
                manageDisplay = None,
                text = None,
                controller = None,
                noConsequential = None,
                title = None,
                editor = None,
                table = None,
                fldId = None,
                fldName = None,
                fldActive = None,
                btnNew = None,
                btnDelete = None,
                list = None,
                getDecorationsSize = None,
                isInside = None,
                isMouseMoving = None,
                isMouseResizing = None,
                isOpaque = None,
                notifyActivate = None,
                notifyDestroyed = None,
                notifySaved = None,
                onActivate = None,
                onActivateClient = None,
                onApplyGraphics = None,
                onChildAddedOrRemoved = None,
                onChildResized = None,
                onChildVisibilityToggled = None,
                onClose = None,
                onCreate = None,
                onDestroy = None,
                onDestroyed = None,
                onDrawOverChildren = None,
                onFileModified = None,
                onHScroll = None,
                onKeyDown = None,
                onKeyHit = None,
                onKeyUp = None,
                onLeftButtonDown = None,
                onLeftButtonUp = None,
                onLeftDoubleClick = None,
                onLoadGraphics = None,
                onMiddleButtonDown = None,
                onMiddleButtonUp = None,
                onMiddleDoubleClick = None,
                onMouseCaptureLost = None,
                onMouseLeave = None,
                onMouseMove = None,
                onMouseOver = None,
                onMoving = None,
                onMultiTouch = None,
                onPosition = None,
                onPostCreate = None,
                onRedraw = None,
                onResize = None,
                onResizing = None,
                onRightButtonDown = None,
                onRightButtonUp = None,
                onRightDoubleClick = None,
                onSaveFile = None,
                onStateChange = None,
                onSysKeyDown = None,
                onSysKeyHit = None,
                onSysKeyUp = None,
                onUnloadGraphics = None,
                onVScroll = None,
                preShowDecorations = None,
                setBox = None,
                setWindowArea = None,
                setWindowMinimum = None,
                showDecorations = None,
                updateNonClient = None,
                notifyDeleteConfirmation = None,
                notifyDeleted = None,
                notifyDeleting = None,
                notifyNew = None,
                notifyRefillList = None,
                notifySaveConfirmation = None,
                notifySelectListRow = None,
                impl = None):
      Group.__init__(self, impl = impl)
      if parent is not None:                   self.parent = parent
      if master is not None:                   self.master = master
      if caption is not None:                  self.caption = caption
      if hotKey is not None:                   self.hotKey = hotKey
      if background is not None:               self.background = background
      if opacity is not None:                  self.opacity = opacity
      if foreground is not None:               self.foreground = foreground
      if borderStyle is not None:              self.borderStyle = borderStyle
      if minClientSize is not None:            self.minClientSize = minClientSize
      if maxClientSize is not None:            self.maxClientSize = maxClientSize
      if hasMaximize is not None:              self.hasMaximize = hasMaximize
      if hasMinimize is not None:              self.hasMinimize = hasMinimize
      if hasClose is not None:                 self.hasClose = hasClose
      if nonClient is not None:                self.nonClient = nonClient
      if inactive is not None:                 self.inactive = inactive
      if clickThrough is not None:             self.clickThrough = clickThrough
      if isRemote is not None:                 self.isRemote = isRemote
      if noCycle is not None:                  self.noCycle = noCycle
      if isModal is not None:                  self.isModal = isModal
      if interim is not None:                  self.interim = interim
      if tabCycle is not None:                 self.tabCycle = tabCycle
      if isDefault is not None:                self.isDefault = isDefault
      if drawBehind is not None:               self.drawBehind = drawBehind
      if hasMenuBar is not None:               self.hasMenuBar = hasMenuBar
      if hasStatusBar is not None:             self.hasStatusBar = hasStatusBar
      if stayOnTop is not None:                self.stayOnTop = stayOnTop
      if menu is not None:                     self.menu = menu
      if font is not None:                     self.font = font
      if sizeAnchor is not None:               self.sizeAnchor = sizeAnchor
      if size is not None:                     self.size = size
      if clientSize is not None:               self.clientSize = clientSize
      if anchor is not None:                   self.anchor = anchor
      if position is not None:                 self.position = position
      if disabled is not None:                 self.disabled = disabled
      if state is not None:                    self.state = state
      if visible is not None:                  self.visible = visible
      if isDocument is not None:               self.isDocument = isDocument
      if mergeMenus is not None:               self.mergeMenus = mergeMenus
      if hasHorzScroll is not None:            self.hasHorzScroll = hasHorzScroll
      if hasVertScroll is not None:            self.hasVertScroll = hasVertScroll
      if dontHideScroll is not None:           self.dontHideScroll = dontHideScroll
      if dontScrollVert is not None:           self.dontScrollVert = dontScrollVert
      if dontScrollHorz is not None:           self.dontScrollHorz = dontScrollHorz
      if snapVertScroll is not None:           self.snapVertScroll = snapVertScroll
      if snapHorzScroll is not None:           self.snapHorzScroll = snapHorzScroll
      if scroll is not None:                   self.scroll = scroll
      if modifyVirtualArea is not None:        self.modifyVirtualArea = modifyVirtualArea
      if dontAutoScrollArea is not None:       self.dontAutoScrollArea = dontAutoScrollArea
      if fileName is not None:                 self.fileName = fileName
      if id is not None:                       self.id = id
      if modifiedDocument is not None:         self.modifiedDocument = modifiedDocument
      if showInTaskBar is not None:            self.showInTaskBar = showInTaskBar
      if saveDialog is not None:               self.saveDialog = saveDialog
      if isActiveClient is not None:           self.isActiveClient = isActiveClient
      if cursor is not None:                   self.cursor = cursor
      if name is not None:                     self.name = name
      if displayDriver is not None:            self.displayDriver = displayDriver
      if autoCreate is not None:               self.autoCreate = autoCreate
      if scrollArea is not None:               self.scrollArea = scrollArea
      if is3D is not None:                     self.is3D = is3D
      if closing is not None:                  self.closing = closing
      if fullRender is not None:               self.fullRender = fullRender
      if icon is not None:                     self.icon = icon
      if moveable is not None:                 self.moveable = moveable
      if alphaBlend is not None:               self.alphaBlend = alphaBlend
      if useSharedMemory is not None:          self.useSharedMemory = useSharedMemory
      if glCapabilities is not None:           self.glCapabilities = glCapabilities
      if creationActivation is not None:       self.creationActivation = creationActivation
      if nativeDecorations is not None:        self.nativeDecorations = nativeDecorations
      if manageDisplay is not None:            self.manageDisplay = manageDisplay
      if text is not None:                     self.text = text
      if controller is not None:               self.controller = controller
      if noConsequential is not None:          self.noConsequential = noConsequential
      if title is not None:                    self.title = title
      if editor is not None:                   self.editor = editor
      if table is not None:                    self.table = table
      if fldId is not None:                    self.fldId = fldId
      if fldName is not None:                  self.fldName = fldName
      if fldActive is not None:                self.fldActive = fldActive
      if btnNew is not None:                   self.btnNew = btnNew
      if btnDelete is not None:                self.btnDelete = btnDelete
      if list is not None:                     self.list = list
      if getDecorationsSize is not None:       self.getDecorationsSize = getDecorationsSize
      if isInside is not None:                 self.isInside = isInside
      if isMouseMoving is not None:            self.isMouseMoving = isMouseMoving
      if isMouseResizing is not None:          self.isMouseResizing = isMouseResizing
      if isOpaque is not None:                 self.isOpaque = isOpaque
      if notifyActivate is not None:           self.notifyActivate = notifyActivate
      if notifyDestroyed is not None:          self.notifyDestroyed = notifyDestroyed
      if notifySaved is not None:              self.notifySaved = notifySaved
      if onActivate is not None:               self.onActivate = onActivate
      if onActivateClient is not None:         self.onActivateClient = onActivateClient
      if onApplyGraphics is not None:          self.onApplyGraphics = onApplyGraphics
      if onChildAddedOrRemoved is not None:    self.onChildAddedOrRemoved = onChildAddedOrRemoved
      if onChildResized is not None:           self.onChildResized = onChildResized
      if onChildVisibilityToggled is not None: self.onChildVisibilityToggled = onChildVisibilityToggled
      if onClose is not None:                  self.onClose = onClose
      if onCreate is not None:                 self.onCreate = onCreate
      if onDestroy is not None:                self.onDestroy = onDestroy
      if onDestroyed is not None:              self.onDestroyed = onDestroyed
      if onDrawOverChildren is not None:       self.onDrawOverChildren = onDrawOverChildren
      if onFileModified is not None:           self.onFileModified = onFileModified
      if onHScroll is not None:                self.onHScroll = onHScroll
      if onKeyDown is not None:                self.onKeyDown = onKeyDown
      if onKeyHit is not None:                 self.onKeyHit = onKeyHit
      if onKeyUp is not None:                  self.onKeyUp = onKeyUp
      if onLeftButtonDown is not None:         self.onLeftButtonDown = onLeftButtonDown
      if onLeftButtonUp is not None:           self.onLeftButtonUp = onLeftButtonUp
      if onLeftDoubleClick is not None:        self.onLeftDoubleClick = onLeftDoubleClick
      if onLoadGraphics is not None:           self.onLoadGraphics = onLoadGraphics
      if onMiddleButtonDown is not None:       self.onMiddleButtonDown = onMiddleButtonDown
      if onMiddleButtonUp is not None:         self.onMiddleButtonUp = onMiddleButtonUp
      if onMiddleDoubleClick is not None:      self.onMiddleDoubleClick = onMiddleDoubleClick
      if onMouseCaptureLost is not None:       self.onMouseCaptureLost = onMouseCaptureLost
      if onMouseLeave is not None:             self.onMouseLeave = onMouseLeave
      if onMouseMove is not None:              self.onMouseMove = onMouseMove
      if onMouseOver is not None:              self.onMouseOver = onMouseOver
      if onMoving is not None:                 self.onMoving = onMoving
      if onMultiTouch is not None:             self.onMultiTouch = onMultiTouch
      if onPosition is not None:               self.onPosition = onPosition
      if onPostCreate is not None:             self.onPostCreate = onPostCreate
      if onRedraw is not None:                 self.onRedraw = onRedraw
      if onResize is not None:                 self.onResize = onResize
      if onResizing is not None:               self.onResizing = onResizing
      if onRightButtonDown is not None:        self.onRightButtonDown = onRightButtonDown
      if onRightButtonUp is not None:          self.onRightButtonUp = onRightButtonUp
      if onRightDoubleClick is not None:       self.onRightDoubleClick = onRightDoubleClick
      if onSaveFile is not None:               self.onSaveFile = onSaveFile
      if onStateChange is not None:            self.onStateChange = onStateChange
      if onSysKeyDown is not None:             self.onSysKeyDown = onSysKeyDown
      if onSysKeyHit is not None:              self.onSysKeyHit = onSysKeyHit
      if onSysKeyUp is not None:               self.onSysKeyUp = onSysKeyUp
      if onUnloadGraphics is not None:         self.onUnloadGraphics = onUnloadGraphics
      if onVScroll is not None:                self.onVScroll = onVScroll
      if preShowDecorations is not None:       self.preShowDecorations = preShowDecorations
      if setBox is not None:                   self.setBox = setBox
      if setWindowArea is not None:            self.setWindowArea = setWindowArea
      if setWindowMinimum is not None:         self.setWindowMinimum = setWindowMinimum
      if showDecorations is not None:          self.showDecorations = showDecorations
      if updateNonClient is not None:          self.updateNonClient = updateNonClient
      if notifyDeleteConfirmation is not None: self.notifyDeleteConfirmation = notifyDeleteConfirmation
      if notifyDeleted is not None:            self.notifyDeleted = notifyDeleted
      if notifyDeleting is not None:           self.notifyDeleting = notifyDeleting
      if notifyNew is not None:                self.notifyNew = notifyNew
      if notifyRefillList is not None:         self.notifyRefillList = notifyRefillList
      if notifySaveConfirmation is not None:   self.notifySaveConfirmation = notifySaveConfirmation
      if notifySelectListRow is not None:      self.notifySelectListRow = notifySelectListRow

   @property
   def title(self): return Label(impl = IPTR(lib, ffi, self, ListSection).title)
   @title.setter
   def title(self, value):
      if not isinstance(value, Label): value = Label(value)
      IPTR(lib, ffi, self, ListSection).title = value.impl

   @property
   def editor(self): return None
   @editor.setter
   def editor(self, value):
      if not isinstance(value, EditSection): value = EditSection(value)
      lib.ListSection_set_editor(self.impl, value.impl)

   @property
   def table(self): return None
   @table.setter
   def table(self, value):
      if not isinstance(value, Table): value = Table(value)
      lib.ListSection_set_table(self.impl, value.impl)

   @property
   def fldId(self): return Field(impl = IPTR(lib, ffi, self, ListSection).fldId)
   @fldId.setter
   def fldId(self, value):
      if not isinstance(value, Field): value = Field(value)
      IPTR(lib, ffi, self, ListSection).fldId = value.impl

   @property
   def fldName(self): return Field(impl = IPTR(lib, ffi, self, ListSection).fldName)
   @fldName.setter
   def fldName(self, value):
      if not isinstance(value, Field): value = Field(value)
      IPTR(lib, ffi, self, ListSection).fldName = value.impl

   @property
   def fldActive(self): return Field(impl = IPTR(lib, ffi, self, ListSection).fldActive)
   @fldActive.setter
   def fldActive(self, value):
      if not isinstance(value, Field): value = Field(value)
      IPTR(lib, ffi, self, ListSection).fldActive = value.impl

   @property
   def btnNew(self): return ButtonStyle(impl = IPTR(lib, ffi, self, ListSection).btnNew)
   @btnNew.setter
   def btnNew(self, value):
      if not isinstance(value, ButtonStyle): value = ButtonStyle(value)
      IPTR(lib, ffi, self, ListSection).btnNew = value.impl

   @property
   def btnDelete(self): return ButtonStyle(impl = IPTR(lib, ffi, self, ListSection).btnDelete)
   @btnDelete.setter
   def btnDelete(self, value):
      if not isinstance(value, ButtonStyle): value = ButtonStyle(value)
      IPTR(lib, ffi, self, ListSection).btnDelete = value.impl

   @property
   def list(self): return ListBox(impl = IPTR(lib, ffi, self, ListSection).list)
   @list.setter
   def list(self, value):
      if not isinstance(value, ListBox): value = ListBox(value)
      IPTR(lib, ffi, self, ListSection).list = value.impl

   def filterNotifyChanged(self, dataBox, closeDropDown):
      if dataBox is not None and not isinstance(dataBox, DataBox): dataBox = DataBox(dataBox)
      if dataBox is None: dataBox = ffi.NULL
      return lib.ListSection_filterNotifyChanged(self.impl, dataBox, closeDropDown)

   def fn_unset_ListSection_notifyDeleteConfirmation(self, _window, listSection):
      return lib.ListSection_notifyDeleteConfirmation(self.impl, _window.impl, ffi.NULL if listSection is None else listSection.impl)

   @property
   def notifyDeleteConfirmation(self):
      if hasattr(self, 'fn_ListSection_notifyDeleteConfirmation'): return self.fn_ListSection_notifyDeleteConfirmation
      else: return self.fn_unset_ListSection_notifyDeleteConfirmation
   @notifyDeleteConfirmation.setter
   def notifyDeleteConfirmation(self, value):
      self.fn_ListSection_notifyDeleteConfirmation = value
      lib.Instance_setMethod(self.impl, "NotifyDeleteConfirmation".encode('utf8'), cb_ListSection_notifyDeleteConfirmation)

   def fn_unset_ListSection_notifyDeleted(self, _window, listSection):
      return lib.ListSection_notifyDeleted(self.impl, _window.impl, ffi.NULL if listSection is None else listSection.impl)

   @property
   def notifyDeleted(self):
      if hasattr(self, 'fn_ListSection_notifyDeleted'): return self.fn_ListSection_notifyDeleted
      else: return self.fn_unset_ListSection_notifyDeleted
   @notifyDeleted.setter
   def notifyDeleted(self, value):
      self.fn_ListSection_notifyDeleted = value
      lib.Instance_setMethod(self.impl, "NotifyDeleted".encode('utf8'), cb_ListSection_notifyDeleted)

   def fn_unset_ListSection_notifyDeleting(self, _window, listSection):
      return lib.ListSection_notifyDeleting(self.impl, _window.impl, ffi.NULL if listSection is None else listSection.impl)

   @property
   def notifyDeleting(self):
      if hasattr(self, 'fn_ListSection_notifyDeleting'): return self.fn_ListSection_notifyDeleting
      else: return self.fn_unset_ListSection_notifyDeleting
   @notifyDeleting.setter
   def notifyDeleting(self, value):
      self.fn_ListSection_notifyDeleting = value
      lib.Instance_setMethod(self.impl, "NotifyDeleting".encode('utf8'), cb_ListSection_notifyDeleting)

   def fn_unset_ListSection_notifyNew(self, _window, listSection, r):
      return lib.ListSection_notifyNew(self.impl, _window.impl, ffi.NULL if listSection is None else listSection.impl, ffi.NULL if r is None else r.impl)

   @property
   def notifyNew(self):
      if hasattr(self, 'fn_ListSection_notifyNew'): return self.fn_ListSection_notifyNew
      else: return self.fn_unset_ListSection_notifyNew
   @notifyNew.setter
   def notifyNew(self, value):
      self.fn_ListSection_notifyNew = value
      lib.Instance_setMethod(self.impl, "NotifyNew".encode('utf8'), cb_ListSection_notifyNew)

   def fn_unset_ListSection_notifyRefillList(self, _window, listSection, r):
      return lib.ListSection_notifyRefillList(self.impl, _window.impl, ffi.NULL if listSection is None else listSection.impl, ffi.NULL if r is None else r.impl)

   @property
   def notifyRefillList(self):
      if hasattr(self, 'fn_ListSection_notifyRefillList'): return self.fn_ListSection_notifyRefillList
      else: return self.fn_unset_ListSection_notifyRefillList
   @notifyRefillList.setter
   def notifyRefillList(self, value):
      self.fn_ListSection_notifyRefillList = value
      lib.Instance_setMethod(self.impl, "NotifyRefillList".encode('utf8'), cb_ListSection_notifyRefillList)

   def fn_unset_ListSection_notifySaveConfirmation(self, _window, listSection):
      return lib.ListSection_notifySaveConfirmation(self.impl, _window.impl, ffi.NULL if listSection is None else listSection.impl)

   @property
   def notifySaveConfirmation(self):
      if hasattr(self, 'fn_ListSection_notifySaveConfirmation'): return self.fn_ListSection_notifySaveConfirmation
      else: return self.fn_unset_ListSection_notifySaveConfirmation
   @notifySaveConfirmation.setter
   def notifySaveConfirmation(self, value):
      self.fn_ListSection_notifySaveConfirmation = value
      lib.Instance_setMethod(self.impl, "NotifySaveConfirmation".encode('utf8'), cb_ListSection_notifySaveConfirmation)

   def fn_unset_ListSection_notifySelectListRow(self, _window, listSection, id):
      return lib.ListSection_notifySelectListRow(self.impl, _window.impl, ffi.NULL if listSection is None else listSection.impl, id)

   @property
   def notifySelectListRow(self):
      if hasattr(self, 'fn_ListSection_notifySelectListRow'): return self.fn_ListSection_notifySelectListRow
      else: return self.fn_unset_ListSection_notifySelectListRow
   @notifySelectListRow.setter
   def notifySelectListRow(self, value):
      self.fn_ListSection_notifySelectListRow = value
      lib.Instance_setMethod(self.impl, "NotifySelectListRow".encode('utf8'), cb_ListSection_notifySelectListRow)

   def refillList(self):
      lib.ListSection_refillList(self.impl)

   def refreshState(self):
      lib.ListSection_refreshState(self.impl)

   def selectFirst(self):
      lib.ListSection_selectFirst(self.impl)

   def selectListRow(self, row):
      if row is not None and not isinstance(row, DataRow): row = DataRow(row)
      if row is None: row = ffi.NULL
      lib.ListSection_selectListRow(self.impl, row)

class Lookup(Instance):
   def __init__(self,
                valueField = None,
                findField = None,
                findIndex = None,
                impl = None):
      Instance.__init__(self, impl = impl)
      if valueField is not None: self.valueField = valueField
      if findField is not None:  self.findField = findField
      if findIndex is not None:  self.findIndex = findIndex

   @property
   def valueField(self): return Field(impl = IPTR(lib, ffi, self, Lookup).valueField)
   @valueField.setter
   def valueField(self, value):
      if not isinstance(value, Field): value = Field(value)
      IPTR(lib, ffi, self, Lookup).valueField = value.impl

   @property
   def findField(self): return Field(impl = IPTR(lib, ffi, self, Lookup).findField)
   @findField.setter
   def findField(self, value):
      if not isinstance(value, Field): value = Field(value)
      IPTR(lib, ffi, self, Lookup).findField = value.impl

   @property
   def findIndex(self): return Table(impl = IPTR(lib, ffi, self, Lookup).findIndex)
   @findIndex.setter
   def findIndex(self, value):
      if not isinstance(value, Table): value = Table(value)
      IPTR(lib, ffi, self, Lookup).findIndex = value.impl

class LookupEditor:
   def __init__(self, editorClass = None, parentWindow = None, lookupValueField = None, lookupFindField = None, lookupIdField = None, lookupFindIndex = None, impl = None):
      if impl is not None:
         self.impl = impl
      else:
         self.impl = ffi.cast("LookupEditor *", lib.Instance_new(lib.class_LookupEditor))
         if editorClass is not None:      self.editorClass      = editorClass
         if parentWindow is not None:     self.parentWindow     = parentWindow
         if lookupValueField is not None: self.lookupValueField = lookupValueField
         if lookupFindField is not None:  self.lookupFindField  = lookupFindField
         if lookupIdField is not None:    self.lookupIdField    = lookupIdField
         if lookupFindIndex is not None:  self.lookupFindIndex  = lookupFindIndex

   @property
   def editorClass(self): return self.impl.editorClass
   @editorClass.setter
   def editorClass(self, value): self.impl.editorClass = value

   @property
   def parentWindow(self): return pyOrNewObject(Window, self.impl.parentWindow)
   @parentWindow.setter
   def parentWindow(self, value):
      if not isinstance(value, Window): value = Window(value)
      self.impl.parentWindow = value

   @property
   def lookupValueField(self): return pyOrNewObject(Field, self.impl.lookupValueField)
   @lookupValueField.setter
   def lookupValueField(self, value):
      if not isinstance(value, Field): value = Field(value)
      self.impl.lookupValueField = value

   @property
   def lookupFindField(self): return pyOrNewObject(Field, self.impl.lookupFindField)
   @lookupFindField.setter
   def lookupFindField(self, value):
      if not isinstance(value, Field): value = Field(value)
      self.impl.lookupFindField = value

   @property
   def lookupIdField(self): return pyOrNewObject(Field, self.impl.lookupIdField)
   @lookupIdField.setter
   def lookupIdField(self, value):
      if not isinstance(value, Field): value = Field(value)
      self.impl.lookupIdField = value

   @property
   def lookupFindIndex(self): return pyOrNewObject(Table, self.impl.lookupFindIndex)
   @lookupFindIndex.setter
   def lookupFindIndex(self, value):
      if not isinstance(value, Table): value = Table(value)
      self.impl.lookupFindIndex = value

class MatchOptions:
   nil = lib.MatchOptions_nil

class MemberStringSample(Instance):
   def __init__(self,
                impl = None):
      Instance.__init__(self, impl = impl)

class MoveOptions:
   nil      = lib.MoveOptions_nil
   first    = lib.MoveOptions_first
   last     = lib.MoveOptions_last
   next     = lib.MoveOptions_next
   previous = lib.MoveOptions_previous
   middle   = lib.MoveOptions_middle
   here     = lib.MoveOptions_here

class ObjectType:
   table = lib.ObjectType_table
   view  = lib.ObjectType_view

class OpenOptions(pyBaseClass):
   def __init__(self, type = 0, create = 0, access = 0, impl = None):
      if impl is not None:
         self.impl = impl
      elif isinstance(type, OpenOptions):
         self.impl = type.impl
      else:
         if isinstance(type, tuple):
            __tuple = type
            type = 0
            if len(__tuple) > 0: type = __tuple[0]
            if len(__tuple) > 1: create = __tuple[1]
            if len(__tuple) > 2: access = __tuple[2]
         self.impl = (
            (type   << lib.OPENOPTIONS_type_SHIFT)   |
            (create << lib.OPENOPTIONS_create_SHIFT) |
            (access << lib.OPENOPTIONS_access_SHIFT) )

   @property
   def type(self): return ((((self.impl)) & lib.OPENOPTIONS_type_MASK) >> lib.OPENOPTIONS_type_SHIFT)
   @type.setter
   def type(self, value): self.value = ((self.impl) & ~(lib.OPENOPTIONS_type_MASK)) | (((value)) << lib.OPENOPTIONS_type_SHIFT)

   @property
   def create(self): return ((((self.impl)) & lib.OPENOPTIONS_create_MASK) >> lib.OPENOPTIONS_create_SHIFT)
   @create.setter
   def create(self, value): self.value = ((self.impl) & ~(lib.OPENOPTIONS_create_MASK)) | (((value)) << lib.OPENOPTIONS_create_SHIFT)

   @property
   def access(self): return ((((self.impl)) & lib.OPENOPTIONS_access_MASK) >> lib.OPENOPTIONS_access_SHIFT)
   @access.setter
   def access(self, value): self.value = ((self.impl) & ~(lib.OPENOPTIONS_access_MASK)) | (((value)) << lib.OPENOPTIONS_access_SHIFT)

class OpenType:
   queryRows     = lib.OpenType_queryRows
   tableRows     = lib.OpenType_tableRows
   viewRows      = lib.OpenType_viewRows
   processesList = lib.OpenType_processesList
   databasesList = lib.OpenType_databasesList
   tablesList    = lib.OpenType_tablesList
   fieldsList    = lib.OpenType_fieldsList

class Orientation:
   portrait  = lib.Orientation_portrait
   landscape = lib.Orientation_landscape

class Page(Window):
   def __init__(self,
                parent = None,
                master = None,
                caption = None,
                hotKey = None,
                background = None,
                opacity = None,
                foreground = None,
                borderStyle = None,
                minClientSize = None,
                maxClientSize = None,
                hasMaximize = None,
                hasMinimize = None,
                hasClose = None,
                nonClient = None,
                inactive = None,
                clickThrough = None,
                isRemote = None,
                noCycle = None,
                isModal = None,
                interim = None,
                tabCycle = None,
                isDefault = None,
                drawBehind = None,
                hasMenuBar = None,
                hasStatusBar = None,
                stayOnTop = None,
                menu = None,
                font = None,
                sizeAnchor = None,
                size = None,
                clientSize = None,
                anchor = None,
                position = None,
                disabled = None,
                state = None,
                visible = None,
                isDocument = None,
                mergeMenus = None,
                hasHorzScroll = None,
                hasVertScroll = None,
                dontHideScroll = None,
                dontScrollVert = None,
                dontScrollHorz = None,
                snapVertScroll = None,
                snapHorzScroll = None,
                scroll = None,
                modifyVirtualArea = None,
                dontAutoScrollArea = None,
                fileName = None,
                id = None,
                modifiedDocument = None,
                showInTaskBar = None,
                saveDialog = None,
                isActiveClient = None,
                cursor = None,
                name = None,
                displayDriver = None,
                autoCreate = None,
                scrollArea = None,
                is3D = None,
                closing = None,
                fullRender = None,
                icon = None,
                moveable = None,
                alphaBlend = None,
                useSharedMemory = None,
                glCapabilities = None,
                creationActivation = None,
                nativeDecorations = None,
                manageDisplay = None,
                text = None,
                controller = None,
                noConsequential = None,
                report = None,
                inside = None,
                headerHeight = None,
                getDecorationsSize = None,
                isInside = None,
                isMouseMoving = None,
                isMouseResizing = None,
                isOpaque = None,
                notifyActivate = None,
                notifyDestroyed = None,
                notifySaved = None,
                onActivate = None,
                onActivateClient = None,
                onApplyGraphics = None,
                onChildAddedOrRemoved = None,
                onChildResized = None,
                onChildVisibilityToggled = None,
                onClose = None,
                onCreate = None,
                onDestroy = None,
                onDestroyed = None,
                onDrawOverChildren = None,
                onFileModified = None,
                onHScroll = None,
                onKeyDown = None,
                onKeyHit = None,
                onKeyUp = None,
                onLeftButtonDown = None,
                onLeftButtonUp = None,
                onLeftDoubleClick = None,
                onLoadGraphics = None,
                onMiddleButtonDown = None,
                onMiddleButtonUp = None,
                onMiddleDoubleClick = None,
                onMouseCaptureLost = None,
                onMouseLeave = None,
                onMouseMove = None,
                onMouseOver = None,
                onMoving = None,
                onMultiTouch = None,
                onPosition = None,
                onPostCreate = None,
                onRedraw = None,
                onResize = None,
                onResizing = None,
                onRightButtonDown = None,
                onRightButtonUp = None,
                onRightDoubleClick = None,
                onSaveFile = None,
                onStateChange = None,
                onSysKeyDown = None,
                onSysKeyHit = None,
                onSysKeyUp = None,
                onUnloadGraphics = None,
                onVScroll = None,
                preShowDecorations = None,
                setBox = None,
                setWindowArea = None,
                setWindowMinimum = None,
                showDecorations = None,
                updateNonClient = None,
                impl = None):
      Window.__init__(self, impl = impl)
      if parent is not None:                   self.parent = parent
      if master is not None:                   self.master = master
      if caption is not None:                  self.caption = caption
      if hotKey is not None:                   self.hotKey = hotKey
      if background is not None:               self.background = background
      if opacity is not None:                  self.opacity = opacity
      if foreground is not None:               self.foreground = foreground
      if borderStyle is not None:              self.borderStyle = borderStyle
      if minClientSize is not None:            self.minClientSize = minClientSize
      if maxClientSize is not None:            self.maxClientSize = maxClientSize
      if hasMaximize is not None:              self.hasMaximize = hasMaximize
      if hasMinimize is not None:              self.hasMinimize = hasMinimize
      if hasClose is not None:                 self.hasClose = hasClose
      if nonClient is not None:                self.nonClient = nonClient
      if inactive is not None:                 self.inactive = inactive
      if clickThrough is not None:             self.clickThrough = clickThrough
      if isRemote is not None:                 self.isRemote = isRemote
      if noCycle is not None:                  self.noCycle = noCycle
      if isModal is not None:                  self.isModal = isModal
      if interim is not None:                  self.interim = interim
      if tabCycle is not None:                 self.tabCycle = tabCycle
      if isDefault is not None:                self.isDefault = isDefault
      if drawBehind is not None:               self.drawBehind = drawBehind
      if hasMenuBar is not None:               self.hasMenuBar = hasMenuBar
      if hasStatusBar is not None:             self.hasStatusBar = hasStatusBar
      if stayOnTop is not None:                self.stayOnTop = stayOnTop
      if menu is not None:                     self.menu = menu
      if font is not None:                     self.font = font
      if sizeAnchor is not None:               self.sizeAnchor = sizeAnchor
      if size is not None:                     self.size = size
      if clientSize is not None:               self.clientSize = clientSize
      if anchor is not None:                   self.anchor = anchor
      if position is not None:                 self.position = position
      if disabled is not None:                 self.disabled = disabled
      if state is not None:                    self.state = state
      if visible is not None:                  self.visible = visible
      if isDocument is not None:               self.isDocument = isDocument
      if mergeMenus is not None:               self.mergeMenus = mergeMenus
      if hasHorzScroll is not None:            self.hasHorzScroll = hasHorzScroll
      if hasVertScroll is not None:            self.hasVertScroll = hasVertScroll
      if dontHideScroll is not None:           self.dontHideScroll = dontHideScroll
      if dontScrollVert is not None:           self.dontScrollVert = dontScrollVert
      if dontScrollHorz is not None:           self.dontScrollHorz = dontScrollHorz
      if snapVertScroll is not None:           self.snapVertScroll = snapVertScroll
      if snapHorzScroll is not None:           self.snapHorzScroll = snapHorzScroll
      if scroll is not None:                   self.scroll = scroll
      if modifyVirtualArea is not None:        self.modifyVirtualArea = modifyVirtualArea
      if dontAutoScrollArea is not None:       self.dontAutoScrollArea = dontAutoScrollArea
      if fileName is not None:                 self.fileName = fileName
      if id is not None:                       self.id = id
      if modifiedDocument is not None:         self.modifiedDocument = modifiedDocument
      if showInTaskBar is not None:            self.showInTaskBar = showInTaskBar
      if saveDialog is not None:               self.saveDialog = saveDialog
      if isActiveClient is not None:           self.isActiveClient = isActiveClient
      if cursor is not None:                   self.cursor = cursor
      if name is not None:                     self.name = name
      if displayDriver is not None:            self.displayDriver = displayDriver
      if autoCreate is not None:               self.autoCreate = autoCreate
      if scrollArea is not None:               self.scrollArea = scrollArea
      if is3D is not None:                     self.is3D = is3D
      if closing is not None:                  self.closing = closing
      if fullRender is not None:               self.fullRender = fullRender
      if icon is not None:                     self.icon = icon
      if moveable is not None:                 self.moveable = moveable
      if alphaBlend is not None:               self.alphaBlend = alphaBlend
      if useSharedMemory is not None:          self.useSharedMemory = useSharedMemory
      if glCapabilities is not None:           self.glCapabilities = glCapabilities
      if creationActivation is not None:       self.creationActivation = creationActivation
      if nativeDecorations is not None:        self.nativeDecorations = nativeDecorations
      if manageDisplay is not None:            self.manageDisplay = manageDisplay
      if text is not None:                     self.text = text
      if controller is not None:               self.controller = controller
      if noConsequential is not None:          self.noConsequential = noConsequential
      if report is not None:                   self.report = report
      if inside is not None:                   self.inside = inside
      if headerHeight is not None:             self.headerHeight = headerHeight
      if getDecorationsSize is not None:       self.getDecorationsSize = getDecorationsSize
      if isInside is not None:                 self.isInside = isInside
      if isMouseMoving is not None:            self.isMouseMoving = isMouseMoving
      if isMouseResizing is not None:          self.isMouseResizing = isMouseResizing
      if isOpaque is not None:                 self.isOpaque = isOpaque
      if notifyActivate is not None:           self.notifyActivate = notifyActivate
      if notifyDestroyed is not None:          self.notifyDestroyed = notifyDestroyed
      if notifySaved is not None:              self.notifySaved = notifySaved
      if onActivate is not None:               self.onActivate = onActivate
      if onActivateClient is not None:         self.onActivateClient = onActivateClient
      if onApplyGraphics is not None:          self.onApplyGraphics = onApplyGraphics
      if onChildAddedOrRemoved is not None:    self.onChildAddedOrRemoved = onChildAddedOrRemoved
      if onChildResized is not None:           self.onChildResized = onChildResized
      if onChildVisibilityToggled is not None: self.onChildVisibilityToggled = onChildVisibilityToggled
      if onClose is not None:                  self.onClose = onClose
      if onCreate is not None:                 self.onCreate = onCreate
      if onDestroy is not None:                self.onDestroy = onDestroy
      if onDestroyed is not None:              self.onDestroyed = onDestroyed
      if onDrawOverChildren is not None:       self.onDrawOverChildren = onDrawOverChildren
      if onFileModified is not None:           self.onFileModified = onFileModified
      if onHScroll is not None:                self.onHScroll = onHScroll
      if onKeyDown is not None:                self.onKeyDown = onKeyDown
      if onKeyHit is not None:                 self.onKeyHit = onKeyHit
      if onKeyUp is not None:                  self.onKeyUp = onKeyUp
      if onLeftButtonDown is not None:         self.onLeftButtonDown = onLeftButtonDown
      if onLeftButtonUp is not None:           self.onLeftButtonUp = onLeftButtonUp
      if onLeftDoubleClick is not None:        self.onLeftDoubleClick = onLeftDoubleClick
      if onLoadGraphics is not None:           self.onLoadGraphics = onLoadGraphics
      if onMiddleButtonDown is not None:       self.onMiddleButtonDown = onMiddleButtonDown
      if onMiddleButtonUp is not None:         self.onMiddleButtonUp = onMiddleButtonUp
      if onMiddleDoubleClick is not None:      self.onMiddleDoubleClick = onMiddleDoubleClick
      if onMouseCaptureLost is not None:       self.onMouseCaptureLost = onMouseCaptureLost
      if onMouseLeave is not None:             self.onMouseLeave = onMouseLeave
      if onMouseMove is not None:              self.onMouseMove = onMouseMove
      if onMouseOver is not None:              self.onMouseOver = onMouseOver
      if onMoving is not None:                 self.onMoving = onMoving
      if onMultiTouch is not None:             self.onMultiTouch = onMultiTouch
      if onPosition is not None:               self.onPosition = onPosition
      if onPostCreate is not None:             self.onPostCreate = onPostCreate
      if onRedraw is not None:                 self.onRedraw = onRedraw
      if onResize is not None:                 self.onResize = onResize
      if onResizing is not None:               self.onResizing = onResizing
      if onRightButtonDown is not None:        self.onRightButtonDown = onRightButtonDown
      if onRightButtonUp is not None:          self.onRightButtonUp = onRightButtonUp
      if onRightDoubleClick is not None:       self.onRightDoubleClick = onRightDoubleClick
      if onSaveFile is not None:               self.onSaveFile = onSaveFile
      if onStateChange is not None:            self.onStateChange = onStateChange
      if onSysKeyDown is not None:             self.onSysKeyDown = onSysKeyDown
      if onSysKeyHit is not None:              self.onSysKeyHit = onSysKeyHit
      if onSysKeyUp is not None:               self.onSysKeyUp = onSysKeyUp
      if onUnloadGraphics is not None:         self.onUnloadGraphics = onUnloadGraphics
      if onVScroll is not None:                self.onVScroll = onVScroll
      if preShowDecorations is not None:       self.preShowDecorations = preShowDecorations
      if setBox is not None:                   self.setBox = setBox
      if setWindowArea is not None:            self.setWindowArea = setWindowArea
      if setWindowMinimum is not None:         self.setWindowMinimum = setWindowMinimum
      if showDecorations is not None:          self.showDecorations = showDecorations
      if updateNonClient is not None:          self.updateNonClient = updateNonClient

   @property
   def report(self): return pyOrNewObject(Report, lib.Page_get_report(self.impl))
   @report.setter
   def report(self, value):
      if not isinstance(value, Report): value = Report(value)
      lib.Page_set_report(self.impl, value.impl)

   @property
   def inside(self): return Window(impl = IPTR(lib, ffi, self, Page).inside)
   @inside.setter
   def inside(self, value):
      if not isinstance(value, Window): value = Window(value)
      IPTR(lib, ffi, self, Page).inside = value.impl

   @property
   def headerHeight(self): return IPTR(lib, ffi, self, Page).headerHeight
   @headerHeight.setter
   def headerHeight(self, value): IPTR(lib, ffi, self, Page).headerHeight = value

class PageFormat:
   custom = lib.PageFormat_custom
   letter = lib.PageFormat_letter
   legal  = lib.PageFormat_legal
   ledger = lib.PageFormat_ledger

class PrintedReport(ReportDestination):
   def __init__(self,
                parent = None,
                master = None,
                caption = None,
                hotKey = None,
                background = None,
                opacity = None,
                foreground = None,
                borderStyle = None,
                minClientSize = None,
                maxClientSize = None,
                hasMaximize = None,
                hasMinimize = None,
                hasClose = None,
                nonClient = None,
                inactive = None,
                clickThrough = None,
                isRemote = None,
                noCycle = None,
                isModal = None,
                interim = None,
                tabCycle = None,
                isDefault = None,
                drawBehind = None,
                hasMenuBar = None,
                hasStatusBar = None,
                stayOnTop = None,
                menu = None,
                font = None,
                sizeAnchor = None,
                size = None,
                clientSize = None,
                anchor = None,
                position = None,
                disabled = None,
                state = None,
                visible = None,
                isDocument = None,
                mergeMenus = None,
                hasHorzScroll = None,
                hasVertScroll = None,
                dontHideScroll = None,
                dontScrollVert = None,
                dontScrollHorz = None,
                snapVertScroll = None,
                snapHorzScroll = None,
                scroll = None,
                modifyVirtualArea = None,
                dontAutoScrollArea = None,
                fileName = None,
                id = None,
                modifiedDocument = None,
                showInTaskBar = None,
                saveDialog = None,
                isActiveClient = None,
                cursor = None,
                name = None,
                displayDriver = None,
                autoCreate = None,
                scrollArea = None,
                is3D = None,
                closing = None,
                fullRender = None,
                icon = None,
                moveable = None,
                alphaBlend = None,
                useSharedMemory = None,
                glCapabilities = None,
                creationActivation = None,
                nativeDecorations = None,
                manageDisplay = None,
                text = None,
                controller = None,
                noConsequential = None,
                report = None,
                getDecorationsSize = None,
                isInside = None,
                isMouseMoving = None,
                isMouseResizing = None,
                isOpaque = None,
                notifyActivate = None,
                notifyDestroyed = None,
                notifySaved = None,
                onActivate = None,
                onActivateClient = None,
                onApplyGraphics = None,
                onChildAddedOrRemoved = None,
                onChildResized = None,
                onChildVisibilityToggled = None,
                onClose = None,
                onCreate = None,
                onDestroy = None,
                onDestroyed = None,
                onDrawOverChildren = None,
                onFileModified = None,
                onHScroll = None,
                onKeyDown = None,
                onKeyHit = None,
                onKeyUp = None,
                onLeftButtonDown = None,
                onLeftButtonUp = None,
                onLeftDoubleClick = None,
                onLoadGraphics = None,
                onMiddleButtonDown = None,
                onMiddleButtonUp = None,
                onMiddleDoubleClick = None,
                onMouseCaptureLost = None,
                onMouseLeave = None,
                onMouseMove = None,
                onMouseOver = None,
                onMoving = None,
                onMultiTouch = None,
                onPosition = None,
                onPostCreate = None,
                onRedraw = None,
                onResize = None,
                onResizing = None,
                onRightButtonDown = None,
                onRightButtonUp = None,
                onRightDoubleClick = None,
                onSaveFile = None,
                onStateChange = None,
                onSysKeyDown = None,
                onSysKeyHit = None,
                onSysKeyUp = None,
                onUnloadGraphics = None,
                onVScroll = None,
                preShowDecorations = None,
                setBox = None,
                setWindowArea = None,
                setWindowMinimum = None,
                showDecorations = None,
                updateNonClient = None,
                addPage = None,
                endPage = None,
                getReport = None,
                impl = None):
      ReportDestination.__init__(self, impl = impl)
      if parent is not None:                   self.parent = parent
      if master is not None:                   self.master = master
      if caption is not None:                  self.caption = caption
      if hotKey is not None:                   self.hotKey = hotKey
      if background is not None:               self.background = background
      if opacity is not None:                  self.opacity = opacity
      if foreground is not None:               self.foreground = foreground
      if borderStyle is not None:              self.borderStyle = borderStyle
      if minClientSize is not None:            self.minClientSize = minClientSize
      if maxClientSize is not None:            self.maxClientSize = maxClientSize
      if hasMaximize is not None:              self.hasMaximize = hasMaximize
      if hasMinimize is not None:              self.hasMinimize = hasMinimize
      if hasClose is not None:                 self.hasClose = hasClose
      if nonClient is not None:                self.nonClient = nonClient
      if inactive is not None:                 self.inactive = inactive
      if clickThrough is not None:             self.clickThrough = clickThrough
      if isRemote is not None:                 self.isRemote = isRemote
      if noCycle is not None:                  self.noCycle = noCycle
      if isModal is not None:                  self.isModal = isModal
      if interim is not None:                  self.interim = interim
      if tabCycle is not None:                 self.tabCycle = tabCycle
      if isDefault is not None:                self.isDefault = isDefault
      if drawBehind is not None:               self.drawBehind = drawBehind
      if hasMenuBar is not None:               self.hasMenuBar = hasMenuBar
      if hasStatusBar is not None:             self.hasStatusBar = hasStatusBar
      if stayOnTop is not None:                self.stayOnTop = stayOnTop
      if menu is not None:                     self.menu = menu
      if font is not None:                     self.font = font
      if sizeAnchor is not None:               self.sizeAnchor = sizeAnchor
      if size is not None:                     self.size = size
      if clientSize is not None:               self.clientSize = clientSize
      if anchor is not None:                   self.anchor = anchor
      if position is not None:                 self.position = position
      if disabled is not None:                 self.disabled = disabled
      if state is not None:                    self.state = state
      if visible is not None:                  self.visible = visible
      if isDocument is not None:               self.isDocument = isDocument
      if mergeMenus is not None:               self.mergeMenus = mergeMenus
      if hasHorzScroll is not None:            self.hasHorzScroll = hasHorzScroll
      if hasVertScroll is not None:            self.hasVertScroll = hasVertScroll
      if dontHideScroll is not None:           self.dontHideScroll = dontHideScroll
      if dontScrollVert is not None:           self.dontScrollVert = dontScrollVert
      if dontScrollHorz is not None:           self.dontScrollHorz = dontScrollHorz
      if snapVertScroll is not None:           self.snapVertScroll = snapVertScroll
      if snapHorzScroll is not None:           self.snapHorzScroll = snapHorzScroll
      if scroll is not None:                   self.scroll = scroll
      if modifyVirtualArea is not None:        self.modifyVirtualArea = modifyVirtualArea
      if dontAutoScrollArea is not None:       self.dontAutoScrollArea = dontAutoScrollArea
      if fileName is not None:                 self.fileName = fileName
      if id is not None:                       self.id = id
      if modifiedDocument is not None:         self.modifiedDocument = modifiedDocument
      if showInTaskBar is not None:            self.showInTaskBar = showInTaskBar
      if saveDialog is not None:               self.saveDialog = saveDialog
      if isActiveClient is not None:           self.isActiveClient = isActiveClient
      if cursor is not None:                   self.cursor = cursor
      if name is not None:                     self.name = name
      if displayDriver is not None:            self.displayDriver = displayDriver
      if autoCreate is not None:               self.autoCreate = autoCreate
      if scrollArea is not None:               self.scrollArea = scrollArea
      if is3D is not None:                     self.is3D = is3D
      if closing is not None:                  self.closing = closing
      if fullRender is not None:               self.fullRender = fullRender
      if icon is not None:                     self.icon = icon
      if moveable is not None:                 self.moveable = moveable
      if alphaBlend is not None:               self.alphaBlend = alphaBlend
      if useSharedMemory is not None:          self.useSharedMemory = useSharedMemory
      if glCapabilities is not None:           self.glCapabilities = glCapabilities
      if creationActivation is not None:       self.creationActivation = creationActivation
      if nativeDecorations is not None:        self.nativeDecorations = nativeDecorations
      if manageDisplay is not None:            self.manageDisplay = manageDisplay
      if text is not None:                     self.text = text
      if controller is not None:               self.controller = controller
      if noConsequential is not None:          self.noConsequential = noConsequential
      if report is not None:                   self.report = report
      if getDecorationsSize is not None:       self.getDecorationsSize = getDecorationsSize
      if isInside is not None:                 self.isInside = isInside
      if isMouseMoving is not None:            self.isMouseMoving = isMouseMoving
      if isMouseResizing is not None:          self.isMouseResizing = isMouseResizing
      if isOpaque is not None:                 self.isOpaque = isOpaque
      if notifyActivate is not None:           self.notifyActivate = notifyActivate
      if notifyDestroyed is not None:          self.notifyDestroyed = notifyDestroyed
      if notifySaved is not None:              self.notifySaved = notifySaved
      if onActivate is not None:               self.onActivate = onActivate
      if onActivateClient is not None:         self.onActivateClient = onActivateClient
      if onApplyGraphics is not None:          self.onApplyGraphics = onApplyGraphics
      if onChildAddedOrRemoved is not None:    self.onChildAddedOrRemoved = onChildAddedOrRemoved
      if onChildResized is not None:           self.onChildResized = onChildResized
      if onChildVisibilityToggled is not None: self.onChildVisibilityToggled = onChildVisibilityToggled
      if onClose is not None:                  self.onClose = onClose
      if onCreate is not None:                 self.onCreate = onCreate
      if onDestroy is not None:                self.onDestroy = onDestroy
      if onDestroyed is not None:              self.onDestroyed = onDestroyed
      if onDrawOverChildren is not None:       self.onDrawOverChildren = onDrawOverChildren
      if onFileModified is not None:           self.onFileModified = onFileModified
      if onHScroll is not None:                self.onHScroll = onHScroll
      if onKeyDown is not None:                self.onKeyDown = onKeyDown
      if onKeyHit is not None:                 self.onKeyHit = onKeyHit
      if onKeyUp is not None:                  self.onKeyUp = onKeyUp
      if onLeftButtonDown is not None:         self.onLeftButtonDown = onLeftButtonDown
      if onLeftButtonUp is not None:           self.onLeftButtonUp = onLeftButtonUp
      if onLeftDoubleClick is not None:        self.onLeftDoubleClick = onLeftDoubleClick
      if onLoadGraphics is not None:           self.onLoadGraphics = onLoadGraphics
      if onMiddleButtonDown is not None:       self.onMiddleButtonDown = onMiddleButtonDown
      if onMiddleButtonUp is not None:         self.onMiddleButtonUp = onMiddleButtonUp
      if onMiddleDoubleClick is not None:      self.onMiddleDoubleClick = onMiddleDoubleClick
      if onMouseCaptureLost is not None:       self.onMouseCaptureLost = onMouseCaptureLost
      if onMouseLeave is not None:             self.onMouseLeave = onMouseLeave
      if onMouseMove is not None:              self.onMouseMove = onMouseMove
      if onMouseOver is not None:              self.onMouseOver = onMouseOver
      if onMoving is not None:                 self.onMoving = onMoving
      if onMultiTouch is not None:             self.onMultiTouch = onMultiTouch
      if onPosition is not None:               self.onPosition = onPosition
      if onPostCreate is not None:             self.onPostCreate = onPostCreate
      if onRedraw is not None:                 self.onRedraw = onRedraw
      if onResize is not None:                 self.onResize = onResize
      if onResizing is not None:               self.onResizing = onResizing
      if onRightButtonDown is not None:        self.onRightButtonDown = onRightButtonDown
      if onRightButtonUp is not None:          self.onRightButtonUp = onRightButtonUp
      if onRightDoubleClick is not None:       self.onRightDoubleClick = onRightDoubleClick
      if onSaveFile is not None:               self.onSaveFile = onSaveFile
      if onStateChange is not None:            self.onStateChange = onStateChange
      if onSysKeyDown is not None:             self.onSysKeyDown = onSysKeyDown
      if onSysKeyHit is not None:              self.onSysKeyHit = onSysKeyHit
      if onSysKeyUp is not None:               self.onSysKeyUp = onSysKeyUp
      if onUnloadGraphics is not None:         self.onUnloadGraphics = onUnloadGraphics
      if onVScroll is not None:                self.onVScroll = onVScroll
      if preShowDecorations is not None:       self.preShowDecorations = preShowDecorations
      if setBox is not None:                   self.setBox = setBox
      if setWindowArea is not None:            self.setWindowArea = setWindowArea
      if setWindowMinimum is not None:         self.setWindowMinimum = setWindowMinimum
      if showDecorations is not None:          self.showDecorations = showDecorations
      if updateNonClient is not None:          self.updateNonClient = updateNonClient
      if addPage is not None:                  self.addPage = addPage
      if endPage is not None:                  self.endPage = endPage
      if getReport is not None:                self.getReport = getReport

class RenderAction:
   addPage     = lib.RenderAction_addPage
   closePage   = lib.RenderAction_closePage
   levelStart  = lib.RenderAction_levelStart
   levelFinish = lib.RenderAction_levelFinish
   groupStart  = lib.RenderAction_groupStart
   groupFinish = lib.RenderAction_groupFinish
   actualRows  = lib.RenderAction_actualRows

@ffi.callback("void(Report, int, bool *)")
def cb_Report_advance(__r, level, dontAdvance):
   report = pyOrNewObject(Report, __r)
   report.fn_Report_advance(report, level, dontAdvance)

@ffi.callback("void(Report, Database)")
def cb_Report_executeData(__r, db):
   report = pyOrNewObject(Report, __r)
   report.fn_Report_executeData(report, pyOrNewObject(Database, db))

@ffi.callback("void(Report, int)")
def cb_Report_executeRowData(__r, group):
   report = pyOrNewObject(Report, __r)
   report.fn_Report_executeRowData(report, group)

@ffi.callback("void(Report)")
def cb_Report_onReset(__r):
   report = pyOrNewObject(Report, __r)
   report.fn_Report_onReset(report)

class Report(Instance):
   def __init__(self,
                orientation = None,
                pageFormat = None,
                pageSize = None,
                insideMarginAnchor = None,
                groupings = None,
                title = None,
                render = None,
                reportHeader = None,
                reportFooter = None,
                pageHeader = None,
                pageFooter = None,
                rowDetail = None,
                advance = None,
                executeData = None,
                executeRowData = None,
                onReset = None,
                impl = None):
      Instance.__init__(self, impl = impl)
      if orientation is not None:        self.orientation = orientation
      if pageFormat is not None:         self.pageFormat = pageFormat
      if pageSize is not None:           self.pageSize = pageSize
      if insideMarginAnchor is not None: self.insideMarginAnchor = insideMarginAnchor
      if groupings is not None:          self.groupings = groupings
      if title is not None:              self.title = title
      if render is not None:             self.render = render
      if reportHeader is not None:       self.reportHeader = reportHeader
      if reportFooter is not None:       self.reportFooter = reportFooter
      if pageHeader is not None:         self.pageHeader = pageHeader
      if pageFooter is not None:         self.pageFooter = pageFooter
      if rowDetail is not None:          self.rowDetail = rowDetail
      if advance is not None:            self.advance = advance
      if executeData is not None:        self.executeData = executeData
      if executeRowData is not None:     self.executeRowData = executeRowData
      if onReset is not None:            self.onReset = onReset

   @property
   def orientation(self): return lib.Report_get_orientation(self.impl, value)
   @orientation.setter
   def orientation(self, value):
      lib.Report_set_orientation(self.impl, value)

   @property
   def pageFormat(self): return lib.Report_get_pageFormat(self.impl, value)
   @pageFormat.setter
   def pageFormat(self, value):
      lib.Report_set_pageFormat(self.impl, value)

   @property
   def pageSize(self): return Size(impl = IPTR(lib, ffi, self, Report).pageSize)
   @pageSize.setter
   def pageSize(self, value):
      if not isinstance(value, Size): value = Size(value)
      IPTR(lib, ffi, self, Report).pageSize = value.impl

   @property
   def insideMarginAnchor(self): return Anchor(impl = IPTR(lib, ffi, self, Report).insideMarginAnchor)
   @insideMarginAnchor.setter
   def insideMarginAnchor(self, value):
      if not isinstance(value, Anchor): value = Anchor(value)
      IPTR(lib, ffi, self, Report).insideMarginAnchor = value.impl

   @property
   def groupings(self): return Array(impl = IPTR(lib, ffi, self, Report).groupings)
   @groupings.setter
   def groupings(self, value): IPTR(lib, ffi, self, Report).groupings = value.impl

   @property
   def title(self): return None
   @title.setter
   def title(self, value):
      if not isinstance(value, String): value = String(value)
      lib.Report_set_title(self.impl, value.impl.encode('utf8'))

   @property
   def render(self): return ReportRender(impl = IPTR(lib, ffi, self, Report).render)
   @render.setter
   def render(self, value):
      if not isinstance(value, ReportRender): value = ReportRender(value)
      IPTR(lib, ffi, self, Report).render = value.impl

   @property
   def reportHeader(self): return IPTR(lib, ffi, self, Report).reportHeader
   @reportHeader.setter
   def reportHeader(self, value): IPTR(lib, ffi, self, Report).reportHeader = value

   @property
   def reportFooter(self): return IPTR(lib, ffi, self, Report).reportFooter
   @reportFooter.setter
   def reportFooter(self, value): IPTR(lib, ffi, self, Report).reportFooter = value

   @property
   def pageHeader(self): return IPTR(lib, ffi, self, Report).pageHeader
   @pageHeader.setter
   def pageHeader(self, value): IPTR(lib, ffi, self, Report).pageHeader = value

   @property
   def pageFooter(self): return IPTR(lib, ffi, self, Report).pageFooter
   @pageFooter.setter
   def pageFooter(self, value): IPTR(lib, ffi, self, Report).pageFooter = value

   @property
   def rowDetail(self): return IPTR(lib, ffi, self, Report).rowDetail
   @rowDetail.setter
   def rowDetail(self, value): IPTR(lib, ffi, self, Report).rowDetail = value

   @property
   def nil(self): return lib.Report_get_nil(self.impl)

   def fn_unset_Report_advance(self, level, dontAdvance):
      if dontAdvance is None: dontAdvance = ffi.NULL
      return lib.Report_advance(self.impl, level, dontAdvance)

   @property
   def advance(self):
      if hasattr(self, 'fn_Report_advance'): return self.fn_Report_advance
      else: return self.fn_unset_Report_advance
   @advance.setter
   def advance(self, value):
      self.fn_Report_advance = value
      lib.Instance_setMethod(self.impl, "Advance".encode('utf8'), cb_Report_advance)

   def fn_unset_Report_executeData(self, db):
      return lib.Report_executeData(self.impl, ffi.NULL if db is None else db.impl)

   @property
   def executeData(self):
      if hasattr(self, 'fn_Report_executeData'): return self.fn_Report_executeData
      else: return self.fn_unset_Report_executeData
   @executeData.setter
   def executeData(self, value):
      self.fn_Report_executeData = value
      lib.Instance_setMethod(self.impl, "ExecuteData".encode('utf8'), cb_Report_executeData)

   def fn_unset_Report_executeRowData(self, group):
      return lib.Report_executeRowData(self.impl, group)

   @property
   def executeRowData(self):
      if hasattr(self, 'fn_Report_executeRowData'): return self.fn_Report_executeRowData
      else: return self.fn_unset_Report_executeRowData
   @executeRowData.setter
   def executeRowData(self, value):
      self.fn_Report_executeRowData = value
      lib.Instance_setMethod(self.impl, "ExecuteRowData".encode('utf8'), cb_Report_executeRowData)

   def fn_unset_Report_onReset(self):
      return lib.Report_onReset(self.impl)

   @property
   def onReset(self):
      if hasattr(self, 'fn_Report_onReset'): return self.fn_Report_onReset
      else: return self.fn_unset_Report_onReset
   @onReset.setter
   def onReset(self, value):
      self.fn_Report_onReset = value
      lib.Instance_setMethod(self.impl, "OnReset".encode('utf8'), cb_Report_onReset)

class ReportPreviewArea(ReportDestination):
   def __init__(self,
                parent = None,
                master = None,
                caption = None,
                hotKey = None,
                background = None,
                opacity = None,
                foreground = None,
                borderStyle = None,
                minClientSize = None,
                maxClientSize = None,
                hasMaximize = None,
                hasMinimize = None,
                hasClose = None,
                nonClient = None,
                inactive = None,
                clickThrough = None,
                isRemote = None,
                noCycle = None,
                isModal = None,
                interim = None,
                tabCycle = None,
                isDefault = None,
                drawBehind = None,
                hasMenuBar = None,
                hasStatusBar = None,
                stayOnTop = None,
                menu = None,
                font = None,
                sizeAnchor = None,
                size = None,
                clientSize = None,
                anchor = None,
                position = None,
                disabled = None,
                state = None,
                visible = None,
                isDocument = None,
                mergeMenus = None,
                hasHorzScroll = None,
                hasVertScroll = None,
                dontHideScroll = None,
                dontScrollVert = None,
                dontScrollHorz = None,
                snapVertScroll = None,
                snapHorzScroll = None,
                scroll = None,
                modifyVirtualArea = None,
                dontAutoScrollArea = None,
                fileName = None,
                id = None,
                modifiedDocument = None,
                showInTaskBar = None,
                saveDialog = None,
                isActiveClient = None,
                cursor = None,
                name = None,
                displayDriver = None,
                autoCreate = None,
                scrollArea = None,
                is3D = None,
                closing = None,
                fullRender = None,
                icon = None,
                moveable = None,
                alphaBlend = None,
                useSharedMemory = None,
                glCapabilities = None,
                creationActivation = None,
                nativeDecorations = None,
                manageDisplay = None,
                text = None,
                controller = None,
                noConsequential = None,
                report = None,
                getDecorationsSize = None,
                isInside = None,
                isMouseMoving = None,
                isMouseResizing = None,
                isOpaque = None,
                notifyActivate = None,
                notifyDestroyed = None,
                notifySaved = None,
                onActivate = None,
                onActivateClient = None,
                onApplyGraphics = None,
                onChildAddedOrRemoved = None,
                onChildResized = None,
                onChildVisibilityToggled = None,
                onClose = None,
                onCreate = None,
                onDestroy = None,
                onDestroyed = None,
                onDrawOverChildren = None,
                onFileModified = None,
                onHScroll = None,
                onKeyDown = None,
                onKeyHit = None,
                onKeyUp = None,
                onLeftButtonDown = None,
                onLeftButtonUp = None,
                onLeftDoubleClick = None,
                onLoadGraphics = None,
                onMiddleButtonDown = None,
                onMiddleButtonUp = None,
                onMiddleDoubleClick = None,
                onMouseCaptureLost = None,
                onMouseLeave = None,
                onMouseMove = None,
                onMouseOver = None,
                onMoving = None,
                onMultiTouch = None,
                onPosition = None,
                onPostCreate = None,
                onRedraw = None,
                onResize = None,
                onResizing = None,
                onRightButtonDown = None,
                onRightButtonUp = None,
                onRightDoubleClick = None,
                onSaveFile = None,
                onStateChange = None,
                onSysKeyDown = None,
                onSysKeyHit = None,
                onSysKeyUp = None,
                onUnloadGraphics = None,
                onVScroll = None,
                preShowDecorations = None,
                setBox = None,
                setWindowArea = None,
                setWindowMinimum = None,
                showDecorations = None,
                updateNonClient = None,
                addPage = None,
                endPage = None,
                getReport = None,
                impl = None):
      ReportDestination.__init__(self, impl = impl)
      if parent is not None:                   self.parent = parent
      if master is not None:                   self.master = master
      if caption is not None:                  self.caption = caption
      if hotKey is not None:                   self.hotKey = hotKey
      if background is not None:               self.background = background
      if opacity is not None:                  self.opacity = opacity
      if foreground is not None:               self.foreground = foreground
      if borderStyle is not None:              self.borderStyle = borderStyle
      if minClientSize is not None:            self.minClientSize = minClientSize
      if maxClientSize is not None:            self.maxClientSize = maxClientSize
      if hasMaximize is not None:              self.hasMaximize = hasMaximize
      if hasMinimize is not None:              self.hasMinimize = hasMinimize
      if hasClose is not None:                 self.hasClose = hasClose
      if nonClient is not None:                self.nonClient = nonClient
      if inactive is not None:                 self.inactive = inactive
      if clickThrough is not None:             self.clickThrough = clickThrough
      if isRemote is not None:                 self.isRemote = isRemote
      if noCycle is not None:                  self.noCycle = noCycle
      if isModal is not None:                  self.isModal = isModal
      if interim is not None:                  self.interim = interim
      if tabCycle is not None:                 self.tabCycle = tabCycle
      if isDefault is not None:                self.isDefault = isDefault
      if drawBehind is not None:               self.drawBehind = drawBehind
      if hasMenuBar is not None:               self.hasMenuBar = hasMenuBar
      if hasStatusBar is not None:             self.hasStatusBar = hasStatusBar
      if stayOnTop is not None:                self.stayOnTop = stayOnTop
      if menu is not None:                     self.menu = menu
      if font is not None:                     self.font = font
      if sizeAnchor is not None:               self.sizeAnchor = sizeAnchor
      if size is not None:                     self.size = size
      if clientSize is not None:               self.clientSize = clientSize
      if anchor is not None:                   self.anchor = anchor
      if position is not None:                 self.position = position
      if disabled is not None:                 self.disabled = disabled
      if state is not None:                    self.state = state
      if visible is not None:                  self.visible = visible
      if isDocument is not None:               self.isDocument = isDocument
      if mergeMenus is not None:               self.mergeMenus = mergeMenus
      if hasHorzScroll is not None:            self.hasHorzScroll = hasHorzScroll
      if hasVertScroll is not None:            self.hasVertScroll = hasVertScroll
      if dontHideScroll is not None:           self.dontHideScroll = dontHideScroll
      if dontScrollVert is not None:           self.dontScrollVert = dontScrollVert
      if dontScrollHorz is not None:           self.dontScrollHorz = dontScrollHorz
      if snapVertScroll is not None:           self.snapVertScroll = snapVertScroll
      if snapHorzScroll is not None:           self.snapHorzScroll = snapHorzScroll
      if scroll is not None:                   self.scroll = scroll
      if modifyVirtualArea is not None:        self.modifyVirtualArea = modifyVirtualArea
      if dontAutoScrollArea is not None:       self.dontAutoScrollArea = dontAutoScrollArea
      if fileName is not None:                 self.fileName = fileName
      if id is not None:                       self.id = id
      if modifiedDocument is not None:         self.modifiedDocument = modifiedDocument
      if showInTaskBar is not None:            self.showInTaskBar = showInTaskBar
      if saveDialog is not None:               self.saveDialog = saveDialog
      if isActiveClient is not None:           self.isActiveClient = isActiveClient
      if cursor is not None:                   self.cursor = cursor
      if name is not None:                     self.name = name
      if displayDriver is not None:            self.displayDriver = displayDriver
      if autoCreate is not None:               self.autoCreate = autoCreate
      if scrollArea is not None:               self.scrollArea = scrollArea
      if is3D is not None:                     self.is3D = is3D
      if closing is not None:                  self.closing = closing
      if fullRender is not None:               self.fullRender = fullRender
      if icon is not None:                     self.icon = icon
      if moveable is not None:                 self.moveable = moveable
      if alphaBlend is not None:               self.alphaBlend = alphaBlend
      if useSharedMemory is not None:          self.useSharedMemory = useSharedMemory
      if glCapabilities is not None:           self.glCapabilities = glCapabilities
      if creationActivation is not None:       self.creationActivation = creationActivation
      if nativeDecorations is not None:        self.nativeDecorations = nativeDecorations
      if manageDisplay is not None:            self.manageDisplay = manageDisplay
      if text is not None:                     self.text = text
      if controller is not None:               self.controller = controller
      if noConsequential is not None:          self.noConsequential = noConsequential
      if report is not None:                   self.report = report
      if getDecorationsSize is not None:       self.getDecorationsSize = getDecorationsSize
      if isInside is not None:                 self.isInside = isInside
      if isMouseMoving is not None:            self.isMouseMoving = isMouseMoving
      if isMouseResizing is not None:          self.isMouseResizing = isMouseResizing
      if isOpaque is not None:                 self.isOpaque = isOpaque
      if notifyActivate is not None:           self.notifyActivate = notifyActivate
      if notifyDestroyed is not None:          self.notifyDestroyed = notifyDestroyed
      if notifySaved is not None:              self.notifySaved = notifySaved
      if onActivate is not None:               self.onActivate = onActivate
      if onActivateClient is not None:         self.onActivateClient = onActivateClient
      if onApplyGraphics is not None:          self.onApplyGraphics = onApplyGraphics
      if onChildAddedOrRemoved is not None:    self.onChildAddedOrRemoved = onChildAddedOrRemoved
      if onChildResized is not None:           self.onChildResized = onChildResized
      if onChildVisibilityToggled is not None: self.onChildVisibilityToggled = onChildVisibilityToggled
      if onClose is not None:                  self.onClose = onClose
      if onCreate is not None:                 self.onCreate = onCreate
      if onDestroy is not None:                self.onDestroy = onDestroy
      if onDestroyed is not None:              self.onDestroyed = onDestroyed
      if onDrawOverChildren is not None:       self.onDrawOverChildren = onDrawOverChildren
      if onFileModified is not None:           self.onFileModified = onFileModified
      if onHScroll is not None:                self.onHScroll = onHScroll
      if onKeyDown is not None:                self.onKeyDown = onKeyDown
      if onKeyHit is not None:                 self.onKeyHit = onKeyHit
      if onKeyUp is not None:                  self.onKeyUp = onKeyUp
      if onLeftButtonDown is not None:         self.onLeftButtonDown = onLeftButtonDown
      if onLeftButtonUp is not None:           self.onLeftButtonUp = onLeftButtonUp
      if onLeftDoubleClick is not None:        self.onLeftDoubleClick = onLeftDoubleClick
      if onLoadGraphics is not None:           self.onLoadGraphics = onLoadGraphics
      if onMiddleButtonDown is not None:       self.onMiddleButtonDown = onMiddleButtonDown
      if onMiddleButtonUp is not None:         self.onMiddleButtonUp = onMiddleButtonUp
      if onMiddleDoubleClick is not None:      self.onMiddleDoubleClick = onMiddleDoubleClick
      if onMouseCaptureLost is not None:       self.onMouseCaptureLost = onMouseCaptureLost
      if onMouseLeave is not None:             self.onMouseLeave = onMouseLeave
      if onMouseMove is not None:              self.onMouseMove = onMouseMove
      if onMouseOver is not None:              self.onMouseOver = onMouseOver
      if onMoving is not None:                 self.onMoving = onMoving
      if onMultiTouch is not None:             self.onMultiTouch = onMultiTouch
      if onPosition is not None:               self.onPosition = onPosition
      if onPostCreate is not None:             self.onPostCreate = onPostCreate
      if onRedraw is not None:                 self.onRedraw = onRedraw
      if onResize is not None:                 self.onResize = onResize
      if onResizing is not None:               self.onResizing = onResizing
      if onRightButtonDown is not None:        self.onRightButtonDown = onRightButtonDown
      if onRightButtonUp is not None:          self.onRightButtonUp = onRightButtonUp
      if onRightDoubleClick is not None:       self.onRightDoubleClick = onRightDoubleClick
      if onSaveFile is not None:               self.onSaveFile = onSaveFile
      if onStateChange is not None:            self.onStateChange = onStateChange
      if onSysKeyDown is not None:             self.onSysKeyDown = onSysKeyDown
      if onSysKeyHit is not None:              self.onSysKeyHit = onSysKeyHit
      if onSysKeyUp is not None:               self.onSysKeyUp = onSysKeyUp
      if onUnloadGraphics is not None:         self.onUnloadGraphics = onUnloadGraphics
      if onVScroll is not None:                self.onVScroll = onVScroll
      if preShowDecorations is not None:       self.preShowDecorations = preShowDecorations
      if setBox is not None:                   self.setBox = setBox
      if setWindowArea is not None:            self.setWindowArea = setWindowArea
      if setWindowMinimum is not None:         self.setWindowMinimum = setWindowMinimum
      if showDecorations is not None:          self.showDecorations = showDecorations
      if updateNonClient is not None:          self.updateNonClient = updateNonClient
      if addPage is not None:                  self.addPage = addPage
      if endPage is not None:                  self.endPage = endPage
      if getReport is not None:                self.getReport = getReport

class ReportRenderNormal(ReportRender):
   def __init__(self,
                pageNumber = None,
                level = None,
                getPageNumber = None,
                render = None,
                impl = None):
      ReportRender.__init__(self, impl = impl)
      if pageNumber is not None:    self.pageNumber = pageNumber
      if level is not None:         self.level = level
      if getPageNumber is not None: self.getPageNumber = getPageNumber
      if render is not None:        self.render = render

   @property
   def pageNumber(self): return IPTR(lib, ffi, self, ReportRenderNormal).pageNumber
   @pageNumber.setter
   def pageNumber(self, value): IPTR(lib, ffi, self, ReportRenderNormal).pageNumber = value

   @property
   def level(self): return IPTR(lib, ffi, self, ReportRenderNormal).level
   @level.setter
   def level(self, value): IPTR(lib, ffi, self, ReportRenderNormal).level = value

class ReportTitle(Window):
   def __init__(self,
                parent = None,
                master = None,
                caption = None,
                hotKey = None,
                background = None,
                opacity = None,
                foreground = None,
                borderStyle = None,
                minClientSize = None,
                maxClientSize = None,
                hasMaximize = None,
                hasMinimize = None,
                hasClose = None,
                nonClient = None,
                inactive = None,
                clickThrough = None,
                isRemote = None,
                noCycle = None,
                isModal = None,
                interim = None,
                tabCycle = None,
                isDefault = None,
                drawBehind = None,
                hasMenuBar = None,
                hasStatusBar = None,
                stayOnTop = None,
                menu = None,
                font = None,
                sizeAnchor = None,
                size = None,
                clientSize = None,
                anchor = None,
                position = None,
                disabled = None,
                state = None,
                visible = None,
                isDocument = None,
                mergeMenus = None,
                hasHorzScroll = None,
                hasVertScroll = None,
                dontHideScroll = None,
                dontScrollVert = None,
                dontScrollHorz = None,
                snapVertScroll = None,
                snapHorzScroll = None,
                scroll = None,
                modifyVirtualArea = None,
                dontAutoScrollArea = None,
                fileName = None,
                id = None,
                modifiedDocument = None,
                showInTaskBar = None,
                saveDialog = None,
                isActiveClient = None,
                cursor = None,
                name = None,
                displayDriver = None,
                autoCreate = None,
                scrollArea = None,
                is3D = None,
                closing = None,
                fullRender = None,
                icon = None,
                moveable = None,
                alphaBlend = None,
                useSharedMemory = None,
                glCapabilities = None,
                creationActivation = None,
                nativeDecorations = None,
                manageDisplay = None,
                text = None,
                controller = None,
                noConsequential = None,
                getDecorationsSize = None,
                isInside = None,
                isMouseMoving = None,
                isMouseResizing = None,
                isOpaque = None,
                notifyActivate = None,
                notifyDestroyed = None,
                notifySaved = None,
                onActivate = None,
                onActivateClient = None,
                onApplyGraphics = None,
                onChildAddedOrRemoved = None,
                onChildResized = None,
                onChildVisibilityToggled = None,
                onClose = None,
                onCreate = None,
                onDestroy = None,
                onDestroyed = None,
                onDrawOverChildren = None,
                onFileModified = None,
                onHScroll = None,
                onKeyDown = None,
                onKeyHit = None,
                onKeyUp = None,
                onLeftButtonDown = None,
                onLeftButtonUp = None,
                onLeftDoubleClick = None,
                onLoadGraphics = None,
                onMiddleButtonDown = None,
                onMiddleButtonUp = None,
                onMiddleDoubleClick = None,
                onMouseCaptureLost = None,
                onMouseLeave = None,
                onMouseMove = None,
                onMouseOver = None,
                onMoving = None,
                onMultiTouch = None,
                onPosition = None,
                onPostCreate = None,
                onRedraw = None,
                onResize = None,
                onResizing = None,
                onRightButtonDown = None,
                onRightButtonUp = None,
                onRightDoubleClick = None,
                onSaveFile = None,
                onStateChange = None,
                onSysKeyDown = None,
                onSysKeyHit = None,
                onSysKeyUp = None,
                onUnloadGraphics = None,
                onVScroll = None,
                preShowDecorations = None,
                setBox = None,
                setWindowArea = None,
                setWindowMinimum = None,
                showDecorations = None,
                updateNonClient = None,
                impl = None):
      Window.__init__(self, impl = impl)
      if parent is not None:                   self.parent = parent
      if master is not None:                   self.master = master
      if caption is not None:                  self.caption = caption
      if hotKey is not None:                   self.hotKey = hotKey
      if background is not None:               self.background = background
      if opacity is not None:                  self.opacity = opacity
      if foreground is not None:               self.foreground = foreground
      if borderStyle is not None:              self.borderStyle = borderStyle
      if minClientSize is not None:            self.minClientSize = minClientSize
      if maxClientSize is not None:            self.maxClientSize = maxClientSize
      if hasMaximize is not None:              self.hasMaximize = hasMaximize
      if hasMinimize is not None:              self.hasMinimize = hasMinimize
      if hasClose is not None:                 self.hasClose = hasClose
      if nonClient is not None:                self.nonClient = nonClient
      if inactive is not None:                 self.inactive = inactive
      if clickThrough is not None:             self.clickThrough = clickThrough
      if isRemote is not None:                 self.isRemote = isRemote
      if noCycle is not None:                  self.noCycle = noCycle
      if isModal is not None:                  self.isModal = isModal
      if interim is not None:                  self.interim = interim
      if tabCycle is not None:                 self.tabCycle = tabCycle
      if isDefault is not None:                self.isDefault = isDefault
      if drawBehind is not None:               self.drawBehind = drawBehind
      if hasMenuBar is not None:               self.hasMenuBar = hasMenuBar
      if hasStatusBar is not None:             self.hasStatusBar = hasStatusBar
      if stayOnTop is not None:                self.stayOnTop = stayOnTop
      if menu is not None:                     self.menu = menu
      if font is not None:                     self.font = font
      if sizeAnchor is not None:               self.sizeAnchor = sizeAnchor
      if size is not None:                     self.size = size
      if clientSize is not None:               self.clientSize = clientSize
      if anchor is not None:                   self.anchor = anchor
      if position is not None:                 self.position = position
      if disabled is not None:                 self.disabled = disabled
      if state is not None:                    self.state = state
      if visible is not None:                  self.visible = visible
      if isDocument is not None:               self.isDocument = isDocument
      if mergeMenus is not None:               self.mergeMenus = mergeMenus
      if hasHorzScroll is not None:            self.hasHorzScroll = hasHorzScroll
      if hasVertScroll is not None:            self.hasVertScroll = hasVertScroll
      if dontHideScroll is not None:           self.dontHideScroll = dontHideScroll
      if dontScrollVert is not None:           self.dontScrollVert = dontScrollVert
      if dontScrollHorz is not None:           self.dontScrollHorz = dontScrollHorz
      if snapVertScroll is not None:           self.snapVertScroll = snapVertScroll
      if snapHorzScroll is not None:           self.snapHorzScroll = snapHorzScroll
      if scroll is not None:                   self.scroll = scroll
      if modifyVirtualArea is not None:        self.modifyVirtualArea = modifyVirtualArea
      if dontAutoScrollArea is not None:       self.dontAutoScrollArea = dontAutoScrollArea
      if fileName is not None:                 self.fileName = fileName
      if id is not None:                       self.id = id
      if modifiedDocument is not None:         self.modifiedDocument = modifiedDocument
      if showInTaskBar is not None:            self.showInTaskBar = showInTaskBar
      if saveDialog is not None:               self.saveDialog = saveDialog
      if isActiveClient is not None:           self.isActiveClient = isActiveClient
      if cursor is not None:                   self.cursor = cursor
      if name is not None:                     self.name = name
      if displayDriver is not None:            self.displayDriver = displayDriver
      if autoCreate is not None:               self.autoCreate = autoCreate
      if scrollArea is not None:               self.scrollArea = scrollArea
      if is3D is not None:                     self.is3D = is3D
      if closing is not None:                  self.closing = closing
      if fullRender is not None:               self.fullRender = fullRender
      if icon is not None:                     self.icon = icon
      if moveable is not None:                 self.moveable = moveable
      if alphaBlend is not None:               self.alphaBlend = alphaBlend
      if useSharedMemory is not None:          self.useSharedMemory = useSharedMemory
      if glCapabilities is not None:           self.glCapabilities = glCapabilities
      if creationActivation is not None:       self.creationActivation = creationActivation
      if nativeDecorations is not None:        self.nativeDecorations = nativeDecorations
      if manageDisplay is not None:            self.manageDisplay = manageDisplay
      if text is not None:                     self.text = text
      if controller is not None:               self.controller = controller
      if noConsequential is not None:          self.noConsequential = noConsequential
      if getDecorationsSize is not None:       self.getDecorationsSize = getDecorationsSize
      if isInside is not None:                 self.isInside = isInside
      if isMouseMoving is not None:            self.isMouseMoving = isMouseMoving
      if isMouseResizing is not None:          self.isMouseResizing = isMouseResizing
      if isOpaque is not None:                 self.isOpaque = isOpaque
      if notifyActivate is not None:           self.notifyActivate = notifyActivate
      if notifyDestroyed is not None:          self.notifyDestroyed = notifyDestroyed
      if notifySaved is not None:              self.notifySaved = notifySaved
      if onActivate is not None:               self.onActivate = onActivate
      if onActivateClient is not None:         self.onActivateClient = onActivateClient
      if onApplyGraphics is not None:          self.onApplyGraphics = onApplyGraphics
      if onChildAddedOrRemoved is not None:    self.onChildAddedOrRemoved = onChildAddedOrRemoved
      if onChildResized is not None:           self.onChildResized = onChildResized
      if onChildVisibilityToggled is not None: self.onChildVisibilityToggled = onChildVisibilityToggled
      if onClose is not None:                  self.onClose = onClose
      if onCreate is not None:                 self.onCreate = onCreate
      if onDestroy is not None:                self.onDestroy = onDestroy
      if onDestroyed is not None:              self.onDestroyed = onDestroyed
      if onDrawOverChildren is not None:       self.onDrawOverChildren = onDrawOverChildren
      if onFileModified is not None:           self.onFileModified = onFileModified
      if onHScroll is not None:                self.onHScroll = onHScroll
      if onKeyDown is not None:                self.onKeyDown = onKeyDown
      if onKeyHit is not None:                 self.onKeyHit = onKeyHit
      if onKeyUp is not None:                  self.onKeyUp = onKeyUp
      if onLeftButtonDown is not None:         self.onLeftButtonDown = onLeftButtonDown
      if onLeftButtonUp is not None:           self.onLeftButtonUp = onLeftButtonUp
      if onLeftDoubleClick is not None:        self.onLeftDoubleClick = onLeftDoubleClick
      if onLoadGraphics is not None:           self.onLoadGraphics = onLoadGraphics
      if onMiddleButtonDown is not None:       self.onMiddleButtonDown = onMiddleButtonDown
      if onMiddleButtonUp is not None:         self.onMiddleButtonUp = onMiddleButtonUp
      if onMiddleDoubleClick is not None:      self.onMiddleDoubleClick = onMiddleDoubleClick
      if onMouseCaptureLost is not None:       self.onMouseCaptureLost = onMouseCaptureLost
      if onMouseLeave is not None:             self.onMouseLeave = onMouseLeave
      if onMouseMove is not None:              self.onMouseMove = onMouseMove
      if onMouseOver is not None:              self.onMouseOver = onMouseOver
      if onMoving is not None:                 self.onMoving = onMoving
      if onMultiTouch is not None:             self.onMultiTouch = onMultiTouch
      if onPosition is not None:               self.onPosition = onPosition
      if onPostCreate is not None:             self.onPostCreate = onPostCreate
      if onRedraw is not None:                 self.onRedraw = onRedraw
      if onResize is not None:                 self.onResize = onResize
      if onResizing is not None:               self.onResizing = onResizing
      if onRightButtonDown is not None:        self.onRightButtonDown = onRightButtonDown
      if onRightButtonUp is not None:          self.onRightButtonUp = onRightButtonUp
      if onRightDoubleClick is not None:       self.onRightDoubleClick = onRightDoubleClick
      if onSaveFile is not None:               self.onSaveFile = onSaveFile
      if onStateChange is not None:            self.onStateChange = onStateChange
      if onSysKeyDown is not None:             self.onSysKeyDown = onSysKeyDown
      if onSysKeyHit is not None:              self.onSysKeyHit = onSysKeyHit
      if onSysKeyUp is not None:               self.onSysKeyUp = onSysKeyUp
      if onUnloadGraphics is not None:         self.onUnloadGraphics = onUnloadGraphics
      if onVScroll is not None:                self.onVScroll = onVScroll
      if preShowDecorations is not None:       self.preShowDecorations = preShowDecorations
      if setBox is not None:                   self.setBox = setBox
      if setWindowArea is not None:            self.setWindowArea = setWindowArea
      if setWindowMinimum is not None:         self.setWindowMinimum = setWindowMinimum
      if showDecorations is not None:          self.showDecorations = showDecorations
      if updateNonClient is not None:          self.updateNonClient = updateNonClient

class Row(Instance):
   def __init__(self,
                tbl = None,
                query = None,
                sysID = None,
                impl = None):
      Instance.__init__(self, impl = impl)
      if tbl is not None:   self.tbl = tbl
      if query is not None: self.query = query
      if sysID is not None: self.sysID = sysID

   @property
   def tbl(self): return pyOrNewObject(Table, lib.Row_get_tbl(self.impl))
   @tbl.setter
   def tbl(self, value):
      if not isinstance(value, Table): value = Table(value)
      lib.Row_set_tbl(self.impl, value.impl)

   @property
   def nil(self): return lib.Row_get_nil(self.impl)

   @property
   def query(self): value = lib.Row_get_query(self.impl); return None if value == ffi.NULL else ffi.string(value).decode('utf8')
   @query.setter
   def query(self, value):
      lib.Row_set_query(self.impl, value.encode('utf8'))

   @property
   def rowsCount(self): return lib.Row_get_rowsCount(self.impl)

   @property
   def sysID(self): return lib.Row_get_sysID(self.impl)
   @sysID.setter
   def sysID(self, value):
      lib.Row_set_sysID(self.impl, value)

   def add(self):
      return lib.Row_add(self.impl)

   def addID(self, id):
      return lib.Row_addID(self.impl, id)

   def bindQueryData(self, paramID, fld, value):
      if fld is not None and not isinstance(fld, Field): fld = Field(fld)
      if fld is None: fld = ffi.NULL
      return lib.Row_bindQueryData(self.impl, paramID, fld, value)

   def delete(self):
      return lib.Row_delete(self.impl)

   def find(self, field, move, match, data):
      if field is not None and not isinstance(field, Field): field = Field(field)
      if field is None: field = ffi.NULL
      return lib.Row_find(self.impl, field, move, match, data)

   def findMultiple(self, findData, move, numFields):
      return lib.Row_findMultiple(self.impl, findData, move, numFields)

   def first(self):
      return lib.Row_first(self.impl)

   def gUIDataRowSetData(self, dr, df, fld):
      if dr is not None and not isinstance(dr, DataRow): dr = DataRow(dr)
      if dr is None: dr = ffi.NULL
      if df is not None and not isinstance(df, DataField): df = DataField(df)
      if df is None: df = ffi.NULL
      if fld is not None and not isinstance(fld, Field): fld = Field(fld)
      if fld is None: fld = ffi.NULL
      return lib.Row_gUIDataRowSetData(self.impl, dr, df, fld)

   def getColumn(self, paramID):
      return lib.Row_getColumn(self.impl, paramID)

   def getData(self, field, data):
      if field is not None and not isinstance(field, Field): field = Field(field)
      if field is None: field = ffi.NULL
      return lib.Row_getData(self.impl, field, data)

   def getDataFieldValue(self, field, value):
      if field is not None and not isinstance(field, Field): field = Field(field)
      if field is None: field = ffi.NULL
      if value is not None and not isinstance(value, FieldValue): value = FieldValue(value)
      value = ffi.NULL if value is None else value.impl
      return lib.Row_getDataFieldValue(self.impl, field, ffi.cast("FieldValue *", value))

   def getQueryData(self, paramID, fld, value):
      if fld is not None and not isinstance(fld, Field): fld = Field(fld)
      if fld is None: fld = ffi.NULL
      return lib.Row_getQueryData(self.impl, paramID, fld, value)

   def getRowData(self):
      return lib.Row_getRowData(self.impl)

   def last(self):
      return lib.Row_last(self.impl)

   def next(self):
      return lib.Row_next(self.impl)

   def previous(self):
      return lib.Row_previous(self.impl)

   def query(self, query):
      return lib.Row_query(self.impl, query.encode('utf8'))

   def select(self, move):
      return lib.Row_select(self.impl, move)

   def setData(self, field, data):
      if field is not None and not isinstance(field, Field): field = Field(field)
      if field is None: field = ffi.NULL
      return lib.Row_setData(self.impl, field, data)

   def setQueryParam(self, paramID, value):
      return lib.Row_setQueryParam(self.impl, paramID, value)

   def setQueryParam64(self, paramID, value):
      return lib.Row_setQueryParam64(self.impl, paramID, value)

   def setQueryParamObject(self, paramID, value, type):
      if type is not None and not isinstance(type, Class): type = Class(type)
      if type is None: type = ffi.NULL
      return lib.Row_setQueryParamObject(self.impl, paramID, value, type)

   def setQueryParamText(self, paramID, value):
      return lib.Row_setQueryParamText(self.impl, paramID, value.encode('utf8'))

   def synch(self, to):
      if to is not None and not isinstance(to, Row): to = Row(to)
      if to is None: to = ffi.NULL
      return lib.Row_synch(self.impl, to)

class SQLiteSearchField(Instance):
   def __init__(self,
                field = None,
                impl = None):
      Instance.__init__(self, impl = impl)
      if field is not None: self.field = field

   @property
   def field(self): return Field(impl = IPTR(lib, ffi, self, SQLiteSearchField).field)
   @field.setter
   def field(self, value):
      if not isinstance(value, Field): value = Field(value)
      IPTR(lib, ffi, self, SQLiteSearchField).field = value.impl

class SQLiteSearchTable(Instance):
   def __init__(self,
                table = None,
                idField = None,
                searchFields = None,
                impl = None):
      Instance.__init__(self, impl = impl)
      if table is not None:        self.table = table
      if idField is not None:      self.idField = idField
      if searchFields is not None: self.searchFields = searchFields

   @property
   def table(self): return Table(impl = IPTR(lib, ffi, self, SQLiteSearchTable).table)
   @table.setter
   def table(self, value):
      if not isinstance(value, Table): value = Table(value)
      IPTR(lib, ffi, self, SQLiteSearchTable).table = value.impl

   @property
   def idField(self): return Field(impl = IPTR(lib, ffi, self, SQLiteSearchTable).idField)
   @idField.setter
   def idField(self, value):
      if not isinstance(value, Field): value = Field(value)
      IPTR(lib, ffi, self, SQLiteSearchTable).idField = value.impl

   @property
   def searchFields(self): return Array(impl = IPTR(lib, ffi, self, SQLiteSearchTable).searchFields)
   @searchFields.setter
   def searchFields(self, value): IPTR(lib, ffi, self, SQLiteSearchTable).searchFields = value.impl

class SeekOptions:
   none       = lib.SeekOptions_none
   reset      = lib.SeekOptions_reset
   first      = lib.SeekOptions_first
   last       = lib.SeekOptions_last
   firstEqual = lib.SeekOptions_firstEqual
   lastEqual  = lib.SeekOptions_lastEqual

class State:
   none        = lib.State_none
   driver      = lib.State_driver
   connected   = lib.State_connected
   opened      = lib.State_opened
   closed      = lib.State_closed
   errorDriver = lib.State_errorDriver

class StringList(Instance):
   def __init__(self,
                impl = None):
      Instance.__init__(self, impl = impl)

class StringSearchField(Instance):
   def __init__(self,
                field = None,
                method = None,
                lookupFindField = None,
                lookupValueField = None,
                impl = None):
      Instance.__init__(self, impl = impl)
      if field is not None:            self.field = field
      if method is not None:           self.method = method
      if lookupFindField is not None:  self.lookupFindField = lookupFindField
      if lookupValueField is not None: self.lookupValueField = lookupValueField

   @property
   def field(self): return Field(impl = IPTR(lib, ffi, self, StringSearchField).field)
   @field.setter
   def field(self, value):
      if not isinstance(value, Field): value = Field(value)
      IPTR(lib, ffi, self, StringSearchField).field = value.impl

   @property
   def method(self): return StringSearchIndexingMethod(impl = IPTR(lib, ffi, self, StringSearchField).method)
   @method.setter
   def method(self, value): IPTR(lib, ffi, self, StringSearchField).method = value.impl

   @property
   def lookupFindField(self): return Field(impl = IPTR(lib, ffi, self, StringSearchField).lookupFindField)
   @lookupFindField.setter
   def lookupFindField(self, value):
      if not isinstance(value, Field): value = Field(value)
      IPTR(lib, ffi, self, StringSearchField).lookupFindField = value.impl

   @property
   def lookupValueField(self): return Field(impl = IPTR(lib, ffi, self, StringSearchField).lookupValueField)
   @lookupValueField.setter
   def lookupValueField(self, value):
      if not isinstance(value, Field): value = Field(value)
      IPTR(lib, ffi, self, StringSearchField).lookupValueField = value.impl

class StringSearchIndexingMethod:
   fullString    = lib.StringSearchIndexingMethod_fullString
   allSubstrings = lib.StringSearchIndexingMethod_allSubstrings

class StringSearchTable(Instance):
   def __init__(self,
                table = None,
                idField = None,
                searchFields = None,
                impl = None):
      Instance.__init__(self, impl = impl)
      if table is not None:        self.table = table
      if idField is not None:      self.idField = idField
      if searchFields is not None: self.searchFields = searchFields

   @property
   def table(self): return Table(impl = IPTR(lib, ffi, self, StringSearchTable).table)
   @table.setter
   def table(self, value):
      if not isinstance(value, Table): value = Table(value)
      IPTR(lib, ffi, self, StringSearchTable).table = value.impl

   @property
   def idField(self): return Field(impl = IPTR(lib, ffi, self, StringSearchTable).idField)
   @idField.setter
   def idField(self, value):
      if not isinstance(value, Field): value = Field(value)
      IPTR(lib, ffi, self, StringSearchTable).idField = value.impl

   @property
   def searchFields(self): return Array(impl = IPTR(lib, ffi, self, StringSearchTable).searchFields)
   @searchFields.setter
   def searchFields(self, value): IPTR(lib, ffi, self, StringSearchTable).searchFields = value.impl

@ffi.callback("void(Table, constString, Class *, int)")
def cb_Table_addField(__t, name, type, length):
   table = pyOrNewObject(Table, __t)
   table.fn_Table_addField(table, name, Class(impl = type), length)

@ffi.callback("void(Table)")
def cb_Table_createRow(__t):
   table = pyOrNewObject(Table, __t)
   table.fn_Table_createRow(table)

@ffi.callback("void(Table, constString)")
def cb_Table_findField(__t, name):
   table = pyOrNewObject(Table, __t)
   table.fn_Table_findField(table, name)

@ffi.callback("void(Table, int, FieldIndex *, bool)")
def cb_Table_generateIndex(__t, count, fieldIndexes, init):
   table = pyOrNewObject(Table, __t)
   table.fn_Table_generateIndex(table, count, fieldIndexes, init)

@ffi.callback("void(Table)")
def cb_Table_getFields(__t):
   table = pyOrNewObject(Table, __t)
   table.fn_Table_getFields(table)

@ffi.callback("void(Table)")
def cb_Table_getFieldsCount(__t):
   table = pyOrNewObject(Table, __t)
   table.fn_Table_getFieldsCount(table)

@ffi.callback("void(Table)")
def cb_Table_getFirstField(__t):
   table = pyOrNewObject(Table, __t)
   table.fn_Table_getFirstField(table)

@ffi.callback("void(Table)")
def cb_Table_getName(__t):
   table = pyOrNewObject(Table, __t)
   table.fn_Table_getName(table)

@ffi.callback("void(Table)")
def cb_Table_getPrimaryKey(__t):
   table = pyOrNewObject(Table, __t)
   table.fn_Table_getPrimaryKey(table)

@ffi.callback("void(Table)")
def cb_Table_getRecordSize(__t):
   table = pyOrNewObject(Table, __t)
   table.fn_Table_getRecordSize(table)

@ffi.callback("void(Table)")
def cb_Table_getRowsCount(__t):
   table = pyOrNewObject(Table, __t)
   table.fn_Table_getRowsCount(table)

class Table(Instance):
   def __init__(self,
                addField = None,
                createRow = None,
                findField = None,
                generateIndex = None,
                getFields = None,
                getFieldsCount = None,
                getFirstField = None,
                getName = None,
                getPrimaryKey = None,
                getRecordSize = None,
                getRowsCount = None,
                impl = None):
      Instance.__init__(self, impl = impl)
      if addField is not None:       self.addField = addField
      if createRow is not None:      self.createRow = createRow
      if findField is not None:      self.findField = findField
      if generateIndex is not None:  self.generateIndex = generateIndex
      if getFields is not None:      self.getFields = getFields
      if getFieldsCount is not None: self.getFieldsCount = getFieldsCount
      if getFirstField is not None:  self.getFirstField = getFirstField
      if getName is not None:        self.getName = getName
      if getPrimaryKey is not None:  self.getPrimaryKey = getPrimaryKey
      if getRecordSize is not None:  self.getRecordSize = getRecordSize
      if getRowsCount is not None:   self.getRowsCount = getRowsCount

   @property
   def name(self): value = lib.Table_get_name(self.impl) if self is not None and self.impl != ffi.NULL else ffi.NULL; return None if value == ffi.NULL else ffi.string(value).decode('utf8')

   @property
   def firstField(self): return pyOrNewObject(Field, lib.Table_get_firstField(self.impl))

   @property
   def primaryKey(self): return pyOrNewObject(Field, lib.Table_get_primaryKey(self.impl))

   @property
   def fieldsCount(self): return lib.Table_get_fieldsCount(self.impl)

   @property
   def rowsCount(self): return lib.Table_get_rowsCount(self.impl)

   @property
   def fields(self): return pyOrNewObject(Container, lib.Table_get_fields(self.impl))

   def fn_unset_Table_addField(self, name, type, length):
      return lib.Table_addField(self.impl, ffi.NULL if name is None else name.impl, ffi.NULL if type is None else type.impl, length)

   @property
   def addField(self):
      if hasattr(self, 'fn_Table_addField'): return self.fn_Table_addField
      else: return self.fn_unset_Table_addField
   @addField.setter
   def addField(self, value):
      self.fn_Table_addField = value
      lib.Instance_setMethod(self.impl, "AddField".encode('utf8'), cb_Table_addField)

   def fn_unset_Table_createRow(self):
      return lib.Table_createRow(self.impl)

   @property
   def createRow(self):
      if hasattr(self, 'fn_Table_createRow'): return self.fn_Table_createRow
      else: return self.fn_unset_Table_createRow
   @createRow.setter
   def createRow(self, value):
      self.fn_Table_createRow = value
      lib.Instance_setMethod(self.impl, "CreateRow".encode('utf8'), cb_Table_createRow)

   def fn_unset_Table_findField(self, name):
      return lib.Table_findField(self.impl, ffi.NULL if name is None else name.impl)

   @property
   def findField(self):
      if hasattr(self, 'fn_Table_findField'): return self.fn_Table_findField
      else: return self.fn_unset_Table_findField
   @findField.setter
   def findField(self, value):
      self.fn_Table_findField = value
      lib.Instance_setMethod(self.impl, "FindField".encode('utf8'), cb_Table_findField)

   def gUIListBoxAddFields(self, list):
      if list is not None and not isinstance(list, ListBox): list = ListBox(list)
      if list is None: list = ffi.NULL
      lib.Table_gUIListBoxAddFields(self.impl, list)

   def gUIListBoxAddRows(self, list):
      if list is not None and not isinstance(list, ListBox): list = ListBox(list)
      if list is None: list = ffi.NULL
      lib.Table_gUIListBoxAddRows(self.impl, list)

   def gUIListBoxAddRowsField(self, list, fieldName = None):
      if list is not None and not isinstance(list, ListBox): list = ListBox(list)
      if list is None: list = ffi.NULL
      if fieldName is not None and not isinstance(fieldName, String): fieldName = String(fieldName)
      if fieldName is None: fieldName = ffi.NULL
      lib.Table_gUIListBoxAddRowsField(self.impl, list, fieldName)

   def fn_unset_Table_generateIndex(self, count, fieldIndexes, init):
      return lib.Table_generateIndex(self.impl, count, fieldIndexes, init)

   @property
   def generateIndex(self):
      if hasattr(self, 'fn_Table_generateIndex'): return self.fn_Table_generateIndex
      else: return self.fn_unset_Table_generateIndex
   @generateIndex.setter
   def generateIndex(self, value):
      self.fn_Table_generateIndex = value
      lib.Instance_setMethod(self.impl, "GenerateIndex".encode('utf8'), cb_Table_generateIndex)

   def fn_unset_Table_getFields(self):
      return lib.Table_getFields(self.impl)

   @property
   def getFields(self):
      if hasattr(self, 'fn_Table_getFields'): return self.fn_Table_getFields
      else: return self.fn_unset_Table_getFields
   @getFields.setter
   def getFields(self, value):
      self.fn_Table_getFields = value
      lib.Instance_setMethod(self.impl, "GetFields".encode('utf8'), cb_Table_getFields)

   def fn_unset_Table_getFieldsCount(self):
      return lib.Table_getFieldsCount(self.impl)

   @property
   def getFieldsCount(self):
      if hasattr(self, 'fn_Table_getFieldsCount'): return self.fn_Table_getFieldsCount
      else: return self.fn_unset_Table_getFieldsCount
   @getFieldsCount.setter
   def getFieldsCount(self, value):
      self.fn_Table_getFieldsCount = value
      lib.Instance_setMethod(self.impl, "GetFieldsCount".encode('utf8'), cb_Table_getFieldsCount)

   def fn_unset_Table_getFirstField(self):
      return lib.Table_getFirstField(self.impl)

   @property
   def getFirstField(self):
      if hasattr(self, 'fn_Table_getFirstField'): return self.fn_Table_getFirstField
      else: return self.fn_unset_Table_getFirstField
   @getFirstField.setter
   def getFirstField(self, value):
      self.fn_Table_getFirstField = value
      lib.Instance_setMethod(self.impl, "GetFirstField".encode('utf8'), cb_Table_getFirstField)

   def fn_unset_Table_getName(self):
      return lib.Table_getName(self.impl)

   @property
   def getName(self):
      if hasattr(self, 'fn_Table_getName'): return self.fn_Table_getName
      else: return self.fn_unset_Table_getName
   @getName.setter
   def getName(self, value):
      self.fn_Table_getName = value
      lib.Instance_setMethod(self.impl, "GetName".encode('utf8'), cb_Table_getName)

   def fn_unset_Table_getPrimaryKey(self):
      return lib.Table_getPrimaryKey(self.impl)

   @property
   def getPrimaryKey(self):
      if hasattr(self, 'fn_Table_getPrimaryKey'): return self.fn_Table_getPrimaryKey
      else: return self.fn_unset_Table_getPrimaryKey
   @getPrimaryKey.setter
   def getPrimaryKey(self, value):
      self.fn_Table_getPrimaryKey = value
      lib.Instance_setMethod(self.impl, "GetPrimaryKey".encode('utf8'), cb_Table_getPrimaryKey)

   def fn_unset_Table_getRecordSize(self):
      return lib.Table_getRecordSize(self.impl)

   @property
   def getRecordSize(self):
      if hasattr(self, 'fn_Table_getRecordSize'): return self.fn_Table_getRecordSize
      else: return self.fn_unset_Table_getRecordSize
   @getRecordSize.setter
   def getRecordSize(self, value):
      self.fn_Table_getRecordSize = value
      lib.Instance_setMethod(self.impl, "GetRecordSize".encode('utf8'), cb_Table_getRecordSize)

   def fn_unset_Table_getRowsCount(self):
      return lib.Table_getRowsCount(self.impl)

   @property
   def getRowsCount(self):
      if hasattr(self, 'fn_Table_getRowsCount'): return self.fn_Table_getRowsCount
      else: return self.fn_unset_Table_getRowsCount
   @getRowsCount.setter
   def getRowsCount(self, value):
      self.fn_Table_getRowsCount = value
      lib.Instance_setMethod(self.impl, "GetRowsCount".encode('utf8'), cb_Table_getRowsCount)

   def index(self, count, fieldIndexes):
      return lib.Table_index(self.impl, count, fieldIndexes)

@ffi.callback("void(TableDropBox)")
def cb_TableDropBox_refill(__t):
   tabledropbox = pyOrNewObject(TableDropBox, __t)
   tabledropbox.fn_TableDropBox_refill(tabledropbox)

class TableDropBox(DropBox):
   def __init__(self,
                parent = None,
                master = None,
                caption = None,
                hotKey = None,
                background = None,
                opacity = None,
                foreground = None,
                borderStyle = None,
                minClientSize = None,
                maxClientSize = None,
                hasMaximize = None,
                hasMinimize = None,
                hasClose = None,
                nonClient = None,
                inactive = None,
                clickThrough = None,
                isRemote = None,
                noCycle = None,
                isModal = None,
                interim = None,
                tabCycle = None,
                isDefault = None,
                drawBehind = None,
                hasMenuBar = None,
                hasStatusBar = None,
                stayOnTop = None,
                menu = None,
                font = None,
                sizeAnchor = None,
                size = None,
                clientSize = None,
                anchor = None,
                position = None,
                disabled = None,
                state = None,
                visible = None,
                isDocument = None,
                mergeMenus = None,
                hasHorzScroll = None,
                hasVertScroll = None,
                dontHideScroll = None,
                dontScrollVert = None,
                dontScrollHorz = None,
                snapVertScroll = None,
                snapHorzScroll = None,
                scroll = None,
                modifyVirtualArea = None,
                dontAutoScrollArea = None,
                fileName = None,
                id = None,
                modifiedDocument = None,
                showInTaskBar = None,
                saveDialog = None,
                isActiveClient = None,
                cursor = None,
                name = None,
                displayDriver = None,
                autoCreate = None,
                scrollArea = None,
                is3D = None,
                closing = None,
                fullRender = None,
                icon = None,
                moveable = None,
                alphaBlend = None,
                useSharedMemory = None,
                glCapabilities = None,
                creationActivation = None,
                nativeDecorations = None,
                manageDisplay = None,
                text = None,
                controller = None,
                noConsequential = None,
                toolTip = None,
                activeStipple = None,
                showButton = None,
                alignment = None,
                noHighlight = None,
                activeColor = None,
                currentRow = None,
                contents = None,
                editText = None,
                typingTimeout = None,
                rowHeight = None,
                maxShown = None,
                showNone = None,
                selectionColor = None,
                selectionText = None,
                changeContents = None,
                button = None,
                filter = None,
                filtered = None,
                nameField = None,
                exclusion = None,
                table = None,
                filterField = None,
                getDecorationsSize = None,
                isInside = None,
                isMouseMoving = None,
                isMouseResizing = None,
                isOpaque = None,
                notifyActivate = None,
                notifyDestroyed = None,
                notifySaved = None,
                onActivate = None,
                onActivateClient = None,
                onApplyGraphics = None,
                onChildAddedOrRemoved = None,
                onChildResized = None,
                onChildVisibilityToggled = None,
                onClose = None,
                onCreate = None,
                onDestroy = None,
                onDestroyed = None,
                onDrawOverChildren = None,
                onFileModified = None,
                onHScroll = None,
                onKeyDown = None,
                onKeyHit = None,
                onKeyUp = None,
                onLeftButtonDown = None,
                onLeftButtonUp = None,
                onLeftDoubleClick = None,
                onLoadGraphics = None,
                onMiddleButtonDown = None,
                onMiddleButtonUp = None,
                onMiddleDoubleClick = None,
                onMouseCaptureLost = None,
                onMouseLeave = None,
                onMouseMove = None,
                onMouseOver = None,
                onMoving = None,
                onMultiTouch = None,
                onPosition = None,
                onPostCreate = None,
                onRedraw = None,
                onResize = None,
                onResizing = None,
                onRightButtonDown = None,
                onRightButtonUp = None,
                onRightDoubleClick = None,
                onSaveFile = None,
                onStateChange = None,
                onSysKeyDown = None,
                onSysKeyHit = None,
                onSysKeyUp = None,
                onUnloadGraphics = None,
                onVScroll = None,
                preShowDecorations = None,
                setBox = None,
                setWindowArea = None,
                setWindowMinimum = None,
                showDecorations = None,
                updateNonClient = None,
                notifyClose = None,
                notifyHighlight = None,
                notifySelect = None,
                notifyTextEntry = None,
                onCloseDropDown = None,
                onDropDown = None,
                refill = None,
                impl = None):
      DropBox.__init__(self, impl = impl)
      if parent is not None:                   self.parent = parent
      if master is not None:                   self.master = master
      if caption is not None:                  self.caption = caption
      if hotKey is not None:                   self.hotKey = hotKey
      if background is not None:               self.background = background
      if opacity is not None:                  self.opacity = opacity
      if foreground is not None:               self.foreground = foreground
      if borderStyle is not None:              self.borderStyle = borderStyle
      if minClientSize is not None:            self.minClientSize = minClientSize
      if maxClientSize is not None:            self.maxClientSize = maxClientSize
      if hasMaximize is not None:              self.hasMaximize = hasMaximize
      if hasMinimize is not None:              self.hasMinimize = hasMinimize
      if hasClose is not None:                 self.hasClose = hasClose
      if nonClient is not None:                self.nonClient = nonClient
      if inactive is not None:                 self.inactive = inactive
      if clickThrough is not None:             self.clickThrough = clickThrough
      if isRemote is not None:                 self.isRemote = isRemote
      if noCycle is not None:                  self.noCycle = noCycle
      if isModal is not None:                  self.isModal = isModal
      if interim is not None:                  self.interim = interim
      if tabCycle is not None:                 self.tabCycle = tabCycle
      if isDefault is not None:                self.isDefault = isDefault
      if drawBehind is not None:               self.drawBehind = drawBehind
      if hasMenuBar is not None:               self.hasMenuBar = hasMenuBar
      if hasStatusBar is not None:             self.hasStatusBar = hasStatusBar
      if stayOnTop is not None:                self.stayOnTop = stayOnTop
      if menu is not None:                     self.menu = menu
      if font is not None:                     self.font = font
      if sizeAnchor is not None:               self.sizeAnchor = sizeAnchor
      if size is not None:                     self.size = size
      if clientSize is not None:               self.clientSize = clientSize
      if anchor is not None:                   self.anchor = anchor
      if position is not None:                 self.position = position
      if disabled is not None:                 self.disabled = disabled
      if state is not None:                    self.state = state
      if visible is not None:                  self.visible = visible
      if isDocument is not None:               self.isDocument = isDocument
      if mergeMenus is not None:               self.mergeMenus = mergeMenus
      if hasHorzScroll is not None:            self.hasHorzScroll = hasHorzScroll
      if hasVertScroll is not None:            self.hasVertScroll = hasVertScroll
      if dontHideScroll is not None:           self.dontHideScroll = dontHideScroll
      if dontScrollVert is not None:           self.dontScrollVert = dontScrollVert
      if dontScrollHorz is not None:           self.dontScrollHorz = dontScrollHorz
      if snapVertScroll is not None:           self.snapVertScroll = snapVertScroll
      if snapHorzScroll is not None:           self.snapHorzScroll = snapHorzScroll
      if scroll is not None:                   self.scroll = scroll
      if modifyVirtualArea is not None:        self.modifyVirtualArea = modifyVirtualArea
      if dontAutoScrollArea is not None:       self.dontAutoScrollArea = dontAutoScrollArea
      if fileName is not None:                 self.fileName = fileName
      if id is not None:                       self.id = id
      if modifiedDocument is not None:         self.modifiedDocument = modifiedDocument
      if showInTaskBar is not None:            self.showInTaskBar = showInTaskBar
      if saveDialog is not None:               self.saveDialog = saveDialog
      if isActiveClient is not None:           self.isActiveClient = isActiveClient
      if cursor is not None:                   self.cursor = cursor
      if name is not None:                     self.name = name
      if displayDriver is not None:            self.displayDriver = displayDriver
      if autoCreate is not None:               self.autoCreate = autoCreate
      if scrollArea is not None:               self.scrollArea = scrollArea
      if is3D is not None:                     self.is3D = is3D
      if closing is not None:                  self.closing = closing
      if fullRender is not None:               self.fullRender = fullRender
      if icon is not None:                     self.icon = icon
      if moveable is not None:                 self.moveable = moveable
      if alphaBlend is not None:               self.alphaBlend = alphaBlend
      if useSharedMemory is not None:          self.useSharedMemory = useSharedMemory
      if glCapabilities is not None:           self.glCapabilities = glCapabilities
      if creationActivation is not None:       self.creationActivation = creationActivation
      if nativeDecorations is not None:        self.nativeDecorations = nativeDecorations
      if manageDisplay is not None:            self.manageDisplay = manageDisplay
      if text is not None:                     self.text = text
      if controller is not None:               self.controller = controller
      if noConsequential is not None:          self.noConsequential = noConsequential
      if toolTip is not None:                  self.toolTip = toolTip
      if activeStipple is not None:            self.activeStipple = activeStipple
      if showButton is not None:               self.showButton = showButton
      if alignment is not None:                self.alignment = alignment
      if noHighlight is not None:              self.noHighlight = noHighlight
      if activeColor is not None:              self.activeColor = activeColor
      if currentRow is not None:               self.currentRow = currentRow
      if contents is not None:                 self.contents = contents
      if editText is not None:                 self.editText = editText
      if typingTimeout is not None:            self.typingTimeout = typingTimeout
      if rowHeight is not None:                self.rowHeight = rowHeight
      if maxShown is not None:                 self.maxShown = maxShown
      if showNone is not None:                 self.showNone = showNone
      if selectionColor is not None:           self.selectionColor = selectionColor
      if selectionText is not None:            self.selectionText = selectionText
      if changeContents is not None:           self.changeContents = changeContents
      if button is not None:                   self.button = button
      if filter is not None:                   self.filter = filter
      if filtered is not None:                 self.filtered = filtered
      if nameField is not None:                self.nameField = nameField
      if exclusion is not None:                self.exclusion = exclusion
      if table is not None:                    self.table = table
      if filterField is not None:              self.filterField = filterField
      if getDecorationsSize is not None:       self.getDecorationsSize = getDecorationsSize
      if isInside is not None:                 self.isInside = isInside
      if isMouseMoving is not None:            self.isMouseMoving = isMouseMoving
      if isMouseResizing is not None:          self.isMouseResizing = isMouseResizing
      if isOpaque is not None:                 self.isOpaque = isOpaque
      if notifyActivate is not None:           self.notifyActivate = notifyActivate
      if notifyDestroyed is not None:          self.notifyDestroyed = notifyDestroyed
      if notifySaved is not None:              self.notifySaved = notifySaved
      if onActivate is not None:               self.onActivate = onActivate
      if onActivateClient is not None:         self.onActivateClient = onActivateClient
      if onApplyGraphics is not None:          self.onApplyGraphics = onApplyGraphics
      if onChildAddedOrRemoved is not None:    self.onChildAddedOrRemoved = onChildAddedOrRemoved
      if onChildResized is not None:           self.onChildResized = onChildResized
      if onChildVisibilityToggled is not None: self.onChildVisibilityToggled = onChildVisibilityToggled
      if onClose is not None:                  self.onClose = onClose
      if onCreate is not None:                 self.onCreate = onCreate
      if onDestroy is not None:                self.onDestroy = onDestroy
      if onDestroyed is not None:              self.onDestroyed = onDestroyed
      if onDrawOverChildren is not None:       self.onDrawOverChildren = onDrawOverChildren
      if onFileModified is not None:           self.onFileModified = onFileModified
      if onHScroll is not None:                self.onHScroll = onHScroll
      if onKeyDown is not None:                self.onKeyDown = onKeyDown
      if onKeyHit is not None:                 self.onKeyHit = onKeyHit
      if onKeyUp is not None:                  self.onKeyUp = onKeyUp
      if onLeftButtonDown is not None:         self.onLeftButtonDown = onLeftButtonDown
      if onLeftButtonUp is not None:           self.onLeftButtonUp = onLeftButtonUp
      if onLeftDoubleClick is not None:        self.onLeftDoubleClick = onLeftDoubleClick
      if onLoadGraphics is not None:           self.onLoadGraphics = onLoadGraphics
      if onMiddleButtonDown is not None:       self.onMiddleButtonDown = onMiddleButtonDown
      if onMiddleButtonUp is not None:         self.onMiddleButtonUp = onMiddleButtonUp
      if onMiddleDoubleClick is not None:      self.onMiddleDoubleClick = onMiddleDoubleClick
      if onMouseCaptureLost is not None:       self.onMouseCaptureLost = onMouseCaptureLost
      if onMouseLeave is not None:             self.onMouseLeave = onMouseLeave
      if onMouseMove is not None:              self.onMouseMove = onMouseMove
      if onMouseOver is not None:              self.onMouseOver = onMouseOver
      if onMoving is not None:                 self.onMoving = onMoving
      if onMultiTouch is not None:             self.onMultiTouch = onMultiTouch
      if onPosition is not None:               self.onPosition = onPosition
      if onPostCreate is not None:             self.onPostCreate = onPostCreate
      if onRedraw is not None:                 self.onRedraw = onRedraw
      if onResize is not None:                 self.onResize = onResize
      if onResizing is not None:               self.onResizing = onResizing
      if onRightButtonDown is not None:        self.onRightButtonDown = onRightButtonDown
      if onRightButtonUp is not None:          self.onRightButtonUp = onRightButtonUp
      if onRightDoubleClick is not None:       self.onRightDoubleClick = onRightDoubleClick
      if onSaveFile is not None:               self.onSaveFile = onSaveFile
      if onStateChange is not None:            self.onStateChange = onStateChange
      if onSysKeyDown is not None:             self.onSysKeyDown = onSysKeyDown
      if onSysKeyHit is not None:              self.onSysKeyHit = onSysKeyHit
      if onSysKeyUp is not None:               self.onSysKeyUp = onSysKeyUp
      if onUnloadGraphics is not None:         self.onUnloadGraphics = onUnloadGraphics
      if onVScroll is not None:                self.onVScroll = onVScroll
      if preShowDecorations is not None:       self.preShowDecorations = preShowDecorations
      if setBox is not None:                   self.setBox = setBox
      if setWindowArea is not None:            self.setWindowArea = setWindowArea
      if setWindowMinimum is not None:         self.setWindowMinimum = setWindowMinimum
      if showDecorations is not None:          self.showDecorations = showDecorations
      if updateNonClient is not None:          self.updateNonClient = updateNonClient
      if notifyClose is not None:              self.notifyClose = notifyClose
      if notifyHighlight is not None:          self.notifyHighlight = notifyHighlight
      if notifySelect is not None:             self.notifySelect = notifySelect
      if notifyTextEntry is not None:          self.notifyTextEntry = notifyTextEntry
      if onCloseDropDown is not None:          self.onCloseDropDown = onCloseDropDown
      if onDropDown is not None:               self.onDropDown = onDropDown
      if refill is not None:                   self.refill = refill

   @property
   def button(self): return Button(impl = IPTR(lib, ffi, self, TableDropBox).button)
   @button.setter
   def button(self, value):
      if not isinstance(value, Button): value = Button(value)
      IPTR(lib, ffi, self, TableDropBox).button = value.impl

   @property
   def filter(self): return Id(impl = IPTR(lib, ffi, self, TableDropBox).filter)
   @filter.setter
   def filter(self, value):
      if not isinstance(value, Id): value = Id(value)
      IPTR(lib, ffi, self, TableDropBox).filter = value.impl

   @property
   def filtered(self): return IPTR(lib, ffi, self, TableDropBox).filtered
   @filtered.setter
   def filtered(self, value): IPTR(lib, ffi, self, TableDropBox).filtered = value

   @property
   def nameField(self): return Field(impl = IPTR(lib, ffi, self, TableDropBox).nameField)
   @nameField.setter
   def nameField(self, value):
      if not isinstance(value, Field): value = Field(value)
      IPTR(lib, ffi, self, TableDropBox).nameField = value.impl

   @property
   def exclusion(self): return Id(impl = IPTR(lib, ffi, self, TableDropBox).exclusion)
   @exclusion.setter
   def exclusion(self, value):
      if not isinstance(value, Id): value = Id(value)
      IPTR(lib, ffi, self, TableDropBox).exclusion = value.impl

   @property
   def table(self): return Table(impl = IPTR(lib, ffi, self, TableDropBox).table)
   @table.setter
   def table(self, value):
      if not isinstance(value, Table): value = Table(value)
      IPTR(lib, ffi, self, TableDropBox).table = value.impl

   @property
   def filterField(self): return Field(impl = IPTR(lib, ffi, self, TableDropBox).filterField)
   @filterField.setter
   def filterField(self, value):
      if not isinstance(value, Field): value = Field(value)
      IPTR(lib, ffi, self, TableDropBox).filterField = value.impl

   def editNotifyCharsAdded(self):
      lib.TableDropBox_editNotifyCharsAdded(self.impl)

   def editNotifyUpdate(self, editBox):
      if editBox is not None and not isinstance(editBox, EditBox): editBox = EditBox(editBox)
      if editBox is None: editBox = ffi.NULL
      lib.TableDropBox_editNotifyUpdate(self.impl, editBox)

   def fn_unset_TableDropBox_refill(self):
      return lib.TableDropBox_refill(self.impl)

   @property
   def refill(self):
      if hasattr(self, 'fn_TableDropBox_refill'): return self.fn_TableDropBox_refill
      else: return self.fn_unset_TableDropBox_refill
   @refill.setter
   def refill(self, value):
      self.fn_TableDropBox_refill = value
      lib.Instance_setMethod(self.impl, "Refill".encode('utf8'), cb_TableDropBox_refill)

@ffi.callback("void(TableEditor)")
def cb_TableEditor_onCreateDynamicLookupEditors(__t):
   tableeditor = pyOrNewObject(TableEditor, __t)
   tableeditor.fn_TableEditor_onCreateDynamicLookupEditors(tableeditor)

@ffi.callback("void(TableEditor)")
def cb_TableEditor_onInitialize(__t):
   tableeditor = pyOrNewObject(TableEditor, __t)
   tableeditor.fn_TableEditor_onInitialize(tableeditor)

@ffi.callback("void(TableEditor)")
def cb_TableEditor_onLeavingModifiedDocument(__t):
   tableeditor = pyOrNewObject(TableEditor, __t)
   tableeditor.fn_TableEditor_onLeavingModifiedDocument(tableeditor)

@ffi.callback("void(TableEditor, Row, Array)")
def cb_TableEditor_onList(__t, r, matches):
   tableeditor = pyOrNewObject(TableEditor, __t)
   tableeditor.fn_TableEditor_onList(tableeditor, pyOrNewObject(Row, r), Array("<Id>", impl = matches))

@ffi.callback("void(TableEditor)")
def cb_TableEditor_onLoad(__t):
   tableeditor = pyOrNewObject(TableEditor, __t)
   tableeditor.fn_TableEditor_onLoad(tableeditor)

@ffi.callback("void(TableEditor)")
def cb_TableEditor_onRemovalRequest(__t):
   tableeditor = pyOrNewObject(TableEditor, __t)
   tableeditor.fn_TableEditor_onRemovalRequest(tableeditor)

@ffi.callback("void(TableEditor)")
def cb_TableEditor_onStateChanged(__t):
   tableeditor = pyOrNewObject(TableEditor, __t)
   tableeditor.fn_TableEditor_onStateChanged(tableeditor)

class TableEditor(Window):
   def __init__(self,
                parent = None,
                master = None,
                caption = None,
                hotKey = None,
                background = None,
                opacity = None,
                foreground = None,
                borderStyle = None,
                minClientSize = None,
                maxClientSize = None,
                hasMaximize = None,
                hasMinimize = None,
                hasClose = None,
                nonClient = None,
                inactive = None,
                clickThrough = None,
                isRemote = None,
                noCycle = None,
                isModal = None,
                interim = None,
                tabCycle = None,
                isDefault = None,
                drawBehind = None,
                hasMenuBar = None,
                hasStatusBar = None,
                stayOnTop = None,
                menu = None,
                font = None,
                sizeAnchor = None,
                size = None,
                clientSize = None,
                anchor = None,
                position = None,
                disabled = None,
                state = None,
                visible = None,
                isDocument = None,
                mergeMenus = None,
                hasHorzScroll = None,
                hasVertScroll = None,
                dontHideScroll = None,
                dontScrollVert = None,
                dontScrollHorz = None,
                snapVertScroll = None,
                snapHorzScroll = None,
                scroll = None,
                modifyVirtualArea = None,
                dontAutoScrollArea = None,
                fileName = None,
                id = None,
                modifiedDocument = None,
                showInTaskBar = None,
                saveDialog = None,
                isActiveClient = None,
                cursor = None,
                name = None,
                displayDriver = None,
                autoCreate = None,
                scrollArea = None,
                is3D = None,
                closing = None,
                fullRender = None,
                icon = None,
                moveable = None,
                alphaBlend = None,
                useSharedMemory = None,
                glCapabilities = None,
                creationActivation = None,
                nativeDecorations = None,
                manageDisplay = None,
                text = None,
                controller = None,
                noConsequential = None,
                table = None,
                index = None,
                list = None,
                listFields = None,
                listSortOrder = None,
                listSortField = None,
                disabledFullListing = None,
                searchFields = None,
                searchTables = None,
                sqliteSearchTables = None,
                searchString = None,
                dynamicLookupEditors = None,
                idField = None,
                stringField = None,
                indexFilterField = None,
                readOnly = None,
                masterEditor = None,
                getDecorationsSize = None,
                isInside = None,
                isMouseMoving = None,
                isMouseResizing = None,
                isOpaque = None,
                notifyActivate = None,
                notifyDestroyed = None,
                notifySaved = None,
                onActivate = None,
                onActivateClient = None,
                onApplyGraphics = None,
                onChildAddedOrRemoved = None,
                onChildResized = None,
                onChildVisibilityToggled = None,
                onClose = None,
                onCreate = None,
                onDestroy = None,
                onDestroyed = None,
                onDrawOverChildren = None,
                onFileModified = None,
                onHScroll = None,
                onKeyDown = None,
                onKeyHit = None,
                onKeyUp = None,
                onLeftButtonDown = None,
                onLeftButtonUp = None,
                onLeftDoubleClick = None,
                onLoadGraphics = None,
                onMiddleButtonDown = None,
                onMiddleButtonUp = None,
                onMiddleDoubleClick = None,
                onMouseCaptureLost = None,
                onMouseLeave = None,
                onMouseMove = None,
                onMouseOver = None,
                onMoving = None,
                onMultiTouch = None,
                onPosition = None,
                onPostCreate = None,
                onRedraw = None,
                onResize = None,
                onResizing = None,
                onRightButtonDown = None,
                onRightButtonUp = None,
                onRightDoubleClick = None,
                onSaveFile = None,
                onStateChange = None,
                onSysKeyDown = None,
                onSysKeyHit = None,
                onSysKeyUp = None,
                onUnloadGraphics = None,
                onVScroll = None,
                preShowDecorations = None,
                setBox = None,
                setWindowArea = None,
                setWindowMinimum = None,
                showDecorations = None,
                updateNonClient = None,
                onCreateDynamicLookupEditors = None,
                onInitialize = None,
                onLeavingModifiedDocument = None,
                onList = None,
                onLoad = None,
                onRemovalRequest = None,
                onStateChanged = None,
                impl = None):
      Window.__init__(self, impl = impl)
      if parent is not None:                       self.parent = parent
      if master is not None:                       self.master = master
      if caption is not None:                      self.caption = caption
      if hotKey is not None:                       self.hotKey = hotKey
      if background is not None:                   self.background = background
      if opacity is not None:                      self.opacity = opacity
      if foreground is not None:                   self.foreground = foreground
      if borderStyle is not None:                  self.borderStyle = borderStyle
      if minClientSize is not None:                self.minClientSize = minClientSize
      if maxClientSize is not None:                self.maxClientSize = maxClientSize
      if hasMaximize is not None:                  self.hasMaximize = hasMaximize
      if hasMinimize is not None:                  self.hasMinimize = hasMinimize
      if hasClose is not None:                     self.hasClose = hasClose
      if nonClient is not None:                    self.nonClient = nonClient
      if inactive is not None:                     self.inactive = inactive
      if clickThrough is not None:                 self.clickThrough = clickThrough
      if isRemote is not None:                     self.isRemote = isRemote
      if noCycle is not None:                      self.noCycle = noCycle
      if isModal is not None:                      self.isModal = isModal
      if interim is not None:                      self.interim = interim
      if tabCycle is not None:                     self.tabCycle = tabCycle
      if isDefault is not None:                    self.isDefault = isDefault
      if drawBehind is not None:                   self.drawBehind = drawBehind
      if hasMenuBar is not None:                   self.hasMenuBar = hasMenuBar
      if hasStatusBar is not None:                 self.hasStatusBar = hasStatusBar
      if stayOnTop is not None:                    self.stayOnTop = stayOnTop
      if menu is not None:                         self.menu = menu
      if font is not None:                         self.font = font
      if sizeAnchor is not None:                   self.sizeAnchor = sizeAnchor
      if size is not None:                         self.size = size
      if clientSize is not None:                   self.clientSize = clientSize
      if anchor is not None:                       self.anchor = anchor
      if position is not None:                     self.position = position
      if disabled is not None:                     self.disabled = disabled
      if state is not None:                        self.state = state
      if visible is not None:                      self.visible = visible
      if isDocument is not None:                   self.isDocument = isDocument
      if mergeMenus is not None:                   self.mergeMenus = mergeMenus
      if hasHorzScroll is not None:                self.hasHorzScroll = hasHorzScroll
      if hasVertScroll is not None:                self.hasVertScroll = hasVertScroll
      if dontHideScroll is not None:               self.dontHideScroll = dontHideScroll
      if dontScrollVert is not None:               self.dontScrollVert = dontScrollVert
      if dontScrollHorz is not None:               self.dontScrollHorz = dontScrollHorz
      if snapVertScroll is not None:               self.snapVertScroll = snapVertScroll
      if snapHorzScroll is not None:               self.snapHorzScroll = snapHorzScroll
      if scroll is not None:                       self.scroll = scroll
      if modifyVirtualArea is not None:            self.modifyVirtualArea = modifyVirtualArea
      if dontAutoScrollArea is not None:           self.dontAutoScrollArea = dontAutoScrollArea
      if fileName is not None:                     self.fileName = fileName
      if id is not None:                           self.id = id
      if modifiedDocument is not None:             self.modifiedDocument = modifiedDocument
      if showInTaskBar is not None:                self.showInTaskBar = showInTaskBar
      if saveDialog is not None:                   self.saveDialog = saveDialog
      if isActiveClient is not None:               self.isActiveClient = isActiveClient
      if cursor is not None:                       self.cursor = cursor
      if name is not None:                         self.name = name
      if displayDriver is not None:                self.displayDriver = displayDriver
      if autoCreate is not None:                   self.autoCreate = autoCreate
      if scrollArea is not None:                   self.scrollArea = scrollArea
      if is3D is not None:                         self.is3D = is3D
      if closing is not None:                      self.closing = closing
      if fullRender is not None:                   self.fullRender = fullRender
      if icon is not None:                         self.icon = icon
      if moveable is not None:                     self.moveable = moveable
      if alphaBlend is not None:                   self.alphaBlend = alphaBlend
      if useSharedMemory is not None:              self.useSharedMemory = useSharedMemory
      if glCapabilities is not None:               self.glCapabilities = glCapabilities
      if creationActivation is not None:           self.creationActivation = creationActivation
      if nativeDecorations is not None:            self.nativeDecorations = nativeDecorations
      if manageDisplay is not None:                self.manageDisplay = manageDisplay
      if text is not None:                         self.text = text
      if controller is not None:                   self.controller = controller
      if noConsequential is not None:              self.noConsequential = noConsequential
      if table is not None:                        self.table = table
      if index is not None:                        self.index = index
      if list is not None:                         self.list = list
      if listFields is not None:                   self.listFields = listFields
      if listSortOrder is not None:                self.listSortOrder = listSortOrder
      if listSortField is not None:                self.listSortField = listSortField
      if disabledFullListing is not None:          self.disabledFullListing = disabledFullListing
      if searchFields is not None:                 self.searchFields = searchFields
      if searchTables is not None:                 self.searchTables = searchTables
      if sqliteSearchTables is not None:           self.sqliteSearchTables = sqliteSearchTables
      if searchString is not None:                 self.searchString = searchString
      if dynamicLookupEditors is not None:         self.dynamicLookupEditors = dynamicLookupEditors
      if idField is not None:                      self.idField = idField
      if stringField is not None:                  self.stringField = stringField
      if indexFilterField is not None:             self.indexFilterField = indexFilterField
      if readOnly is not None:                     self.readOnly = readOnly
      if masterEditor is not None:                 self.masterEditor = masterEditor
      if getDecorationsSize is not None:           self.getDecorationsSize = getDecorationsSize
      if isInside is not None:                     self.isInside = isInside
      if isMouseMoving is not None:                self.isMouseMoving = isMouseMoving
      if isMouseResizing is not None:              self.isMouseResizing = isMouseResizing
      if isOpaque is not None:                     self.isOpaque = isOpaque
      if notifyActivate is not None:               self.notifyActivate = notifyActivate
      if notifyDestroyed is not None:              self.notifyDestroyed = notifyDestroyed
      if notifySaved is not None:                  self.notifySaved = notifySaved
      if onActivate is not None:                   self.onActivate = onActivate
      if onActivateClient is not None:             self.onActivateClient = onActivateClient
      if onApplyGraphics is not None:              self.onApplyGraphics = onApplyGraphics
      if onChildAddedOrRemoved is not None:        self.onChildAddedOrRemoved = onChildAddedOrRemoved
      if onChildResized is not None:               self.onChildResized = onChildResized
      if onChildVisibilityToggled is not None:     self.onChildVisibilityToggled = onChildVisibilityToggled
      if onClose is not None:                      self.onClose = onClose
      if onCreate is not None:                     self.onCreate = onCreate
      if onDestroy is not None:                    self.onDestroy = onDestroy
      if onDestroyed is not None:                  self.onDestroyed = onDestroyed
      if onDrawOverChildren is not None:           self.onDrawOverChildren = onDrawOverChildren
      if onFileModified is not None:               self.onFileModified = onFileModified
      if onHScroll is not None:                    self.onHScroll = onHScroll
      if onKeyDown is not None:                    self.onKeyDown = onKeyDown
      if onKeyHit is not None:                     self.onKeyHit = onKeyHit
      if onKeyUp is not None:                      self.onKeyUp = onKeyUp
      if onLeftButtonDown is not None:             self.onLeftButtonDown = onLeftButtonDown
      if onLeftButtonUp is not None:               self.onLeftButtonUp = onLeftButtonUp
      if onLeftDoubleClick is not None:            self.onLeftDoubleClick = onLeftDoubleClick
      if onLoadGraphics is not None:               self.onLoadGraphics = onLoadGraphics
      if onMiddleButtonDown is not None:           self.onMiddleButtonDown = onMiddleButtonDown
      if onMiddleButtonUp is not None:             self.onMiddleButtonUp = onMiddleButtonUp
      if onMiddleDoubleClick is not None:          self.onMiddleDoubleClick = onMiddleDoubleClick
      if onMouseCaptureLost is not None:           self.onMouseCaptureLost = onMouseCaptureLost
      if onMouseLeave is not None:                 self.onMouseLeave = onMouseLeave
      if onMouseMove is not None:                  self.onMouseMove = onMouseMove
      if onMouseOver is not None:                  self.onMouseOver = onMouseOver
      if onMoving is not None:                     self.onMoving = onMoving
      if onMultiTouch is not None:                 self.onMultiTouch = onMultiTouch
      if onPosition is not None:                   self.onPosition = onPosition
      if onPostCreate is not None:                 self.onPostCreate = onPostCreate
      if onRedraw is not None:                     self.onRedraw = onRedraw
      if onResize is not None:                     self.onResize = onResize
      if onResizing is not None:                   self.onResizing = onResizing
      if onRightButtonDown is not None:            self.onRightButtonDown = onRightButtonDown
      if onRightButtonUp is not None:              self.onRightButtonUp = onRightButtonUp
      if onRightDoubleClick is not None:           self.onRightDoubleClick = onRightDoubleClick
      if onSaveFile is not None:                   self.onSaveFile = onSaveFile
      if onStateChange is not None:                self.onStateChange = onStateChange
      if onSysKeyDown is not None:                 self.onSysKeyDown = onSysKeyDown
      if onSysKeyHit is not None:                  self.onSysKeyHit = onSysKeyHit
      if onSysKeyUp is not None:                   self.onSysKeyUp = onSysKeyUp
      if onUnloadGraphics is not None:             self.onUnloadGraphics = onUnloadGraphics
      if onVScroll is not None:                    self.onVScroll = onVScroll
      if preShowDecorations is not None:           self.preShowDecorations = preShowDecorations
      if setBox is not None:                       self.setBox = setBox
      if setWindowArea is not None:                self.setWindowArea = setWindowArea
      if setWindowMinimum is not None:             self.setWindowMinimum = setWindowMinimum
      if showDecorations is not None:              self.showDecorations = showDecorations
      if updateNonClient is not None:              self.updateNonClient = updateNonClient
      if onCreateDynamicLookupEditors is not None: self.onCreateDynamicLookupEditors = onCreateDynamicLookupEditors
      if onInitialize is not None:                 self.onInitialize = onInitialize
      if onLeavingModifiedDocument is not None:    self.onLeavingModifiedDocument = onLeavingModifiedDocument
      if onList is not None:                       self.onList = onList
      if onLoad is not None:                       self.onLoad = onLoad
      if onRemovalRequest is not None:             self.onRemovalRequest = onRemovalRequest
      if onStateChanged is not None:               self.onStateChanged = onStateChanged

   @property
   def table(self): return pyOrNewObject(Table, lib.TableEditor_get_table(self.impl))
   @table.setter
   def table(self, value):
      if not isinstance(value, Table): value = Table(value)
      lib.TableEditor_set_table(self.impl, value.impl)

   @property
   def index(self): return pyOrNewObject(Table, lib.TableEditor_get_index(self.impl))
   @index.setter
   def index(self, value):
      if not isinstance(value, Table): value = Table(value)
      lib.TableEditor_set_index(self.impl, value.impl)

   @property
   def list(self): return None
   @list.setter
   def list(self, value):
      if not isinstance(value, ListBox): value = ListBox(value)
      lib.TableEditor_set_list(self.impl, value.impl)

   @property
   def listFields(self): return None
   @listFields.setter
   def listFields(self, value):
      lib.TableEditor_set_listFields(self.impl, value.impl)

   @property
   def listSortOrder(self): return lib.TableEditor_get_listSortOrder(self.impl)
   @listSortOrder.setter
   def listSortOrder(self, value):
      lib.TableEditor_set_listSortOrder(self.impl, value)

   @property
   def listSortField(self): return pyOrNewObject(DataField, lib.TableEditor_get_listSortField(self.impl))
   @listSortField.setter
   def listSortField(self, value):
      if not isinstance(value, DataField): value = DataField(value)
      lib.TableEditor_set_listSortField(self.impl, value.impl)

   @property
   def disabledFullListing(self): return lib.TableEditor_get_disabledFullListing(self.impl)
   @disabledFullListing.setter
   def disabledFullListing(self, value):
      lib.TableEditor_set_disabledFullListing(self.impl, value)

   @property
   def searchFields(self): return None
   @searchFields.setter
   def searchFields(self, value):
      lib.TableEditor_set_searchFields(self.impl, value.impl)

   @property
   def searchTables(self): return None
   @searchTables.setter
   def searchTables(self, value):
      lib.TableEditor_set_searchTables(self.impl, value.impl)

   @property
   def sqliteSearchTables(self): return None
   @sqliteSearchTables.setter
   def sqliteSearchTables(self, value):
      lib.TableEditor_set_sqliteSearchTables(self.impl, value.impl)

   @property
   def searchString(self): return None
   @searchString.setter
   def searchString(self, value):
      if not isinstance(value, String): value = String(value)
      lib.TableEditor_set_searchString(self.impl, value.impl.encode('utf8'))

   @property
   def dynamicLookupEditors(self): return None
   @dynamicLookupEditors.setter
   def dynamicLookupEditors(self, value):
      lib.TableEditor_set_dynamicLookupEditors(self.impl, value.impl)

   @property
   def selectedId(self): return Id(lib.TableEditor_get_selectedId(self.impl))

   @property
   def idField(self): return pyOrNewObject(Field, lib.TableEditor_get_idField(self.impl))
   @idField.setter
   def idField(self, value):
      if not isinstance(value, Field): value = Field(value)
      lib.TableEditor_set_idField(self.impl, value.impl)

   @property
   def stringField(self): return pyOrNewObject(Field, lib.TableEditor_get_stringField(self.impl))
   @stringField.setter
   def stringField(self, value):
      if not isinstance(value, Field): value = Field(value)
      lib.TableEditor_set_stringField(self.impl, value.impl)

   @property
   def indexFilterField(self): return pyOrNewObject(Field, lib.TableEditor_get_indexFilterField(self.impl))
   @indexFilterField.setter
   def indexFilterField(self, value):
      if not isinstance(value, Field): value = Field(value)
      lib.TableEditor_set_indexFilterField(self.impl, value.impl)

   @property
   def readOnly(self): return lib.TableEditor_get_readOnly(self.impl)
   @readOnly.setter
   def readOnly(self, value):
      lib.TableEditor_set_readOnly(self.impl, value)

   @property
   def masterEditor(self): return pyOrNewObject(TableEditor, lib.TableEditor_get_masterEditor(self.impl))
   @masterEditor.setter
   def masterEditor(self, value):
      if not isinstance(value, TableEditor): value = TableEditor(value)
      lib.TableEditor_set_masterEditor(self.impl, value.impl)

   def createRow(self):
      lib.TableEditor_createRow(self.impl)

   def enumerate(self):
      lib.TableEditor_enumerate(self.impl)

   def filter(self, id):
      if id is not None and not isinstance(id, Id): id = Id(id)
      if id is None: id = ffi.NULL
      return lib.TableEditor_filter(self.impl, id)

   def listSelect(self, row):
      if row is not None and not isinstance(row, DataRow): row = DataRow(row)
      if row is None: row = ffi.NULL
      return lib.TableEditor_listSelect(self.impl, row)

   def load(self):
      lib.TableEditor_load(self.impl)

   def notifyClosing(self):
      return lib.TableEditor_notifyClosing(self.impl)

   def notifyModifiedDocument(self):
      lib.TableEditor_notifyModifiedDocument(self.impl)

   def fn_unset_TableEditor_onCreateDynamicLookupEditors(self):
      return lib.TableEditor_onCreateDynamicLookupEditors(self.impl)

   @property
   def onCreateDynamicLookupEditors(self):
      if hasattr(self, 'fn_TableEditor_onCreateDynamicLookupEditors'): return self.fn_TableEditor_onCreateDynamicLookupEditors
      else: return self.fn_unset_TableEditor_onCreateDynamicLookupEditors
   @onCreateDynamicLookupEditors.setter
   def onCreateDynamicLookupEditors(self, value):
      self.fn_TableEditor_onCreateDynamicLookupEditors = value
      lib.Instance_setMethod(self.impl, "OnCreateDynamicLookupEditors".encode('utf8'), cb_TableEditor_onCreateDynamicLookupEditors)

   def fn_unset_TableEditor_onInitialize(self):
      return lib.TableEditor_onInitialize(self.impl)

   @property
   def onInitialize(self):
      if hasattr(self, 'fn_TableEditor_onInitialize'): return self.fn_TableEditor_onInitialize
      else: return self.fn_unset_TableEditor_onInitialize
   @onInitialize.setter
   def onInitialize(self, value):
      self.fn_TableEditor_onInitialize = value
      lib.Instance_setMethod(self.impl, "OnInitialize".encode('utf8'), cb_TableEditor_onInitialize)

   def fn_unset_TableEditor_onLeavingModifiedDocument(self):
      return lib.TableEditor_onLeavingModifiedDocument(self.impl)

   @property
   def onLeavingModifiedDocument(self):
      if hasattr(self, 'fn_TableEditor_onLeavingModifiedDocument'): return self.fn_TableEditor_onLeavingModifiedDocument
      else: return self.fn_unset_TableEditor_onLeavingModifiedDocument
   @onLeavingModifiedDocument.setter
   def onLeavingModifiedDocument(self, value):
      self.fn_TableEditor_onLeavingModifiedDocument = value
      lib.Instance_setMethod(self.impl, "OnLeavingModifiedDocument".encode('utf8'), cb_TableEditor_onLeavingModifiedDocument)

   def fn_unset_TableEditor_onList(self, r, matches):
      return lib.TableEditor_onList(self.impl, ffi.NULL if r is None else r.impl, ffi.NULL if matches is None else matches.impl)

   @property
   def onList(self):
      if hasattr(self, 'fn_TableEditor_onList'): return self.fn_TableEditor_onList
      else: return self.fn_unset_TableEditor_onList
   @onList.setter
   def onList(self, value):
      self.fn_TableEditor_onList = value
      lib.Instance_setMethod(self.impl, "OnList".encode('utf8'), cb_TableEditor_onList)

   def fn_unset_TableEditor_onLoad(self):
      return lib.TableEditor_onLoad(self.impl)

   @property
   def onLoad(self):
      if hasattr(self, 'fn_TableEditor_onLoad'): return self.fn_TableEditor_onLoad
      else: return self.fn_unset_TableEditor_onLoad
   @onLoad.setter
   def onLoad(self, value):
      self.fn_TableEditor_onLoad = value
      lib.Instance_setMethod(self.impl, "OnLoad".encode('utf8'), cb_TableEditor_onLoad)

   def fn_unset_TableEditor_onRemovalRequest(self):
      return lib.TableEditor_onRemovalRequest(self.impl)

   @property
   def onRemovalRequest(self):
      if hasattr(self, 'fn_TableEditor_onRemovalRequest'): return self.fn_TableEditor_onRemovalRequest
      else: return self.fn_unset_TableEditor_onRemovalRequest
   @onRemovalRequest.setter
   def onRemovalRequest(self, value):
      self.fn_TableEditor_onRemovalRequest = value
      lib.Instance_setMethod(self.impl, "OnRemovalRequest".encode('utf8'), cb_TableEditor_onRemovalRequest)

   def fn_unset_TableEditor_onStateChanged(self):
      return lib.TableEditor_onStateChanged(self.impl)

   @property
   def onStateChanged(self):
      if hasattr(self, 'fn_TableEditor_onStateChanged'): return self.fn_TableEditor_onStateChanged
      else: return self.fn_unset_TableEditor_onStateChanged
   @onStateChanged.setter
   def onStateChanged(self, value):
      self.fn_TableEditor_onStateChanged = value
      lib.Instance_setMethod(self.impl, "OnStateChanged".encode('utf8'), cb_TableEditor_onStateChanged)

   def remove(self):
      lib.TableEditor_remove(self.impl)

   def select(self, id):
      if id is not None and not isinstance(id, Id): id = Id(id)
      if id is None: id = ffi.NULL
      return lib.TableEditor_select(self.impl, id)

   def selectListRow(self, row):
      if row is not None and not isinstance(row, DataRow): row = DataRow(row)
      if row is None: row = ffi.NULL
      lib.TableEditor_selectListRow(self.impl, row)

   def selectNext(self, loopAround):
      return lib.TableEditor_selectNext(self.impl, loopAround)

   def selectPrevious(self, loopAround):
      return lib.TableEditor_selectPrevious(self.impl, loopAround)

   def write(self):
      lib.TableEditor_write(self.impl)
def convertToASCII(string, newString, len, lowerCase): lib.convertToASCII(string, newString, len, lowerCase)
def eRSProgressAdvance(): lib.eRSProgressAdvance()
def eRSProgressAdvanceLevelCheck(): lib.eRSProgressAdvanceLevelCheck()
def setDefaultIdField(value): lib.setDefaultIdField(value)
def setDefaultNameField(value): lib.setDefaultNameField(value)
def setEDBIndexOptions(options): lib.setEDBIndexOptions(options)
def toASCII(ch): lib.toASCII(ch)

def pyEDA_setup(app):
   app.appGlobals.append(globals())
   if lib.EDA_init(app.impl) == ffi.NULL: raise Exception("Failed to load library")
   app.registerClass(ButtonStyle, True)
   app.registerClass(CSVReport, True)
   app.registerClass(DataSource, True)
   app.registerClass(DataSourceDriver, True)
   app.registerClass(Database, True)
   app.registerClass(Detail, True)
   app.registerClass(DirFilesDataSourceDriver, True)
   app.registerClass(DriverRow, True)
   app.registerClass(DropDataBox, True)
   app.registerClass(EditDropDataBox, True)
   app.registerClass(EditFieldDropDataBox, True)
   app.registerClass(EditSection, True)
   app.registerClass(Field, True)
   app.registerClass(FieldBox, True)
   app.registerClass(FieldCheckButton, True)
   app.registerClass(FieldDataBox, True)
   app.registerClass(FieldDropDataBox, True)
   app.registerClass(FixedMultiLineString, True)
   app.registerClass(GetMemberString, True)
   app.registerClass(Group, True)
   app.registerClass(Grouping, True)
   app.registerClass(IdList, True)
   app.registerClass(IdList32, True)
   app.registerClass(IdList32Includes, True)
   app.registerClass(IdListIncludes, True)
   app.registerClass(ListSection, True)
   app.registerClass(Lookup, True)
   app.registerClass(MemberStringSample, True)
   app.registerClass(NoCaseAccent, True)
   app.registerClass(Page, True)
   app.registerClass(PrintedReport, True)
   app.registerClass(Report, True)
   app.registerClass(ReportDestination, True)
   app.registerClass(ReportPreviewArea, True)
   app.registerClass(ReportRender, True)
   app.registerClass(ReportRenderNormal, True)
   app.registerClass(ReportTitle, True)
   app.registerClass(Row, True)
   app.registerClass(SQLCustomFunction, True)
   app.registerClass(SQLiteSearchField, True)
   app.registerClass(SQLiteSearchTable, True)
   app.registerClass(StringList, True)
   app.registerClass(StringSearchField, True)
   app.registerClass(StringSearchTable, True)
   app.registerClass(Table, True)
   app.registerClass(TableDropBox, True)
   app.registerClass(TableEditor, True)
