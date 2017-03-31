
void check()
{
   PrintLn("check");
}

bool assert(bool condition)
{
   if(!condition)
      PrintLn("assertion failed");
   return condition;
}

void pause()
{
   PrintLn("pause");
}
