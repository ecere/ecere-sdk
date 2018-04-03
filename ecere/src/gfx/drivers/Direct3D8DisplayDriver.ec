namespace gfx::drivers;

import "instance"

#define D3D_DEBUG_INFO  1

#if defined(__WIN32__)

#define Method _Method
#define uint _uint
#define byte _byte
#define int64 _int64
#define String _String
#define Mutex _Mutex
#define Size _Size
#define Platform _Platform

#include <windows.h>

#if defined(__MINGW32__) && !defined(_W64)
#undef DECLARE_INTERFACE
#define DECLARE_INTERFACE(i) \
   interface i { CONST_VTABLE struct i##Vtbl *lpVtbl; }; \
   typedef CONST_VTABLE struct i##Vtbl i##Vtbl; \
   CONST_VTABLE struct i##Vtbl
#endif

#include <d3d8.h>

#undef Method
#undef uint
#undef byte
#undef int64
#undef String
#undef Mutex
#undef Size
#undef Platform

import "Display"

#define MATRIX_STACK_SIZE  32

#define NUM_VERTEX_SHADERS 4

static class D3D8Display : struct
{
   Box updateBox;
   IDirect3DSwapChain8 * swapChain;
   Matrix worldMatrixStack[MATRIX_STACK_SIZE];
   Matrix * worldMatrix;
   D3DMATRIX projMatrix;
   D3DLIGHT8 lights[NumberOfLights], lightsPI[NumberOfLights];
   D3DPRESENT_PARAMETERS d3dpp;
   IDirect3DSurface8 * backBuffer, * depthSurface;
};

static class D3D8System : struct
{
   HMODULE d3dDll;
   IDirect3D8 * direct3D;
   IDirect3DDevice8 * d3dDevice;
   IDirect3D8 * (WINAPI * direct3DCreate8)(UINT);
   uint usage;
   D3DPRESENT_PARAMETERS d3dpp;
   DWORD shaders[NUM_VERTEX_SHADERS], shader2D;
   bool ready;
   HWND hwnd;
   int format;
   bool inScene;
};

static class D3D8Surface : struct
{
   // For compatibility with LFB driver
   Font font;
   bool opaqueText;
   int xOffset;
   bool writingText;
   bool writingOutline;

   ColorAlpha background;
};

static class D3D8Mesh : struct
{
   IDirect3DVertexBuffer8 * vertices;
   IDirect3DVertexBuffer8 * normals;
   IDirect3DVertexBuffer8 * texCoords;
   IDirect3DVertexBuffer8 * texCoords2;
};

static struct D3D8Vertex
{
   float x,y,z;
   ColorAlpha color;
   float u,v;
};

static class D3D8Indices : struct
{
   uint16 * indices;
   IDirect3DIndexBuffer8 * buffer;
   int nIndices;
};

static int primitiveTypes[RenderPrimitiveType] =
{
   D3DPT_POINTLIST, D3DPT_LINELIST, D3DPT_TRIANGLELIST, D3DPT_TRIANGLESTRIP, D3DPT_TRIANGLEFAN, D3DPT_TRIANGLEFAN, 0, D3DPT_LINESTRIP
};

static void SetTransformMatrix(IDirect3DDevice8 * device, Matrix matrix)
{
   D3DMATRIX d3dMat =
   {
      {
         {
            (float)matrix.m[0][0], (float)matrix.m[0][1], (float)matrix.m[0][2], (float)matrix.m[0][3],
            (float)matrix.m[1][0], (float)matrix.m[1][1], (float)matrix.m[1][2], (float)matrix.m[1][3],
            (float)matrix.m[2][0], (float)matrix.m[2][1], (float)matrix.m[2][2], (float)matrix.m[2][3],
            (float)matrix.m[3][0], (float)matrix.m[3][1], (float)matrix.m[3][2], (float)matrix.m[3][3]
         }
      }
   };
   IDirect3DDevice8_SetTransform(device, D3DTS_WORLD, &d3dMat);
}

class Direct3D8DisplayDriver : DisplayDriver
{
   class_property(name) = "Direct3D8";

   bool ::LockDisplay(Display display, Surface surface, Bitmap lfbBitmap, Surface * lfbSurface)
   {
      bool result = false;
      D3D8Display d3dDisplay = display.driverData;

      //if(!IDirect3DDevice8_GetBackBuffer(d3dSystem.d3dDevice, 0, 0, D3DBACKBUFFER_TYPE_MONO, &d3dDisplay.backBuffer))
      {
         D3DLOCKED_RECT lockedRect;
         if(!IDirect3DSurface8_LockRect(d3dDisplay.backBuffer, &lockedRect, null, 0))
         {
            result = true;
            switch(d3dDisplay.d3dpp.BackBufferFormat)
            {
               case D3DFMT_A8R8G8B8:
               case D3DFMT_X8R8G8B8:
                  lfbBitmap.pixelFormat = pixelFormat888;
                  break;
               case D3DFMT_R5G6B5:
                  lfbBitmap.pixelFormat = pixelFormat565;
                  break;
               case D3DFMT_X1R5G5B5:
               case D3DFMT_A1R5G5B5:
                  lfbBitmap.pixelFormat = pixelFormat555;
                  break;
               case D3DFMT_A4R4G4B4:
               case D3DFMT_X4R4G4B4:
                  lfbBitmap.pixelFormat = pixelFormat444;
                  break;
               default:
                  result = false;
            }
            if(result)
            {
               lfbBitmap.driver = null;
               lfbBitmap.displaySystem = null;
               lfbBitmap.picture = (byte *)lockedRect.pBits;
               lfbBitmap.transparent = false;
               lfbBitmap.stride = lockedRect.Pitch >> GetColorDepthShifts(lfbBitmap.pixelFormat);
               lfbBitmap.width = display.width;
               lfbBitmap.height = display.height;

               *lfbSurface = lfbBitmap.GetSurface(surface ? surface.offset.x : 0, surface ? surface.offset.y : 0, surface ? &surface.box : null);
            }
         }
         if(!result)
            IDirect3DSurface8_Release(d3dDisplay.backBuffer);
      }
      return result;
   }

   void ::UnlockDisplay(Display display, Surface surface)
   {
      D3D8Display d3dDisplay = display.driverData;
      if(d3dDisplay.backBuffer)
      {
         IDirect3DSurface8_UnlockRect(d3dDisplay.backBuffer);
         IDirect3DSurface8_Release(d3dDisplay.backBuffer);
      }
      delete surface;
   }

   void ::SetViewportAndMatrices(Display display, int x, int y, Box box)
   {
      D3D8Display d3dDisplay = display.driverData;
      DisplaySystem displaySystem = display.displaySystem;
      D3D8System d3dSystem = displaySystem.driverData;
      if(d3dSystem.ready)
      {
         D3DVIEWPORT8 viewport;
         viewport.MinZ = 0;
         viewport.MaxZ = 1;
         if(box.right<box.left || box.bottom <box.top)
         {
            viewport.Width = viewport.Height = 1;
            viewport.X = viewport.Y = MAXDWORD;
         }
         else
         {
            viewport.X = x + box.left;
            viewport.Y = y + box.top;
            viewport.Width = box.right - box.left + 1;
            viewport.Height = box.bottom - box.top + 1;
         }
         if(!IDirect3DDevice8_SetViewport(d3dSystem.d3dDevice, &viewport))
         {
            D3DMATRIX * matProj = &d3dDisplay.projMatrix;
            Matrix * matWorld = d3dDisplay.worldMatrix = d3dDisplay.worldMatrixStack;

            matProj->m[0][0] = 2.0f / viewport.Width;
            matProj->m[1][1] =-2.0f / viewport.Height;
            matProj->m[2][2] = matProj->m[3][1] = matProj->m[3][3] = 1;
            matProj->m[3][0] = -1;

            IDirect3DDevice8_SetTransform(d3dSystem.d3dDevice, D3DTS_PROJECTION, matProj);

            matWorld->Identity();
            matWorld->m[3][0] =-box.left;
            matWorld->m[3][1] =-box.top;

            SetTransformMatrix(d3dSystem.d3dDevice, matWorld);
         }
      }
   }

   // Implementation
   bool CreateDisplaySystem(DisplaySystem displaySystem)
   {
      bool result = false;
      D3D8System d3dSystem = displaySystem.driverData = D3D8System { };
      if(d3dSystem)
      {
         displaySystem.flags.alpha = true;
         //if(displaySystem.flags.fullScreen)
            displaySystem.flags.flipping = true;
         displaySystem.pixelFormat = pixelFormat888;

         d3dSystem.d3dDll = LoadLibrary("d3d8.dll");
         if(d3dSystem.d3dDll)
         {
            d3dSystem.direct3DCreate8 = (void *)GetProcAddress(d3dSystem.d3dDll, "Direct3DCreate8");
            if(d3dSystem.direct3DCreate8)
            {
               if((d3dSystem.direct3D = d3dSystem.direct3DCreate8(D3D_SDK_VERSION)))
               {
                  D3DDISPLAYMODE d3ddm;
                  if(!IDirect3D8_GetAdapterDisplayMode(d3dSystem.direct3D, D3DADAPTER_DEFAULT, &d3ddm))
                  {
                     d3dSystem.d3dpp.BackBufferCount = 1;

                     if(displaySystem.flags.fullScreen)
                     {
                        d3dSystem.d3dpp.BackBufferWidth = d3ddm.Width;
                        d3dSystem.d3dpp.BackBufferHeight = d3ddm.Height;
                        d3dSystem.d3dpp.hDeviceWindow = displaySystem.window;
                     }
                     else
                     {
                        d3dSystem.d3dpp.hDeviceWindow = d3dSystem.hwnd =
                           CreateWindow("static", null, 0,0,0,0,0,null,null,null,null);
                        d3dSystem.d3dpp.Windowed = TRUE;
                     }

                     d3dSystem.d3dpp.SwapEffect = D3DSWAPEFFECT_DISCARD;
                     d3dSystem.format = d3dSystem.d3dpp.BackBufferFormat = d3ddm.Format;
                     d3dSystem.d3dpp.Flags = D3DPRESENTFLAG_LOCKABLE_BACKBUFFER;

                     if(!IDirect3D8_CreateDevice(d3dSystem.direct3D, D3DADAPTER_DEFAULT, D3DDEVTYPE_HAL,
                        d3dSystem.d3dpp.hDeviceWindow,
                               D3DCREATE_HARDWARE_VERTEXPROCESSING|D3DCREATE_PUREDEVICE|D3DCREATE_FPU_PRESERVE,
                               &d3dSystem.d3dpp, &d3dSystem.d3dDevice))
                        result = true;
                     else
                     {
                        d3dSystem.usage = D3DUSAGE_SOFTWAREPROCESSING;
                        if(!IDirect3D8_CreateDevice(d3dSystem.direct3D, D3DADAPTER_DEFAULT, D3DDEVTYPE_HAL,
                              d3dSystem.d3dpp.hDeviceWindow,
                                  D3DCREATE_SOFTWARE_VERTEXPROCESSING|D3DCREATE_FPU_PRESERVE,
                                  &d3dSystem.d3dpp, &d3dSystem.d3dDevice))
                           result = true;
                     }

                     if(result)
                     {
                        DWORD vertexShaders[NUM_VERTEX_SHADERS][7] =
                        {
                           {
                               D3DVSD_STREAM(0),
                               D3DVSD_REG(D3DVSDE_POSITION, D3DVSDT_FLOAT3),
                               D3DVSD_END()
                           },
                           {
                               D3DVSD_STREAM(0),
                               D3DVSD_REG(D3DVSDE_POSITION, D3DVSDT_FLOAT3),
                               D3DVSD_STREAM(1),
                               D3DVSD_REG(D3DVSDE_NORMAL, D3DVSDT_FLOAT3),
                               D3DVSD_END()
                           },
                           {
                               D3DVSD_STREAM(0),
                               D3DVSD_REG(D3DVSDE_POSITION, D3DVSDT_FLOAT3),
                               D3DVSD_STREAM(2),
                               D3DVSD_REG(D3DVSDE_TEXCOORD0, D3DVSDT_FLOAT2),
                               D3DVSD_END()
                           },
                           {
                               D3DVSD_STREAM(0),
                               D3DVSD_REG(D3DVSDE_POSITION, D3DVSDT_FLOAT3),
                               D3DVSD_STREAM(1),
                               D3DVSD_REG(D3DVSDE_NORMAL, D3DVSDT_FLOAT3),
                               D3DVSD_STREAM(2),
                               D3DVSD_REG(D3DVSDE_TEXCOORD0, D3DVSDT_FLOAT2),
                               D3DVSD_END()
                           }
                        };

                        DWORD vertexShader2D[] =
                        {
                            D3DVSD_STREAM(0),
                            D3DVSD_REG(D3DVSDE_POSITION,  D3DVSDT_FLOAT3),
                            D3DVSD_REG(D3DVSDE_DIFFUSE,   D3DVSDT_D3DCOLOR),
                            D3DVSD_REG(D3DVSDE_TEXCOORD0, D3DVSDT_FLOAT2),
                            D3DVSD_END()
                        };

                        int c;
                        for(c = 0; c<NUM_VERTEX_SHADERS; c++)
                           if(IDirect3DDevice8_CreateVertexShader(d3dSystem.d3dDevice, vertexShaders[c], null, &d3dSystem.shaders[c], 0))
                              break;

                        if(c < NUM_VERTEX_SHADERS ||
                           IDirect3DDevice8_CreateVertexShader(d3dSystem.d3dDevice, vertexShader2D, null, &d3dSystem.shader2D, 0))
                           result = false;
                     }
                     if(result)
                        d3dSystem.ready = false;
                  }
               }
            }
         }
         else
            Log("Couldn't load library d3d8.dll\n");
            // LogErrorCode(ERR_MISSING_LIBRARY, "d3d8.dll");
      }
      return result;
   }

   void DestroyDisplaySystem(DisplaySystem displaySystem)
   {
      D3D8System d3dSystem = displaySystem.driverData;
      int c;

      for(c = 0; c<NUM_VERTEX_SHADERS; c++)
      {
         if(d3dSystem.shaders[c])
            IDirect3DDevice8_DeleteVertexShader(d3dSystem.d3dDevice, d3dSystem.shaders[c]);
      }

      if(d3dSystem.shader2D)
         IDirect3DDevice8_DeleteVertexShader(d3dSystem.d3dDevice, d3dSystem.shader2D);

      if(d3dSystem.d3dDevice)
         IDirect3DDevice8_Release(d3dSystem.d3dDevice);

      if(d3dSystem.direct3D)
         IDirect3D8_Release(d3dSystem.direct3D);

      FreeLibrary(d3dSystem.d3dDll);

      delete d3dSystem;
      displaySystem.driverData = null;

   }

   void DestroyDisplay(Display display)
   {
      DisplaySystem displaySystem = display.displaySystem;
      D3D8System d3dSystem = displaySystem.driverData;
      D3D8Display d3dDisplay = display.driverData;

      if(d3dSystem.inScene)
      {
         IDirect3DDevice8_EndScene(d3dSystem.d3dDevice);
         d3dSystem.inScene = false;
      }

      if(d3dDisplay.backBuffer)
         IDirect3DSurface8_Release(d3dDisplay.backBuffer);

      if(d3dDisplay.depthSurface)
         IDirect3DSurface8_Release(d3dDisplay.depthSurface);

      if(d3dDisplay.swapChain)
         IDirect3DSwapChain8_Release(d3dDisplay.swapChain);

      delete d3dDisplay;
      display.driverData = null;
   }

   bool CreateDisplay(Display display)
   {
      bool result = false;
      DisplaySystem displaySystem = display.displaySystem;
      D3D8System d3dSystem = displaySystem.driverData;
      display.driverData = D3D8Display { };

      d3dSystem.ready = false;

      result = true;

      return result;
   }

   bool DisplaySize(Display display, int width, int height)
   {
      bool result = false;
      DisplaySystem displaySystem = display.displaySystem;
      D3D8System d3dSystem = displaySystem.driverData;
      D3D8Display d3dDisplay = display.driverData;
      IDirect3DDevice8 * d3dDevice = d3dSystem.d3dDevice;

      d3dSystem.ready = false;

      if(d3dDisplay.backBuffer)
      {
         IDirect3DSurface8_Release(d3dDisplay.backBuffer);
         d3dDisplay.backBuffer = null;
      }

      if(d3dDisplay.depthSurface)
      {
         IDirect3DSurface8_Release(d3dDisplay.depthSurface);
         d3dDisplay.depthSurface = null;
      }

      if(d3dDisplay.swapChain)
      {
         IDirect3DSwapChain8_Release(d3dDisplay.swapChain);
         d3dDisplay.swapChain = null;
      }

      if(width && height)
      {

         if(displaySystem.flags.fullScreen)
         {
            d3dSystem.d3dpp.BackBufferWidth = width;
            d3dSystem.d3dpp.BackBufferHeight = height;

            result = !IDirect3DDevice8_Reset(d3dSystem.d3dDevice, &d3dSystem.d3dpp);
         }
         else
         {
            d3dDisplay.d3dpp.MultiSampleType = D3DMULTISAMPLE_4_SAMPLES;
            d3dDisplay.d3dpp.BackBufferWidth = width;
            d3dDisplay.d3dpp.BackBufferHeight = height;
            d3dDisplay.d3dpp.Windowed = TRUE;
            //d3dDisplay.d3dpp.SwapEffect = D3DSWAPEFFECT_COPY;
            //d3dDisplay.d3dpp.SwapEffect = D3DSWAPEFFECT_FLIP;
            d3dDisplay.d3dpp.SwapEffect = D3DSWAPEFFECT_DISCARD;

            //d3dDisplay.d3dpp.BackBufferFormat = D3DFMT_R5G6B5;
            d3dDisplay.d3dpp.BackBufferFormat = d3dSystem.format;
            d3dDisplay.d3dpp.BackBufferCount = 1;
            d3dDisplay.d3dpp.hDeviceWindow = display.window;
            d3dDisplay.d3dpp.Flags = D3DPRESENTFLAG_LOCKABLE_BACKBUFFER;
            // d3dDisplay.d3dpp.PresentationInterval = D3DPRESENT_DONOTWAIT;
            //d3dDisplay.d3dpp.PresentationInterval = D3DPRESENT_INTERVAL_IMMEDIATE;
            //d3dDisplay.d3dpp.PresentationInterval = D3DPRESENT_INTERVAL_DEFAULT;

            result = !IDirect3DDevice8_CreateAdditionalSwapChain(d3dSystem.d3dDevice,
               &d3dDisplay.d3dpp, &d3dDisplay.swapChain);

            if(!result)
            {
               d3dDisplay.d3dpp.MultiSampleType = D3DMULTISAMPLE_2_SAMPLES;
               result = !IDirect3DDevice8_CreateAdditionalSwapChain(d3dSystem.d3dDevice,
                  &d3dDisplay.d3dpp, &d3dDisplay.swapChain);
            }
            if(!result)
            {
               d3dDisplay.d3dpp.MultiSampleType = D3DMULTISAMPLE_NONE;
               result = !IDirect3DDevice8_CreateAdditionalSwapChain(d3dSystem.d3dDevice,
                  &d3dDisplay.d3dpp, &d3dDisplay.swapChain);
            }
         }

         if(result)
         {
            if(d3dDisplay.swapChain)
               result = !IDirect3DSwapChain8_GetBackBuffer(d3dDisplay.swapChain,
                  0, D3DBACKBUFFER_TYPE_MONO, &d3dDisplay.backBuffer);
            else
               result = !IDirect3DDevice8_GetBackBuffer(d3dSystem.d3dDevice,
                  0, D3DBACKBUFFER_TYPE_MONO, &d3dDisplay.backBuffer);
            if(result)
            {
               if(!IDirect3DDevice8_CreateDepthStencilSurface(d3dSystem.d3dDevice, width, height,
                  D3DFMT_D16, d3dDisplay.d3dpp.MultiSampleType,&d3dDisplay.depthSurface))
                  d3dSystem.ready = true;
            }
         }

         if(d3dSystem.ready)
         {
            float fogDensity = 0;

            IDirect3DDevice8_SetVertexShader(d3dDevice, d3dSystem.shader2D);

            //IDirect3DDevice8_SetRenderState(d3dDevice, D3DRS_SOFTWAREVERTEXPROCESSING, FALSE);
            IDirect3DDevice8_SetRenderState(d3dDevice, D3DRS_CULLMODE, D3DCULL_NONE);
            IDirect3DDevice8_SetRenderState(d3dDevice, D3DRS_ZENABLE, FALSE);
            IDirect3DDevice8_SetRenderState(d3dDevice, D3DRS_LIGHTING, FALSE);
            IDirect3DDevice8_SetRenderState(d3dDevice, D3DRS_ALPHABLENDENABLE, TRUE);
            IDirect3DDevice8_SetRenderState(d3dDevice, D3DRS_SRCBLEND, D3DBLEND_SRCALPHA);
            IDirect3DDevice8_SetRenderState(d3dDevice, D3DRS_DESTBLEND, D3DBLEND_INVSRCALPHA);
            IDirect3DDevice8_SetRenderState(d3dDevice, D3DRS_FOGTABLEMODE, D3DFOG_EXP);
            IDirect3DDevice8_SetRenderState(d3dDevice, D3DRS_FOGDENSITY, RenderStateFloat { fogDensity }.ui);
            display.ambient = Color { 50,50,50 };
            IDirect3DDevice8_SetRenderState(d3dDevice, D3DRS_NORMALIZENORMALS, TRUE);
            IDirect3DDevice8_SetRenderState(d3dSystem.d3dDevice, D3DRS_MULTISAMPLEANTIALIAS, FALSE);

            IDirect3DDevice8_SetTextureStageState(d3dDevice, 0, D3DTSS_COLOROP, D3DTOP_MODULATE);
            IDirect3DDevice8_SetTextureStageState(d3dDevice, 0, D3DTSS_COLORARG1, D3DTA_CURRENT);
            IDirect3DDevice8_SetTextureStageState(d3dDevice, 0, D3DTSS_COLORARG2, D3DTA_TEXTURE);
            IDirect3DDevice8_SetTextureStageState(d3dDevice, 0, D3DTSS_ALPHAOP, D3DTOP_MODULATE);
            IDirect3DDevice8_SetTextureStageState(d3dDevice, 0, D3DTSS_ALPHAARG1, D3DTA_CURRENT);
            IDirect3DDevice8_SetTextureStageState(d3dDevice, 0, D3DTSS_ALPHAARG2, D3DTA_TEXTURE);

            IDirect3DDevice8_SetTextureStageState(d3dDevice, 0, D3DTSS_MINFILTER, D3DTEXF_LINEAR);
            IDirect3DDevice8_SetTextureStageState(d3dDevice, 0, D3DTSS_MAGFILTER, D3DTEXF_LINEAR);
            IDirect3DDevice8_SetTextureStageState(d3dDevice, 0, D3DTSS_MIPFILTER, D3DTEXF_LINEAR);

            IDirect3DDevice8_SetTextureStageState(d3dDevice, 0, D3DTSS_ADDRESSU, D3DTADDRESS_CLAMP);
            IDirect3DDevice8_SetTextureStageState(d3dDevice, 0, D3DTSS_ADDRESSV, D3DTADDRESS_CLAMP);

            IDirect3DDevice8_SetTexture(d3dDevice, 0, null);

            result = true;
         }
      }
      display.width = width;
      display.height = height;
      d3dDisplay.updateBox.left = display.width;
      d3dDisplay.updateBox.top = display.height;
      d3dDisplay.updateBox.right = 0;
      d3dDisplay.updateBox.bottom = 0;

      return result;
   }

   void DisplayPosition(Display display, int x, int y)
   {

   }

   void SetPalette(Display display, ColorAlpha * palette, bool colorMatch)
   {
   }

   void RestorePalette(Display display)
   {
   }

   void StartUpdate(Display display)
   {
   }

   void EndUpdate(Display display)
   {
   }

   void Scroll(Display display, Box scroll, int x, int y, Extent dirty)
   {
   }

   void Update(Display display, Box updateBox)
   {
      DisplaySystem displaySystem = display.displaySystem;
      D3D8System d3dSystem = displaySystem.driverData;
      D3D8Display d3dDisplay = display.driverData;
      if(d3dSystem.ready)
      {
         //eSystem_Sleep(0.05);
         IDirect3DDevice8_EndScene(d3dSystem.d3dDevice);

         if(display.displaySystem.flags.flipping)
         {
            if(d3dDisplay.swapChain)
               IDirect3DSwapChain8_Present(d3dDisplay.swapChain, null, null, null, null);
            else
               IDirect3DDevice8_Present(d3dSystem.d3dDevice, null, null, null, null);
         }
         else
         {
            RECT source, dest;

            if(updateBox != null)
            {
               source.left = dest.left = updateBox.left;
               source.top = dest.top = updateBox.top;
               source.right = dest.right = updateBox.right+1;
               source.bottom = dest.bottom = updateBox.bottom+1;
            }
            else
            {
               source.left = dest.left = d3dDisplay.updateBox.left;
               source.top = dest.top = d3dDisplay.updateBox.top;
               source.right = dest.right = d3dDisplay.updateBox.right+1;
               source.bottom = dest.bottom = d3dDisplay.updateBox.bottom+1;
            }
            if(dest.bottom > dest.top && dest.right > dest.left)
               IDirect3DDevice8_Present(d3dSystem.d3dDevice, &source, &dest, null, null);
            if(updateBox == null)
            {
               d3dDisplay.updateBox.left = display.width;
               d3dDisplay.updateBox.top = display.height;
               d3dDisplay.updateBox.right = 0;
               d3dDisplay.updateBox.bottom = 0;
            }
         }
         d3dSystem.inScene = false;
      }
   }

   bool GrabScreen(Display display, Bitmap bitmap, int x, int y, unsigned int w, unsigned int h)
   {
      bool result = false;
      Surface lfbSurface;
      Bitmap lfbBitmap { };

      if(LockDisplay(display, null, lfbBitmap, &lfbSurface))
      {
         Surface surface;
         if(bitmap.pixelFormat != lfbBitmap.pixelFormat || bitmap.width < w || bitmap.height < h)
         {
            bitmap.Free();
            bitmap.Allocate(null, w,h,w, lfbBitmap.pixelFormat, false);
         }
         surface = bitmap.GetSurface(0,0,null);
         if(surface)
         {
            ((subclass(DisplayDriver))class(LFBDisplayDriver)).Blit(null, surface, lfbBitmap, 0, 0, x, y, w, h);
            result = true;
         }
         delete surface;
         UnlockDisplay(display, lfbSurface);
      }
      lfbBitmap.picture = null;
      delete lfbBitmap;
      if(!result)
         bitmap.Free();
      return result;
   }

   void FreeBitmap(DisplaySystem displaySystem, Bitmap bitmap)
   {
      if(bitmap.driverData)
         IDirect3DTexture8_Release((IDirect3DTexture8 *)bitmap.driverData);
   }

   bool AllocateBitmap(DisplaySystem displaySystem, Bitmap bitmap, int width, int height, int stride, PixelFormat format, bool allocatePalette)
   {
      return false;
   }

   bool MakeDDBitmap(DisplaySystem displaySystem, Bitmap bitmap, bool mipMaps, int cubeMapFace)
   {
      bool result = false;
      D3D8System d3dSystem = displaySystem.driverData;
      if(cubeMapFace && bitmap.Convert(null, pixelFormat888, null))
      {
         IDirect3DTexture8 * texture;
         uint w = pow2i(Min(bitmap.width, 512)), h = pow2i(Min(bitmap.height, 512));

         if(!IDirect3DDevice8_CreateTexture(d3dSystem.d3dDevice, w, h, mipMaps ? log2i(Max(w+1, h+1)) : 1, 0,
               D3DFMT_A8R8G8B8, D3DPOOL_MANAGED, &texture))
         {
            int level;

            result = true;

            for(level = 0; result && (w >= 1 || h >= 1); level++, w >>= 1, h >>= 1)
            {
               D3DSURFACE_DESC desc;
               D3DLOCKED_RECT lockedRect;

               if(!IDirect3DTexture8_GetLevelDesc(texture, level, &desc) &&
                  !IDirect3DTexture8_LockRect(texture, level, &lockedRect, null, 0))
               {
                  Bitmap mipMap { };
                  Surface mipSurface;

                  mipMap.width = desc.Width;
                  mipMap.height = desc.Height;
                  mipMap.picture = lockedRect.pBits;
                  switch(desc.Format)
                  {
                     case D3DFMT_R5G6B5:   mipMap.pixelFormat = pixelFormat565; break;
                     case D3DFMT_A8R8G8B8: mipMap.pixelFormat = pixelFormat888; break;
                     case D3DFMT_A1R5G5B5: mipMap.pixelFormat = pixelFormat555; break;
                     default:
                        result = false;
                  }
                  if(result)
                  {
                     mipMap.stride = lockedRect.Pitch >> GetColorDepthShifts(mipMap.pixelFormat);

                     mipSurface = mipMap.GetSurface(0,0,null);
                     if(mipSurface)
                     {
                        if(mipMap.width != bitmap.width || mipMap.height != bitmap.height)
                           mipSurface.Filter(bitmap, 0,0, 0,0, mipMap.width, mipMap.height, bitmap.width, bitmap.height);
                        else
                        {
                           //FillBytesBy4(mipMap.picture, bitmap.picture, mipMap.width * mipMap.height);
                           mipSurface.Blit(bitmap, 0,0, 0,0, bitmap.width, bitmap.height);
                        }

                        delete mipSurface;
                     }
                  }

                  mipMap.picture = null;
                  delete mipMap;

                  IDirect3DTexture8_UnlockRect(texture, level);
               }
               if(!mipMaps) break;
            }

            bitmap.driver.FreeBitmap(bitmap.displaySystem, bitmap);
            bitmap.driver = displaySystem.driver;
            bitmap.driverData = (void *)texture;

            if(!result)
               FreeBitmap(displaySystem, bitmap);
         }
      }
      return result;
   }

   bool GetSurface(Display display, Surface surface, int x,int y, Box clip)
   {
      bool result = false;
      D3D8Display d3dDisplay = display.driverData;
      DisplaySystem displaySystem = display.displaySystem;
      D3D8System d3dSystem = displaySystem.driverData;
      D3D8Surface d3dSurface = surface.driverData = D3D8Surface { };

      if(d3dSurface && d3dSystem.ready)
      {
         surface.unclippedBox = surface.box = clip;
         surface.offset.x = x;
         surface.offset.y = y;

         d3dDisplay.updateBox.left = Min(x + clip.left, d3dDisplay.updateBox.left);
         d3dDisplay.updateBox.top = Min(y + clip.top, d3dDisplay.updateBox.top);
         d3dDisplay.updateBox.right = Max(x + clip.right, d3dDisplay.updateBox.right);
         d3dDisplay.updateBox.bottom = Max(y + clip.bottom, d3dDisplay.updateBox.bottom);

         SetViewportAndMatrices(display, x,y, &surface.box);

         result = true;
      }
      return result;
   }

   bool GetBitmapSurface(DisplaySystem displaySystem, Surface surface, Bitmap bitmap, int x, int y, Box clip)
   {
      return false;
   }

   void ReleaseSurface(Display display, Surface surface)
   {
      delete surface.driverData;
   }

   void Clip(Display display, Surface surface, Box clip)
   {
      Box box;

      if(clip != null)
      {
         box = clip;
         box.Clip(surface.unclippedBox);
         surface.box = box;
      }
      else
         box = surface.box = surface.unclippedBox;

      SetViewportAndMatrices(display, surface.offset.x, surface.offset.y, box);
   }

   void SetForeground(Display display, Surface surface, ColorAlpha color)
   {

   }

   void SetBackground(Display display, Surface surface, ColorAlpha color)
   {
      D3D8Surface d3dSurface = surface.driverData;
      d3dSurface.background = color;
   }

   ColorAlpha GetPixel(Display display, Surface surface, int x, int y)
   {
      return 0;
   }

   void PutPixel(Display display, Surface surface,int x,int y)
   {
      DisplaySystem displaySystem = display.displaySystem;
      D3D8System d3dSystem = displaySystem.driverData;
      D3D8Vertex vertex = { (float)x, (float)y, 1.0f, surface.foreground, 0, 0 };

      IDirect3DDevice8_DrawPrimitiveUP(d3dSystem.d3dDevice, D3DPT_POINTLIST, 1,
         &vertex, sizeof(D3D8Vertex));
   }

   void DrawLine(Display display, Surface surface, int x1, int y1, int x2, int y2)
   {
      DisplaySystem displaySystem = display.displaySystem;
      D3D8System d3dSystem = displaySystem.driverData;
      D3D8Vertex vertex[2] =
      {
         { (float)x1, (float)y1, 1.0f, surface.foreground, 0, 0 },
         { (float)x2, (float)y2, 1.0f, surface.foreground, 0, 0 }
      };

      if(x1 == x2) vertex[1].y++;
      else if(y1 == y2) vertex[1].x++;

      IDirect3DDevice8_DrawPrimitiveUP(d3dSystem.d3dDevice, D3DPT_LINESTRIP, 1,
         vertex, sizeof(D3D8Vertex));
   }

   void Rectangle(Display display, Surface surface,int x1,int y1,int x2,int y2)
   {
      DisplaySystem displaySystem = display.displaySystem;
      D3D8System d3dSystem = displaySystem.driverData;
      D3D8Vertex vertex[5] =
      {
         { (float)x1, (float)y1, 1.0f, surface.foreground, 0, 0 },
         { (float)x2, (float)y1, 1.0f, surface.foreground, 0, 0 },
         { (float)x2, (float)y2, 1.0f, surface.foreground, 0, 0 },
         { (float)x1, (float)y2, 1.0f, surface.foreground, 0, 0 },
         { (float)x1, (float)y1, 1.0f, surface.foreground, 0, 0 }
      };

      IDirect3DDevice8_DrawPrimitiveUP(d3dSystem.d3dDevice, D3DPT_LINESTRIP, 4,
         vertex, sizeof(D3D8Vertex));

   }

   void Area(Display display, Surface surface,int x1,int y1,int x2,int y2)
   {
      DisplaySystem displaySystem = display.displaySystem;
      D3D8System d3dSystem = displaySystem.driverData;
      D3D8Surface d3dSurface = surface.driverData;
      D3D8Vertex vertex[4] =
      {
         { (float)x1, (float)y1, 1.0f, d3dSurface.background, 0, 0 },
         { (float)x2 + 1.0f, (float)y1, 1.0f, d3dSurface.background, 0, 0 },
         { (float)x1, (float)y2 + 1.0f, 1.0f, d3dSurface.background, 0, 0 },
         { (float)x2 + 1.0f, (float)y2 + 1.0f, 1.0f, d3dSurface.background, 0, 0 }
      };

      IDirect3DDevice8_DrawPrimitiveUP(d3dSystem.d3dDevice, D3DPT_TRIANGLESTRIP, 2,
         vertex, sizeof(D3D8Vertex));

   }

   void Clear(Display display, Surface surface, ClearType type)
   {
      DisplaySystem displaySystem = display.displaySystem;
      D3D8System d3dSystem = displaySystem.driverData;
      D3D8Surface d3dSurface = surface.driverData;
      IDirect3DDevice8_Clear(d3dSystem.d3dDevice, 0, null,
         ((type == depthBuffer) ? 0 : D3DCLEAR_TARGET) |
         ((type == colorBuffer) ? 0 : D3DCLEAR_ZBUFFER),
         d3dSurface.background, 1,0);
   }

   bool ConvertBitmap(DisplaySystem displaySystem, Bitmap bitmap, PixelFormat format, ColorAlpha * palette)
   {
      return true;
   }

   void Blit(Display display, Surface surface, Bitmap src, int dx, int dy, int sx, int sy, int w, int h)
   {
      DisplaySystem displaySystem = display.displaySystem;
      D3D8System d3dSystem = displaySystem.driverData;
      D3D8Surface d3dSurface = surface.driverData;
      Color foreground = d3dSurface.writingText ? surface.foreground : white;
      D3D8Vertex vertex[4] =
      {
         { (float)dx, (float)dy, 1.0f, foreground,
            (float)sx / (src.width-1), (float)sy/ (src.height-1) },
         { (float)(dx+w), (float)dy, 1.0f, foreground,
            (float)(sx+w)/ (src.width-1), (float)sy/ (src.height-1) },
         { (float)dx, (float)(dy+h), 1.0f, foreground,
            (float)sx/ (src.width-1), (float)(sy+h)/ (src.height-1) },
         { (float)(dx+w), (float)(dy+h), 1.0f, foreground,
            (float)(sx+w) / (src.width-1), (float)(sy+h)/ (src.height-1) }
      };

      IDirect3DDevice8_SetTexture(d3dSystem.d3dDevice, 0, (IDirect3DBaseTexture8 *)src.driverData);
      IDirect3DDevice8_DrawPrimitiveUP(d3dSystem.d3dDevice, D3DPT_TRIANGLESTRIP, 2,
         vertex, sizeof(D3D8Vertex));
      IDirect3DDevice8_SetTexture(d3dSystem.d3dDevice, 0, null);
   }

   void Stretch(Display display, Surface surface, Bitmap src, int dx, int dy, int sx, int sy, int w, int h, int sw, int sh)
   {
      DisplaySystem displaySystem = display.displaySystem;
      D3D8System d3dSystem = displaySystem.driverData;
      D3D8Vertex vertex[4] =
      {
         { (float)dx, (float)dy, 1.0f, surface.foreground,
            (float)sx / (src.width-1), (float)sy/ (src.height-1) },
         { (float)(dx+w), (float)dy, 1.0f, surface.foreground,
            (float)(sx+sw)/ (src.width-1), (float)sy/ (src.height-1) },
         { (float)dx, (float)(dy+h), 1.0f, surface.foreground,
            (float)sx/ (src.width-1), (float)(sy+sh)/ (src.height-1) },
         { (float)(dx+w), (float)(dy+h), 1.0f, surface.foreground,
            (float)(sx+sw) / (src.width-1), (float)(sy+sh)/ (src.height-1) }
      };

      IDirect3DDevice8_SetTexture(d3dSystem.d3dDevice, 0, (IDirect3DBaseTexture8 *)src.driverData);
      IDirect3DDevice8_DrawPrimitiveUP(d3dSystem.d3dDevice, D3DPT_TRIANGLESTRIP, 2,
         vertex, sizeof(D3D8Vertex));
      IDirect3DDevice8_SetTexture(d3dSystem.d3dDevice, 0, null);
   }

   void Filter(Display display, Surface surface, Bitmap src, int dx, int dy, int sx, int sy, int w, int h, int sw, int sh)
   {
      Stretch(display, surface, src, dx, dy, sx, sy, w, h, sw, sh);
   }

   void StretchDI(Display display, Surface surface, Bitmap src, int dx, int dy, int sx, int sy, int w, int h, int sw, int sh)
   {
      Surface lfbSurface;
      Bitmap lfbBitmap { };
      if(LockDisplay(display, surface, lfbBitmap, &lfbSurface))
      {
         ((subclass(DisplayDriver))class(LFBDisplayDriver)).Stretch(null, lfbSurface, src, dx, dy, sx, sy, w, h, sw, sh);
         UnlockDisplay(display, lfbSurface);
      }
      lfbBitmap.picture = null;
      delete lfbBitmap;
   }

   void BlitDI(Display display, Surface surface, Bitmap src, int dx, int dy, int sx, int sy, int w, int h)
   {
      Surface lfbSurface;
      Bitmap lfbBitmap { };
      if(LockDisplay(display, surface, lfbBitmap, &lfbSurface))
      {
         ((subclass(DisplayDriver))class(LFBDisplayDriver)).Blit(null, lfbSurface, src, dx, dy, sx, sy, w, h);
         UnlockDisplay(display, lfbSurface);
      }
      lfbBitmap.picture = null;
      delete lfbBitmap;
   }

   void FilterDI(Display display, Surface surface, Bitmap src, int dx, int dy, int sx, int sy, int w, int h, int sw, int sh)
   {
      StretchDI(display, surface, src, dx, dy, sx, sy, w, h, sw, sh);
   }

   void UnloadFont(DisplaySystem displaySystem, Font font)
   {
      ((subclass(DisplayDriver))class(LFBDisplayDriver)).UnloadFont(displaySystem, font);
   }

   Font LoadFont(DisplaySystem displaySystem, const char * faceName, float size, FontFlags flags, float outlineSize, float outlineFade)
   {
      return ((subclass(DisplayDriver))class(LFBDisplayDriver)).LoadFont(displaySystem, faceName, size, flags, outlineSize, outlineFade);
   }

   void TextFont(Display display, Surface surface, Font font)
   {
      ((subclass(DisplayDriver))class(LFBDisplayDriver)).TextFont(display, surface, font);
   }

   void TextOpacity(Display display, Surface surface, bool opaque)
   {
      D3D8Surface d3dSurface = surface.driverData;
      d3dSurface.opaqueText = opaque;
   }

   void FontExtent(DisplaySystem displaySystem, Font font, const char * text, int len, int * width, int * height, int prevGlyph, int * rPrevGlyph, int * adv)
   {
      ((subclass(DisplayDriver))class(LFBDisplayDriver)).FontExtent(displaySystem, font, text, len, width, height, prevGlyph, rPrevGlyph, adv);
   }

   void WriteText(Display display, Surface surface, int x, int y, const char * text, int len, int prevGlyph, int * rPrevGlyph)
   {
      DisplaySystem displaySystem = display.displaySystem;
      D3D8System d3dSystem = displaySystem.driverData;
      D3D8Surface d3dSurface = surface.driverData;

      if(surface.textOpacity)
      {
         int w, h, adv;
         FontExtent(display.displaySystem, surface.font, text, len, &w, &h, prevGlyph, rPrevGlyph, &adv);
         w += adv;

         {
            int x1 = x, y1 = y, x2 = x+w-1, y2 = y+h-1;
            D3D8Vertex vertex[4] =
            {
               { (float)x1, (float)y1 /*- 0.5*/, 1.0f, d3dSurface.background, 0, 0 },
               { (float)x2 + 1.0f, (float)y1 /*- 0.5*/, 1.0f, d3dSurface.background, 0, 0 },
               { (float)x1, (float)y2 /*+ 1.5f*/, 1.0f, d3dSurface.background, 0, 0 },
               { (float)x2 + 1.0f, (float)y2 /*+ 1.5f*/, 1.0f, d3dSurface.background, 0, 0 }
            };

            IDirect3DDevice8_DrawPrimitiveUP(d3dSystem.d3dDevice, D3DPT_TRIANGLESTRIP, 2,
               vertex, sizeof(D3D8Vertex));
         }
         //display.displaySystem.driver.Area(display, surface, x, y, x+w-1, y+h-1);
      }
      IDirect3DDevice8_SetTextureStageState(d3dSystem.d3dDevice, 0, D3DTSS_MINFILTER, D3DTEXF_POINT);
      IDirect3DDevice8_SetTextureStageState(d3dSystem.d3dDevice, 0, D3DTSS_MAGFILTER, D3DTEXF_POINT);
      IDirect3DDevice8_SetTextureStageState(d3dSystem.d3dDevice, 0, D3DTSS_MIPFILTER, D3DTEXF_NONE);
      d3dSurface.writingText = true;

      ((subclass(DisplayDriver))class(LFBDisplayDriver)).WriteText(display, surface, x, y, text, len, prevGlyph, rPrevGlyph);

      d3dSurface.writingText = false;
      IDirect3DDevice8_SetTextureStageState(d3dSystem.d3dDevice, 0, D3DTSS_MINFILTER, D3DTEXF_LINEAR);
      IDirect3DDevice8_SetTextureStageState(d3dSystem.d3dDevice, 0, D3DTSS_MAGFILTER, D3DTEXF_LINEAR);
      IDirect3DDevice8_SetTextureStageState(d3dSystem.d3dDevice, 0, D3DTSS_MIPFILTER, D3DTEXF_LINEAR); //NONE);
   }

   void TextExtent(Display display, Surface surface, const char * text, int len, int * width, int * height, int prevGlyph, int * rPrevGlyph, int * adv)
   {
      ((subclass(DisplayDriver))class(LFBDisplayDriver)).TextExtent(display, surface, text, len, width, height, prevGlyph, rPrevGlyph, adv);
   }

   void DrawingChar(Display display, Surface surface, byte character)
   {

   }

   void LineStipple(Display display, Surface surface, uint stipple)
   {
      /*
      D3D8Display d3dDisplay = display.driverData;
      IDirect3DDevice8_SetRenderState(d3dSystem.d3dDevice, D3DRS_LINEPATTERN,
         stipple?MDWORD(1,stipple):0);
      */
   }

   void SetRenderState(Display display, RenderState state, uint value)
   {
      DisplaySystem displaySystem = display.displaySystem;
      D3D8System d3dSystem = displaySystem.driverData;
      switch(state)
      {
         case antiAlias:
            IDirect3DDevice8_SetRenderState(d3dSystem.d3dDevice, D3DRS_MULTISAMPLEANTIALIAS, value ? TRUE : FALSE);
            break;
         case fillMode:
            IDirect3DDevice8_SetRenderState(d3dSystem.d3dDevice, D3DRS_FILLMODE,
               ((FillModeValue)value == solid) ? D3DFILL_SOLID : D3DFILL_WIREFRAME);
            break;
         case depthTest:
            // IDirect3DDevice8_SetRenderState(d3dSystem.d3dDevice, D3DRS_ZENABLE, value ? D3DZB_USEW : D3DZB_FALSE);
            IDirect3DDevice8_SetRenderState(d3dSystem.d3dDevice, D3DRS_ZENABLE, value ? D3DZB_TRUE : D3DZB_FALSE);
            break;
         case depthWrite:
            IDirect3DDevice8_SetRenderState(d3dSystem.d3dDevice, D3DRS_ZWRITEENABLE, value);
            break;
         case fogColor:
            IDirect3DDevice8_SetRenderState(d3dSystem.d3dDevice, D3DRS_FOGCOLOR, value);
            break;
         case fogDensity:
         {
            float fogDensity = RenderStateFloat { ui = value }.f;
            IDirect3DDevice8_SetRenderState(d3dSystem.d3dDevice, D3DRS_FOGDENSITY, RenderStateFloat { fogDensity }.ui);
            break;
         }
         case blend:
            IDirect3DDevice8_SetRenderState(d3dSystem.d3dDevice, D3DRS_ALPHABLENDENABLE, value);
            break;
         case ambient:
            IDirect3DDevice8_SetRenderState(d3dSystem.d3dDevice, D3DRS_AMBIENT, value);
            break;
      }
   }

   void SetLight(Display display, int id, Light light)
   {
      DisplaySystem displaySystem = display.displaySystem;
      D3D8System d3dSystem = displaySystem.driverData;
      D3D8Display d3dDisplay = display.driverData;
      if(light != null)
      {
         D3DLIGHT8 d3dLight =
         {
            D3DLIGHT_DIRECTIONAL,
            // Opacity on the light?
            { light.diffuse.r, light.diffuse.g, light.diffuse.b,    1.0f },
            { light.specular.r, light.specular.g, light.specular.b, 1.0f },
            { light.ambient.r, light.ambient.g, light.ambient.b,    1.0f }
         };
         Vector3Df * lightDirection;
         Vector3Df vector {0,0,1};
         Vector3Df vectorPI {0,0,-1};
         Vector3Df direction;
         Matrix mat;
         lightDirection = (Vector3Df *)&d3dLight.Direction;

         mat.RotationQuaternion(light.orientation);

         direction.MultMatrix(vector, mat);
         if(!display.display3D || !display.display3D.camera)
         {
            d3dLight.Direction.x = direction.x;
            d3dLight.Direction.y = direction.y;
            d3dLight.Direction.z =-direction.z;
         }
         else
            lightDirection->MultMatrix(direction, d3dDisplay.worldMatrix);

         d3dDisplay.lights[id] = d3dLight;

         IDirect3DDevice8_LightEnable(d3dSystem.d3dDevice, id, TRUE);
         IDirect3DDevice8_SetLight(d3dSystem.d3dDevice, id, &d3dDisplay.lights[id]);

         direction.MultMatrix(vectorPI, mat);
         lightDirection->MultMatrix(direction, d3dDisplay.worldMatrix);

         d3dDisplay.lightsPI[id] = d3dLight;
      }
      else
      {
         IDirect3DDevice8_LightEnable(d3dSystem.d3dDevice, id, FALSE);
         d3dDisplay.lights[id].Type = 0;
      }
   }

   void SetCamera(Display display, Surface surface, Camera camera)
   {
      DisplaySystem displaySystem = display.displaySystem;
      D3D8System d3dSystem = displaySystem.driverData;
      D3D8Display d3dDisplay = display.driverData;
      IDirect3DDevice8 * d3dDevice = d3dSystem.d3dDevice;
      if(camera)
      {
         Point topLeft {surface.box.left + surface.offset.x, surface.box.top  + surface.offset.y};
         Point downRight {surface.box.right + surface.offset.x, surface.box.bottom  + surface.offset.y};
         Point origin
         {
            surface.offset.x + camera.origin.x,
            surface.offset.y + camera.origin.y
         };
         D3DMATRIX matProj;
         Matrix matrix;
         float l = (topLeft.x - origin.x) * camera.zMin / camera.focalX;
         float r = (downRight.x - origin.x) * camera.zMin / camera.focalX;
         float b = (downRight.y - origin.y) * camera.zMin / camera.focalY;
         float t = (topLeft.y - origin.y) * camera.zMin / camera.focalY;
         float n = camera.zMin;
         float f = camera.zMax;

         matProj.m[0][0] = 2 * n / (r - l);
         matProj.m[0][1] = 0;
         matProj.m[0][2] = 0;
         matProj.m[0][3] = 0;

         matProj.m[1][0] = 0;
         matProj.m[1][1] = 2 * n / (t - b);
         matProj.m[1][2] = 0;
         matProj.m[1][3] = 0;

         matProj.m[2][0] = (l + r) / (r - l);
         matProj.m[2][1] = (t + b) / (t - b);
         matProj.m[2][2] = f / (n - f);
         matProj.m[2][3] = -1;

         matProj.m[3][0] = 0;
         matProj.m[3][1] = 0;
         matProj.m[3][2] = n * f / (n - f);
         matProj.m[3][3] = 0;

         IDirect3DDevice8_SetTransform(d3dDevice, D3DTS_PROJECTION, &matProj);

         // *** View Matrix ***
         if(!display.display3D.camera)
            d3dDisplay.worldMatrix++;

         matrix.Identity();
         matrix.Scale(1.0f, 1.0f, -1.0f);
         d3dDisplay.worldMatrix->Multiply(camera.viewMatrix, matrix);

         SetTransformMatrix(d3dDevice, d3dDisplay.worldMatrix);

         IDirect3DDevice8_SetVertexShader(d3dDevice, d3dSystem.shaders[0]);

         // IDirect3DDevice8_SetRenderState(d3dDevice, D3DRS_ZENABLE, D3DZB_USEW);
         IDirect3DDevice8_SetRenderState(d3dDevice, D3DRS_ZENABLE, D3DZB_TRUE);
         IDirect3DDevice8_SetRenderState(d3dDevice, D3DRS_ZWRITEENABLE, TRUE);
         IDirect3DDevice8_SetRenderState(d3dDevice, D3DRS_ALPHABLENDENABLE, FALSE);
         IDirect3DDevice8_SetRenderState(d3dDevice, D3DRS_LIGHTING, TRUE);
         IDirect3DDevice8_SetRenderState(d3dDevice, D3DRS_SPECULARENABLE, TRUE);

         IDirect3DDevice8_SetRenderState(d3dDevice, D3DRS_CULLMODE, D3DCULL_CW);
      }
      else if(display.display3D.camera)
      {
         d3dDisplay.worldMatrix = d3dDisplay.worldMatrixStack;
         SetTransformMatrix(d3dDevice, d3dDisplay.worldMatrix);
         IDirect3DDevice8_SetTransform(d3dDevice, D3DTS_PROJECTION, &d3dDisplay.projMatrix);

         IDirect3DDevice8_SetRenderState(d3dDevice, D3DRS_CULLMODE, D3DCULL_NONE);
         IDirect3DDevice8_SetRenderState(d3dDevice, D3DRS_ZENABLE, FALSE);
         IDirect3DDevice8_SetRenderState(d3dDevice, D3DRS_LIGHTING, FALSE);
         IDirect3DDevice8_SetRenderState(d3dDevice, D3DRS_ALPHABLENDENABLE, TRUE);
         IDirect3DDevice8_SetRenderState(d3dDevice, D3DRS_FOGENABLE, FALSE);
         IDirect3DDevice8_SetRenderState(d3dDevice, D3DRS_SPECULARENABLE, FALSE);

         IDirect3DDevice8_SetTextureStageState(d3dDevice, 0, D3DTSS_ADDRESSU, D3DTADDRESS_CLAMP);
         IDirect3DDevice8_SetTextureStageState(d3dDevice, 0, D3DTSS_ADDRESSV, D3DTADDRESS_CLAMP);

         IDirect3DDevice8_SetVertexShader(d3dDevice, d3dSystem.shader2D);

         IDirect3DDevice8_SetTexture(d3dDevice, 0, null);
      }
   }

   void ApplyMaterial(Display display, Material material, Mesh mesh)
   {
      DisplaySystem displaySystem = display.displaySystem;
      D3D8System d3dSystem = displaySystem.driverData;
      IDirect3DDevice8 * d3dDevice = d3dSystem.d3dDevice;
      D3D8Mesh d3dMesh = mesh.data;

      // Fog
      IDirect3DDevice8_SetRenderState(d3dDevice, D3DRS_FOGENABLE, material.flags.noFog ? FALSE : TRUE);

      // Maps
      if(material.baseMap && d3dMesh.texCoords && material.baseMap.driver.displaySystem == displaySystem)
      {
         Bitmap map = material.baseMap;

         IDirect3DDevice8_SetTexture(d3dDevice, 0, (IDirect3DBaseTexture8 *)map.driverData);

         if(material.flags.tile)
         {
            IDirect3DDevice8_SetTextureStageState(d3dDevice, 0, D3DTSS_ADDRESSU, D3DTADDRESS_WRAP);
            IDirect3DDevice8_SetTextureStageState(d3dDevice, 0, D3DTSS_ADDRESSV, D3DTADDRESS_WRAP);
         }
         else
         {
            IDirect3DDevice8_SetTextureStageState(d3dDevice, 0, D3DTSS_ADDRESSU, D3DTADDRESS_CLAMP);
            IDirect3DDevice8_SetTextureStageState(d3dDevice, 0, D3DTSS_ADDRESSV, D3DTADDRESS_CLAMP);
         }
      }
      else
         IDirect3DDevice8_SetTexture(d3dDevice, 0, null);

      // Color
      // IDirect3DDevice8_SetMaterial(d3dDevice, (D3DMATERIAL8 *)&material.diffuse);

      {
         D3DMATERIAL8 d3dMaterial;

         d3dMaterial.Diffuse.r = material.diffuse.r;
         d3dMaterial.Diffuse.g = material.diffuse.g;
         d3dMaterial.Diffuse.b = material.diffuse.b;
         d3dMaterial.Diffuse.a = material.opacity;

         d3dMaterial.Ambient.r = material.ambient.r;
         d3dMaterial.Ambient.g = material.ambient.g;
         d3dMaterial.Ambient.b = material.ambient.b;
         d3dMaterial.Ambient.a = 1;

         d3dMaterial.Specular.r = material.specular.r;
         d3dMaterial.Specular.g = material.specular.g;
         d3dMaterial.Specular.b = material.specular.b;
         d3dMaterial.Specular.a = 1;

         d3dMaterial.Emissive.r = material.emissive.r;
         d3dMaterial.Emissive.g = material.emissive.g;
         d3dMaterial.Emissive.b = material.emissive.b;
         d3dMaterial.Emissive.a = 1;

         d3dMaterial.Power = material.power;

         IDirect3DDevice8_SetMaterial(d3dDevice, &d3dMaterial);   //(D3DMATERIAL8 *)&material.diffuse
      }
   }

   void FreeMesh(DisplaySystem displaySystem, Mesh mesh)
   {
      D3D8Mesh d3dMesh = mesh.data;
      if(d3dMesh)
      {
         if(!(mesh.flags.vertices))
         {
            if(d3dMesh.vertices)
            {
               IDirect3DVertexBuffer8_Release(d3dMesh.vertices);
               d3dMesh.vertices = null;
            }
            delete mesh.vertices;
         }
         if(!(mesh.flags.normals))
         {
            if(d3dMesh.normals)
            {
               IDirect3DVertexBuffer8_Release(d3dMesh.normals);
               d3dMesh.normals = null;
            }
            delete mesh.normals;
         }
         if(!(mesh.flags.texCoords1))
         {
            if(d3dMesh.texCoords)
            {
               IDirect3DVertexBuffer8_Release(d3dMesh.texCoords);
               d3dMesh.texCoords = null;
            }
            delete mesh.texCoords;
         }
         if(!(mesh.flags.texCoords2))
         {
            if(d3dMesh.texCoords2)
            {
               IDirect3DVertexBuffer8_Release(d3dMesh.texCoords2);
               d3dMesh.texCoords2 = null;
            }
            // delete mesh.texCoords2;
         }
         if(!mesh.flags)
         {
            delete d3dMesh;
            mesh.data = null;
         }
      }
   }

   bool AllocateMesh(DisplaySystem displaySystem, Mesh mesh, MeshFeatures flags, int nVertices)
   {
      D3D8System d3dSystem = displaySystem.driverData;
      bool result = false;
      IDirect3DDevice8 * d3dDevice = d3dSystem.d3dDevice;
      //bool memAllocOnly = flags.memAllocOnly;
      flags.memAllocOnly = false;

      if(!mesh.data)
         mesh.data = D3D8Mesh { };
      if(mesh.data)
      {
         D3D8Mesh d3dMesh = mesh.data;
         result = true;
         if(mesh.nVertices == nVertices)
         {
            if(mesh.flags != flags)
            {
               // Same number of vertices, adding features (Leaves the other features pointers alone)
               if(flags.vertices && !d3dMesh.vertices)
               {
                  mesh.vertices = new Vector3Df[nVertices];
                  if(IDirect3DDevice8_CreateVertexBuffer(d3dDevice, sizeof(Vector3Df) * nVertices,
                     d3dSystem.usage, 0, D3DPOOL_MANAGED, &d3dMesh.vertices))
                     result = false;
               }
               if(flags.normals && !d3dMesh.normals)
               {
                  mesh.normals = new Vector3Df[nVertices];
                  if(IDirect3DDevice8_CreateVertexBuffer(d3dDevice, sizeof(Vector3Df) * nVertices,
                     d3dSystem.usage, 0, D3DPOOL_MANAGED, &d3dMesh.normals))
                     result = false;
               }
               if(flags.texCoords1 && !d3dMesh.texCoords)
               {
                  mesh.texCoords = new Pointf[nVertices];
                  if(IDirect3DDevice8_CreateVertexBuffer(d3dDevice, sizeof(Pointf) * nVertices,
                     d3dSystem.usage, 0, D3DPOOL_MANAGED, &d3dMesh.texCoords))
                     result = false;
               }
            }
         }
         else
         {
            // New number of vertices, reallocate all current and new features
            flags |= mesh.flags;

            // Same number of vertices, adding features (Leaves the other features pointers alone)
            if(flags.vertices)
            {
               if(d3dMesh.vertices)
               {
                  IDirect3DVertexBuffer8_Release(d3dMesh.vertices);
                  d3dMesh.vertices = null;
               }
               mesh.vertices = renew mesh.vertices Vector3Df[nVertices];
               if(IDirect3DDevice8_CreateVertexBuffer(d3dDevice, sizeof(Vector3Df) * nVertices,
                  d3dSystem.usage, 0, D3DPOOL_MANAGED, &d3dMesh.vertices))
                  result = false;
            }
            if(flags.normals)
            {
               if(d3dMesh.normals)
               {
                  IDirect3DVertexBuffer8_Release(d3dMesh.normals);
                  d3dMesh.normals = null;
               }
               mesh.normals = renew mesh.normals Vector3Df[nVertices];
               if(IDirect3DDevice8_CreateVertexBuffer(d3dDevice, sizeof(Vector3Df) * nVertices,
                  d3dSystem.usage, 0, D3DPOOL_MANAGED, &d3dMesh.normals))
                  result = false;
            }
            if(flags.texCoords1)
            {
               if(d3dMesh.texCoords)
               {
                  IDirect3DVertexBuffer8_Release(d3dMesh.texCoords);
                  d3dMesh.texCoords = null;
               }
               mesh.texCoords = renew mesh.texCoords Pointf[nVertices];
               if(IDirect3DDevice8_CreateVertexBuffer(d3dDevice, sizeof(Pointf) * nVertices,
                  d3dSystem.usage, 0, D3DPOOL_MANAGED, &d3dMesh.texCoords))
                  result = false;
            }
         }
      }
      return result;
   }

   void UnlockMesh(DisplaySystem displaySystem, Mesh mesh, MeshFeatures flags)
   {
      D3D8Mesh d3dMesh = mesh.data;
      if(!flags) flags = mesh.flags;

      if(flags.vertices && mesh.vertices)
      {
         Vector3Df * vertices;
         if(!IDirect3DVertexBuffer8_Lock(d3dMesh.vertices, 0, 0, (byte **) &vertices, 0))
         {
            memcpy(vertices, mesh.vertices, mesh.nVertices * sizeof(Vector3Df));
            IDirect3DVertexBuffer8_Unlock(d3dMesh.vertices);
         }
      }
      if(flags.normals && mesh.normals)
      {
         Vector3Df * normals;
         if(!IDirect3DVertexBuffer8_Lock(d3dMesh.normals, 0, 0, (byte **) &normals, 0))
         {
            memcpy(normals, mesh.normals, mesh.nVertices * sizeof(Vector3Df));
            IDirect3DVertexBuffer8_Unlock(d3dMesh.normals);
         }
      }
      if(flags.texCoords1 && mesh.texCoords)
      {
         Pointf * texCoords;
         if(!IDirect3DVertexBuffer8_Lock(d3dMesh.texCoords, 0, 0, (byte **) &texCoords, 0))
         {
            memcpy(texCoords, mesh.texCoords, mesh.nVertices * sizeof(Pointf));
            IDirect3DVertexBuffer8_Unlock(d3dMesh.texCoords);
         }
      }
   }

   bool LockMesh(DisplaySystem displaySystem, Mesh mesh, MeshFeatures flags)
   {

      return true;
   }

   void FreeIndices(DisplaySystem displaySystem, D3D8Indices d3dIndices)
   {
      if(d3dIndices)
      {
         if(d3dIndices.buffer)
            IDirect3DIndexBuffer8_Release(d3dIndices.buffer);
         delete d3dIndices.indices;
         delete d3dIndices;
      }
   }

   void * AllocateIndices(DisplaySystem displaySystem, int nIndices, bool indices32bit)
   {
      D3D8System d3dSystem = displaySystem.driverData;
      IDirect3DDevice8 * d3dDevice = d3dSystem.d3dDevice;
      D3D8Indices d3dIndices { };
      if(d3dIndices && nIndices)
      {
         d3dIndices.indices = (void *)(indices32bit ? new uint32[nIndices] : new uint16[nIndices]);
         IDirect3DDevice8_CreateIndexBuffer(d3dDevice, (indices32bit ? sizeof(uint32) : sizeof(uint16)) * nIndices, 0, indices32bit ? D3DFMT_INDEX32 : D3DFMT_INDEX16,
            D3DPOOL_MANAGED, &d3dIndices.buffer);
         d3dIndices.nIndices = nIndices;
      }
      return d3dIndices;
   }

   void UnlockIndices(DisplaySystem displaySystem, D3D8Indices d3dIndices, bool indices32bit, int nIndices)
   {
      uint16 * indexBuffer = null;
      if(!IDirect3DIndexBuffer8_Lock(d3dIndices.buffer, 0, 0, (byte **)&indexBuffer, 0))
      {
         memcpy(indexBuffer, d3dIndices.indices, indices32bit ? sizeof(uint32) : sizeof(uint16) * d3dIndices.nIndices);
         IDirect3DIndexBuffer8_Unlock(d3dIndices.buffer);
      }
   }

   uint16 * LockIndices(DisplaySystem displaySystem, D3D8Indices d3dIndices)
   {
      return d3dIndices.indices;
   }

   void SelectMesh(Display display, Mesh mesh)
   {
      DisplaySystem displaySystem = display.displaySystem;
      D3D8System d3dSystem = displaySystem.driverData;
      IDirect3DDevice8 * d3dDevice = d3dSystem.d3dDevice;

      if(mesh && mesh.data)
      {
         int shader = 0;
         D3D8Mesh d3dMesh = mesh.data;

         IDirect3DDevice8_SetStreamSource(d3dDevice, 0, d3dMesh.vertices, sizeof(Vector3Df));
         if(d3dMesh.normals)
         {
            IDirect3DDevice8_SetStreamSource(d3dDevice, 1, d3dMesh.normals, sizeof(Vector3Df));
            shader |= 1;
         }
         else
            IDirect3DDevice8_SetStreamSource(d3dDevice, 1, null, sizeof(Vector3Df));
         if(d3dMesh.texCoords)
         {
            IDirect3DDevice8_SetStreamSource(d3dDevice, 2, d3dMesh.texCoords, sizeof(Pointf));
            shader |= 2;
         }
         else
            IDirect3DDevice8_SetStreamSource(d3dDevice, 2, null, sizeof(Pointf));

         IDirect3DDevice8_SetVertexShader(d3dDevice, d3dSystem.shaders[shader]);
      }
   }

   void DrawPrimitives(Display display, PrimitiveSingle * primitive, Mesh mesh)
   {
      DisplaySystem displaySystem = display.displaySystem;
      D3D8System d3dSystem = displaySystem.driverData;
      D3D8Display d3dDisplay = display.driverData;
      IDirect3DDevice8 * d3dDevice = d3dSystem.d3dDevice;
      if(primitiveTypes[primitive->type.primitiveType])
      {
         int numPrimitives = (primitive->type.vertexRange) ? primitive->nVertices : primitive->nIndices;
         int c;

         switch(primitive->type.primitiveType)
         {
            case lines:     numPrimitives /= 2; break;
            case triangles: numPrimitives /= 3; break;
            case triStrip:
            case triFan:
               numPrimitives -= 2;
               break;
            case lineStrip:
               numPrimitives --;
               break;
            case quads:
               numPrimitives /= 4;
               break;
         }
         if(primitive->type.vertexRange)
         {
            if(primitive->type.primitiveType == quads)
            {
               for(c = 0; c<numPrimitives; c++)
                  IDirect3DDevice8_DrawPrimitive(d3dDevice, primitiveTypes[primitive->type.primitiveType], primitive->first+c*4, 2);
            }
            else
               IDirect3DDevice8_DrawPrimitive(d3dDevice, primitiveTypes[primitive->type.primitiveType], primitive->first, numPrimitives);
         }
         else
         {
            D3D8Indices indices = primitive->data;
            IDirect3DDevice8_SetIndices(d3dDevice, indices.buffer, 0);
            if(primitive->type.primitiveType == quads)
            {
               for(c = 0; c<numPrimitives; c++)
                  IDirect3DDevice8_DrawIndexedPrimitive(d3dDevice, primitiveTypes[primitive->type.primitiveType], 0, mesh.nVertices, c*4, 2);
            }
            else
               IDirect3DDevice8_DrawIndexedPrimitive(d3dDevice, primitiveTypes[primitive->type.primitiveType], 0, mesh.nVertices, 0, numPrimitives);
         }

         if(display.display3D.material.flags.doubleSided)
         {
            IDirect3DDevice8_SetRenderState(d3dDevice, D3DRS_CULLMODE, D3DCULL_CCW);
            if(!display.display3D.material.flags.singleSideLight)
            {
               for(c = 0; c<NumberOfLights; c++)
                  if(d3dDisplay.lights[c].Type)
                     IDirect3DDevice8_SetLight(d3dDevice, c, &d3dDisplay.lightsPI[c]);
            }
            if(primitive->type.vertexRange)
            {
               if(primitive->type.primitiveType == quads)
               {
                  for(c = 0; c<numPrimitives; c++)
                     IDirect3DDevice8_DrawPrimitive(d3dDevice, primitiveTypes[primitive->type.primitiveType], primitive->first+c*4, 2);
               }
               else
                  IDirect3DDevice8_DrawPrimitive(d3dDevice, primitiveTypes[primitive->type.primitiveType], primitive->first, numPrimitives);
            }
            else
            {
               D3D8Indices indices = primitive->data;
               IDirect3DDevice8_SetIndices(d3dDevice, indices.buffer, 0);
               if(primitive->type.primitiveType == quads)
               {
                  for(c = 0; c<numPrimitives; c++)
                     IDirect3DDevice8_DrawIndexedPrimitive(d3dDevice, primitiveTypes[primitive->type.primitiveType], 0, mesh.nVertices, c*4, 2);
               }
               else
                  IDirect3DDevice8_DrawIndexedPrimitive(d3dDevice, primitiveTypes[primitive->type.primitiveType], 0, mesh.nVertices, 0, numPrimitives);
            }

            if(!display.display3D.material.flags.singleSideLight)
            {
               for(c = 0; c<NumberOfLights; c++)
                  if(d3dDisplay.lights[c].Type)
                     IDirect3DDevice8_SetLight(d3dDevice, c, &d3dDisplay.lights[c]);
            }
            IDirect3DDevice8_SetRenderState(d3dDevice, D3DRS_CULLMODE, D3DCULL_CW);
         }
      }
   }

   void PushMatrix(Display display)
   {
      D3D8Display d3dDisplay = display.driverData;
      *(d3dDisplay.worldMatrix+1) = *(d3dDisplay.worldMatrix);
      d3dDisplay.worldMatrix++;
   }

   void PopMatrix(Display display, bool setMatrix)
   {
      D3D8Display d3dDisplay = display.driverData;
      DisplaySystem displaySystem = display.displaySystem;
      D3D8System d3dSystem = displaySystem.driverData;

      d3dDisplay.worldMatrix--;
      if(setMatrix)
         SetTransformMatrix(d3dSystem.d3dDevice, d3dDisplay.worldMatrix);
   }

   void SetTransform(Display display, Matrix transMatrix, bool viewSpace, bool useCamera)
   {
      DisplaySystem displaySystem = display.displaySystem;
      D3D8System d3dSystem = displaySystem.driverData;
      Camera camera = useCamera ? display.display3D.camera : null;
      D3D8Display d3dDisplay = display.driverData;

      Matrix matrix = transMatrix, temp;

      if(viewSpace)
      {
         matrix.Scale(1.0f, 1.0f, -1.0f);
         *(d3dDisplay.worldMatrix) = matrix;
      }
      else
      {
         if(camera)
            matrix.Translate(
               - camera.cPosition.x,
               - camera.cPosition.y,
               - camera.cPosition.z);
         temp.Multiply(matrix, d3dDisplay.worldMatrix);
         *(d3dDisplay.worldMatrix) = temp;
      }

      SetTransformMatrix(d3dSystem.d3dDevice, d3dDisplay.worldMatrix);
   }

   bool Lock(Display display)
   {
      DisplaySystem displaySystem = display.displaySystem;
      D3D8System d3dSystem = displaySystem.driverData;
      D3D8Display d3dDisplay = display.driverData;

      if(d3dDisplay.backBuffer)
      {
         IDirect3DDevice8_SetRenderTarget(d3dSystem.d3dDevice, d3dDisplay.backBuffer, d3dDisplay.depthSurface);
         IDirect3DDevice8_BeginScene(d3dSystem.d3dDevice);

         d3dSystem.inScene = true;
      }
      return true;
   }

   void Unlock(Display display)
   {
      DisplaySystem displaySystem = display.displaySystem;
      D3D8System d3dSystem = displaySystem.driverData;

      if(d3dSystem.inScene)
      {
         IDirect3DDevice8_EndScene(d3dSystem.d3dDevice);
         d3dSystem.inScene = false;
      }
   }
}

#endif
