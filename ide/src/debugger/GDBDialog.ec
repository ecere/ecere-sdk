import "ecere"
import "CodeEditor"

static uint TokenizeList(char * string, const uint maxTokens, const char seperator, char * tokens[])
{
   uint count = 0;
   uint level = 0;

   bool quoted = false; //bool escaped = false;
   char * start = null;

   for(; *string && count < maxTokens; string++)
   {
      if(!start)
         start = string;
      if(quoted)
      {
         if(*string == '\"')
            quoted = false;
      }
      else if(*string == '\"')
         quoted = true;
      else if(*string == '{' || *string == '[' || *string == '(' || *string == '<')
         level++;
      else if(*string == '}' || *string == ']' || *string == ')' || *string == '>')
         level--;
      else if(*string == seperator && !level)
      {
         tokens[count++] = start;
         *string = '\0';
         start = null;
      }
   }
   if(start && count < maxTokens)
   {
      tokens[count++] = start;
      *string = '\0';
   }
   return count;
}

// String Unescape Copy
// TOFIX: THIS DOESN'T HANDLE NUMERIC ESCAPE CODES (OCTAL/HEXADECIMAL...)?
// Seems very similar to ReadString in pass15.ec (which also misses numeric escape codes :) )
static void struscpy(char * d, char * s)
{
   int j, k;
   j = k = 0;
   while(s[j])
   {
      switch(s[j])
      {
         case '\\':
            switch(s[++j])
            {
               case 'n':
                  d[k] = '\n';
                  break;
               case 't':
                  d[k] = '\t';
                  break;
               case 'a':
                  d[k] = '\a';
                  break;
               case 'b':
                  d[k] = '\b';
                  break;
               case 'f':
                  d[k] = '\f';
                  break;
               case 'r':
                  d[k] = '\r';
                  break;
               case 'v':
                  d[k] = '\v';
                  break;
               case '\\':
                  d[k] = '\\';
                  break;
               case '\"':
                  d[k] = '\"';
                  break;
               default:
                  d[k] = '\\';
                  d[++k] = s[j];
            }
            break;
         default:
            d[k] = s[j];
      }
      ++j;
      ++k;
   }
   d[k] = s[j];
}

static char * StripBrackets(char * string)
{
   int length = strlen(string);
   if(length > 1 && *string == '[' && string[length - 1] == ']')
   {
      *string = '\0';
      string[length - 1] = '\0';
      return ++string;
   }
   else
      return string;
}

static char * StripCurlies(char * string)
{
   int length = strlen(string);
   if(length > 1 && *string == '{' && string[length - 1] == '}')
   {
      *string = '\0';
      string[length - 1] = '\0';
      return ++string;
   }
   else
      return string;
}

class TempListItem : struct
{
   char * name;
   char * value;
}

static bool TokenizeListItem(char * string, TempListItem item)
{
   char * equal = strstr(string, "=");
   if(equal)
   {
      item.name = string;
      *equal = '\0';
      equal++;
      item.value = equal;
      equal = null;
      return true;
   }
   else
      return false;
}

class Output : struct
{
public:
   Output prev, next;
   char * output;
   class_fixed

   void Free()
   {
      delete output;
   }
}

class Command : struct
{
public:
   Command prev, next;
   char * command;
   OldList outputs;
   class_fixed

   void Free()
   {
      delete command;
      outputs.Free(Output::Free);
   }
}

/*class TreeStackItem : struct
{
   int tokenCount;
   char * tokens[3200];
   DataRow parentRow;
}*/

class TagButton : public Button
{
   const void * tag;
}

class GDBDialog : Window
{
   text = $"GDB Command";
   background = formColor;
   borderStyle = sizable;
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
   stayOnTop = true;
   size = { 800, 600 };
   autoCreate = false;

   Command lastCommand;
   OldList commands;

