#define COBJMACROS
#define WIN32_LEAN_AND_MEAN
#define UNICODE
#define uint _uint
#define Method _Method
#define Array _Array
#define byte _byte
#define bool _bool
#define int64 _int64

#include <objbase.h>

#define __RPC_H__
#define _OLE2_H_
#define _BASETSD_H_
#define GUID_DEFINED
#define __LPGUID_DEFINED__
#define __wtypes_h__
#define __objidl_h__
#define __unknwn_h__
#define __propidl_h__

#include <wia.h>
#include <sti.h>

WINOLEAPI PropVariantClear ( PROPVARIANT * pvar );

#undef bool
#undef uint
#undef Method _Method
#undef Array _Array
#undef byte _byte
#undef int64 _int64

#if defined(ECERE_STATIC)
public import static "ecere"
#else
public import "ecere"
#endif

class MSCOM_Base { }

__on_register_module()
{
   class(MSCOM_Base).vTblSize = 0;
   delete class(MSCOM_Base)._vTbl;
}

class MSCOM_IUnknown : MSCOM_Base
{
public:
   virtual uint stdcall QueryInterface(REFIID iid, void ** ppvObj)
   {
      if(!ppvObj)
         return E_POINTER;
      if(IsEqualGUID(iid, &IID_IUnknown))
      {
         if(!_refCount) _refCount = 1;
         *ppvObj = this;
      }
      else
      {
         *ppvObj = null;
         return E_NOINTERFACE;
      }
      AddRef();
      return S_OK;
   }

   virtual uint stdcall AddRef()
   {
      return (uint)InterlockedIncrement(&_refCount);
   }

   virtual uint stdcall Release()
   {
      uint cRef = InterlockedDecrement(&_refCount);
      if(cRef == 0)
         delete this;
      return cRef;
   }
}

class WiaDataCallback : MSCOM_IUnknown
{
   uint stdcall QueryInterface(REFIID iid, void ** ppvObj)
   {
      if(!ppvObj)
         return E_POINTER;
      if(IsEqualGUID(iid, &IID_IWiaDataCallback))
      {
         *ppvObj = this;
         if(!_refCount) _refCount = 1;
         AddRef();
         return S_OK;
      }
      return MSCOM_IUnknown::QueryInterface(iid, ppvObj);
   }

   virtual uint stdcall BandedDataCallback(uint lReason, uint lStatus, uint lPercentComplete, uint lOffset, uint lLength, 
      uint lReserved, uint lResLength, byte * pbBuffer);
};

class WiaDataTransfer
{
   IWiaDataTransfer * pWiaDataTransfer;

   HRESULT idtGetBandedData(PWIA_DATA_TRANSFER_INFO pWiaDataTransInfo, WiaDataCallback wiaDataCallback)
   {
      return (HRESULT)IWiaDataTransfer_idtGetBandedData(pWiaDataTransfer, pWiaDataTransInfo, (IWiaDataCallback *)wiaDataCallback);
   }
}

class WiaPropertyStorage
{
   IWiaPropertyStorage *pWiaPropertyStorage;
   
   bool ReadLong(const PROPSPEC *pPropSpec, uint *plResult)
   {
      bool result = true;
      PROPVARIANT propVariant;
      HRESULT hr = ReadMultiple(1, pPropSpec, &propVariant);
      if(SUCCEEDED(hr))
      {
         switch(propVariant.vt)
         {
            case VT_I1: *plResult = (uint)propVariant.cVal; break;
            case VT_UI1: *plResult = (uint) propVariant.bVal; break;
            case VT_I2: *plResult = (uint) propVariant.iVal; break;
            case VT_UI2: *plResult = (uint) propVariant.uiVal; break;
            case VT_I4: *plResult = (uint) propVariant.lVal; break;
            case VT_UI4: *plResult = (uint) propVariant.ulVal; break;
            /*
            case VT_INT: *plResult = (uint) propVariant.intVal; break;
            case VT_UINT: *plResult = (uint) propVariant.uintVal; break;
            */
            case VT_R4: *plResult = (uint) (propVariant.fltVal + 0.5); break;
            case VT_R8: *plResult = (uint) (propVariant.dblVal + 0.5); break;
            default: hr = E_FAIL; result = false; break;
         }
      }
      else
         result = false;
      PropVariantClear(&propVariant);
      return result;
   }

