import "idList"

define pgs = 10; // print pgs size
define margin = 36;

public enum Orientation { portrait, landscape };

public enum RenderAction { addPage, closePage, levelStart, levelFinish, groupStart, groupFinish, actualRows };

static class PleaseWait : Window
{
   isModal = true;
   autoCreate = false;
   borderStyle = fixed;
   text = $"Please wait while the report is being generated...";
   clientSize = { 400, 30 };
   ProgressBar progress { this, anchor = { 0,0,0,0 } };
}

static PleaseWait pleaseWait { };

public class ReportTitle : Window
{
   size = { 500, 32 };
   borderStyle = contour;
   background = white;

   font = { $"Arial", 14, bold = true };

   Label { this, foreground = black, anchor = { top = 4 }, labeledWindow = this };
}

class PreviewPage : Window
{
   background = dimGray;
   //size = { 850 + shadowS + pgs * 2, 1100 + shadowS + pgs * 2 };

   public property Orientation orientation
   {
      set
      {
         if(value == portrait)
            size = { 850 + shadowS + pgs * 2, 1100 + shadowS + pgs * 2 };
         else if(value == landscape)
            size = { 1100 + shadowS + pgs * 2, 850 + shadowS + pgs * 2 };
         orientation = value;
      }
   }
   Orientation orientation;

   Page page;

   void OnRedraw(Surface surface)
   {
      int x = clientSize.w - pgs - 1, y = clientSize.h - pgs - 1;

      surface.SetBackground(black);

      surface.Rectangle(pgs, pgs, x - shadowS, y - shadowS);
      surface.Area(pgs + shadowS / 2, y - shadowS + 1, x, y);
      surface.Area(x - shadowS + 1, pgs + shadowS / 2, x, y);

      surface.SetBackground(white);

      surface.Area(pgs + 1, pgs + 1, x - shadowS - 1, y - shadowS - 1);
   }
}

public class Page : Window
{
   background = white;

public:
   property Orientation orientation
   {
      set
      {
         if(value == portrait)
         {
            size = { 850, 1100 };
            inside.size = { 850, 1100 };
         }
         else if(value == landscape)
         {
            size = { 1100, 850 };
            inside.size = { 1100, 850 };
         }
         orientation = value;
      }
   }

   Window inside { this };

   int headerHeight;
   
private:
   Orientation orientation;
}

public class ReportRender
{
public:
   virtual void Render(ReportDestination destination, Report report);
   virtual int GetPageNumber();
}

static ReportRenderNormal ersCurrentReport;
static int ersNumRows;

public void ERSProgressAdvanceLevelCheck()
{
   if(!ersCurrentReport.level)
   {
      ersNumRows++;
      ersNumRows = Min(ersNumRows, pleaseWait.progress.range);
      pleaseWait.progress.progress = ersNumRows;
      ((GuiApplication)__thisModule.application).ProcessInput(true);
      pleaseWait.UpdateDisplay();
   }
}

public void ERSProgressAdvance()
{
   if(!ersNumRows) ersNumRows++;
   ersNumRows++;
   ersNumRows = Min(ersNumRows, pleaseWait.progress.range);
   pleaseWait.progress.progress = ersNumRows;
   if(ersNumRows == pleaseWait.progress.range || !(ersNumRows%100))
   {
      ((GuiApplication)__thisModule.application).ProcessInput(true);
      pleaseWait.UpdateDisplay();
   }
}

public class ReportRenderNormal : ReportRender
{
public:
   int pageNumber;

