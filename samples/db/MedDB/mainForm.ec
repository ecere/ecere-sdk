import "ecere"
import "med"

extern int __ecereVMethodID_class_OnCompare;

class MainForm : Window
{
   tabCycle = true;

   caption = "Drugs Database";
   background = activeBorder;
   borderStyle = sizable;
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
   size = { 640, 480 };

   Window            tabButtons { this, tabCycle = true, background = activeBorder, size = { h = 24 }, anchor = { bottom = 5, left = 10, right = 10 } };
   MedTesting        testForm { this, anchor = { left = 0, top = 0, right = 0, bottom = 30 } };
   UnitesEditor      untEditor { this, anchor = { left = 0, top = 0, right = 0, bottom = 30 }, autoCreate = false };
   FormesEditor      frmEditor { this, anchor = { left = 0, top = 0, right = 0, bottom = 30 }, autoCreate = false };
   SubClassesEditor sclEditor { this, anchor = { left = 0, top = 0, right = 0, bottom = 30 }, autoCreate = false };
   ClassesEditor     clsEditor { this, anchor = { left = 0, top = 0, right = 0, bottom = 30 }, autoCreate = false };
   RestrictionEditor rstEditor { this, anchor = { left = 0, top = 0, right = 0, bottom = 30 }, autoCreate = false };
   MedEditor         medEditor { this, anchor = { left = 0, top = 0, right = 0, bottom = 30 }, autoCreate = false };

   Window curView;
   Button curButton;

   curView = testForm;
   curButton = tabTst;

   bool NotifyClicked(Button button, int x, int y, Modifiers mods)
   {
      if(curView.Destroy(0))
      {
         curButton.checked = false;
         button.checked = true;
         curView = (Window)button.id;
         curView.Create();
         curButton = button;
      }
      return true;

   }

   Button tabTst { tabButtons, checked = true, master = this, stayDown = true, size = { 70, 20 }, anchor = { right = 10 + 6 * 80 },         caption = "Test",  id = (int64)testForm, NotifyClicked = NotifyClicked };
   Button tabUnt { tabButtons, master = this, stayDown = true, size = { 70, 20 }, anchor = { right = 10 + 5 * 80 },         caption = "Units",  id = (int64)untEditor, NotifyClicked = NotifyClicked };
   Button tabFrm { tabButtons, master = this, stayDown = true, size = { 70, 20 }, anchor = { right = 10 + 4 * 80 }, caption = "Forms",        id = (int64)frmEditor, NotifyClicked = NotifyClicked };
   Button tabScl { tabButtons, master = this, stayDown = true, size = { 70, 20 }, anchor = { right = 10 + 3 * 80 }, caption = "Sub-Classes",  id = (int64)sclEditor, NotifyClicked = NotifyClicked };
   Button tabCls { tabButtons, master = this, stayDown = true, size = { 70, 20 }, anchor = { right = 10 + 2 * 80 }, caption = "Classes",       id = (int64)clsEditor, NotifyClicked = NotifyClicked };
   Button tabRes { tabButtons, master = this, stayDown = true, size = { 70, 20 }, anchor = { right = 10 + 1 * 80 }, caption = "Restrictions",  id = (int64)rstEditor, NotifyClicked = NotifyClicked };
   Button tabMed { tabButtons, master = this, stayDown = true, size = { 70, 20 }, anchor = { right = 10 + 0 * 80 },  caption = "Drugs",   id = (int64)medEditor, NotifyClicked = NotifyClicked };
}

class RestrictionEditor : Window
{
   tabCycle = true;

   ListSection list { this, editor = editor, fldName = dbfield("Restrictions", name), table = dbtable("Restrictions"), anchor = { left = 0, top = 0, bottom = 0, right = 0.5 } };
   EditSection editor { this, table = dbtable("Restrictions"), anchor = { left = 0.5, top = 0, bottom = 0, right = 0 } };

   FieldDataBox boxName { editor = editor, field = dbfield("Restrictions", name), caption = "Name", size = { 174, 20 }, position = { 20, 32 } };
   Label label1 { editor.editArea, position = { 20, 8 }, labeledWindow = boxName };
};

class ClassesEditor : Window
{
   tabCycle = true;
   background = activeBorder;

   ListSection list { this, editor = editor, fldName = dbfield("DrugClasses", name), table = dbtable("DrugClasses"), anchor = { left = 0, top = 0, bottom = 0, right = 0.5 } };
   EditSection editor { this, table = dbtable("DrugClasses"), anchor = { left = 0.5, top = 0, bottom = 0, right = 0 } };

   FieldDataBox boxName { editor = editor, field = dbfield("DrugClasses", name), caption = "Name", size = { 174, 20 }, position = { 20, 32 } };
   Label label1 { editor.editArea, position = { 20, 8 }, labeledWindow = boxName };
};

