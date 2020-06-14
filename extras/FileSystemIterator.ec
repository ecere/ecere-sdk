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

// todo: move this in the appropriate extras file
#ifdef __linux__
#include <stdlib.h>
#endif
void getRealPath(const String path, String output)
{
#ifdef __WIN32__
   strcpy(output, path); // todo: a windows implementation should be possible for windows 10 which has symlinks
#else
   realpath(path, output);
#endif
}

public class NormalFileSystemIterator : FileSystemIterator
{
public:
   Array<StackFrame> stack { };

   char * extensions;
   property const char * extensions { set { delete extensions; if(value) extensions = CopyString(value); } }
   bool sorted;

   ~NormalFileSystemIterator()
   {
      delete extensions;
   }

   void Iterate(const char * startPath)
   {
      StackFrame frame;

      if(!OnInit(startPath))
         return;

      frame = StackFrame { };
      stack.Add(frame);
      frame.path = CopyString(startPath);
      frame.listing = FileListing { startPath, extensions = extensions };  // there should be a sorted = true/false

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

      if(sorted)
      {
         while(stack.count)
         {
            bool done = false;
            switch(frame.state)
            {
               case uninit:
                  while(frame.listing.Find())
                  {
                     if(frame.listing.stats.attribs.isDirectory)
                     {
                        if(!frame.dirPaths) frame.dirPaths = { };
                        frame.dirPaths.Add({ CopyString(frame.listing.path), frame.listing.stats });
                     }
                     else
                     {
                        if(!frame.filePaths) frame.filePaths = { };
                        frame.filePaths.Add({ CopyString(frame.listing.path), frame.listing.stats });
                     }
                  }
                  // frame.node = frame.dirPaths ? frame.dirPaths.root.minimum : null;
                  frame.it.container = (void*)frame.dirPaths;
                  frame.next = frame.dirPaths ? frame.it.Next() : false;
                  frame.count = frame.dirPaths ? frame.dirPaths.GetCount() : 0;
                  frame.state = dirs;
                  break;
            }
            switch(frame.state)
            {
               case dirs:
                  // if(frame.count && frame.node)
                  if(frame.next)
                  {
                     // const char * path = frame.node.key.path;
                     const char * path = frame.it.data.path;
                     bool peek = OnFolder(path);
                     // frame.node = frame.node.next;
                     frame.next = frame.it.Next();
                     if(peek)
                     {
                        StackFrame newFrame { };
                        stack.Add(newFrame);
                        newFrame.path = CopyString(path);
                        newFrame.listing = FileListing { newFrame.path, extensions = frame.listing.extensions };
                        frame = newFrame;
                     }
                     done = true;
                  }
                  else
                  {
                     // frame.node = frame.filePaths ? frame.filePaths.root.minimum : null;
                     frame.it.container = (void*)frame.filePaths;
                     frame.next = frame.filePaths ? frame.it.Next() : false;
                     frame.count = frame.filePaths ? frame.filePaths.GetCount() : 0;
                     frame.state = files;
                  }
                  break;
            }
            if(done) continue;
            switch(frame.state)
            {
               case files:
                  // if(frame.count && frame.node)
                  if(frame.next)
                  {
                     // const char * path = frame.node.key.path;
                     const char * path = frame.it.data.path;
                     OnFile(path);
                     // frame.node = frame.node.next;
                     frame.next = frame.it.Next();
                     done = true;
                  }
                  break;
            }
            if(!done)
            {
               StackFrame parentFrame = stack.count > 1 ? stack[stack.count - 2] : null;
               OutFolder(parentFrame ? parentFrame.listing.path : startPath, !parentFrame);
               stack.lastIterator.Remove();
               delete frame;
               if(stack.count)
                  frame = stack.lastIterator.data;
               else
                  frame = null;
            }
         }
      }
      else
      {
         while(stack.count)
         {
            if(frame.listing.Find())
            {
               bool peek = frame.listing.stats.attribs.isDirectory && OnFolder(frame.listing.path);
               if(!frame.listing.stats.attribs.isDirectory)
               {
                  const char * path = frame.listing.path;
                  OnFile(path);
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
               delete frame;
               if(stack.count)
                  frame = stack.lastIterator.data;
               else
                  frame = null;
            }
         }
      }
   }
}

public class FileSystemIterator
{
public:
   bool iterateStartPath;
   // bool abort;

   virtual bool OnInit(const char * startPath)
   {
      return true;
   }

   virtual bool OnFile(const char * filePath)
   {
      return true;
   }

   virtual bool OnFolder(const char * folderPath)
   {
      return true;
   }

   virtual bool OnVolume(const char * volumePath)
   {
      return true;
   }

   virtual void OutFolder(const char * folderPath, bool isRoot)
   {
   }
}
/*
static class IteratorThread : Thread
{
   void Temp()
   {
      //listing = FileListing { dir, extensions = filter.extensions };  // there should be a sorted = true/false
   }
}
*/

enum StackFrameState { uninit, dirs, files };

struct StatsAndPath
{
   const char * path;
   FileStats stats;

   int OnCompare(StatsAndPath b)
   {
      return strcmp(path, b.path);
   }
};

public class StackFrame
{
   int tag;
   char * path;
   FileListing listing;
private:
   StackFrameState state;
   // int n;
   int count;
   AVLTree<StatsAndPath> dirPaths;
   AVLTree<StatsAndPath> filePaths;
   // AVLNode<StatsAndPath> node;
   Iterator<StatsAndPath> it { };
   bool next;

   ~StackFrame()
   {
      delete path;
      //delete listing;
      delete dirPaths;
      delete filePaths;
   }
};
