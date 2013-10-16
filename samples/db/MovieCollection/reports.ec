import "EDA"

struct ShortDate : Date
{
   char * OnGetString(char * stringOutput, void * fieldData, bool * needClass)
   {
      static const char months[12][4] =
      {
         "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
      };
      if(day || month || year)
         sprintf(stringOutput, "%s %d, %d", months[month], day, year);
      else
         stringOutput[0] = 0;
      return stringOutput;
   }
};

class CommonReportHeader : Detail
{
   size = { 500, 100 };

   ReportTitle       { this, anchor = { left = 0, top = 4, right = 0 }, text = "Movie Collection Report" };
   ReportTitle title { this, size = { h = 28 }, anchor = { left = 0, top = 42, right = 0 }, font = { "Arial", 12, bold = true } };

   bool OnCreate(void)
   {
      Report report = ((ReportDestination)master).GetReport();
      title.text = report.title;
      return true;
   }
}

class CommonReportPageFooter : Detail
{
   size = { 500, 32 };

   Label pageNumber { this, anchor = { top = 0, right = 0 } };

   void OnRedraw(Surface surface)
   {
      int x = clientSize.w - 1;
      surface.DrawLine(0, 0, x, 0);
   }

   bool OnCreate(void)
   {
      char number[64];
      ReportRender render = ((ReportDestination)master).GetReport().render;
      sprintf(number, "Page %d", render.GetPageNumber());
      pageNumber.text = number;
      return true;
   }
}

class CommonReportFooter : Detail
{
   size = { 500, 32 };

   void OnRedraw(Surface surface)
   {
      int x = clientSize.w - 1;
      surface.DrawLine(0, 0, x, 0);
   }
}

Report report;

class PreviewWindow : Window
{
   size = { 1024, 768 };
   state = maximized;

   hasClose = true;
   fullRender = true;
   background = activeBorder;

   ReportPreviewArea preview { this, anchor = { left = 2, top = 32, right = 2, bottom = 2 } };
   Button print
   {
      this, size = { 80, 20 }, anchor = { right = 8, top = 8 }, hotKey = altP, text = "Print";

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         PrintedReport print { size = (preview.report.orientation == landscape) ? { 1100, 850 } :  { 850, 1100 } };

         print.report = preview.report;
         print.Create();
         print.report.render.Render(print, print.report);
         ((GuiApplication)__thisModule.application).UpdateDisplay();
         print.Destroy(0);
         return true;
      }
   };
}

class CommonReport : Report
{
   orientation = portrait;
   insideMarginAnchor = Anchor { left = 75, top = 75, right = 75, bottom = 75 };
   render = ReportRenderNormal { };

   reportHeader = class(CommonReportHeader);
   reportFooter = class(CommonReportFooter);
   pageFooter = class(CommonReportPageFooter);

   CommonReport()
   {
      groupings.size = 1;
      groupings[0] = Grouping { };
   }
}

void ExecuteReport(Database db, Class reportClass)
{
   PreviewWindow preview { };
   report = eInstance_New(reportClass);
   preview.preview.report = report;
   preview.Create();
   if(report.ExecuteData(db))
      report.render.Render(preview.preview, report);
   preview.DoModal();
   delete report;
}