   void Render(ReportDestination destination, Report report)
   {
      bool dontAdvance = false;
      bool nil;
      level = 0;
      overlap = 0;
      renderAction = levelStart;
      ersCurrentReport = this;
      ersNumRows = 0;
      if(!report.groupings[0].filtered)
      {
         pleaseWait.master = destination.master;
         pleaseWait.Create();

         pleaseWait.progress.range = report.groupings[0].rowsCount ? report.groupings[0].rowsCount : report.groupings[0].row.rowsCount;
         pleaseWait.progress.progress = 0;
         ((GuiApplication)__thisModule.application).ProcessInput(true);
         pleaseWait.UpdateDisplay();
      }
      for(pageNumber = 1; true; pageNumber++)
      {
         Detail lastDetail = null;
         page = Page { orientation = report.orientation };
         destination.AddPage(page);
         inside = page.inside;
         inside.anchor = report.insideMarginAnchor;
         insideSize = inside.size.h;

         pageTop = 0;
         if(pageNumber == 1)
         {
            if(report.reportHeader)
            {
               reportHeader = eInstance_New(report.reportHeader);
               reportHeader.anchor = Anchor { left = 0, top = 0, right = 0 };
               reportHeader.master = destination;
               reportHeader.parent = inside;
               
               pageTop += reportHeader.size.h;
               reportHeader.Create();
            
            }
            /*if(report.reportFooter)
            {
               reportFooter = eInstance_New(report.reportFooter);
               reportFooter.anchor = Anchor { left = 0, bottom = 0, right = 0 };
               reportFooter.master = destination;
               reportFooter.parent = inside;
               reportFooter.Create();
            }*/
         }

         if(report.pageHeader)
         {
            pageHeader = eInstance_New(report.pageHeader);
            pageHeader.anchor = Anchor { left = 0, top = pageTop, right = 0 };
            pageHeader.master = destination;
            pageHeader.parent = inside;
            
            pageTop += pageHeader.size.h;

            pageHeader.Create();
         }
         
         if(report.pageFooter)
         {
            pageFooter = eInstance_New(report.pageFooter);
            pageFooter.master = destination;
            pageFooter.parent = inside;
            footerHeight = pageFooter.size.h;
         }
         else
            footerHeight = 0;

         if(report.rowDetail)
         {
            bool loop;
            //int levelHead = 0;
            //int levelFoot = 0;
            pageTop += overlap;

            if((renderAction != levelStart && renderAction != groupStart)|| level > 0)
            {
               int c;
               for(c = 0; c < ((renderAction == groupStart) ? level : (level + 1)); c++)
               {
                  if(report.groupings[c].continuation)
                  {
                     Detail continuation = eInstance_New(report.groupings[c].continuation);
                     continuation.level = c;
                     AddDetailToPage(destination, continuation);
                  }
               }
            }

            loop = true;
            for( ; loop; )
            {
               switch(renderAction)
               {
                  case levelStart:
                     if(level == report.groupings.size - 1)
                        renderAction = actualRows;
                     else
                        renderAction = groupStart;
                     break;
                  case levelFinish:
                     if(level == 0)
                     {
                        // end of rows, end of last group, end of report
                        // TESTING THIS HERE... (UNCOMMENTED AND ADDED CHECK FOR size == 1)
                        if(report.groupings.size == 1 && report.groupings[level].footer)
                        {
                           Detail groupFooter = eInstance_New(report.groupings[level].footer);
                           groupFooter.level = level;
                           if(AddDetailToPage(destination, groupFooter))
                           {
                              //dontAdvance = true;
                              loop = false;
                              break;
                           }
                        }
                        loop = false;
                        break;
                     }
                     else
                     {
                        level--;
                        renderAction = groupFinish;
                     }
                     break;
                  case groupStart:
                     lastDetail = null;
                     if(report.Advance(report.groupings[level], level ? report.groupings[level - 1].groupId : 0, &dontAdvance))
                     {
                        report.ExecuteRowData(level);
                        if(report.groupings[level].header)
                        {
                           Detail groupStart = eInstance_New(report.groupings[level].header);
                           groupStart.level = level;

                           if(AddDetailToPage(destination, groupStart))
                           {
                              dontAdvance = true;
                              loop = false;
                              break;
                           }
                           else if(overlap - groupStart.size.h /** 2*/ < 0)
                           {
                              overlap = 0;
                              groupStart.Destroy(0);
                              dontAdvance = true;
                              loop = false;
                              break;
                           }
                        }
                        level++;
                        renderAction = levelStart;
                     }
                     else
                     {
                        renderAction = levelFinish;
                     }
                     break;
                  case groupFinish:
                     if(lastDetail)
                        lastDetail.isLast = true;
                     if(report.groupings[level].footer)
                     {
                        Detail groupEnd = eInstance_New(report.groupings[level].footer);
                        groupEnd.level = level;
                        if(AddDetailToPage(destination, groupEnd))
                        {
                           //dontAdvance = true;
                           loop = false;
                           break;
                        }
                        else if(overlap - groupEnd.size.h < 0)
                        {
                           overlap = 0;
                           groupEnd.Destroy(0);
                           loop = false;
                           break;
                        }
                     }
                     renderAction = groupStart;
                     break;
                  case actualRows:
                     if(report.Advance(report.groupings[level], level ? report.groupings[level - 1].groupId : 0, &dontAdvance))
                     {
                        Detail detail;
                        if(AddDetailToPage(destination, (detail = eInstance_New(report.rowDetail))))
                        {
                           dontAdvance = true;
                           loop = false;
                           break;
                        }
                        else
                        {
                           report.ExecuteRowData(level);
                           lastDetail = detail;
                        }
                     }
                     else
                     {
                        renderAction = levelFinish;
                     }
                     break;

               }
            }
            nil = report.nil;
         }
         else
         {
            nil = true;
         }

         // Cancel group headers if we didn't have space to display any row
         if(!lastDetail)
         {
            Detail detail, prev;
            for(detail = (Detail)inside.lastChild; detail; detail = prev)
            {
               prev = (Detail)detail.previous;
               if(level > 0 && detail._class == report.groupings[level-1].header)
               {
                  detail.Destroy(0);
                  level--;
                  renderAction = groupStart;
               }
               else
               {
                  if(detail._class == report.groupings[level].footer);
                  else
                     lastDetail = detail;
                  break;
               }
            }
         }
         if(lastDetail)
            lastDetail.isLast = true;

         if(nil && report.reportFooter)
         {
            reportFooter = eInstance_New(report.reportFooter);
            reportFooter.master = destination;
            reportFooter.parent = inside;
            inside.anchor = { left = inside.anchor.left, top = inside.anchor.top };
            inside.size = { inside.size.w, inside.size.h + reportFooter.size.h };
            reportFooter.anchor = Anchor { left = 0, bottom = 0, right = 0 };
         }

         if(report.pageFooter)
         {
            if(nil && report.reportFooter)
               pageFooter.anchor = Anchor { left = 0, bottom = (int)reportFooter.size.h, right = 0 };
            else
               pageFooter.anchor = Anchor { left = 0, bottom = 0, right = 0 };
            
            pageFooter.Create();
         }
         if(nil && report.reportFooter)
         {
            reportFooter.Create();
         }
         
         destination.EndPage(page);

         if(nil)
            break;
         
         // still have to bump report footer if it does not fit...
      }
      pleaseWait.Destroy(0);
   }