class SubClassesEditor : Window
{
   tabCycle = true;
   background = activeBorder;
   ListSection list { this, editor = editor, fldName = dbfield("SubClasses", name), table = dbtable("SubClasses"), anchor = { left = 0, top = 0, bottom = 0, right = 0.5 } };
   EditSection editor { this, table = dbtable("SubClasses"), anchor = { left = 0.5, top = 0, bottom = 0, right = 0 } };

   FieldDataBox boxName { editor = editor, field = dbfield("SubClasses", name), caption = "Name", size = { 174, 20 }, position = { 20, 32 } };
   Label label1 { editor.editArea, position = { 20, 8 }, labeledWindow = boxName };
};

class FormesEditor : Window
{
   tabCycle = true;
   background = activeBorder;

   ListSection list { this, editor = editor, fldName = dbfield("Forms", name), table = dbtable("Forms"), anchor = { left = 0, top = 0, bottom = 0, right = 0.5 } };
   EditSection editor { this, table = dbtable("Forms"), anchor = { left = 0.5, top = 0, bottom = 0, right = 0 } };

   FieldDataBox boxName { editor = editor, field = dbfield("Forms", name), caption = "Name", size = { 174, 20 }, position = { 20, 32 } };
   Label label1 { editor.editArea, position = { 20, 8 }, labeledWindow = boxName };
};

class UnitesEditor : Window
{
   tabCycle = true;
   background = activeBorder;
   ListSection list { this, editor = editor, fldName = dbfield("Units", name), table = dbtable("Units"), anchor = { left = 0, top = 0, bottom = 0, right = 0.5 } };
   EditSection editor { this, table = dbtable("Units"), anchor = { left = 0.5, top = 0, bottom = 0, right = 0 } };

   FieldDataBox boxName { editor = editor, field = dbfield("Units", name), caption = "Name", size = { 174, 20 }, position = { 20, 32 } };
   Label label1 { editor.editArea, position = { 20, 8 }, labeledWindow = boxName };
};

class MedEditor : Window
{
   tabCycle = true;
   background = activeBorder;
   ListSection list { this, editor = editor, fldName = dbfield("Drugs", genericName), table = dbtable("Drugs"), anchor = { left = 0, top = 0, bottom = 0, right = 0.5 } };
   EditSection editor { this, table = dbtable("Drugs"), anchor = { left = 0.5, top = 0, bottom = 0, right = 0 } };

   FieldDataBox boxGenericName { editor = editor, field = dbfield("Drugs", genericName), caption = "Generic Name", size = { h = 20 }, anchor = { left = 20, top = 32, right = 20 } };
   FieldDataBox boxCommercialNames { editor = editor, field = dbfield("Drugs", commercialNames), caption = "Commercial Names", size = { h = 67 }, anchor = { left = 20, top = 88, right = 20 } };

   FieldDataBox boxSubClass { editor = editor, field = dbfield("Drugs", subClass), caption = "Sub Class", size = { h = 20 }, anchor = { left = 20, top = 192, right = 20 } };
   FieldDataBox boxClass { editor = editor, field = dbfield("Drugs", drugClass), caption = "Class", size = { h = 20 }, anchor = { left = 20, top = 248, right = 20 } };

   FieldDataBox boxRestriction { editor = editor, field = dbfield("Drugs", restriction), caption = "Restriction", size = { h = 20 }, anchor = { left = 20, top = 290, right = 20 } };

   FieldDataBox boxFormConcentrations { editor = editor, field = dbfield("Drugs", formConcentrations), caption = "Form & Concentrations", size = { h = 80 }, anchor = { left = 20, top = 330, right = 20 } };

   Label label1 { editor.editArea, position = { 20, 8 }, labeledWindow = boxGenericName };
   Label label2 { editor.editArea, position = { 20, 64 }, labeledWindow = boxCommercialNames };
   Label label3 { editor.editArea, position = { 20, 168 }, labeledWindow = boxSubClass };
   Label label4 { editor.editArea, position = { 20, 224 }, labeledWindow = boxClass };
   Label label5 { editor.editArea, position = { 20, 270 }, labeledWindow = boxRestriction };
   Label label6 { editor.editArea, position = { 20, 310 }, labeledWindow = boxFormConcentrations };

   Label spacer { editor.editArea, position = { 20, 420 }, size = { h = 10 } };
}

class MedTesting : Window
{
   tabCycle = true;
   RowDrugs row { };

   background = activeBorder;
   anchor = { left = 0, top = 0, right = 0, bottom = 30 };

