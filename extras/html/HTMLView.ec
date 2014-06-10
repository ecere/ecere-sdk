import "ecere"
import "lines"
import "htmlParser"

enum BlockType
{
   HTML,
   TEXT = 1,
   IMAGE,
   BR,
   BODY,
   FONT,
   CENTER,
   TABLE,
   TR,
   TD,
   ANCHOR,
   INPUT,
   FORM,
   TITLE,
   HEAD
};

define LEFT_MARGIN = 10;
define RIGHT_MARGIN = 10;
define TOP_MARGIN = 10;
define BOTTOM_MARGIN = 10;

enum VerticalAlignment { middle, top, bottom };

enum HorizontalAlignment { none, left, middle, right };

define CELL_SPACING = 0;

class RenderFlags { bool lineW:1,width:1,render:1,minW:1; };

enum InputType { text, submit, checkbox, radio, hidden };

class ImageEntry : struct
{
   ImageEntry prev, next;
   uint size;
   char * src;
   OldList bitmapPtrs;
   Bitmap bitmap;
   bool missing;
   char * referer;

   ~ImageEntry()
   {
      delete bitmap;
      delete referer;
      delete src;
      bitmapPtrs.Free(null);
   }
};

class FontEntry : struct
{
   FontEntry prev, next;
   char * face;
   float size;
   uint attribs;
   Font font;

   ~FontEntry()
   {
      delete face;
   }
};

class RequestLink : OldLink
{
   bool processed;
}

class AlignedObject : struct
{
   AlignedObject prev, next;
   int w;
   int untilY;
};

// Temporary solution
static HTMLView browserWindow;

class ObjectThread : Thread
{
   bool objectThreadDead;
   bool objectThreadTerminate;
   Semaphore objectThreadSemaphore {};

   uint Main()
   {
      objectThreadDead = false;
      for(;!objectThreadTerminate;)
      {
         if(objectRequests.first)
         {
            RequestLink request;

            //((GuiApplication)__thisModule).Lock();

            for(;!objectThreadTerminate;)
            {
               OldLink bitmapPtr;
               File file;
               ImageEntry entry;
               char path[MAX_LOCATION], referer[MAX_LOCATION];

               objectsMutex.Wait();
               for(request = objectRequests.first; request && request.processed; request = (RequestLink)request.next);

               if(request)
                  request.processed = true;
               objectsMutex.Release();
               if(!request) break;

               entry = request.data;

               strcpy(path, entry.src);
               //strcpy(referer, browserWindow.location ? browserWindow.location : "");
               strcpy(referer, entry.referer); //browserWindow.location ? browserWindow.location : "");

               //((GuiApplication)__thisModule).Unlock();

               if(strstr(path, "http://") == path)
               {
                  HTTPFile httpFile {};
                  file = httpFile;
                  incref file;
                  //printf("Opening URL\n");

                  //((GuiApplication)__thisModule).PauseNetworkEvents();
                  if(httpFile.OpenURL(path, referer, null))
                  {
                     char extension[MAX_EXTENSION];
                     entry.bitmap = Bitmap { alphaBlend = true };
                     //printf("Loading File\n");
                     entry.bitmap.LoadFromFile(file, GetExtension(path, extension), null);
                     //printf("Done\n");
                  }
                  else
                     entry.missing = true;
                  //((GuiApplication)__thisModule).ResumeNetworkEvents();
               }
               else
               {
                  file = FileOpen(path, read);
                  if(!file)
                     entry.missing = true;
                  else
                  {
                     char extension[MAX_EXTENSION];
                     entry.bitmap = Bitmap { alphaBlend = true };
                     entry.bitmap.LoadFromFile(file, GetExtension(path, extension), null);
                     incref file;
                  }
               }
               delete file;

               objectsMutex.Wait();
               objectRequests.Remove(request);
               delete request;
               objectsMutex.Release();

               ((GuiApplication)__thisModule).Lock();
               if(!objectThreadTerminate)
               {
                  Display display;
                  Window rootWindow = browserWindow.rootWindow;
                  if(rootWindow.is3D)
                     display = rootWindow.parent.display;
                  else
                     display = rootWindow.display;

                  if(display)
                  {
                     display.Lock(true);
                     entry.bitmap.MakeDD(browserWindow.displaySystem);
                     if(entry.bitmap && entry.bitmap.alphaBlend)
                     {
                        entry.bitmap.Convert(null, pixelFormat888, null);
                        // entry.bitmap.displaySystem = displaySystem;
                     }

                     for(bitmapPtr = entry.bitmapPtrs.first; bitmapPtr; bitmapPtr = bitmapPtr.next)
                     {
                        *((Bitmap*) bitmapPtr.data) = entry.bitmap;
                     }
                     browserWindow.ComputeMinSizes();
                     browserWindow.ComputeSizes();
                     browserWindow.PositionForms();
                     browserWindow.Update(null);

                     // ((GuiApplication)__thisModule).UpdateDisplay();
                     display.Unlock();
                  }

                  // TRIED MOVING THIS HERE BECAUSE OF printf("bug") in GuiApplication if(window.display.current)
                  ((GuiApplication)__thisModule).UpdateDisplay();
               }
               ((GuiApplication)__thisModule).Unlock();
            }
            //((GuiApplication)__thisModule).Unlock();
         }
         else
         {
            //printf("Waiting for Object Thread Semaphore\n");
            objectThreadSemaphore.Wait();
         }
      }
      objectThreadDead = true;
      return 0;
   }
}

