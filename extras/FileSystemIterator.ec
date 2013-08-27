#ifdef BUILDING_ECERE_COM
namespace sys;
import "Array"
#else
#ifdef ECERE_STATIC
public import static "ecere"
#else
public import "ecere"
#endif
#endif

public class NormalFileSystemIterator : FileSystemIterator
{
public:
   Array<StackFrame> stack { };

   char * extensions;
   property char * extensions { set { delete extensions; if(value) extensions = CopyString(value); } }

   ~NormalFileSystemIterator()
   {
      delete extensions;
   }

   void Iterate(char * startPath)
   {
      StackFrame frame;

      if(OnInit(startPath))
      {
         frame = stack.firstIterator.data;
      }
      else
      {
         frame = StackFrame { };
         stack.Add(frame);
         frame.path = CopyString(startPath);
         frame.listing = FileListing { startPath, extensions = extensions };  // there should be a sorted = true/false 
      }

      if(iterateStartPath)
      {
         FileAttribs attribs = FileExists(startPath);
         // || attribs.isCDROM || attribs.isRemote || attribs.isRemovable || attribs.isServer || attribs.isShare || attribs.isSystem || attribs.isTemporary
         if(attribs.isDrive)
            OnVolume(startPath);
         else if(attribs.isDirectory)
            OnFolder(startPath);
         else if(attribs.isFile)
            OnFile(startPath);
      }

      while(stack.count)
      {
         if(frame.listing.Find())
         {
            char * name = frame.listing.name;
            bool isDirectory = frame.listing.stats.attribs.isDirectory;
            bool peek = frame.listing.stats.attribs.isDirectory && OnFolder(frame.listing.path);
            if(!frame.listing.stats.attribs.isDirectory)
            {
               char * path = frame.listing.path;
               OnFile(frame.listing.path);
            }
            else if(peek)
            {
               StackFrame newFrame { };
               stack.Add(newFrame);
               newFrame.path = CopyString(frame.listing.path);
               newFrame.listing = FileListing { newFrame.path, extensions = frame.listing.extensions };
               frame = newFrame;
            }
         }
         else
         {
            StackFrame parentFrame = stack.count > 1 ? stack[stack.count - 2] : null;
            OutFolder(parentFrame ? parentFrame.listing.path : startPath, !parentFrame);
            stack.lastIterator.Remove();
            if(stack.count)
               frame = stack.lastIterator.data;
            else
               frame = null;
         }
      }
   }
}

public class FileSystemIterator
{
public:
   bool iterateStartPath;

   virtual bool OnInit(char * startPath)
   {
      return false;
   }
   
   virtual bool OnFile(char * filePath)
   {
      return true;
   }

   virtual bool OnFolder(char * folderPath)
   {
      return true;
   }

   virtual bool OnVolume(char * volumePath)
   {
      return true;
   }

   virtual void OutFolder(char * folderPath, bool isRoot)
   {
   }
}

static class IteratorThread : Thread
{
   void Temp()
   {
      //listing = FileListing { dir, extensions = filter.extensions };  // there should be a sorted = true/false 
   }
}

public class StackFrame
{
   int tag;
   char * path;
   FileListing listing;

   ~StackFrame()
   {
      delete path;
      //delete listing;
   }
};

