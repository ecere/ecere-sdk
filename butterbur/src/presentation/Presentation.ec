public import IMPORT_STATIC "ecere"

import "DrawingManager"

private:

public class Presentation
{
   class_no_expansion;

   MultiPresentation parent;

   RenderPassFlags rdrFlags; // Compared to the flag passed to prepareDraw() for pass selection

   // TODO: Review whether we should use LinkElement here to have link in place

   bool needUpdate;
   needUpdate = true;

   //int commandsCount; //Number of draw commands this takes to draw

   virtual void calculate(Presentation topPres, PresentationManager mgr);
   virtual void prepareDraw(RenderPassFlags flags, DrawingManager dm, const void * data);

   public property MultiPresentation parent
   {
      set
      {
         if(parent != value)
         {
            incref this;
            if(parent)
            {
               if(parent.subElements.TakeOut(this))
                  _refCount--;
            }
            parent = value;
            if(value)
            {
               value.subElements.Add(this);
               incref this;
            }
            delete this;
         }
      }
      get { return parent; }
   }

   // Whenever an element is flagged for an update, all its parents should be flagged as well
   // TODO: The local data variable should probably be part of a bit collection class,
   //       which would also avoid the member vs. property confusion
   //       Cascading setting updates on parent should probably be handled more efficiently, by directly setting the bits,
   //       not invoking the property again.
   public property bool needUpdate
   {
      set
      {
         if(value && parent)
            parent.needUpdate = true;
         needUpdate = value;
      }
      get { return needUpdate; }
   }
}

public class MultiPresentation : Presentation
{
   List<Presentation> subElements { };
   bool anchored; // Use flags?

   //virtual void skipUpdate(Presentation e);

public:
   ~MultiPresentation()
   {
      Iterator<Presentation> it { subElements };
      it.Next();
      while(it.pointer)
      {
         IteratorPointer ptr = subElements.GetNext(it.pointer);
         Presentation p = it.data;
         *&p.parent = null;
         it.Remove();
         delete p;
         it.pointer = ptr;
      }
   }

   void calculate(Presentation topPres, PresentationManager mgr)
   {
      if(parent != topPres)
         anchored = parent ? parent.anchored : false;
      rdrFlags = 0;
      // TODO: Avoid looping through hierarchy by properly maintaining multi's 'needUpdate'
      for(oo : subElements)
      {
         Presentation o = oo;
         if(o.needUpdate)
         {
            o.calculate(topPres, mgr);
            o.needUpdate = false;
         }
         rdrFlags |= o.rdrFlags;
      }
   }

   void prepareDraw(RenderPassFlags flags, DrawingManager dm, const void * data)
   {
      // TODO: Support requeuing commands for entire multi hierarchy without re-iteration?
      for(o : subElements)
      {
         Presentation p = o;
         if(p.rdrFlags & flags)
            p.prepareDraw(flags, dm, data);
      }
   }
}