static ObjectThread objectThread1 { };
static ObjectThread objectThread2 { };
static ObjectThread objectThread3 { };
static ObjectThread objectThread4 { };
static Mutex objectsMutex {};
static OldList imageCache;
/*static */OldList fontCache;

static OldList objectRequests;

/*static void WriteBlock(File f, Block block)
{
   static int indent = 0;
   Block child;
   int c;

   for(c = 0; c<indent; c++)
      f.Printf("   ");

   switch(block.type)
   {
      case TEXT:
         f.Printf("Text: %s\n", block.text);
         break;
      case IMAGE:
         f.Printf("Image: %d %d %s\n", block.w, block.h, block.src);
         break;
      case BR:
         f.Printf("Br\n");
         break;
      case BODY:
         f.Printf("Body\n");
         break;
      case ANCHOR:
         f.Printf("Anchor: %s\n", block.src);
         break;
      case FONT:
         f.Printf("Font: %s, %d\n", block.face, block.size);
         break;
      case CENTER:
         f.Printf("Center\n");
         break;
      case TABLE:
         f.Printf("Table\n");
         break;
      case TR:
         f.Printf("Tr\n");
         break;
      case TD:
         f.Printf("Td\n");
         break;
   }

   for(child = block.subBlocks.first; child; child = child.next)
   {
      indent ++;
      WriteBlock(f, child);
      indent --;
   }
}*/

static void ComputeImageSize(Block block)
{
   Block child;

   if(block.type == IMAGE)
   {
      if(block.width)
         block.w = block.width;
      else
         block.w = block.bitmap ? block.bitmap.width : 0;

      if(block.height)
         block.h = block.height;
      else
         block.h = block.bitmap ? block.bitmap.height : 0;
   }
   for(child = block.subBlocks.first; child; child = child.next)
      ComputeImageSize(child);
}

// Resources Cache
Window sharedWindow
{
   visible = false;

   bool OnLoadGraphics()
   {
      ImageEntry entry;
      FontEntry fEntry;
      for(entry = imageCache.first; entry; entry = entry.next)
      {
         entry.bitmap.MakeDD(displaySystem);
         if(entry.bitmap && entry.bitmap.alphaBlend)
         {
            entry.bitmap.Convert(null, pixelFormat888, null);
            // entry.bitmap.displaySystem = displaySystem;
         }
      }
      for(fEntry = fontCache.first; fEntry; fEntry = fEntry.next)
      {
         if(!fEntry.font)
            fEntry.font = displaySystem.LoadFont(fEntry.face, fEntry.size, fEntry.attribs);
      }
      return true;
   }

   void OnUnloadGraphics()
   {
      ImageEntry entry;
      FontEntry fontEntry;
      while((entry = imageCache.first))
      {
         imageCache.Remove(entry);
         delete entry;
      }
      while((fontEntry = fontCache.first))
      {
         displaySystem.UnloadFont(fontEntry.font);
         fontCache.Remove(fontEntry);
         delete fontEntry;
      }
   }
};

class HTMLView : Window
{
   HTMLFile html {};
   BitmapResource missing { "<:ecere>emblems/unreadable.png", window = sharedWindow /*this*/ };
   char * location;
   Block overLink, clickedLink;
   Block overBlock;
   int overPos;

   void ComputeMinSizes()
   {
      if(html.body)
      {
         ComputeImageSize(html.body);

         // Pre compute some stuff
         {
            Block block = html.body;
            int textPos = 0;
            int centered = 0;

            Surface surface = display.GetSurface(0,0,null);
            if(surface)
            {
               surface.TextFont(html.defaultFont.font.font);

               while(block)
               {
                  Block nextBlock;
                  int nextTextPos;
                  int w;
                  ComputeLine(surface, block, textPos, &nextBlock, &nextTextPos, &centered, &w, MAXINT, 0, RenderFlags { minW = true }, 0, null, null, null, true, 0, LEFT_MARGIN);
                  block = nextBlock;
                  textPos = nextTextPos;
               }
               delete surface;
            }
         }
      }
   }