   FieldDataBox boxGenericName { this, caption = "Generic Name", size = { 238, 20 }, position = { 16, 40 }, field = dbfield("Drugs", genericName), row = row};
   FieldDataBox boxCommercialNames { this, caption = "Commercial Names", size = { 238, 67 }, position = { 16, 96 }, field = dbfield("Drugs", commercialNames), row = row };
   FieldDataBox boxClass { this, caption = "Class", size = { 238, 20 }, position = { 272, 40 }, field = dbfield("Drugs", drugClass), row = row };
   FieldDataBox boxSubClass { this, caption = "Sub Class", size = { 238, 20 }, position = { 272, 96 }, field = dbfield("Drugs", subClass), row = row };
   FieldDataBox boxRestriction { this, caption = "Restriction", size = { 238, 20 }, position = { 272, 152 }, field = dbfield("Drugs", restriction), row = row };
   FieldDataBox boxFormConcentrations { this, caption = "Form & Concentrations", size = { 240, 80 }, position = { 272, 208 }, field = dbfield("Drugs", formConcentrations), row = row };

   Label etude { this, caption = "Study Method", inactive = false, size = { 233, 77 }, position = { 16, 176 }, isGroupBox = true };
   Button generique
   {
      etude, this, "Give out generic name", size = { 146, 15 }, position = { 16, 24 }, isRadio = true, checked = true;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         boxGenericName.Load();
         return true;
      }
   };
   Button commercial
   {
      etude, this, "Give out commercial names", size = { 170, 15 }, position = { 16, 48 }, isRadio = true;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         boxCommercialNames.Load();
         return true;
      }
   };

   Button next
   {
      this, caption = "Draw Next", position = { 16, 264 };

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         if(row.Last())
         {
            int range = row.id;
            Drug id = GetRandom(1, range);
            if(row.Find(dbfield("Drugs", id), middle, 0, id))
            {
               boxCommercialNames.foreground = black;
               boxGenericName.foreground = black;
               boxSubClass.foreground = black;
               boxClass.foreground = black;
               boxRestriction.foreground = black;
               boxFormConcentrations.foreground = black;

               if(generique.checked)
               {
                  boxGenericName.Load();
                  boxCommercialNames.Clear();
               }
               else
               {
                  boxCommercialNames.Load();
                  boxGenericName.Clear();
               }
               boxSubClass.Clear();
               boxClass.Clear();
               boxRestriction.Clear();
               boxFormConcentrations.Clear();

               answers.disabled = false;
            }
         }
         return true;
      }
   };
   Button answers
   {
      this, caption = "Give out Answers", position = { 136, 264 };

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         StringList commercialNames = row.commercialNames;
         String genericName = row.genericName;
         SubClass subClass = row.subClass;
         DrugClass drugClass = row.drugClass;
         Restriction restriction = row.restriction;
         FormConcentrations formConcentrations = row.formConcentrations;

         // if(commercialNames.OnCompare(*(void **)boxCommercialNames.data))
         if(class(StringList)._vTbl[__ecereVMethodID_class_OnCompare](class(StringList), commercialNames, *(void **)boxCommercialNames.data))
            boxCommercialNames.foreground = red;

         // if(genericName.OnCompare(*(void **)boxGenericName.data))
         if(class(String)._vTbl[__ecereVMethodID_class_OnCompare](class(String), genericName, *(void **)boxGenericName.data))
            boxGenericName.foreground = red;

         if(drugClass.OnCompare(boxClass.data))
            boxClass.foreground = red;

         if(subClass.OnCompare(boxSubClass.data))
            boxSubClass.foreground = red;

         if(restriction.OnCompare(boxRestriction.data))
            boxRestriction.foreground = red;

         if(formConcentrations.OnCompare(boxFormConcentrations.data))
            boxFormConcentrations.foreground = red;

         boxCommercialNames.Load();
         boxGenericName.Load();
         boxSubClass.Load();
         boxClass.Load();
         boxRestriction.Load();
         boxFormConcentrations.Load();
         answers.disabled = true;

         delete commercialNames;
         delete genericName;
         formConcentrations.OnFree();
         return true;
      }
   };

   Label label1 { this, position = { 16, 16 }, labeledWindow = boxGenericName };
   Label label2 { this, position = { 16, 72 }, labeledWindow = boxCommercialNames };
   Label label3 { this, position = { 272, 72 }, labeledWindow = boxSubClass };
   Label label4 { this, position = { 272, 16 }, labeledWindow = boxClass };
   Label label5 { this, position = { 272, 128 }, labeledWindow = boxRestriction };
   Label label6 { this, position = { 272, 184 }, labeledWindow = boxFormConcentrations };
   Label spacer { this, position = { 20, 420 }, size = { h = 10 } };

   bool OnPostCreate()
   {
      next.NotifyClicked(this, next, 0,0, 0);
      return true;
   }
}

MainForm mainForm {};