   HRESULT WriteMultiple(ULONG cpspec, const PROPSPEC *rgpspec, const PROPVARIANT * rgpropvar,PROPID propidNameFirst)
   {
      return (HRESULT)IWiaPropertyStorage_WriteMultiple(pWiaPropertyStorage, cpspec, rgpspec, rgpropvar, propidNameFirst);
   }

   HRESULT ReadMultiple(ULONG cpspec, const PROPSPEC * rgpspec, PROPVARIANT * rgpropvar)
   {
      return (HRESULT)IWiaPropertyStorage_ReadMultiple(pWiaPropertyStorage, cpspec, rgpspec, rgpropvar);
   }

   ~WiaPropertyStorage()
   {
      if(pWiaPropertyStorage)
      {
         IWiaPropertyStorage_Release(pWiaPropertyStorage);
         pWiaPropertyStorage = null;
      }
   }
}

class ScanningProgress : Window
{  
   autoCreate = false;
   text = "Scanning in progress. Please wait.";
   borderStyle = fixed;
   size = { 300, 60 };
   ProgressBar progressBar { this, anchor = { 4, 4, 4, 4 }, range = 100 };
}

ScanningProgress scanProgress { };

bool nextPage = false;

class MyWiaDataCallback : WiaDataCallback
{
   TempFile f { };

   uint stdcall BandedDataCallback(uint lReason, uint lStatus, uint lPercentComplete, uint lOffset, uint lLength, 
      uint lReserved, uint lResLength, byte * pbBuffer)
   {
      switch(lReason)
      {
         case IT_MSG_DATA_HEADER:
         case IT_MSG_DATA:
            ((GuiApplication)__thisModule.application).Lock();
            scanProgress.progressBar.progress = lPercentComplete;
            ((GuiApplication)__thisModule.application).Unlock();
            f.Seek(lOffset, start);
            f.WriteData(pbBuffer, lLength);
            break;
         case IT_MSG_STATUS:
            ((GuiApplication)__thisModule.application).Lock();
            scanProgress.progressBar.progress = lPercentComplete;
            ((GuiApplication)__thisModule.application).Unlock();
            break;
         case IT_MSG_TERMINATION:
            break;
         case IT_MSG_NEW_PAGE:
            nextPage = true;
            break;
      }
      ((GuiApplication)__thisModule.application).Lock();
      ((GuiApplication)__thisModule.application).ProcessInput(true);
      ((GuiApplication)__thisModule.application).UpdateDisplay();
      ((GuiApplication)__thisModule.application).Unlock();

      return S_OK;
   }
}

class WiaItem
{
   IWiaItem *pWiaItem;

   HRESULT DeviceDlg(HWND hWndParent, uint lFlags, uint lIntent, int * count, void * images)
   {
      return (HRESULT)IWiaItem_DeviceDlg(pWiaItem, hWndParent, lFlags, lIntent, count, images);
   }

   property WiaPropertyStorage propertyStorage
   {
      get
      {
         WiaPropertyStorage ps { };
         HRESULT hr = IWiaItem_QueryInterface(pWiaItem, &IID_IWiaPropertyStorage, &ps.pWiaPropertyStorage);
         if(FAILED(hr))
         {
            delete ps;
            printf("Error for WiaItem::propertyStorage (IWiaItem_QueryInterface)\n");
         }
         return ps;
      }
   }

   property WiaDataTransfer dataTransfer
   {
      get
      {
         WiaDataTransfer dt { };
         HRESULT hr = IWiaItem_QueryInterface(pWiaItem, &IID_IWiaDataTransfer, &dt.pWiaDataTransfer);
         if(FAILED(hr))
         {
            delete dt;
            printf("Error for WiaItem::dataTransfer (IWiaItem_QueryInterface)\n");
         }
         return dt;
      }
   }