   Stacker bg
   {
      this, direction = horizontal, gap = 0;
      isActiveClient = true;
      background = darkGray;//formColor
      anchor = { left = 0, top = 0, right = 0, bottom = 0 };
      flipSpring = true;
      flipper = rightCol;
   };

   Stacker leftCol
   {
      bg, this, gap = 4, margin = 4 ;
      isActiveClient = true;
      background = darkGray;
      size = { 200, 100 };
      anchor = { top = 0, bottom = 0 };
      flipSpring = true;
      flipper = history;
   };

   PaneSplitter splitter
   {
      this, leftPane = leftCol, rightPane = rightCol, split = 200;
   };

   Stacker rightCol
   {
      bg, this, gap = 4, margin = 4;
      isActiveClient = true;
      background = darkGray;
      size = { 800, 600 };
      anchor = { top = 0, bottom = 0 };
      flipSpring = true;
      flipper = tree;
   };

   Label lhistory { leftCol, this, position = { 4, 4 }, labeledWindow = history };
   ListBox history
   {
      leftCol, this, borderStyle = deep, hasVertScroll = true, hasHorzScroll = true;
      // selectionColor = unfocusedSelectorColor;
      fullRowSelect = true, alwaysHighLight = true;

      size = { 180 };
      anchor = { left = leftCol.margin, right = leftCol.margin };
      text = $"Command History";

      bool NotifySelect(ListBox listBox, DataRow row, Modifiers mods)
      {
         if(row)
         {
            lastCommand = (Command)row.tag;
            command.contents = lastCommand.command;
            UpdateOutput();
         }
         return true;
      }
   };

   Label commandLabel { rightCol, this, position = { 4, 4 }, labeledWindow = command };
   EditBox command
   {
      rightCol, this, text = $"Command:", size = { 328, 19 }, anchor = { left = rightCol.margin, right = rightCol.margin };

      bool NotifyKeyDown(EditBox editBox, Key key, unichar ch)
      {
         if((SmartKey)key == up || (SmartKey)key == down)
         {
            if(commands.first)
            {
               bool previous = ((SmartKey)key == up);

               if(!lastCommand)
                  lastCommand = previous ? commands.last : commands.first;
               else
                  lastCommand = previous ? lastCommand.prev : lastCommand.next;

               if(lastCommand)
               {
                  command.contents = lastCommand.command;
                  UpdateOutput();
               }
               else
                 lastCommand = previous ? commands.first : commands.last;
            }
         }
         else if((SmartKey)key == enter)
            OnCommand(command.contents);
         return true;
      }
   };

   Stacker toolBar
   {
      rightCol, this, direction = horizontal, gap = 4;
      isActiveClient = true;
      background = darkGray;
      size = { 200, 30 };
      anchor = { left = rightCol.margin, right = rightCol.margin };
   };

   TagButton infoLibs { toolBar, this, text = "libs", tag = "info shared", NotifyClicked = QuickCommandNotifyClicked; };
   TagButton infoPaths { toolBar, this, text = "paths", tag = "-environment-path", NotifyClicked = QuickCommandNotifyClicked; };
   TagButton infoWorkDir { toolBar, this, text = "wd", tag = "-environment-pwd", NotifyClicked = QuickCommandNotifyClicked; };
   TagButton infoDirs { toolBar, this, text = "pths", tag = "-environment-directory", NotifyClicked = QuickCommandNotifyClicked; };
   TagButton infoTemp { toolBar, this, text = "pths", tag = "-environment-temp", NotifyClicked = QuickCommandNotifyClicked; };

   bool QuickCommandNotifyClicked(Button button, int x, int y, Modifiers mods)
   {
      TagButton tagButton = (TagButton)button;
      OnCommand(tagButton.tag);
      return true;
   }

   Label outputLabel { rightCol, this, position = { 4, 4 }, labeledWindow = output };
   EditBox output
   {
      rightCol, this, text = $"Output:", multiLine = true, hasVertScroll = true, hasHorzScroll = true;
      size = { 328, 80 };
      anchor = { left = rightCol.margin, right = rightCol.margin };
      font = { panelFont.faceName, panelFont.size };
   };