   int GetPageNumber()
   {
      return pageNumber;
   }

   int level;

private:
   int overlap, pageTop, insideSize, footerHeight;
   RenderAction renderAction;

   Page page;
   Window inside;

   Detail reportHeader;
   Detail reportFooter;
   Detail pageHeader;
   Detail pageFooter;

   // This function returns true if it there's no room and we should display on next page
   bool AddDetailToPage(ReportDestination destination, Detail detail)
   {
      int detailSize;

      detail.anchor = Anchor { left = 0, right = 0 };
      detail.master = destination;
      detail.parent = inside;

      detailSize = detail.size.h;
      overlap = (insideSize - pageTop - footerHeight) - detailSize;
      
      if(overlap < 0 && detail.keepTogether)
      {
         delete detail;
         overlap = 0;
         return true;
      }
      else
      {
         detail.anchor = Anchor { left = 0, top = pageTop, right = 0 };
         pageTop += detailSize;

         detail.Create();
         // This will probably never go here... (Only report/page headers have keepTogether set to false)
         /*if(overlap < 0)
         {
            printf("bug");
         }*/

      }
      return false;
   }
}

public class ReportDestination : Window
{
public:
   Report report;

   virtual void EndPage(Page page)
   {
      SetScrollArea(page.master.size.w, page.master.position.y + page.master.size.h, false);
      SetScrollPosition((page.master.size.w - clientSize.w) / 2, 0);
   }

   virtual void AddPage(Page page);
   virtual Report GetReport() { return null; }
private:
   int pageCount;

   List<PreviewPage> pages { };
}

public class PrintedReport : ReportDestination
{
   displayDriver = "Win32Printer";
   fullRender = true;

   Page lastPage;

   bool OnCreate()
   {
      if(report)
         SetPrintingDocumentName(report.title);
      return ReportDestination::OnCreate();
   }

