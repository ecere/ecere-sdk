#define COBJMACROS
#define WIN32_LEAN_AND_MEAN
#define UNICODE
#define Method _Method
#define Array _Array
#define byte _byte
#define int64 _int64
#include <shlobj.h>
#undef Method
#undef Array
#undef byte
#undef int64

#ifdef ECERE_STATIC
import static "ecere"
#else
import "ecere"
#endif

bool CreateLink(char * lpszPathObj, char * lpszPathLink, char * lpszDesc)
{
    HRESULT hres;
    IShellLink* psl;

    CoInitialize(NULL);
    hres = CoCreateInstance(&CLSID_ShellLink, NULL, CLSCTX_INPROC_SERVER, &IID_IShellLink, (void *)&psl);
    if (SUCCEEDED(hres))
    {
        IPersistFile * ppf;
        uint16 pathObj[2048] = { 0 };
        uint16 desc[2048] = { 0 };

        UTF8toUTF16Buffer(lpszPathObj, pathObj, sizeof(pathObj) / sizeof(uint16));
        UTF8toUTF16Buffer(lpszDesc, desc, sizeof(desc) / sizeof(uint16));
        IShellLinkW_SetPath(psl, pathObj);
        IShellLinkW_SetDescription(psl, desc);

        //hres = IShellLinkA_QueryInterface(psl, &IID_IPersistFile, (void *)&ppf);
        hres = IShellLinkW_QueryInterface(psl, &IID_IPersistFile, (void *)&ppf);

        if(SUCCEEDED(hres))
        {
            WCHAR wsz[MAX_PATH];
            MultiByteToWideChar(CP_ACP, 0, lpszPathLink, -1, wsz, MAX_PATH);
            hres = IPersistFile_Save(ppf, wsz, TRUE);
            IPersistFile_Release(ppf);
        }
        IShellLinkW_Release(psl);
    }
    return hres == 0;
}