   Label treeLabel { rightCol, this, position = { 4, 4 }, labeledWindow = tree };
   ListBox tree
   {
      rightCol, this, text = $"Tree:";
      multiSelect = false, fullRowSelect = false, hasVertScroll = true, hasHorzScroll = true;
      borderStyle = deep, collapseControl = true, treeBranches = true;
      anchor = { left = rightCol.margin, right = rightCol.margin };
      font = { panelFont.faceName, panelFont.size };
   };

   void UpdateOutput()
   {
      Output out;
      output.Clear();
      for(out = lastCommand.outputs.first; out; out = out.next)
      {
         output.AddS(out.output);
         output.AddS("\n");
      }
      UpdateTree();
   }

   void UpdateTree()
   {
      if(lastCommand && lastCommand.outputs.first)
      {
         char * s, * t;
         int i, j, outTksCount, subTksCount;
         char * outTokens[3200], * subTokens[3200];
         DataRow root, frame, row;
         TempListItem item { };
         Output out;

         tree.Clear();
         root = tree.AddString("Output");

         for(out = lastCommand.outputs.first; out; out = out.next)
         {
            if(out.output && out.output[0])
            {
               t = CopyString(out.output);
               s = t;

               switch(s[0])
               {
                  case '^':
                     outTksCount = TokenizeList(s, sizeof(outTokens) / sizeof(char *), ',', outTokens);
                     row = root.AddString(outTokens[0]);
                     if(!strcmp(outTokens[0], "^done"))
                     {
                        for(i = 1; i < outTksCount; i++)
                        {
                           if(TokenizeListItem(outTokens[i], item))
                           {
                              if(!strcmp(item.name, "bkpt"))
                              {
                                 row = root.AddString(item.name);
                                 item.value = StripCurlies(item.value);
                                 subTksCount = TokenizeList(item.value, sizeof(subTokens) / sizeof(char *), ',', subTokens);
                                 for(j = 0; j < subTksCount; j++)
                                 {
                                    if(TokenizeListItem(subTokens[j], item))
                                       UpdateTreeValue(item, row);
                                    else
                                       row.AddString("Bad");
                                 }
                              }
                              else if(!strcmp(item.name, "stack"))
                              {
                                 row = root.AddString(item.name);
                                 item.value = StripBrackets(item.value);
                                 subTksCount = TokenizeList(item.value, sizeof(subTokens) / sizeof(char *), ',', subTokens);
                                 for(j = 0; j < subTksCount; j++)
                                 {
                                    if(TokenizeListItem(subTokens[j], item))
                                    {
                                       frame = row.AddString(item.name);
                                       if(!strcmp(item.name, "frame"))
                                          UpdateTreeFrame(item, frame);
                                       else
                                          UpdateTreeValue(item, row);
                                    }
                                    else
                                       row.AddString("Bad");
                                 }
                              }
                              else if(!strcmp(item.name, "path"))
                              {
                                 StripQuotes(item.value, item.value);
                                 subTksCount = TokenizeList(item.value, sizeof(subTokens) / sizeof(char *), ':', subTokens);
                                 for(j = 0; j < subTksCount; j++)
                                 {
                                    row = root.AddString(subTokens[j]);
                                 }
                              }
                              else
                                 UpdateTreeValue(item, row);
                           }
                           else
                              row.AddString("Bad");
                        }
                     }
                     else if(!strcmp(outTokens[0], "^running"))
                     {
                        if(outTksCount > 1)
                           row.AddString(outTokens[1]);
                     }
                     else if(!strcmp(outTokens[0], "^exit"))
                     {
                        if(outTksCount > 1)
                           row.AddString(outTokens[1]);
                     }
                     else if(!strcmp(outTokens[0], "^error"))
                     {
                        if(outTksCount > 1)
                           row.AddString(outTokens[1]);
                     }
                     else
                     {
                        row = row.AddString("Unknown output");
                        if(outTksCount > 1)
                           row.AddString(outTokens[1]);
                     }
                     break;
                  case '+':
                     outTksCount = TokenizeList(s, sizeof(outTokens) / sizeof(char *), ',', outTokens);
                     row = root.AddString(outTokens[0]);
                     {
                        row = root.AddString("Unknown status-async-output");
                        row.AddString(s);
                     }
                     break;
                  case '=':
                     outTksCount = TokenizeList(s, sizeof(outTokens) / sizeof(char *), ',', outTokens);
                     row = root.AddString(outTokens[0]);
                     //if(!strcmp(outTokens[0], "=thread-group-created")) //=thread-group-created,id="7611"
                     //else if(!strcmp(outTokens[0], "=thread-created")) //=thread-created,id="1",group-id="7611"
                     //else if(!strcmp(outTokens[0], "=library-loaded")) //=library-loaded,id="/lib/ld-linux.so.2",target-name="/lib/ld-linux.so.2",host-name="/lib/ld-linux.so.2",symbols-loaded="0"
                     if(!strcmp(outTokens[0], "=thread-group-created") || !strcmp(outTokens[0], "=thread-created") || !strcmp(outTokens[0], "=library-loaded"))
                     {
                        for(i = 1; i < outTksCount; i++)
                           row.AddString(outTokens[i]);
                     }
                     else
                     {
                        row = root.AddString("Unknown notify-async-output");
                        row.AddString(s);
                     }
                     break;
                  case '*':
                     outTksCount = TokenizeList(s, sizeof(outTokens) / sizeof(char *), ',', outTokens);
                     row = root.AddString(outTokens[0]);
                     if(!strcmp(outTokens[0], "*stopped"))
                     {
                        for(i = 1; i < outTksCount; i++)
                        {
                           if(TokenizeListItem(outTokens[i], item))
                           {
                              if(!strcmp(item.name, "frame"))
                              {
                                 frame = row.AddString(item.name);
                                 UpdateTreeFrame(item, frame);
                              }
                              UpdateTreeValue(item, row);
                           }
                           else
                              row.AddString("Bad");
                        }
                     }
                     else
                     {
                        row = root.AddString("Unknown exec-async-output");
                        if(outTksCount > 1)
                           row.AddString(outTokens[1]);
                     }
                     break;
                  case '(':
                     if(!strcmpi(s, "(gdb) "))
                     {
                        root.AddString(s);
                     }
                     else
                     {
                        row = root.AddString("Unknown prompt");
                        row.AddString(s);
                     }
                     break;
                  case '~':
                     s++;
                     StripQuotes(s, s);
                     if(TrimEscapedNewLineChar(s))
                     {
                        s = StripBrackets(s);
                        if(!strncmp(s, "Executable and object file path: ", 33))
                        {
                           s += 33;
                           outTksCount = TokenizeList(s, sizeof(outTokens) / sizeof(char *), ':', outTokens);
                           for(i = 0; i < outTksCount; i++)
                           {
                              row = root.AddString(outTokens[i]);
                           }
                        }
                        else
                           root.AddString(s);
                     }
                     break;
                  case '&':
                     s++;
                     StripQuotes(s, s);
                     if(TrimEscapedNewLineChar(s))
                     {
                        struscpy(s, s);
                        root.AddString(s);
                     }
                     break;
                  default:
                     row = root.AddString("Unknown output");
                     row.AddString(s);
               }

               delete t;
            }
         }
         delete item;
      }
   }