   void Clear(Block block)
   {
      Block b;

      if(block.type != TABLE && block.type != IMAGE)
      {
         block.width = 0;
         block.height = 0;
      }
      if(block.type == TABLE)
      {
         block.columns.Free(null);
      }
      if(block.type != IMAGE)
      {
         block.w = 0;
         block.h = 0;
         block.lineW = 0;
         block.minW = 0;
         block.rowSpan = block.span = 1;
      }

      for(b = block.subBlocks.first; b; b = b.next)
      {
         Clear(b);
      }
   }
   void ComputeSizes()
   {
      int width = clientSize.w;
      int height = clientSize.h;
      Block block = html.body;
      int totalWidth = 0, totalHeight = 0;
      int y = TOP_MARGIN;
      int textPos = 0;
      int centered = 0;
      Surface surface = display.GetSurface(0,0,null);

      if(!initSize.w)
         width = parent.clientSize.w;
      if(!initSize.h)
         height = parent.clientSize.h;

      if(surface)
      {
         int maxH = height - BOTTOM_MARGIN;

         if(html.defaultFont.font)
            surface.TextFont(html.defaultFont.font.font);
         while(block)
         {
            Block nextBlock;
            int nextTextPos;
            int w, newH;
            int maxW = width - (LEFT_MARGIN + RIGHT_MARGIN);
            bool changeLine;

            newH = ComputeLine(surface, block, textPos, &nextBlock, &nextTextPos, &centered, &w, maxW, maxH - y, RenderFlags { lineW = true, width = true }, 0, null, null, &changeLine, true, y, LEFT_MARGIN);
            if(changeLine)
               y += newH;
            block = nextBlock;
            textPos = nextTextPos;

            totalWidth = Max(totalWidth, w);
         }
         delete surface;

         totalHeight = y + BOTTOM_MARGIN;
         totalWidth += LEFT_MARGIN + RIGHT_MARGIN;

         SetScrollArea(totalWidth, totalHeight, false);
         SetScrollArea(totalWidth, totalHeight, false);
      }

      if(!initSize.w || !initSize.h)
         clientSize = Size {!initSize.w ? totalWidth : clientSize.w, !initSize.h ? totalHeight : clientSize.h };
   }

   void CreateForms(Block block)
   {
      Block child;

      if(block.type == INPUT)
      {
         switch(block.inputType)
         {
            case submit:
               block.window = Button { this, text = block.value, position = Point { 10, 50 }, id = (int64)block, NotifyClicked = ButtonClicked, isDefault = true };
               if(block.size)
                  block.window.size = { w = (int)(block.size * 8) };
               if(block.src)
               {
                  ((Button)block.window).bitmap = { block.src };
                  ((Button)block.window).bevel = false;
               }
               eInstance_IncRef(block.window);
               block.window.Create();
               block.window.cursor = ((GuiApplication)__thisModule).GetCursor(arrow);
               //if(!html.defaultButton) html.defaultButton = block.window;
               break;
            case checkbox:
               block.window = Button { this, isCheckbox = true, position = Point { 10, 100 }, id = (int64)block, NotifyClicked = ButtonClicked };
               eInstance_IncRef(block.window);
               block.window.Create();
               block.window.cursor = ((GuiApplication)__thisModule).GetCursor(arrow);
               break;
            case radio:
               block.window = Button { this, isRadio = true, position = Point { 10, 100 }, id = (int64)block, NotifyClicked = ButtonClicked };
               eInstance_IncRef(block.window);
               block.window.Create();
               block.window.cursor = ((GuiApplication)__thisModule).GetCursor(arrow);
               break;
            case text:
               block.window = EditBox { this, contents = block.value, size = { w = (int)(block.size * 8) }, position = Point { 10, 20 }, id = (int64)block };
               if(!block.size)
               {
                  ((EditBox)block.window).size.w = block.parent.width;
               }
               eInstance_IncRef(block.window);
               block.window.Create();
               break;
         }
         /*if(!activeChild && block.window)
            block.window.Activate();*/
      }

      for(child = block.subBlocks.last; child; child = child.prev)
         CreateForms(child);
   }

