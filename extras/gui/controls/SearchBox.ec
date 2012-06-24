#ifdef ECERE_STATIC
public import static "ecere"
#else
public import "ecere"
#endif

class SearchBox : EditBox
{
   searchLabelColor = gray;

public:
   Color searchLabelColor;
   String label;

private:
   Color originalFg;
   originalFg = foreground;
   foreground = searchLabelColor;

   void OnRedraw(Surface surface)
   {
      if(contents && contents[0])
         EditBox::OnRedraw(surface);
      else
      {
         char * search = CopyString(label && label[0] ? label : caption);
         contents = search;
         EditBox::OnRedraw(surface);
         contents = "";
         delete search;
      }
   }

   void Window::NotifyUpdate(EditBox editBox)
   {
      if(editBox.contents && editBox.contents[0])
         editBox.foreground = ((SearchBox)editBox).originalFg;
      else
         editBox.foreground = ((SearchBox)editBox).searchLabelColor;
   }
}
