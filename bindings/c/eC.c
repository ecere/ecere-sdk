#include "eC.h"

void (*CheckConsistency)(void);
void (*CheckMemory)(void);
DesignerBase (*GetActiveDesigner)(void);
Platform (*GetRuntimePlatform)(void);
void (*InitializeDataTypes)(Module module);
void (*InitializeDataTypes1)(Module module);
bool (*LocateModule)(const char *name, const char *fileName);
void (*Print)(Class * class_object, void * object, ...);
int (*PrintBuf)(char *buffer, int maxLen, Class * class_object, const void * object, ...);
void (*PrintLn)(Class * class_object, const void * object, ...);
int (*PrintLnBuf)(char *buffer, int maxLen, Class * class_object, const void * object, ...);
char *(*PrintLnString)(Class * class_object, const void * object, ...);
int (*PrintStdArgsToBuffer)(char *buffer, int maxLen, Class * class_object, const void * object, va_list args);
char *(*PrintString)(Class * class_object, const void * object, ...);
void (*SetActiveDesigner)(DesignerBase designer);
int64 (*_strtoi64)(const char *string, const char **endString, int base);
uint64 (*_strtoui64)(const char *string, const char **endString, int base);
uint (*log2i)(uint number);
void (*memswap)(byte *a, byte *b, uint size);
uint (*pow2i)(uint number);
void (*queryMemInfo)(char *string);
void (*ChangeCh)(char *string, char ch1, char ch2);
void (*ChangeChars)(char *string, const char *chars, char alt);
char *(*ChangeExtension)(const char *string, const char *ext, char *output);
char *(*CopyString)(const char *string);
double (*FloatFromString)(const char *string);
int64 (*GetCurrentThreadID)(void);
char *(*GetExtension)(const char *string, char *output);
uint (*GetHexValue)(char **buffer);
char *(*GetLastDirectory)(const char *string, char *output);
bool (*GetString)(char **buffer, char *string, int max);
int (*GetValue)(char **buffer);
int (*ISO8859_1toUTF8)(const char *source, char *dest, int max);
bool (*IsPathInsideOf)(const char *path, const char *of);
char *(*MakePathRelative)(const char *path, const char *to, char *destination);
char *(*PathCat)(char *string, const char *addedPath);
char *(*PathCatSlash)(char *string, const char *addedPath);
void (*PrintBigSize)(char *string, double size, int prec);
void (*PrintSize)(char *string, uint size, int prec);
char *(*RSearchString)(const char *buffer, const char *subStr, int maxLen, bool matchCase, bool matchWord);
void (*RepeatCh)(char *string, int count, char ch);
char *(*SearchString)(const char *buffer, int start, const char *subStr, bool matchCase, bool matchWord);
bool (*SplitArchivePath)(const char *fileName, char *archiveName, const char **archiveFile);
char *(*SplitDirectory)(const char *string, char *part, char *rest);
bool (*StripExtension)(char *string);
char *(*StripLastDirectory)(const char *string, char *output);
char *(*StripQuotes)(const char *string, char *output);
int (*Tokenize)(char *string, int maxTokens, char *tokens[], BackSlashEscaping esc);
int (*TokenizeWith)(char *string, int maxTokens, char *tokens[], const char *tokenizers, bool escapeBackSlashes);
char *(*TrimLSpaces)(const char *string, char *output);
char *(*TrimRSpaces)(const char *string, char *output);
char *(*UTF16toUTF8)(const uint16 *source);
int (*UTF16toUTF8Buffer)(const uint16 *source, char *dest, int max);
int (*UTF32toUTF8Len)(const unichar *source, int count, char *dest, int max);
unichar (*UTF8GetChar)(const char *string, int *numBytes);
bool (*UTF8Validate)(const char *source);
uint16 *(*UTF8toUTF16)(const char *source, int *wordCount);
int (*UTF8toUTF16Buffer)(const char *source, uint16 *dest, int max);
void (*strcatf)(char *string, const char *format, ...);

Class * class_Application;
Class * class_String;
Class * class_int;
Class * class_double;
Class * class_float;
Class * class_char;
Class * class_int64;
Class * class_short;
Class * class_uint16;
Class * class_uint;
Class * class_uint64;
Class * class_byte;