   void LoadGraphics(Block block, void **previous)
   {
      Block child;

      if(block.src && (block.type == IMAGE || block.type == TD || block.type == TABLE))
      {
         char path[MAX_LOCATION];
         ImageEntry entry = null;

         strcpy(path, location ? location : "");
         if(location && path[strlen(path)-1] != '/')
            PathCat(path, "..");
         if(block.src[0] == '/' && block.src[1] == '/')
         {
            strcpy(path, "http:");
            strcat(path, block.src);
         }
         else
            PathCat(path, block.src);

         if(!strstr(path, "File://"))
         {
            for(entry = imageCache.first; entry; entry = entry.next)
               if(!strcmp(entry.src, path))
                  break;
         }

         if(!entry)
         {
            entry = ImageEntry { src = CopyString(path), referer = CopyString(location) };
            imageCache.Add(entry);
         }

         block.imageEntry = entry;
         block.entryPtr = OldLink { data = &block.bitmap };
         entry.bitmapPtrs.Add(block.entryPtr);

         if(entry.bitmap)
            block.bitmap = entry.bitmap;
         else
         {
            if(strstr(path, "http://") == path || strstr(path, "https://") == path)
            {
               RequestLink request;
               objectsMutex.Wait();
               for(request = objectRequests.first; request; request = (RequestLink)request.next)
               {
                  if(request.data == entry)
                     break;
               }
               if(!request)
               {
                  request = RequestLink { data = entry };
                  objectRequests.Insert(*previous, request);
                  *previous = request;
                  objectThread1.objectThreadSemaphore.Release();
                  objectThread2.objectThreadSemaphore.Release();
                  objectThread3.objectThreadSemaphore.Release();
                  objectThread4.objectThreadSemaphore.Release();
               }
               else if(*previous != request)
               {
                  objectRequests.Move(request, *previous);
                  *previous = request;
               }
               objectsMutex.Release();
            }
            else
            {
               // ADDED THIS TO LOAD LOCAL FILES RIGHT HERE...
               OldLink bitmapPtr;
               File file = FileOpen(path, read);
               if(!file)
                  entry.missing = true;
               else
               {
                  char extension[MAX_EXTENSION];
                  entry.bitmap = Bitmap { alphaBlend = true };
                  entry.bitmap.LoadFromFile(file, GetExtension(path, extension), null);
                  display.Lock(false);
                  entry.bitmap.MakeDD(displaySystem);
                  display.Unlock();
               }
               delete file;
               for(bitmapPtr = entry.bitmapPtrs.first; bitmapPtr; bitmapPtr = bitmapPtr.next)
               {
                  *((Bitmap*) bitmapPtr.data) = entry.bitmap;
               }
               block.bitmap = entry.bitmap;
            }
         }
         block.font = block.parent.font;
         block.textColor = block.parent.textColor;
      }
      else if(block.type == FONT || block.type == ANCHOR)
      {
         FontEntry entry;
         for(entry = fontCache.first; entry; entry = entry.next)
         {
            if(!strcmpi(entry.face, block.face) &&
               entry.size == block.size &&
               entry.attribs == block.attribs)
            {
               break;
            }
         }
         if(!entry)
         {
            display.Lock(false);
            entry = FontEntry { font = displaySystem.LoadFont(block.face, block.size, block.attribs), size = block.size, attribs = block.attribs, face = CopyString(block.face) };
            fontCache.Add(entry);
            display.Unlock();
         }

         if(entry)
            block.font = entry;
      }
      else if(block.parent)
      {
         block.font = block.parent.font;
         block.textColor = block.parent.textColor;
      }
      else
      {
         block.textColor = black;
      }

      for(child = block.subBlocks.first; child; child = child.next)
         LoadGraphics(child, previous);
   }

   void NormalizeSelection(Block * startBlock, int * startSel, Block * endBlock, int * endSel)
   {
      bool selAfter = false;
      Block b;
      for(b = selBlock; b; b = GetNextBlock(b))
      {
         if(b != selBlock && b == textBlock)
         {
            selAfter = true;
            break;
         }
      }

      if(textBlock == selBlock)
      {
         *startSel = Min(selPosition, curPosition);
         *endSel = Max(selPosition, curPosition);
         *startBlock = *endBlock = textBlock;
      }
      else if(!selAfter)
      {
         *startBlock = textBlock;
         *startSel = curPosition;
         *endSel = selPosition;
         *endBlock = selBlock;
      }
      else
      {
         *startBlock = selBlock;
         *startSel = selPosition;
         *endSel = curPosition;
         *endBlock = textBlock;
      }
   }

   void PositionForms()
   {
      Block block = html.body;
      int y = TOP_MARGIN;
      int textPos = 0;
      int centered = 0;
      int maxH = clientSize.h - BOTTOM_MARGIN;
      OldList leftObjects { };
      OldList rightObjects { };
      AlignedObject object, nextObject;

      Surface surface = display.GetSurface(0,0,null);
      if(surface)
      {
         Font font;
         if(html.defaultFont.font)
            surface.TextFont(html.defaultFont.font.font);

         font = surface.font;
         for(;block;)
         {
            Block nextBlock;
            int nextTextPos;
            int w, newH;
            int left, right;
            int x, maxW;
            int thisLineCentered = centered;
            bool changeLine;

            left = LEFT_MARGIN;
            right = clientSize.w - RIGHT_MARGIN;

            for(object = leftObjects.last; object; object = nextObject)
            {
               nextObject = object.prev;
               if(y < object.untilY || object.next)
                  left += object.w;
               else
                  leftObjects.Delete(object);
            }
            for(object = rightObjects.last; object; object = nextObject)
            {
               nextObject = object.prev;
               if(y < object.untilY || object.next)
                  right -= object.w;
               else
                  rightObjects.Delete(object);
            }
            right = Max(left, right);
            maxW = right - left;

            newH = ComputeLine(surface, block, textPos, &nextBlock, &nextTextPos, &centered, &w, maxW, maxH - y, RenderFlags {}, y, &leftObjects, &rightObjects, &changeLine, true, 0 /*y*/, LEFT_MARGIN);

            if(thisLineCentered)
               x = Max(left,(left + right - w) / 2);
            else
               x = left;

            surface.font = font;

            PositionLine(this, surface, x - scroll.x, y - scroll.y,
               maxW, newH, block, textPos, nextBlock, nextTextPos,
               left - scroll.x, right - scroll.x);

            if(changeLine)
               y += newH;
            block = nextBlock;
            textPos = nextTextPos;
         }
         delete surface;
      }
   }

