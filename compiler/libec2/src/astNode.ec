import "lexing"

public class ASTNode : Container
{
public:
   Location loc;

//private:
   LinkList<TopoEdge, link = out> outgoing { };
   LinkList<TopoEdge, link = in> incoming { };
   int nonBreakableIncoming;
//public:
   virtual void print(OutputOptions o);

   void printStart(OutputOptions o)
   {
      if(o.astType)
         out.Print(_class.name, "[[");
   }

   void printEnd(OutputOptions o)
   {
      if(o.astType)
         out.Print("]]");
   }

   void createUniqueEdge(ASTNode from, bool soft)
   {
      for(i : from.outgoing; i.to == this)
      {
         if(i.breakable && !soft)
         {
#ifdef _DEBUG
            if(from == this)
               PrintLn("bug: self-dependency");
#endif
            i.breakable = false;
            nonBreakableIncoming++;
         }
         return;
      }
      createEdge(from, soft);
   }

   void createEdge(ASTNode from, bool soft)
   {
      TopoEdge e { from = from, to = this, breakable = soft };

#ifdef _DEBUG
      if(from == this && !soft)
         PrintLn("bug: self-dependency");

      /*for(i : from.outgoing)
      {
         if(i.to == this)
            PrintLn("Warning: adding a duplicate edge");
      }*/
#endif

   virtual void print();
}

public class ASTList : ASTNode
{
public:
   List<ASTNode> list { };

   IteratorPointer GetFirst()                             { return list ? list.GetFirst() : 0; }
   IteratorPointer GetLast()                              { return list ? list.GetLast() : 0; }
   IteratorPointer GetPrev(IteratorPointer pointer)       { return list ? list.GetPrev(pointer) : 0; }
   IteratorPointer GetNext(IteratorPointer pointer)       { return list ? list.GetNext(pointer) : 0; }
   bool SetData(IteratorPointer pointer, D data)          { return list ? list.SetData(pointer, (ASTNode)data) : 0; }
   D GetData(IteratorPointer pointer)                     { return list ? list.GetData(pointer) : (D)0; }
   IteratorPointer GetAtPosition(I pos, bool create, bool * justAdded)      { return list ? list.GetAtPosition((int)pos, create, justAdded) : 0; }
   IteratorPointer Insert(Link after, T value)            { return list ? list.Insert(after, (void *)value) : 0; }
   IteratorPointer Add(T value)                           { return list ? list.Add((void *)value) : 0; }
   void Remove(IteratorPointer it)                        { if(list) list.Remove(it); }
   void Move(IteratorPointer it, IteratorPointer after)   { if(list) list.Move(it, after); }
   void RemoveAll()                                       { if(list) list.RemoveAll(); }
   void Copy(Container<T> source)                         { if(list) list.Copy(source); }
   IteratorPointer Find(D value)                          { return list ? list.Find((void *)value) : 0; }
   void FreeIterator(IteratorPointer it)                  { if(list) list.FreeIterator(it); }
   int GetCount()                                         { return list ? list.GetCount() : 0; }
   void Free()                                            { if(list) list.Free(); }
   void Delete(IteratorPointer i)                         { if(list) list.Delete(i); }

public:
   virtual void printSep()
   {
      out.Print(", ");
   }

   void print(OutputOptions o)
   {
      Iterator<ASTNode> it { list };
      printStart(o);
      while(it.Next())
      {
         it.data.print(o);
         if(list.GetNext(it.pointer))
            printSep();
      }
      printEnd(o);
   }

   Container ::parse(subclass(Container) c, ASTNode parser(), char sep)
   {
      Container<ASTNode> list = null;
      while(true)
      {
         ASTNode e = parser();
         if(e)
         {
            if(!list) list = eInstance_New(c);
            list.Add(e);
         }
         peekToken();
         if(sep && nextToken.type == sep)
            readToken();
         else if(sep || nextToken.type == '}' || !nextToken.type)
            break;
      }
      return list;
   }

   ~ASTList()
   {
      Free();
   }
}
