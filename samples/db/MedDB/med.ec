#ifdef ECERE_STATIC
public import static "ecere"
public import static "EDA"
#else
public import "ecere"
public import "EDA"
#endif

class ConcentrationEditor : Window
{
   DataBox formEditor;
   DataBox amountEditor;
   DataBox unitEditor;
}

default:
static void UnusedFunction()
{
   int a;
   a.OnGetString(0,0,0);
}
extern int __ecereVMethodID_class_OnSaveEdit;
extern int __ecereVMethodID_class_OnGetString;
private:

class Concentration
{
public:
   Form form;
   double amount;
   Unit unit;

   bool Window::NotifyChanged(bool closed)
   {
      master.master.modifiedDocument = true;
      return true;
   }

   void OnDisplay(Surface surface, int x, int y, int width, void * fieldData, Alignment alignment, DataDisplayFlags displayFlags)
   {
      char string[1024];
      char amountString[256];

      // TODO: FIX THIS
      //amount.OnGetString(amountString, null, null);
      if(!this)
      {
         sprintf(string, "(Click here to add)");
      }
      else
      {
         class(double)._vTbl[__ecereVMethodID_class_OnGetString](class(double), &amount, amountString, null, null);
         if(form)
         {
            String formName = form.name;
            String unitName = unit.name;
            sprintf(string, "%s: %s %s", formName ? formName : "", amountString, unitName ? unitName : "");
            delete formName;
            delete unitName;
         }
         else
            sprintf(string, "(Click here to add)");
      }
      surface.WriteText(x, y, string, strlen(string));
   }

   Window OnEdit(DataBox dataBox, DataBox obsolete, int x, int y, int w, int h, void * userData)
   {
      if(this != null)
      {
         ConcentrationEditor editor
         {
            dataBox,
            borderStyle = 0,
            anchor = { 0, 0, 0, 0 };
         };

         editor.formEditor = { editor, type = class(Form), data = &form, anchor = { top = 0, bottom = 0, left = 0, right = 0.66 }, NotifyChanged = NotifyChanged };
         editor.amountEditor = { editor, type = class(double), data = &amount, anchor = { top = 0, bottom = 0, left = 0.34, right = 0.33 }, NotifyChanged = NotifyChanged };
         editor.unitEditor = { editor, type = class(Unit), data = &unit, anchor = { top = 0, bottom = 0, left = 0.66, right = 0 }, NotifyChanged = NotifyChanged };
         editor.Create();
         return editor;
      }
      return null;
   }

   bool OnSaveEdit(ConcentrationEditor editor, void * object)
   {
      Concentration _this = this;
      if(this && !_this.form)
      {
         delete _this;
         this = null;
         return false;
      }
      else
         editor.amountEditor.SaveData();
      return false;
   }

   void OnFree() { }    // WE DON'T WANT THE LISTBOX TO DELETE THE INSTANCES...
};

struct FormConcentrations : DataList
{
   class_property(type) = "Concentration";
};

dbtable "Restrictions" Restriction
{
   Restriction id    "id";
   String      name  "name";
};

dbtable "DrugClasses" DrugClass
{
   DrugClass id   "id";
   String name "name";
};

dbtable "SubClasses" SubClass
{
   SubClass   id    "id";
   String     name  "name";
};

dbtable "Forms" Form
{
   Form    id   "id";
   String   name "name";
};

dbtable "Units" Unit
{
   Unit    id    "id";
   String   name  "name";
};

dbtable "Drugs" Drug
{
   Drug                 id                  "id";
   String               genericName         "Generic Name";
   StringList           commercialNames     "Commercial Names";
   Restriction          restriction         "Restriction";
   SubClass             subClass            "Sub Class";
   DrugClass            drugClass           "Class";
   FormConcentrations   formConcentrations  "Form and Concentrations";
};

DataSource ds;
Database db;

class MyApp : GuiApplication
{
   MyApp()
   {
      RandomSeed((uint)(GetTime() * 1000));
      SetDefaultIdField("id");
      SetDefaultNameField("name");
      ds = DataSource { driver = "EDB" };
      db = database_open(ds, "med");
   }
   ~MyApp()
   {
      delete db;
      delete ds;
   }
}