   void Open(char * location, char * firstReferer)
   {
      HTTPFile f { /*reuseConnection = false*/ };
      char referer[MAX_LOCATION] = "";
      char relocation[MAX_LOCATION];
      bool opened = false;

      strcpy(relocation, location);

      // PrintLn("\n\n\nOpening new location: ", location, "\n");

      if(strstr(location, "http://") != location && strstr(location, "https://") != location)
      {
         if(!FileExists(location))
         {
            strcpy(relocation, "http://");
            strcat(relocation, location);
         }
         else
         {
            delete f;
            f = (HTTPFile)FileOpen(location, read);
            if(f)
               opened = true;
         }
      }
      clickedLink = null;
      overLink = null;
      overBlock = null;

      if(firstReferer)
         strcpy(referer, firstReferer);

      delete html;
      html = HTMLFile {};

      SetScrollArea(0,0,0);
      Update(null);

      while(!opened)
      {
         char path[MAX_LOCATION];

         if(this.location)
            delete this.location;
         this.location = CopyString(relocation);
         fileName = this.location;
         ((GuiApplication)__thisModule).UpdateDisplay();

         if(!(opened = f.OpenURL(this.location, referer, relocation)) && !strcmp(this.location, relocation))
            break;

         if(!opened)
         {
            //printf("Relocated to %s\n", relocation);
         }
         strcpy(referer, this.location);

         // Fix up relocation relative paths
         strcpy(path, this.location);
         if(path[strlen(path)-1] != '/')
            PathCat(path, "..");
         if(relocation[0] == '/' && relocation[1] == '/')
         {
            strcpy(path, "http:");
            strcat(path, relocation);
         }
         else
            PathCat(path, relocation);
         strcpy(relocation, path);
      }
      if(this.location)
         delete this.location;
      this.location = CopyString(relocation);
      fileName = this.location;

      if(opened)
      {
         bool isHTTP = eClass_IsDerived(f._class, class(HTTPFile));
         void * previous = null;
         bool isImage = false;
         bool isPlain = isHTTP ? false : true;

         // Handle known types
         if(isHTTP && f.contentType)
         {
            if(strstr(f.contentType, "image/") == f.contentType)
               isImage = true;
            else if(strstr(f.contentType, "text/") == f.contentType && strnicmp(f.contentType + 5, "html", 4))
               isPlain = true;
         }
         else
         {
            const String imageExt[] = { "jpg", "jpeg", "bmp", "pcx", "png", "gif" };
            const String htmlExt[] = { "html", "htm", "php" };
            const String textExt[] = { "c", "h", "ec", "eh", "epj", "cpp", "cxx", "cc", "hpp", "hxx", "hh", "m", "java", "cs", "py", "Makefile", "mk", "cf" };
            char ext[MAX_EXTENSION];
            int i;
            GetExtension(fileName, ext);
            for(i = 0; i < sizeof(imageExt) / sizeof(imageExt[0]); i++)
               if(!strcmpi(ext, imageExt[i]))
               {
                  isImage = true;
                  break;
               }

            for(i = 0; i < sizeof(htmlExt) / sizeof(htmlExt[0]); i++)
               if(!strcmpi(ext, htmlExt[i]))
               {
                  isPlain = false;
                  break;
               }

            for(i = 0; i < sizeof(textExt) / sizeof(textExt[0]); i++)
               if(!strcmpi(ext, textExt[i]))
               {
                  isPlain = true;
                  break;
               }
         }

         if(isImage)
         {
            Block subBlock;
            html.body = HTMLFile::AddBlock(html.block, BODY);

            subBlock = HTMLFile::AddBlock(html.body, IMAGE);
            subBlock.valign = bottom;
            subBlock.halign = middle;
            subBlock.src = CopyString(fileName);
            html.defaultFont.type = FONT;
            html.defaultFont.face = CopyString("Times New Roman");
         }
         else if(isPlain)
         {
            uint size;
            TempFile tmp { };
            Block subBlock;
            char * text;
            int len;
            String cd = eClass_IsDerived(f._class, class(HTTPFile)) ? f.contentDisposition : null;

            String tmpPath = PrintString("File://", (uintptr)tmp);
            f.CopyTo(tmpPath);
            size = tmp.GetSize();
            tmp.Seek(0, start);

            html.defaultFont.type = FONT;
            html.defaultFont.face = CopyString("Courier New");

            if(cd)
            {
               char fn[MAX_LOCATION];
               while(GetKeyWordEx(&cd, fn, sizeof(fn), true, false))
               {
                  if(!strcmp(fn, "filename") && GetKeyWordEx(&cd, fn, sizeof(fn), true, true))
                  {
                     html.titleBlock = HTMLFile::AddBlock(html.block, TITLE);
                     subBlock = HTMLFile::AddBlock(html.titleBlock, TEXT);
                     subBlock.text = CopyString(fn);
                     subBlock.textLen = strlen(fn);
                  }
               }
            }

            html.body = HTMLFile::AddBlock(html.block, BODY);
            html.block = html.body;

            text = new char[size + 1];
            len = tmp.Read(text, 1, size);
            text[len] = 0;

            {
               int c;
               char ch;
               int start = 0;
               Block textBlock = HTMLFile::AddBlock(html.block, TEXT);

               for(c = 0; ; c++)
               {
                  ch = text[c];
                  if(ch == '\n' || ch == '\r' || !ch)
                  {
                     int len = c - start;
                     textBlock.text = renew textBlock.text char[textBlock.textLen + 1 + len];
                     memmove(textBlock.text + len, textBlock.text, textBlock.textLen + 1);
                     memcpy(textBlock.text, text + start, len);
                     textBlock.textLen += len;
                     if(!ch) break;
                     {
                        Block block { type = BR, parent = textBlock.parent };
                        Block newBlock { type = TEXT, parent = textBlock.parent };

                        textBlock.parent.subBlocks.Insert(textBlock, block);
                        textBlock.parent.subBlocks.Insert(block, newBlock);

                        newBlock.textLen = 0;
                        newBlock.text = new char[1];
                        newBlock.text[0] = 0;

                        textBlock = newBlock;
                     }
                     if(ch == '\r' && text[c+1] == '\n') c++;
                     start = c + 1;
                  }
               }

               html.block = html.block.parent;
               delete text;
            }
            delete tmp;
            delete tmpPath;

         }
         else
         {
            html.Parse(f);
            if(html.baseHRef)
            {
               delete this.location;
               this.location = CopyString(html.baseHRef);
            }
         }
         LoadGraphics(html.defaultFont, &previous);
         html.block.font = html.defaultFont.font;
         LoadGraphics(html.block, &previous);
         CreateForms(html.block);

         ComputeMinSizes();
         ComputeSizes();
         PositionForms();
         Update(null);

         /*
         {
            File f = FileOpen("debug2.txt", write);
            if(f)
            {
               WriteBlock(f, html.body);
               delete f;
            }
         }
         */

      }
      ((GuiApplication)__thisModule.application).Unlock();
      // PrintLn("At position ", f.Tell(), " for ", fileName);
      delete f;
      ((GuiApplication)__thisModule.application).Lock();
      NotifyPageOpened(master);
   }

