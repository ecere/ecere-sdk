import "movieSchema"
import "reports"

Date d;
class BorrowerReportDetail : Detail
{
   size = { 500, 22 };
   font = { "Arial", 10 };

   keepTogether = true;

   Label movieName      { this, anchor = { left = 44, top = 2, right = 0.30, bottom = 2 } };
   Label dateBorrowed   { this, anchor = { left = 0.5, top = 2, right = 0.20, bottom = 2 } };

   bool OnCreate(void)
   {
      String s;
      BorrowerReport report = (BorrowerReport)((ReportDestination)master).GetReport();
      RowMovies row = (RowMovies)report.groupings[1].row;

      s = row.name; movieName.text = s; delete s;
      s = PrintString((ShortDate)row.dateBorrowed); dateBorrowed.text = s; delete s;
      return true;
   }
}

class BorrowerReportPageHeader : Detail
{
   size = { 500, 30 };
   font = { "Arial", 10, bold = true };

   Label name { this, anchor = { left = 44, top = 9, right = 0.65, bottom = 2 }, text = "Movie Name" };
   Label dateBorrowed { this, anchor = { left = 0.5, top = 9, right = 4, bottom = 2 }, text = "Date Borrowed" };

   void OnRedraw(Surface surface)
   {
      int x = clientSize.w - 1, y = clientSize.h - 1;
      surface.Rectangle(0, 5, x, y);
   }
}

class BorrowerGroupHeader : Detail
{
   size = { 500, 28 };
   font = { "Arial", 10, bold = true };

   keepTogether = true;

   Label name { this, anchor = { left = 4, top = 7, right = 0.65, bottom = 2 } };
   Label phone { this, anchor = { left = 0.4, top = 7, right = 4, bottom = 2 } };

   bool OnCreate(void)
   {
      String s;
      BorrowerReport report = (BorrowerReport)((ReportDestination)master).GetReport();
      RowBorrowers row = (RowBorrowers)report.groupings[0].row;
      s = row.name; name.text = s; delete s;
      s = row.phoneNumber; phone.text = s; delete s;
      return true;
   }

   void OnRedraw(Surface surface)
   {
      int x = clientSize.w - 1, y = clientSize.h - 1;
      surface.Rectangle(0, 4, x, y - 2);
   }
}

class BorrowerGroupContinuation : Detail
{
   size = { 500, 28 };
   font = { "Arial", 10, bold = true };

   keepTogether = true;

   Label name { this, anchor = { left = 4, top = 7, right = 0.65, bottom = 2 } };

   bool OnCreate(void)
   {
      String s;
      BorrowerReport report = (BorrowerReport)((ReportDestination)master).GetReport();
      RowBorrowers row = (RowBorrowers)report.groupings[0].row;

      s = PrintString(row.name, " (Continued)"); name.text = s; delete s;
      return true;
   }

   void OnRedraw(Surface surface)
   {
      int x = clientSize.w - 1, y = clientSize.h - 1;
      surface.Rectangle(0, 4, x, y - 2);
   }
}

static int numMovies;

class BorrowerGroupFooter : Detail
{
   size = { 500, 40 };
   font = { "Arial", 10, bold = true };

   keepTogether = true;

   Label title { this, anchor = { left = 0.85, top = 9, right = 0.03, bottom = 2 }, text = "Total count:" };
   Label total { this, anchor = { left = 0.97, top = 9, right = 9, bottom = 2 } };

   bool OnCreate(void)
   {
      String s = PrintString(numMovies);
      total.text = s;
      delete s;
      return true;
   }

   void OnRedraw(Surface surface)
   {
      int x = clientSize.w - 1, y = clientSize.h - 1;
      surface.HLine(0, x, 5);
   }
}

class BorrowerGrouping : Grouping
{
   RowMovies rowMovies { };
   bool ShouldSkip()
   {
      RowBorrowers r = (RowBorrowers)row;
      int id = r.id;
      return !rowMovies.Find(dbfield("Movies", borrower), middle, nil, id);
   }
}

int daysAgo;

class BorrowerReport : CommonReport
{
   pageHeader = class(BorrowerReportPageHeader);
   rowDetail = class(BorrowerReportDetail);

   BorrowerReport()
   {
      groupings.size = 2;

      groupings[1] = groupings[0];

      groupings[0] = BorrowerGrouping { };
      groupings[0].field = dbfield("Borrowers", id);
      groupings[0].header = class(BorrowerGroupHeader);
      groupings[0].continuation = class(BorrowerGroupContinuation);
      groupings[0].footer = class(BorrowerGroupFooter);
   }

   bool ExecuteData(Database db)
   {
      DateTime now, d;
      TimeStamp t;
      now.GetLocalTime();
      t = now;
      t -= 60 * 60 * 24 * daysAgo; // Go back 90 days
      d = t;

      if(daysAgo)
      {
         static char reportTitle[256];
         sprintf(reportTitle, "Movies borrowed for more than %d days", daysAgo);
         title = reportTitle;
      }
      else
         title = "Borrowed movies";

      groupings[0].row = RowBorrowers { };
      groupings[0].row.query = "SELECT ROWID, * FROM `Borrowers` ORDER BY `Name`;";
      groupings[0].row.Select(nil);

      groupings[1].row = RowMovies { };
      groupings[1].row.query = "SELECT ROWID, * FROM `Movies` WHERE `Date Borrowed` < ? AND `Borrower` = ? ORDER BY `Date Borrowed`;";
      groupings[1].row.SetQueryParamObject(1, Date { d.year, d.month, d.day }, class(Date));
      return true;
   }

   void ExecuteRowData(int group)
   {
      if(group == 0)
      {
         groupings[1].row.SetQueryParam(2, (int)groupings[0].row.sysID);
         numMovies = 0;
      }
      else if(group == 1)
         numMovies++;
   }
}