   void UpdateTreeValue(TempListItem item, DataRow row)
   {
      char * string;
      StripQuotes(item.value, item.value);
      string = new char[strlen(item.name) + strlen(item.value) + 3];
      sprintf(string, "%s: %s", item.name, item.value);
      row.AddString(string);
      delete string;
   }

   void UpdateTreeFrame(TempListItem item, DataRow frame)
   {
      int k, l, m, frameTksCount, argsTksCount, mTksCount;
      char * frameTokens[3200], * argsTokens[3200], * mTokens[3200];

      item.value = StripCurlies(item.value);
      frameTksCount = TokenizeList(item.value, sizeof(frameTokens) / sizeof(char *), ',', frameTokens);
      for(k = 0; k < frameTksCount; k++)
      {
         if(TokenizeListItem(frameTokens[k], item))
         {
            if(!strcmp(item.name, "level"))
            {
               char * string;
               StripQuotes(item.value, item.value);
               string = new char[strlen(item.value) + strlen(frame.string) + 7];
               // WTH do I need to do in order to print with leading zeros
               sprintf(string, "%d %s", atoi(item.value), frame.string);
               frame.string = string;
               delete string;
            }
            else if(!strcmp(item.name, "addr"))
            {
               char * string;
               StripQuotes(item.value, item.value);
               string = new char[strlen(item.value) + strlen(frame.string) + 4];
               sprintf(string, "%s (%s)", frame.string, item.value);
               frame.string = string;
               delete string;
            }
            else if(!strcmp(item.name, "args"))
            {
               DataRow args, arg;
               args = frame.AddString("args");
               item.value = StripBrackets(item.value);
               argsTksCount = TokenizeList(item.value, sizeof(argsTokens) / sizeof(char *), ',', argsTokens);
               for(l = 0; l < argsTksCount; l++)
               {
                  arg = args.AddString("arg");
                  argsTokens[l] = StripCurlies(argsTokens[l]);
                  mTksCount = TokenizeList(argsTokens[l], sizeof(mTokens) / sizeof(char *), ',', mTokens);
                  for(m = 0; m < mTksCount; m++)
                  {
                     if(TokenizeListItem(mTokens[m], item))
                     {
                        if(!strcmp(item.name, "name"))
                        {
                           char * string;
                           StripQuotes(item.value, item.value);
                           string = new char[strlen(arg.string) + strlen(item.value) + 2];
                           sprintf(string, "%s %s", arg.string, item.value);
                           arg.string = string;
                           delete string;
                        }
                        else if(!strcmp(item.name, "value"))
                        {
                           char * string;
                           StripQuotes(item.value, item.value);
                           string = new char[strlen(arg.string) + strlen(item.value) + 4];
                           sprintf(string, "%s = %s", arg.string, item.value);
                           arg.string = string;
                           delete string;
                        }
                        else
                           UpdateTreeValue(item, args);
                     }
                     else
                        frame.AddString("Bad");
                  }
               }
            }
            else
               UpdateTreeValue(item, frame);
         }
         else
            frame.AddString("Bad");
      }
   }

   int TrimEscapedNewLineChar(char * s)
   {
      int len = strlen(s);
      if(s[len - 1] == 'n' && s[len - 2] == '\\')
      {
         s[len - 2] = '\0';
         len -= 2;
      }
      return len;
   }

   void AddCommand(char * string)
   {
      if(string && strlen(string))
      {
         Command cmd = Command { command = CopyString(string) };
         commands.Add(cmd);
         history.AddString(string).tag = (uint64)cmd;
         lastCommand = commands.last;

         if(created)
         {
            command.contents = string;
            command.SelectAll();
         }
      }
   }

   void AddOutput(char * string)
   {
      if(string && strlen(string))
      {
         Command last = commands.last;
         if(last)
         {
            last.outputs.Add(Output { output = CopyString(string) });
            if(last == lastCommand)
               UpdateOutput();
         }
      }
   }

   virtual void OnCommand(const char * string);

   void Show()
   {
      if(!created)
         Create();
      else
         Activate();
   }

   bool OnPostCreate()
   {
      if(lastCommand)
      {
         command.contents = lastCommand.command;
         UpdateOutput();
      }
      return true;
   }

   ~GDBDialog()
   {
      commands.Free(Command::Free);
   }
}