   ~WiaItem()
   {
      if(pWiaItem)
      {
         IWiaItem_Release(pWiaItem);
         pWiaItem = null;
      }
   }

public:
   List<Bitmap> GetBitmaps(/*File * file*/)
   {
      List<Bitmap> result = null;
      IWiaItem ** ppIWiaItem;
      int count;
      Window window = ((GuiApplication)__thisModule.application).desktop.activeChild;
      if(window) window = window.rootWindow;

      if(!DeviceDlg(window ? window.systemHandle : 0, 0, WIA_INTENT_NONE, &count, &ppIWiaItem))
      {
         // Feeder Code
         // if (!(lFlags & WIA_DEVICE_DIALOG_SINGLE_IMAGE))
         WiaPropertyStorage scannerProp = propertyStorage;
         PROPSPEC specDevType;
         uint nDevType = 0;
         specDevType.ulKind = PRSPEC_PROPID;
         specDevType.propid = WIA_DIP_DEV_TYPE;

         if(scannerProp.ReadLong(&specDevType, &nDevType) &&
            GET_STIDEVICE_TYPE(nDevType) == StiDeviceTypeScanner)
         {
            PROPSPEC specDocumentHandlingSelect;
            LONG nDocumentHandlingSelect;

            specDocumentHandlingSelect.ulKind = PRSPEC_PROPID;
            specDocumentHandlingSelect.propid = WIA_DPS_DOCUMENT_HANDLING_SELECT;

            if(scannerProp.ReadLong(&specDocumentHandlingSelect, &nDocumentHandlingSelect) &&
               nDocumentHandlingSelect & FEEDER)
            {
               PROPSPEC specPages;
               PROPVARIANT varPages;
                    
               specPages.ulKind = PRSPEC_PROPID;
               specPages.propid = WIA_DPS_PAGES;

               varPages.vt = VT_I4;
               varPages.lVal = ALL_PAGES;

               scannerProp.WriteMultiple(1, &specPages, &varPages, WIA_DPS_FIRST);
                
               PropVariantClear(&varPages);
            }
         }
         delete scannerProp;
         
         nextPage = true;
         while(nextPage)
         {
            int i = 0;
            nextPage = false;
            for(i = 0; i < count; i++)
            {
               WiaItem wiaItem { pWiaItem = ppIWiaItem[i] };
               WiaPropertyStorage wiaPropertyStorage = wiaItem.propertyStorage;
               WiaDataTransfer wiaDataTransfer = wiaItem.dataTransfer;

               if(wiaPropertyStorage && wiaDataTransfer)
               {
                  PROPSPEC specTymed;
                  PROPVARIANT varTymed;

                  specTymed.ulKind = PRSPEC_PROPID;
                  specTymed.propid = WIA_IPA_TYMED;

                  varTymed.vt = VT_I4;
                  varTymed.lVal = TYMED_CALLBACK;

                  if(!wiaPropertyStorage.WriteMultiple(1, &specTymed, &varTymed, WIA_IPA_FIRST))
                  {
                     GUID guidFormat = WiaImgFmt_BMP;
                     GUID preferredFormat;
                     String format = "bmp";
                     PROPSPEC specPreferredFormat;

                     specPreferredFormat.ulKind = PRSPEC_PROPID;
                     specPreferredFormat.propid = WIA_IPA_PREFERRED_FORMAT;

                     if(ReadPropertyGuid(wiaPropertyStorage, &specPreferredFormat, &preferredFormat))
                     {
                        if(!memcmp(&preferredFormat, &WiaImgFmt_MEMORYBMP, sizeof(preferredFormat)))
                        {
                           guidFormat = WiaImgFmt_MEMORYBMP;
                           format = "memorybmp";
                        }
                     }

                     {
                        bool suitableFormat = false;
                        PROPSPEC specFormat;
                        PROPVARIANT varFormat;

                        specFormat.ulKind = PRSPEC_PROPID;
                        specFormat.propid = WIA_IPA_FORMAT;

                        varFormat.vt = VT_CLSID;
                        varFormat.puuid = &guidFormat;

                        if(!wiaPropertyStorage.WriteMultiple(1, &specFormat, &varFormat, WIA_IPA_FIRST))
                           suitableFormat = true;
                        else
                        {
                           guidFormat = WiaImgFmt_MEMORYBMP;
                           if(!wiaPropertyStorage.WriteMultiple(1, &specFormat, &varFormat, WIA_IPA_FIRST))
                           {
                              format = "memorybmp";
                              suitableFormat = true;
                           }
                        }

                        if(suitableFormat)
                        {
                           PROPSPEC specBufferSize;
                           uint nBufferSize;
                           WIA_DATA_TRANSFER_INFO WiaDataTransferInfo = { 0 };
                           MyWiaDataCallback dataCallback { };

                           specBufferSize.ulKind = PRSPEC_PROPID;
                           specBufferSize.propid = WIA_IPA_BUFFER_SIZE;

                           if(!wiaPropertyStorage.ReadLong(&specBufferSize, &nBufferSize))
                              nBufferSize = 64 * 1024;
                           WiaDataTransferInfo.ulSize        = sizeof(WIA_DATA_TRANSFER_INFO);
                           WiaDataTransferInfo.ulBufferSize  = 2 * nBufferSize;
                           WiaDataTransferInfo.bDoubleBuffer = TRUE;

                           ((GuiApplication)__thisModule).Lock();
                           scanProgress.progressBar.progress = 0;
                           scanProgress.Create();
                           ((GuiApplication)__thisModule).Unlock();
                           {
                           uint errorCode = wiaDataTransfer.idtGetBandedData(&WiaDataTransferInfo, dataCallback);
                           //if(!wiaDataTransfer.idtGetBandedData(&WiaDataTransferInfo, dataCallback))
                           if(!errorCode)
                           {
                              File source = dataCallback.f;
                              Bitmap bitmap { };
                              //source.MakeACopy("output.bmp");
                              source.Seek(0, start);
                              if(bitmap.LoadFromFile(source, format, null))
                              {
                                 /*if(file)
                                 {
                                    *file = source;
                                    dataCallback.f = null;
                                 }*/

                                 if(!result) result = { };
                                 result.Add(bitmap);
                              }
                              else
                                 delete bitmap;
                           }
                           }
                           ((GuiApplication)__thisModule).Lock();
                           scanProgress.Destroy(0);
                           ((GuiApplication)__thisModule).Unlock();

                           delete dataCallback;
                        }
                        varFormat.puuid = null;
                        PropVariantClear(&varFormat);
                     }
                  }
                  PropVariantClear(&varTymed);
               }
               delete wiaPropertyStorage;
               delete wiaDataTransfer;
               delete wiaItem;
            }
         }
      }
      return result;
   }
}

