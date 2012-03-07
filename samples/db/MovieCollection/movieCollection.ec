import "movieSchema"
import "genericEditor"
import "allMoviesReport"
import "borrowerReport"

class MovieCollectionForm : Window
{
   text = "Movie Collection";
   background = activeBorder;
   borderStyle = sizable;
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
   hasMenuBar = true;
   size = { 576, 432 };

   Menu fileMenu { menu, "File", f };
   MenuItem exit { fileMenu, "Exit", x, altF4, NotifySelect = MenuFileExit };
   Menu reportsMenu { menu, "Reports", r };
   MenuItem allMovies
   {
      reportsMenu, "All Movies", a;

      bool NotifySelect(MenuItem selection, Modifiers mods)
      {
         ExecuteReport(db, class(MoviesReport));
         return true;
      }
   };
   MenuItem borrowedMovies
   {
      reportsMenu, "Borrowed Movies", b;

      bool NotifySelect(MenuItem selection, Modifiers mods)
      {
         daysAgo = 0;
         ExecuteReport(db, class(BorrowerReport));
         return true;
      }
   };
   MenuItem olderThan3Months
   {
      reportsMenu, "> 3 months ago", k3, ctrlR;

      bool NotifySelect(MenuItem selection, Modifiers mods)
      {
         daysAgo = 90;
         ExecuteReport(db, class(BorrowerReport));
         return true;
      }
   };
   GenericEditor editor { this, anchor = { 0, 0, 0, 0 }, table = dbtable("Movies"),
      list.text = "List of Movies", editor.text = "Movie Entry Being Edited" };
   Button editBorrowers
   {
      this, caption = "Edit Borrowers", altB, stayOnTop = true, anchor = { right = 40, bottom = 40 };

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         GenericEditor borrowersEditor
         {
            hasClose = true;
            borderStyle = sizable;
            size = { 640, 300 };
            table = dbtable("Borrowers");
            list.text = "List of Borrowers", editor.text = "Borrower Entry Being Edited";
         };
         borrowersEditor.Modal();
         editor.dataBoxes[3].Refresh();
         return true;
      }
   };
}

MovieCollectionForm mainForm {};
