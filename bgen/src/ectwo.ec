import "ecere"
import "ec2"

class ARGPrintTypeNameList : TypeNameList
{
   void printSep(File out)
   {
      out.Print(" _ARG ");
   }
};

void ec2PrintToZedString(ZString o, ASTNode node, bool addln)
{
   TempFile f { };
   char buf[1024*1024];
   uint count, len = 0;
   char * s = buf;
   node.print(f, { });
   f.Seek(0, start);
   buf[0] = 0;
   while(!f.Eof())
   {
      bool hasNewLine = false;
      count = f.GetLineEx(s, sizeof(buf), &hasNewLine);
      if(count)
      {
         s += count;
         len += count;
      }
      if(hasNewLine)
      {
         *s++ = '\n';
         *s = 0;
         len++;
      }
   }
   if(addln && len > 0 && buf[len-1] != '\n')
      o.concatx(buf, '\n');
   else
      o.concat(buf);
   delete f;
}

void parseInspection(File restoreIn, const char * code, File console)
{
   TempFile f { };
   f.Puts(code);
   f.Seek(0, start);
   initParser(f);
   {
      AST ast = AST::parse();
      //AST ast = ASTStatement::parse();
      PrintLn("");
      PrintLn("code:");
      PrintLn(code);
      PrintLn("parseInspection:");
      if(ast)
         ast.print(console, { astType = true });
      else
         PrintLn(" *** ast is null");
      PrintLn("");
   }
   delete f;
   initParser(restoreIn);
}

void astInspection(ASTNode node, File console)
{
   PrintLn("astInspection:");
   node.print(console, { astType = true });
}

void astPrint(ASTNode node, File console, bool addln)
{
   if(addln) PrintLn("astPrint:");
   node.print(console, { });
   if(addln) PrintLn("");
}