   void OpenFile(File f, char * firstReferer)
   {
      char referer[MAX_LOCATION] = "";
      bool opened = false;

      clickedLink = null;
      overLink = null;
      overBlock = null;

      if(firstReferer)
         strcpy(referer, firstReferer);

      delete html;
      html = HTMLFile {};

      SetScrollArea(0,0,0);
      Update(null);

      opened = true;
      this.location = null;
      fileName = this.location;

      if(opened)
      {
         void * previous = null;
         html.Parse(f);
         LoadGraphics(html.defaultFont, &previous);
         html.block.font = html.defaultFont.font;
         LoadGraphics(html.block, &previous);
         CreateForms(html.block);

         ComputeMinSizes();
         ComputeSizes();
         PositionForms();
         /*
         {
            File f = FileOpen("debug2.txt", write);
            if(f)
            {
               WriteBlock(f, html.body);
               delete f;
            }
         }
         */
      }
      NotifyPageOpened(master);
   }

   bool ScrollToAnchor(Block block, const char * anchor)
   {
      bool result = false;
      if(block.type == ANCHOR && block.anchor && !strcmpi(block.anchor, anchor))
      {
         SetScrollPosition(0, block.startY);
         result = true;
      }
      else
      {
         Block subBlock;
         for(subBlock = block.subBlocks.first; subBlock; subBlock = subBlock.next)
         {
            if((result = ScrollToAnchor(subBlock, anchor)))
               break;
         }
      }
      return result;
   }

   bool GoToAnchor(const char * anchor)
   {
      return anchor ? ScrollToAnchor(html.block, anchor) : false;
   }

   virtual bool Window::NotifyPageOpened();

   void OnDestroy()
   {
      objectThread1.objectThreadTerminate = true;
      objectThread2.objectThreadTerminate = true;
      objectThread3.objectThreadTerminate = true;
      objectThread4.objectThreadTerminate = true;
      ((GuiApplication)__thisModule).Unlock();
      objectThread1.objectThreadSemaphore.Release();
      objectThread2.objectThreadSemaphore.Release();
      objectThread3.objectThreadSemaphore.Release();
      objectThread4.objectThreadSemaphore.Release();


      while(!objectThread1.objectThreadDead ||
            !objectThread2.objectThreadDead ||
            !objectThread3.objectThreadDead ||
            !objectThread4.objectThreadDead)
      {
         // ((GuiApplication)__thisModule).ProcessNetworkEvents();
         Sleep(0.01);
      }

      //objectThread.Wait();
      objectRequests.Free(null);

      ((GuiApplication)__thisModule).Lock();
   }

   bool OnCreate()
   {
      browserWindow = this;
      objectThread1.objectThreadTerminate = false;
      objectThread2.objectThreadTerminate = false;
      objectThread3.objectThreadTerminate = false;
      objectThread4.objectThreadTerminate = false;

      objectThread1.Create();
      objectThread2.Create();
      objectThread3.Create();
      objectThread4.Create();

      /*
      if(location)
      {
         location = CopyString(location);
      }
      */
      return true;
   }

   bool OnPostCreate()
   {
      if(location)
         Open(location, null);
      return true;
   }

   void OnResize(int width, int height)
   {
      if(html.body)
      {
         ComputeMinSizes();
         ComputeSizes();
         PositionForms();
      }
   }

   // For text selection
   Block textBlock, selBlock;
   int curPosition, selPosition;
   bool isSelected; // Persistent state changed by RenderLine

