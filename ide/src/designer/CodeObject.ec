import "ide"

enum CodeObjectType { typeClass, typeData, typeMethod, typeEvent, typeProperty, typeNameSpace, typeDataType, typeEnumValue, typeDataPrivate, typeMethodPrivate, typePropertyPrivate };

// patch for GCC 4.4 bug (Can't make it static or the patch won't work)
/*static*/ int mystrlen(const char * s)
{
   return strlen(s);
}
#define strlen mystrlen

class CodeObject : struct
{
   const char * name;
   bool bold;
   CodeObjectType type;
   int indent;
   Method method;
   int overriden;
   OldList compatible;
   BitmapResource bitmap;
   ObjectInfo object;

   ClassFunction function;
   Button attachBtn, detachBtn, deleteBtn;
   bool eventsUp;

   void OnDisplay(Surface surface, int x, int y, int width, CodeEditor editor, Alignment alignment, DataDisplayFlags displayFlags)
   {
      int indent = displayFlags.dropBox ? 0 : 10;
      int textOffset;
      const char * name = object ? (object.name ? object.name : $"(unnamed)") : this.name;
      int nameLen = strlen(name);

      Bitmap icon = bitmap ? bitmap.bitmap : editor.icons[type].bitmap;

      textOffset = this.indent * indent + (icon ? (/*icon.width + 4*/ 20) : 0);
      if(overriden || object)
         surface.TextFont(editor.boldFont.font);
      else
         surface.TextFont(editor.normalFont.font);

      surface.WriteTextDots(alignment, x + textOffset, y + 2, width - textOffset, name, nameLen);
      if(icon)
         surface.Blit(icon, x + (20 - icon.width) / 2 + this.indent * indent,y + 2,0,0, icon.width, icon.height);

      if(object)
      {
         int nameW;
         char text[1024] = "";
         int len;

         strcpy(text, object.instance._class.name);
         len = strlen(text);
         surface.TextExtent(name, nameLen, &nameW, null);

         surface.TextFont(editor.normalFont.font);
         surface.WriteTextDots(left, x + textOffset + nameW + 10, y + 2, width - (x + textOffset + nameW + 10), text, len);
      }

      if(overriden == 2 /*&& codeObject.function*/)
      {
         int w, nameW;
         const char * text = function ? function.declarator.symbol.string : "";
         int len = strlen(text);
         int start;
         surface.TextExtent(name, nameLen, &nameW, null);
         surface.TextExtent(text, len, &w, null);

         start = x + textOffset + nameW + 10;

         surface.WriteTextDots(right, start, y + 2, width - start - 16, text, len);
      }
   }

   void OnFree()
   {
      OldLink compatible;

      if(function && function.declarator && function.declarator.symbol && !function.declarator.symbol.type)
         FreeClassFunction(function);
      if(deleteBtn)
      {
         deleteBtn.Destroy(0);
         delete deleteBtn;
      }
      if(detachBtn)
      {
         detachBtn.Destroy(0);
         delete detachBtn;
      }
      if(attachBtn)
      {
         attachBtn.Destroy(0);
         delete attachBtn;
      }

      while((compatible = this.compatible.first))
      {
         ClassFunction function = compatible.data;

         if(function && function.declarator && function.declarator.symbol && !function.declarator.symbol.type)
            FreeClassFunction(function);

         this.compatible.Delete(compatible);
      }
      delete this;
   }

   const char * OnGetString(char * string, void * fieldData, ObjectNotationType * onType)
   {
      return name ? name : "";
   }

   int OnCompare(CodeObject b)
   {
      int result = 0;
      if(type == typeEvent && b.type == typeMethod)
         result = eventsUp ? -1 : 1;
      else if(type == typeMethod && b.type == typeEvent)
         result = eventsUp ? 1 : -1;
      else if(name && b.name)
         result = strcmpi(name, b.name);
      else if(!name && b.name)
         result = 1;
      else if(name && !b.name)
         result = -1;
      return result;
   }
};
