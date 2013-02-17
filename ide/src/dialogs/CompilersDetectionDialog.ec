import "ecere"
import "IDESettings"

//static Color unfocusedSelectorColor { 70, 96, 166 };

// how to detect express vs pro?
static const char * compilerSignatureEnvVars[CompilerType] = { "", "", "", "VS80COMNTOOLS", "VS90COMNTOOLS", "VS100COMNTOOLS" };

class CompilersDetectionDialog : Window
{
   background = formColor;
   minClientSize = { 320, 180 };
   maxClientSize = { 640, 360 };
   borderStyle = sizable;
   tabCycle = true;
   hasClose = true;
   showInTaskBar = false;
   text = $"Compilers Detection";

   CompilerType selectedCompilerType;
   
   //property Array<NamedString> compilerEnvVars
   property CompilerConfig compilerConfig
   {
      get
      {
         //Array<NamedString> result { };
         CompilerConfig result = null;
         if(selectedCompilerType)
         {
            char compilerPath[MAX_LOCATION];
            compilerPath[0] = '\0';
            GetEnvironment(compilerSignatureEnvVars[selectedCompilerType], compilerPath, sizeof(compilerPath));
            if(compilerPath && compilerPath[0] && FileExists(compilerPath).isDirectory)
            {
               PathCat(compilerPath, "vsvars32.bat"); // is this file name constant and this file always present?
               if(FileExists(compilerPath).isFile)
               {
                  File f = FileOpen(compilerPath, read);
                  if(f)
                  {
                     char line[65536];
                     result = MakeDefaultCompiler(selectedCompilerType, false);
                     result.type = selectedCompilerType;
                     if(selectedCompilerType.isVC)
                     {
                        //result.cppCommand = "";
                        //result.ccCommand = "";
                        result.makeCommand = "vcbuild";
                     }
                     while(f.GetLine(line, 65536))
                     {
                        char * var = SearchString(line, 0, "@SET ", false, false);
                        if(var/* == line*/)
                        {
                           char * equal;
                           var = &var[5];
                           equal = strstr(var, "=");
                           if(equal)
                           {
                              char * val = equal + 1;
                              Array<String> dirs = null;
                              equal[0] = '\0';
                              TrimLSpaces(var, var);
                              TrimRSpaces(var, var);
                              if(!strcmpi(var, "VSINSTALLDIR") || !strcmpi(var, "VCINSTALLDIR") || 
                                    !strcmpi(var, "FrameworkDir") || !strcmpi(var, "FrameworkVersion") || !strcmpi(var, "FrameworkSDKDir") || 
                                    !strcmpi(var, "DevEnvDir") || !strcmpi(var, "LIBPATH"))
                              {
                                 result.environmentVars.Add(NamedString { name = CopyString(var), string = CopyString(val) });
                              }
                              else if(!strcmpi(var, "PATH"))
                                 dirs = result.executableDirs;
                              else if(!strcmpi(var, "LIB"))
                                 dirs = result.libraryDirs;
                              else if(!strcmpi(var, "INCLUDE"))
                                 dirs = result.includeDirs;
                              if(dirs)
                              {
                                 byte * tokens[256];
                                 int c, numTokens;
                                 char * refId = new char[strlen(var)+3];
                                 sprintf(refId, "%%%s%%", var);
                                 numTokens = TokenizeWith(val, sizeof(tokens) / sizeof(byte *), tokens, ";", false);
                                 for(c = 0; c < numTokens; c++)
                                 {
                                    if(strcmpi(tokens[c], refId))
                                       dirs.Add(CopyString(tokens[c]));
                                 }
                              }
                           }
                        }
                        else if(!strcmp(line, "@goto end"))
                           break;
                     }
                     delete f;
                  }
               }
            }
         }
         return result;
      }
   }

   Label labelCompilersList { this, position = { 8, 8 }, labeledWindow = compilersList };
   ListBox compilersList
   {
      this, borderStyle = deep, hasVertScroll = true, hasHorzScroll = true;
      // multiSelect = true, selectionColor = unfocusedSelectorColor;
      fullRowSelect = true;
      alwaysHighLight = true;
      
      size = { 180 };
      anchor = Anchor { left = 8, top = 24, right = 8, bottom = 36 };
      text = $"Compilers";

      bool NotifySelect(ListBox listBox, DataRow row, Modifiers mods)
      {
         if(row)
         {
            selectedCompilerType = (CompilerType)row.tag;
            ok.disabled = !selectedCompilerType;
         }
         return true;
      }
   };

   Button ok
   {
      this, isDefault = true, disabled = true, text = $"OK";
      size = { 60 }, anchor = { right = 76, bottom = 8 };
      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {

         Destroy(1);
         return true;
      }
   };
   
   Button
   {
      this, hotKey = escape, text = $"Cancel";
      size = { 60 }, anchor = { right = 8, bottom = 8 };
      NotifyClicked = ButtonCloseDialog;
   };

   bool OnPostCreate()
   {
      CompilerType compilerType;
      char compilerPath[MAX_LOCATION];
      for(compilerType = firstCompilerType; compilerType <= lastCompilerType; compilerType++)
      {
         char * varName = compilerSignatureEnvVars[compilerType];
         if(varName && *varName)
         {
            compilerPath[0] = '\0';
            GetEnvironment(varName, compilerPath, sizeof(compilerPath));
            if(compilerPath && compilerPath[0] && FileExists(compilerPath).isDirectory)
            {
               PathCat(compilerPath, "vsvars32.bat"); // is this file name constant and this file always present?
               if(FileExists(compilerPath).isFile)
               {
                  DataRow row = compilersList.AddString(compilerType.longName);
                  row.tag = (int64)compilerType;
                  // maybe try to read this line in vsvars32.bat instead of hard coded compiler names or not
                  // @echo Setting environment for using Microsoft Visual Studio 2005 x86 tools.
               }
            }
         }
      }
      if(compilersList.rowCount)
         compilersList.SelectRow(compilersList.firstRow);
      return true;
   }
}
