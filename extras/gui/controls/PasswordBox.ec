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
      char * contents = (char *)this.contents;
      char * backup = CopyString(contents);
      int len = strlen(backup);
      // what char / font combination to use for desired blocking char on all platforms?
      // memset(string, 'g', len);
      memset(contents, 'l', len);
      EditBox::OnRedraw(surface);
      memcpy(contents, backup, len);
      delete backup;
   }
}