   void OnRedraw(Surface surface)
   {
      Block block = html.body;
      int y = TOP_MARGIN;
      int textPos = 0;
      int centered = 0;
      int maxH = clientSize.h - BOTTOM_MARGIN;
      OldList leftObjects { };
      OldList rightObjects { };
      Font font;

      AlignedObject object, nextObject;

      surface.SetBackground(html.background);
      if(html.background.a < 255)
         surface.Area(0,0,clientSize.w,clientSize.h);
      else
         surface.Clear(colorBuffer);
      if(html.defaultFont.font) // TOFIX: Null! (No font set?)
         surface.TextFont(html.defaultFont.font.font);
      surface.SetForeground(html.defaultFont.textColor);
      isSelected = false;

      for(;block;)
      {
         Block nextBlock;
         int nextTextPos;
         int w, newH;
         int left, right;
         int x, maxW;
         int thisLineCentered = centered;
         bool changeLine;

         left = LEFT_MARGIN;
         right = clientSize.w - RIGHT_MARGIN;

         for(object = leftObjects.last; object; object = nextObject)
         {
            nextObject = object.prev;
            if(y < object.untilY || object.next)
               left += object.w;
            else
               leftObjects.Delete(object);
         }
         for(object = rightObjects.last; object; object = nextObject)
         {
            nextObject = object.prev;
            if(y < object.untilY || object.next)
               right -= object.w;
            else
               rightObjects.Delete(object);
         }
         right = Max(left, right);
         maxW = right - left;

         font = surface.font;
         newH = ComputeLine(surface, block, textPos, &nextBlock, &nextTextPos, &centered, &w, maxW, maxH - y, RenderFlags {}, y, &leftObjects, &rightObjects, &changeLine, false, 0, 0);
         surface.font = font;
         if(thisLineCentered)
            x = Max(left,(left + right - w) / 2);
         else
            x = left;

         surface.TextFont(font);

         RenderLine(this, surface, x - scroll.x, y - scroll.y, maxW, newH, block, textPos, nextBlock, nextTextPos, left - scroll.x, right - scroll.x);

         if(changeLine)
            y += newH;
         block = nextBlock;
         textPos = nextTextPos;
      }
   }

   void OnVScroll(ScrollBarAction action, int position, Key key)
   {
      Update(null);
   }

   bool OnKeyHit(Key key, unichar character)
   {
      switch(key)
      {
         case shiftTab:
            CycleChildren(true, false, false, true);
            return false;
         case tab:
            CycleChildren(false, false, false, true);
            return false;
         case left: case right:
            horzScroll.OnKeyHit(key, character);
            break;
         case down: case up: case pageDown: case pageUp:
            vertScroll.OnKeyHit(key, character);
            break;
      }
      return true;
   }

   bool OnKeyDown(Key key, unichar character)
   {
      switch(key)
      {
         case ctrlHome:
         {
            vertScroll.OnKeyDown(home, character);
            horzScroll.OnKeyDown(home, character);
            break;
         }
         case ctrlEnd:
         {
            vertScroll.OnKeyDown(end, character);
            horzScroll.OnKeyDown(end, character);
            break;
         }
      }
      return true;
   }

   void OnHScroll(ScrollBarAction action, int position, Key key)
   {
      Update(null);
   }

   bool PickHTML(int pickX, int pickY, Block* pickBlock, int * pickTextPos)
   {
      bool result = false;
      Block block = html.body;
      int y = TOP_MARGIN;
      int textPos = 0;
      int centered = 0;
      int maxH = clientSize.h - BOTTOM_MARGIN;
      OldList leftObjects { };
      OldList rightObjects { };
      AlignedObject object, nextObject;

      Surface surface = display.GetSurface(0,0,null);
      if(surface)
      {
         if(html.defaultFont.font) // TOFIX: Null! (No font set?)
            surface.TextFont(html.defaultFont.font.font);
         for(;block;)
         {
            Block nextBlock;
            int nextTextPos;
            int w, newH;
            int left, right;
            int x, maxW;
            int thisLineCentered = centered;
            Font font = surface.font;
            bool changeLine;

            left = LEFT_MARGIN;
            right = clientSize.w - RIGHT_MARGIN;

            for(object = leftObjects.last; object; object = nextObject)
            {
               nextObject = object.prev;
               if(y < object.untilY || object.next)
                  left += object.w;
               else
                  leftObjects.Delete(object);
            }
            for(object = rightObjects.last; object; object = nextObject)
            {
               nextObject = object.prev;
               if(y < object.untilY || object.next)
                  right -= object.w;
               else
                  rightObjects.Delete(object);
            }
            right = Max(left, right);
            maxW = right - left;

            newH = ComputeLine(surface, block, textPos, &nextBlock, &nextTextPos, &centered, &w, maxW, maxH - y, RenderFlags {}, y, &leftObjects, &rightObjects, &changeLine, false, 0, 0);
            if(thisLineCentered)
               x = Max(left,(left + right - w) / 2);
            else
               x = left;

            surface.font = font;

            if(PickLine(this, surface, x - scroll.x, y - scroll.y,
               maxW, newH, block, textPos, nextBlock, nextTextPos,
               left - scroll.x, right - scroll.x, pickX, pickY, pickBlock, pickTextPos))
            {
               result = true;
               break;
            }

            if(changeLine)
               y += newH;

            block = nextBlock;
            textPos = nextTextPos;
         }
         delete surface;
      }

      for(object = leftObjects.last; object; object = nextObject)
      {
         nextObject = object.prev;
         leftObjects.Delete(object);
      }
      for(object = rightObjects.last; object; object = nextObject)
      {
         nextObject = object.prev;
         rightObjects.Delete(object);
      }
      return result;
   }