   void AddPage(Page page)
   {
      if(pageCount && display)
         display.NextPage();
      lastPage = page;
      page.anchor = { left = 0, top = 0, right = 0, bottom = 0};
      page.master = this;
      page.parent = this;
      pageCount++;
      page.Create();
   }

   void EndPage(Page page)
   {
      Update(null);
      ((GuiApplication)__thisModule.application).ProcessInput(true);
      ((GuiApplication)__thisModule.application).UpdateDisplay();
      lastPage.Destroy(0);
   }

   Report GetReport()
   {
      return report;
   }
}

public class ReportPreviewArea : ReportDestination
{
   hasHorzScroll = true;
   hasVertScroll = true;
   dontHideScroll = true;
   background = dimGray;

   void AddPage(Page page)
   {
      PreviewPage previewPage { this, this, page = page, orientation = page.orientation, 
                                   anchor = { top = pageCount * ((int)page.size.h + shadowS + pgs) } };
      previewPage.Create();
      page.anchor = { left = pgs, top = pgs, right = shadowS + pgs, bottom = shadowS + pgs};
      page.master = previewPage;
      page.parent = previewPage;
      page.Create();
      pageCount++;
   }
   
   Report GetReport()
   {
      return report;
   }

   void OnResize(int width, int height)
   {
      scroll = { (scrollArea.w - width) / 2, scroll.y };
   }
}

Array<FileFilter> csvFilters
{ [
   { 
      $"Comma Separated Values Spreadsheet (*.csv)",
      "csv"
   },
   { $"All files", null }
] };

public class CSVReport : ReportDestination
{
   hasHorzScroll = true;
   hasVertScroll = true;
   dontHideScroll = true;
   background = dimGray;
   
   Page lastPage;

   void AddPage(Page page)
   {
      int h;
      if(pageCount && display)
         display.NextPage();
      lastPage = page;
      page.master = this;
      page.parent = this;
      page.size = { MAXINT - 10, MAXINT - 10 };
      h = page.size.h;
      pageCount++;
      page.Create();
   }
   
   void PutString(File f, char * text)
   {
      char output[4096];
      int s = 0, d = 0;
      byte ch;

      output[d++] = '"';
      while((ch = text[s++]) && d < sizeof(output) - 1)
      {
         if(ch > 127)
         {
            int nb;
            int keyCode = UTF8GetChar(text + s - 1, &nb);
            s += nb - 1;
            if(keyCode < 256)
               ch = (byte)keyCode;
            else
               ch = '?';
         }
         if(ch == '\"') output[d++] = '\\';
         output[d++] = ch;
      }
      output[d++] = '"';
      output[d] = 0;
      f.Puts(output);
   }

   FileDialog saveTo { type = save, text = $"Export as Spreadsheet (CSV)", filters = csvFilters.array, sizeFilters = csvFilters.count * sizeof(FileFilter) };

   void EndPage(Page page)
   {
      char filePath[MAX_LOCATION];
      strcpy(filePath, report.title);
      strcat(filePath, ".csv");
      saveTo.master = master;
      saveTo.filePath = filePath;
      if(saveTo.Modal())
      {
         File f = FileOpen(saveTo.filePath, write);
         if(f)
         {
            Detail detail, first = null;         
            for(detail = (Detail)page.inside.firstChild; detail && detail != first; detail = (Detail)detail.next)
            {
               if(!first) first = detail;
               if(eClass_IsDerived(detail._class, class(Detail)))
               {
                  Label label, first = null;
      
                  if(detail._class == report.pageFooter) continue;
                  if(detail._class == report.groupings[0].header)
                     f.Puts("\n");
                  for(label = (Label)detail.firstChild; label && label != first; label = (Label)label.next)
                  {
                     if(!first) first = label;
                     if(label._class == class(ReportTitle) || eClass_IsDerived(label._class, class(Label)))
                     {
                        char * text = label.text;
                        if(label != first)f.Puts(",");
                        if(text)
                           PutString(f, text);
                     }
                  }
                  if(detail._class == report.groupings[0].header)
                     f.Puts("\n");
                  f.Puts("\n");
               }
            }
         }
         delete f;
      }
      lastPage.Destroy(0);
   }

   Report GetReport()
   {
      return report;
   }
}

public class IdFilter : struct
{
public:
   Id id;
   Field field;
   
