public import IMPORT_STATIC "ecere"

import "DrawingManager"

private:

public class Presentation
{
   class_no_expansion;

   MultiPresentation parent;

   RenderPassFlags rdrFlags; // Compared to the flag passed to prepareDraw() for pass selection

   // TODO: Review whether we should use LinkElement here to have link in place

   bool visible;
   bool pickable;
   bool needUpdate;
   bool visibilityUpdate;
   needUpdate = true;
   visible = true;
   pickable = true;
   visibilityUpdate = true;

   //int commandsCount; //Number of draw commands this takes to draw

   virtual void calculate(Presentation topPres, PresentationManager mgr);
   virtual void prepareDraw(RenderPassFlags flags, DrawingManager dm, const void * data);
   virtual int pick(const Boxf region, int maxResults, PickResult * results, const void * data,
      const Matrix * vm, const Pointd * pm)
   {
      return 0;
   }
   public virtual void unloadGraphics(bool shutDown, PresentationManager mgr);

   public property MultiPresentation parent
   {
      set
      {
         if(parent != value)
         {
            bool isVisible = visible;
            visibilityUpdate = true;
            incref this;
            if(parent)
            {
               Presentation p = parent;
               MultiPresentation topPres = (MultiPresentation)p;

               while(topPres.parent) topPres = topPres.parent;
               while(p && *&p.visible)
                  p.visibilityUpdate = true, p = *&p.parent;
               visible = false;
               calculate(topPres, null);
               visible = isVisible;
               if(parent.subElements.TakeOut(this))
                  _refCount--;
            }
            parent = value;
            if(value)
            {
               Presentation p = parent;
               while(p && *&p.visible)
                  p.visibilityUpdate = true, p = *&p.parent;
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

   public property bool visible
   {
      set
      {
         Presentation p = parent;

         visible = value;
         needUpdate = true;
         visibilityUpdate = true;
         while(p && *&p.visible)
            p.visibilityUpdate = true, p = *&p.parent;
      }
      get { return visible; }
   }

   public property bool pickable { set { pickable = value; } get { return pickable; } }
}

public struct Boxf
{
   float left, top, right, bottom;
};

public struct PickResult
{
   Presentation presentation;
   union { GraphicalElement element; uint64 id; };
};

public class MultiPresentation : Presentation
{
   List<Presentation> subElements { };
   bool anchored; // Use flags?

   //virtual void skipUpdate(Presentation e);

public:
   property List<Presentation> subElements { get { return subElements; } }
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
      if(parent != topPres && parent && parent.anchored)
         anchored = true; // TODO: Handle re-parenting?
      rdrFlags = 0;
      // TODO: Avoid looping through hierarchy by properly maintaining multi's 'needUpdate'
      for(oo : subElements)
      {
         Presentation o = oo;
         if(o.needUpdate)
         {
            o.calculate(topPres, mgr);
            o.needUpdate = false;
            o.visibilityUpdate = false;
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
         if(p.visible && (p.rdrFlags & flags))
            p.prepareDraw(flags, dm, data);
      }
   }

   int pick(const Boxf region, int maxResults, PickResult * results, const void * data, const Matrix * vm, const Pointd * projParams)
   {
      int numResults = 0;
      Iterator<Presentation> it { subElements };
      while(it.Prev() && numResults < maxResults)
      {
         Presentation p = it.data;
         if(p.pickable && p.visible)
            numResults += p.pick(region, maxResults, results + numResults, data, vm, projParams);
      }
      return numResults;
   }

   bool pickAt(const Pointf pos, float threshold, PickResult result)
   {
      float w = Max(0.5f, threshold), h = Max(0.5f, threshold);
      Boxf region { pos.x - w, pos.y - h, pos.x + w, pos.y + h };
      if(pick(region, 1, result, null, null, null) != 0)
         return true;
      result = { };
      return false;
   }

   Array<PickResult> pickWithin(const Boxf region)
   {
      Array<PickResult> results { minAllocSize = 1024 };
      results.count = pick(region, results.minAllocSize, results.array, null, null, null);
      results.minAllocSize = 0;
      if(!results.count) delete results;
      return results;
   }

   void unloadGraphics(bool shutDown, PresentationManager mgr)
   {
      for(o : subElements)
      {
         Presentation p = o;
         p.unloadGraphics(shutDown, mgr);
      }
   }
}