class WiaDeviceManager
{
   IWiaDevMgr *pWiaDevMgr;

   WiaDeviceManager()
   {
      if(CoCreateInstance(&CLSID_WiaDevMgr, null, /*CLSCTX_INPROC_SERVER*/CLSCTX_LOCAL_SERVER, &IID_IWiaDevMgr, (void*)&pWiaDevMgr))
         printf("Error for CoCreateInstance with CLSID_WiaDevMgr\n");
   }

   ~WiaDeviceManager()
   {
      if(pWiaDevMgr)
      {
         IWiaDevMgr_Release(pWiaDevMgr);
         pWiaDevMgr = null;
      }
   }
}

define MAX_GUID_STRING_LEN = 39;

bool ReadPropertyGuid(WiaPropertyStorage  pWiaPropertyStorage, const PROPSPEC *pPropSpec, GUID *pguidResult)
{
   bool result = false;
   PROPVARIANT propVariant;
   if(!pWiaPropertyStorage.ReadMultiple(1, pPropSpec, &propVariant))
   {
      switch (propVariant.vt)
      {
         case VT_CLSID: *pguidResult = *propVariant.puuid; result = true; break;
         case VT_BSTR: result = CLSIDFromString(propVariant.bstrVal, pguidResult) == 0; break;
         case VT_LPWSTR: result = CLSIDFromString(propVariant.pwszVal, pguidResult) == 0; break;
         case VT_LPSTR:
         {
             uint16 wszGuid[MAX_GUID_STRING_LEN];
             UTF8toUTF16Buffer(propVariant.pszVal, wszGuid, MAX_GUID_STRING_LEN-1);
             result = CLSIDFromString(wszGuid, pguidResult) == 0;
             break;
         }
      }
    }
    PropVariantClear(&propVariant);
    return result;
}

static bool comInited = false;

bool InitCOM()
{
   if(!comInited && CoInitialize(null) == 0)
      comInited = true;
   return comInited;
}

void TerminateCOM()
{
   if(comInited)
   {
      CoUninitialize();
      comInited = false;
   }
}

WiaItem GetScanner(bool alwaysAsk)
{
   WiaItem result = null;
   if(InitCOM())
   {
      WiaDeviceManager devMan { };
      IWiaItem *pItemRoot;
      Window window = ((GuiApplication)__thisModule.application).desktop.activeChild;
      if(window) window = window.rootWindow;
      if(!IWiaDevMgr_SelectDeviceDlg(devMan.pWiaDevMgr, window ? window.systemHandle : 0,
         StiDeviceTypeDefault, alwaysAsk ? WIA_SELECT_DEVICE_NODEFAULT : 0, 0, &pItemRoot))
      {
         result = { pWiaItem = pItemRoot };
      }
      delete devMan;
   }
   return result;
}