   bool OnMouseMove(int x, int y, Modifiers mods)
   {
      Block pickBlock = null;
      Block linkBlock = null;
      int pickTextPos = 0;

      if(!mods.isSideEffect)
      {
         PickHTML(x,y, &pickBlock, &pickTextPos);

         if(pickBlock)
         {
            for(linkBlock = pickBlock; linkBlock; linkBlock = linkBlock.parent)
            {
               if(linkBlock.type == ANCHOR)
                  break;
            }
         }
         if(linkBlock)
         {
            if(linkBlock.href && strstr(linkBlock.href, "edit://") == linkBlock.href)
               cursor = ((GuiApplication)__thisModule).GetCursor(iBeam);
            else
               cursor = ((GuiApplication)__thisModule).GetCursor(hand);
            overLink = linkBlock;
         }
         else
         {
            if(pickBlock && pickBlock.type == TEXT)
            {
               cursor = ((GuiApplication)__thisModule).GetCursor(iBeam);
            }
            else
            {
               cursor = ((GuiApplication)__thisModule).GetCursor(arrow); //null);
            }
            overLink = null;
         }
         overBlock = pickBlock;
         overPos = pickTextPos;
      }
      return true;
   }

   bool OnLeftButtonDown(int x, int y, Modifiers mods)
   {
      OnMouseMove(x, y, mods);
      if(overLink)
      {
         clickedLink = overLink;

         Capture();
      }
      return true;
   }

   virtual bool OnOpen(char * href)
   {
      char newLocation[MAX_LOCATION];

      strcpy(newLocation, location ? location : "");
      if(newLocation[strlen(newLocation)-1] != '/')
         PathCat(newLocation, "..");
      if(href[0] == '/' && href[1] == '/')
      {
         strcpy(newLocation, "http:");
         strcat(newLocation, href);
      }
      else
         PathCat(newLocation, href);

      Open(newLocation, null);
      return true;
   }

   bool OnLeftButtonUp(int x, int y, Modifiers mods)
   {
      if(clickedLink)
      {
         ReleaseCapture();
         if(clickedLink == overLink && clickedLink.href)
         {
            if(OnOpen(clickedLink.href))
               Update(null);
         }
      }
      return true;
   }

   void AddFormControls(char * location, Block block)
   {
      Block child;
      if(block.type == INPUT)
      {
         switch(block.inputType)
         {
            case radio:
               break;
            case text:
            {
               int c;
               int len;
               const char * text;

               if(location[strlen(location)-1] != '?')
               {
                  strcat(location, "&");
               }
               strcat(location, block.name);
               strcat(location, "=");

               len = strlen(location);

               text = ((EditBox)block.window).contents;

               for(c = 0; text[c]; c++)
               {
                  if(text[c] == ' ')
                     location[len++] = '+';
                  else
                  {
                     location[len++] = text[c];
                  }
               }
               location[len] = '\0';
               break;
            }
         }
      }

      for(child = block.subBlocks.first; child; child = child.next)
      {
         AddFormControls(location, child);
      }
   }

   bool ButtonClicked(Button button, int x, int y, Modifiers mods)
   {
      Block block = (Block)button.id;
      if(block.inputType == submit)
      {
         Block formBlock;

         for(formBlock = block; formBlock; formBlock = formBlock.parent)
            if(formBlock.type == FORM)
               break;

         if(formBlock && formBlock.action)
         {
            char newLocation[MAX_LOCATION];

            strcpy(newLocation, location);
            if(newLocation[strlen(newLocation)-1] != '/')
               PathCat(newLocation, "..");

            if(formBlock.action[0] == '/' && formBlock.action[1] == '/')
            {
               strcpy(newLocation, "http:");
               strcat(newLocation, formBlock.action);
            }
            else
               PathCat(newLocation, formBlock.action);
            strcat(newLocation, "?");

            if(block.name)
            {
               strcat(newLocation, block.name);
               strcat(newLocation, "=");
            }

            AddFormControls(newLocation, formBlock);

            Open(newLocation, null);
            Update(null);
         }
      }
      return true;
   }

   HTMLView()
   {
      //tabCycle = true;
      html.background = white;
   }

   ~HTMLView()
   {
      delete this.location;

      html.block.ClearEntries();
   }

   property char * location
   {
      set
      {
         if(location)
            delete location;
         location = CopyString(value);
         if(created)
            Open(location, null);
      }
      get { return location; }
   }

   property String title
   {
      get
      {
         String title = html.title;
         return title ? title : location;
      }
   }
}
