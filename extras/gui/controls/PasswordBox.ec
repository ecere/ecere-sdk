#ifdef ECERE_STATIC
public import static "ecere"
#else
public import "ecere"
#endif

class PasswordBox : EditBox
{
   font = { "Wingdings"/*"Webdings"*/, 16 };

   void OnRedraw(Surface surface)
   {
      EditLine l;
      int y, x1, x2;
      char * backup = CopyString(contents);
      int len = strlen(backup);
      char * string = new char[len + 1];
      // what char / font combination to use for desired blocking char on all platforms?
      // memset(string, 'g', len);
      memset(string, 'l', len);
      string[len] = 0;
      GetSelPos(&l, &y, &x1, &l, &y, &x2, false);
      contents = string;
      SetSelPos(l, y, x1, l, y, x2);
      EditBox::OnRedraw(surface);
      memcpy(contents, backup, len);
      delete string;
      delete backup;
   }
}
