#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from pyecere import *

app = GuiApplication(appGlobals=globals())

light = Light(diffuse=DefinedColor.lightCoral,
              orientation=Euler(pitch=10, yaw=30))

camera = Camera(type=CameraType.fixed,
                position=Vector3D(0, 0, -300),
                orientation=Euler(0, 0, 0),
                fov=53)  # Field of View

@regclass
class Hello3D(Window):

    def __init__(self):
        Window.__init__(self,
                        displayDriver="OpenGL",
                        caption=I18N("Hello 3D"),
                        hasClose=True,
                        hasMaximize=True,
                        hasMinimize=True,
                        borderStyle=BorderStyle.sizable,
                        clientSize=Size(640, 480),
                        background=ColorAlpha(255, DefinedColor.black),
                        foreground=ColorAlpha(255, DefinedColor.black))

        self.cube = Cube()

        def h3d_onLoadGraphics(self):
            self.cube.create(self.displaySystem)
            # NOTE: Assigning to .cube.transform.scaling does not work
            #       (not sure what Python mechanism could be used to support this nicely)
            self.cube.transform = Transform(scaling=(100, 100, 100),
                                            orientation=Euler(50, 30, 50))
            self.cube.updateTransform()
            return True
        self.onLoadGraphics = h3d_onLoadGraphics

        def h3d_onResize(self, width, height):
            camera.setup(width, height, None)
            camera.update()
        self.onResize       = h3d_onResize

        def h3d_onRedraw(self, surface):
            surface.clear(ClearType.depthBuffer)
            surface.display.setLight(0, light)
            surface.display.setCamera(surface, camera)
            surface.display.drawObject(self.cube)
            surface.display.setCamera(surface, None)
        self.onRedraw       = h3d_onRedraw

Hello3D()

app.main()