Class * class_class;

Method * method_class_onDisplay;
Method * method_class_onCompare;
Method * method_class_onCopy;
Method * method_class_onFree;
Method * method_class_onGetString;
Method * method_class_onGetDataFromString;
Method * method_class_onEdit;
Method * method_class_onSerialize;
Method * method_class_onUnserialize;
Method * method_class_onSaveEdit;

int onDisplay_vTblID;
int onCompare_vTblID;
int onCopy_vTblID;
int onFree_vTblID;
int onGetString_vTblID;
int onGetDataFromString_vTblID;
int onEdit_vTblID;
int onSerialize_vTblID;
int onUnserialize_vTblID;
int onSaveEdit_vTblID;

int Application_main_vTblID;

Method * method_Application_main;

GlobalFunction * function_PrintLn;

Application eC_init(bool guiApp, int argc, char * argv[])
{
   Application app = eC_initApp(guiApp, argc, argv);
   if(app)
   {
      Module module = Module_load(app, "ecereCOM", publicAccess);
      app->_refCount++;
      if(module)
      {
         // Set up all the class_*, property, method, function pointers ...
         class_class = eC_findClass(app, "class");
         if(class_class)
         {
            method_class_onDisplay = Class_findMethod(class_class, "OnDisplay", app);
            if(method_class_onDisplay)
               onDisplay_vTblID = method_class_onDisplay->vid;
            method_class_onCompare = Class_findMethod(class_class, "OnCompare", app);
            if(method_class_onCompare)
               onCompare_vTblID = method_class_onCompare->vid;
            method_class_onCopy = Class_findMethod(class_class, "OnCopy", app);
            if(method_class_onCopy)
               onCopy_vTblID = method_class_onCopy->vid;
            method_class_onFree = Class_findMethod(class_class, "OnFree", app);
            if(method_class_onFree)
               onFree_vTblID = method_class_onFree->vid;
            method_class_onGetString = Class_findMethod(class_class, "OnGetString", app);
            if(method_class_onGetString)
               onGetString_vTblID = method_class_onGetString->vid;
            method_class_onGetDataFromString = Class_findMethod(class_class, "OnGetDataFromString", app);
            if(method_class_onGetDataFromString)
               onGetDataFromString_vTblID = method_class_onGetDataFromString->vid;
            method_class_onEdit = Class_findMethod(class_class, "OnEdit", app);
            if(method_class_onEdit)
               onEdit_vTblID = method_class_onEdit->vid;
            method_class_onSerialize = Class_findMethod(class_class, "OnSerialize", app);
            if(method_class_onSerialize)
               onSerialize_vTblID = method_class_onSerialize->vid;
            method_class_onUnserialize = Class_findMethod(class_class, "OnUnserialize", app);
            if(method_class_onUnserialize)
               onUnserialize_vTblID = method_class_onUnserialize->vid;
            method_class_onSaveEdit = Class_findMethod(class_class, "OnSaveEdit", app);
            if(method_class_onSaveEdit)
               onSaveEdit_vTblID = method_class_onSaveEdit->vid;
         }

         class_String = eC_findClass(app, "String");
         class_int = eC_findClass(app, "int");
         class_double = eC_findClass(app, "double");
         class_float = eC_findClass(app, "float");
         class_char = eC_findClass(app, "char");
         class_int64 = eC_findClass(app, "int64");
         class_short = eC_findClass(app, "short");
         class_uint16 = eC_findClass(app, "uint16");
         class_uint = eC_findClass(app, "uint");
         class_uint64 = eC_findClass(app, "uint64");
         class_byte = eC_findClass(app, "byte");

         class_Application = eC_findClass(app, "Application");
         if(class_Application)
         {
            method_Application_main = Class_findMethod(class_Application, "Main", app);
            if(method_Application_main)
               Application_main_vTblID = method_Application_main->vid;
         }

         function_PrintLn = eC_findFunction(app, "PrintLn");
         if(function_PrintLn)
            PrintLn = (void *)function_PrintLn->function;
      }
   }
   return app;
}
