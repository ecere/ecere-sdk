public import "lexing"

void printIndent(int indent, File out)
{
   int i;
   for(i = 0; i < indent; i++)
   {
      out.Print("   ");
   }
}

public class CMSSNode : Container
{
   // We don't want to compare contents of these nodes
   class_no_expansion;
   int OnCompare(CMSSNode b)
   {
      if(this < b) return -1;
      if(this > b) return  1;
      return 0;
   }

public:
   virtual void print(File out, int indent, CMSSOutputOptions o);
   virtual void * /*thisclass FIXME */ copy() { return null; }
   String toString(CMSSOutputOptions o)
   {
      TempFile f { };
      String s;
      print(f, 0, o);
      f.Putc(0);
      s = (String)f.StealBuffer();
      delete f;
      return s;
   }

   ~CMSSNode()
   {
      if(this)
         Free();
   }
}

public class CMSSList : CMSSNode
{
public:
   List<CMSSNode> list { };

   IteratorPointer GetFirst()                             { return list ? list.GetFirst() : 0; }
   IteratorPointer GetLast()                              { return list ? list.GetLast() : 0; }
   IteratorPointer GetPrev(IteratorPointer pointer)       { return list ? list.GetPrev(pointer) : 0; }
   IteratorPointer GetNext(IteratorPointer pointer)       { return list ? list.GetNext(pointer) : 0; }
   bool SetData(IteratorPointer pointer, D data)          { return list ? list.SetData(pointer, (CMSSNode)data) : 0; }
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
   void OnFree()
   {
      Free();
      delete list;
      delete this;
   }

   virtual void printSep(File out)
   {
      out.Print(", ");
   }

   void print(File out, int indent, CMSSOutputOptions o)
   {
      Iterator<CMSSNode> it { list };
      while(it.Next())
      {
         it.data.print(out, indent, o);
         if(list.GetNext(it.pointer))
            printSep(out);
      }
   }

   Container ::parse(subclass(Container) c, CMSSLexer lexer, CMSSNode parser(CMSSLexer lexer), char sep)
   {
      Container<CMSSNode> list = null;
      while(true)
      {
         CMSSNode e = parser(lexer);
         if(e)
         {
            if(!list) list = eInstance_New(c);
            list.Add(e);
         }
         else
            break;
         lexer.peekToken();
         if(sep && lexer.nextToken.type == sep)
            lexer.readToken();
         else if(sep || lexer.nextToken.type == '}' || !lexer.nextToken.type)
            break;
      }
      return list;
   }

   ~CMSSList()
   {
      Free();
   }

   CMSSList copy()
   {
      CMSSList l = null;
      if(this)
      {
         l = eInstance_New(_class);
         if(list)
         {
            for(n : list)
               l.list.Add(n.copy());
         }
      }
      return l;
   }
}
