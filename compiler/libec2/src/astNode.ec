import "lexing"

public class ASTNode : Container
{
public:
   Location loc;

   virtual void print();
}

public class ASTList : ASTNode
{
   List<ASTNode> list { };

   IteratorPointer GetFirst()                             { return list ? list.GetFirst() : 0; }
   IteratorPointer GetLast()                              { return list ? list.GetLast() : 0; }
   IteratorPointer GetPrev(IteratorPointer pointer)       { return list ? list.GetPrev(pointer) : 0; }
   IteratorPointer GetNext(IteratorPointer pointer)       { return list ? list.GetNext(pointer) : 0; }
   bool SetData(IteratorPointer pointer, D data)          { return list ? list.SetData(pointer, (ASTNode)data) : 0; }
   D GetData(IteratorPointer pointer)                     { return list ? list.GetData(pointer) : (D)0; }
   IteratorPointer GetAtPosition(I pos, bool create)      { return list ? list.GetAtPosition((int)pos, create) : 0; }
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
      Print(", ");
   }

   void print()
   {
      Iterator<ASTNode> it { list };
      while(it.Next())
      {
         it.data.print();
         if(list.GetNext(it.pointer))
            printSep();
      }
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
         if(sep && peekToken().type == sep)
            readToken();
         else if(sep || peekToken().type == '}')
            break;
      }
      return list;
   }

   ~ASTList()
   {
      list.Free();
   }
}
