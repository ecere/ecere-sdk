// Topological Sort implementation

import "LinkList"
import "Pool"

// An 'edge from' is a 'dependency on'
class TopoEdge : struct
{
   public LinkElement<TopoEdge> in, out;
   TopoNode from, to;
   bool breakable;
};

class TopoNode : struct
{
   thisclass prev, next;
   LinkList<TopoEdge, link = out> outgoing { };
   LinkList<TopoEdge, link = in> incoming { };
   int nonBreakableIncoming;
   void * data;

   void createEdge(TopoNode from, bool soft, InstancePool<TopoEdge> pool)
   {
      TopoEdge e = pool ? (TopoEdge)pool.allocate() : null;
      e.from = from, e.to = this, e.breakable = soft;

#ifdef _DEBUG
      if(from == this && !soft)
         PrintLn("bug: self-dependency");
#endif

      from.outgoing.Add(e);
      incoming.Add(e);
      if(!soft)
         nonBreakableIncoming++;
   }

   void free(InstancePool<TopoEdge> pool)
   {
      TopoEdge e;
      while((e = incoming.first))
      {
         e.from.outgoing.Remove((IteratorPointer)e);
         incoming.Remove((IteratorPointer)e);
         if(pool) pool.free(e); else delete e;
      }
      while((e = outgoing.first))
      {
         e.to.incoming.Remove((IteratorPointer)e);
         outgoing.Remove((IteratorPointer)e);
         if(!e.breakable)
            e.to.nonBreakableIncoming--;
         if(pool) pool.free(e); else delete e;
      }
   }

   ~TopoNode()
   {
      free(null);
   }
};

bool topoSort(OldList/*<TopoNode>*/ input, InstancePool<TopoEdge> edgesPool)
{
   bool result = true;
   OldList L { }; // Sorted list
   OldList S { }; // All nodes with no incoming edge
   OldList B { }; // Breakable edges
   TopoNode n, next;
   int inputCount = input.count;

   if(!inputCount) return result;

   for(n = input.first; n; n = next)
   {
      next = n.next;
      if(!n.incoming || !n.incoming.count)
      {
         input.Remove(n);
         S.Add(n);
      }
      else if(!n.nonBreakableIncoming)
      {
         input.Remove(n);
         B.Add(n);
      }
   }

   while(true)
   {
      TopoEdge e, ne;
      if((n = S.first))
      {
         S.Remove((IteratorPointer)n);

         L.Add(n);
         if(n.outgoing)
         {
            for(e = n.outgoing.first; e; e = ne)
            {
               TopoNode m = e.to;
               OldList * list;

               if(m.nonBreakableIncoming)
                  list = input;
               else
                  list = &B;

#ifdef _DEBUG
               if(!list->count)
                  PrintLn("TopoSort: !!! Something's wrong !!!");
#endif
               ne = e.out.next;

               if(!e.breakable)
               {
#ifdef _DEBUG
                  if(!m.nonBreakableIncoming)
                     printf("TopoSort: Bug");
#endif
                  m.nonBreakableIncoming--;
               }

               n.outgoing.Remove((IteratorPointer)e);
               m.incoming.Remove((IteratorPointer)e);
               delete e;

               if(!m.incoming.count)
               {
                  list->Remove(m);
                  S.Add(m);
               }
               else if(!m.nonBreakableIncoming)
               {
                  list->Remove(m);
                  B.Add(m);
               }
            }
         }
      }
      else if((n = B.first))
      {
         B.Remove((IteratorPointer)n);

         // Break the edges of this node
         if(n.incoming)
         {
            for(e = n.incoming.first; e; e = ne)
            {
               TopoEdge e2, n2;
               TopoNode m = e.from;
               TopoNode f = null;

               // TODO: Callback here to break this edge
#ifdef _DEBUG
               PrintLn("TopoSort: Breaking edge...");
#endif

               ne = e.in.next;
               // If necessary, recheck input for edges created by breaking process
               {
                  TopoNode c, next;
                  for(c = input.first; c; c = next)
                  {
                     next = c.next;
                     if(!c.incoming || !c.incoming.count)
                     {
                        input.Remove(c);
                        S.Add(c);
                     }
                     else if(!c.nonBreakableIncoming)
                     {
                        input.Remove(c);
                        B.Add(c);
                     }
                  }
               }

               for(e2 = m.outgoing.first; e2; e2 = n2)
               {
                  n2 = e2.out.next;
                  if(e2.breakable)
                  {
                     // TODO: Break this edge here
#ifdef _DEBUG
                     PrintLn("TopoSort: Break this edge...");
#endif
                  }
               }
               if(!f.incoming.count)
                  S.Add(f);
               else if(!f.nonBreakableIncoming)
                  B.Add(f);
               else
                  input.Add(f);
               // Avoid needless edge breaking by processing a node as soon as one shows up in S
               if(S.first)
                  break;
            }
         }

         // Put n back in input because it now has unbreakable edges
         input.Add(n);
      }
      else
      {
         if(input.count)
         {
            // TopoSort failed -- remove incoming edges of first node with a single one, or of the first node
            for(n = input.first; n; n = n.next)
               if(n.incoming.count == 1)
                  break;
            if(!n) n = input.first;

            if(n)
            {
               TopoEdge e;
               while((e = n.incoming.first))
               {
                  e.from.outgoing.Remove((IteratorPointer)e);
                  n.incoming.Remove((IteratorPointer)e);
                  if(edgesPool) edgesPool.free(e); else delete e;
               }
            }

            input.Remove(n);
            S.Add(n);

            if(result)
            {
               result = false;

#ifdef _DEBUG
               // PrintLn("TopoSort: Cycles found with ", input.count, " nodes left.");
#endif
            }
            continue;
         }
         input = L;
         break;
      }
   }

#ifdef _DEBUG
   if(input.count != inputCount)
      PrintLn("TopoSort: Lost nodes?");
#endif
   return result;
}