   bool RowMatch(Row row)
   {
      Id value;
      if(!field)
         return false;
      if(!row.GetData(field, value))
         return false;
      return value == id;
   }
}

public class Grouping
{
public:
   Id groupId;
   Row row;
   Field field, fieldLink;
   bool filtered;
   Array<IdFilter> filters { };

   // Contractors have a list of trades they're in
   Field listFieldLink;

   // Portfolios have the list of contacts for them, Portfolio id goes in fieldLink
   Field reverseListFieldLink;
   Grouping reverseLink;

   bool activeOnly;
   Field activeField;
   uint rowsCount;

   subclass(Detail) header;
   subclass(Detail) continuation;
   subclass(Detail) footer;

   ~Grouping()
   {
      filters.Free();
      delete row;
   }
   
   virtual bool ShouldSkip()
   {
      return false;
   }

   virtual bool Advance(Id linkId, bool *dontAdvance)
   {
      bool result;
      IdList reverseIdList = null;

      if(dontAdvance && *dontAdvance)
      {
         *dontAdvance = false;
         return !row.nil;
      }
      if(!reverseLink && fieldLink && row.nil)
         result = row.Find(fieldLink, middle, nil, linkId);
      else
         result = row.Next();
      if(!result)
         return false;
      
      if(reverseLink)
         reverseLink.row.GetData(reverseListFieldLink, reverseIdList);

      if(activeOnly && !activeField)
         activeField = row.tbl.FindField("Active");

      while(result)
      {
         if(!ersCurrentReport.level)
         {
            ersNumRows++;
            ersNumRows = Min(ersNumRows, pleaseWait.progress.range);
            pleaseWait.progress.progress = ersNumRows;
            ((GuiApplication)__thisModule.application).ProcessInput(true);
            pleaseWait.UpdateDisplay();
         }

         if(reverseLink)
         {
            Id id = 0;
            row.GetData(fieldLink, id);
            if(!reverseIdList || !reverseIdList.Includes(id))
               result = false;
         }
         else if(listFieldLink)
         {
            IdList list = null;
            row.GetData(listFieldLink, list);
            if(!list || !list.Includes(linkId))
               result = false;
            delete list;
         }
         else if(fieldLink)
         {
            Id id = 0;
            row.GetData(fieldLink, id);
            if(id != linkId)
            {
               row.Last();
               row.Next();
               return false;
            }
         }
         if(activeOnly)
         {
            bool active = true;
            row.GetData(activeField, active);
            if(!active)
               result = false;
         }
         if(result && filtered && filters.size)
         {
            int f;
            for(f = 0; f < filters.size && result && filters[f].field; f++)
            {
               Id id = 0;
               row.GetData(filters[f].field, id);
               if(id != filters[f].id)
               {
                  result = false;
                  break;
               }
            }
         }
         if(result && ShouldSkip())
            result = false;

         if(result)
         {
            if(field)
            {
               groupId = 0;
               row.GetData(field, groupId);
            }
            delete reverseIdList;
            return true;
         }
         result = row.Next();
      }
      delete reverseIdList;
      return result;
   }
}

public class Report
{
public:
   Orientation orientation;
   Anchor insideMarginAnchor;

   Array<Grouping> groupings { };

   property String title
   {
      set
      {
         delete title;
         if(value)
            title = CopyString(value);
      }
   }
   String title;

   ReportRender render;

   subclass(Detail) reportHeader;
   subclass(Detail) reportFooter;

   subclass(Detail) pageHeader;
   subclass(Detail) pageFooter;

   subclass(Detail) rowDetail;

   virtual bool Advance(Grouping grouping, Id linkId, bool *dontAdvance)
   {
      return grouping.Advance(linkId, dontAdvance);
   }
   
   virtual bool ExecuteData(Database db)
   {
      return false;
   }

   virtual void ExecuteRowData(int group);
   virtual void OnReset();

   property bool nil
   {
      get
      {
         if(groupings && groupings.size && groupings[0].row)
            return groupings[0].row.nil;
         return true;
      }
   }

   ~Report()
   {
      groupings.Free();
      delete title;
      delete render;
   }
}

public class Detail : Window
{
public:
   bool keepTogether;
   bool isLast;
   int level;

   subclass(Detail) rowDetail;
}
