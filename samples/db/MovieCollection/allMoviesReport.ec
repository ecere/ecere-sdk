import "movieSchema"
import "reports"

class MoviesReportDetail : Detail
{
   size = { 500, 22 };
   font = { "Arial", 10 };

   keepTogether = true;
   
   Label movieName      { this, anchor = { left = 4, top = 2, right = 0.60, bottom = 2 } };
   Label mediaType      { this, anchor = { left = 0.40, top = 2, right = 0.45, bottom = 2 } };
   Label dateAdded      { this, anchor = { left = 0.55, top = 2, right = 0.30, bottom = 2 } };
   Label borrowerName   { this, anchor = { left = 0.70, top = 2, right = 4, bottom = 2 } };

   bool OnCreate(void)
   {
      String s;
      RowMovies row = (RowMovies)report.groupings[0].row;
      
      s = row.name; movieName.text = s; delete s;
      s = PrintString(row.mediaType); mediaType.text = s; delete s;
      s = PrintString((ShortDate)row.dateAdded); dateAdded.text = s; delete s;
      s = row.borrower.name; borrowerName.text = s; delete s;
      return true;
   }
}

class MoviesReportPageHeader : Detail
{
   size = { 500, 30 };
   font = { "Arial", 10, bold = true };

   Label movieName      { this, anchor = { left = 4, top = 9, right = 0.60, bottom = 2 }, text = "Movie Name" };
   Label mediaType      { this, anchor = { left = 0.40, top = 9, right = 0.45, bottom = 2 }, text = "Media Type" };
   Label dateAdded      { this, anchor = { left = 0.55, top = 9, right = 0.30, bottom = 2 }, text = "Date Added" };
   Label borrowerName   { this, anchor = { left = 0.70, top = 9, right = 4, bottom = 2 }, text = "Borrower Name" };

   void OnRedraw(Surface surface)
   {
      int x = clientSize.w - 1, y = clientSize.h - 1;
      surface.Rectangle(0, 5, x, y);
   }
}

class MoviesReport : CommonReport
{
   title = "All my movies";
   pageHeader = class(MoviesReportPageHeader);
   rowDetail = class(MoviesReportDetail);

   bool ExecuteData(Database db)
   {
      RowMovies row { };
      row.query = "SELECT ROWID, * FROM `Movies` ORDER BY `Media Type`, `Name`;";
      row.Select(nil);
      groupings[0].row = row;
      return true;
   }
}
