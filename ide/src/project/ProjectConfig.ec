#ifndef MAKEFILE_GENERATOR
import "ide"
#endif

import "Project"

enum DirExpressionType { unknown, targetDir, intermediateObjectsDir };  // "type" is not right

class DirExpression : struct
{
   char * dir;
   DirExpressionType type;

   ~DirExpression()
   {
      delete dir;
   }

   property char * dir
   {
      get
      {
         return dir ? dir : "";
      }
      set
      {
         delete dir;
         if(value && value[0])
            dir = CopyString(value);
         else
            dir = CopyString("");
      }
   }

   void Evaluate(char * expression, Project project, CompilerConfig compiler, ProjectConfig config)
   {
      int len;
      char * expr = expression;
      if(!expr || !expr[0])
      {
         char buffer[MAX_LOCATION];
         if(ideSettings)
         {
         if(type == targetDir)
            expr = ideSettings.projectDefaultTargetDir;
         else if(type == intermediateObjectsDir)
            expr = ideSettings.projectDefaultIntermediateObjDir;
         }
         if(!expr || !expr[0])
            expr = defaultObjDirExpression;
      }
      if((len = strlen(expr)))
      {
         int c, d;
         char * configName = config && config.name && config.name[0] ? config.name : "Common";
         char * projectName = project.name ? project.name : "";
         char * moduleName = project.moduleName ? project.moduleName : "";
         char * compilerName = (compiler && compiler.name) ? compiler.name : defaultCompilerName;
         char * targetPlatformName = compiler && compiler.targetPlatform ? compiler.targetPlatform : "";
         char buffer[MAX_LOCATION];
         for(c = 0, d = 0; c < len; c++)
         {
            if(expr[c] == '$' && c < len - 1 && expr[c + 1] == '(')
            {
               int i;
               for(i = c + 2; i < len; i++)
               {
                  if(expr[i] == ')')
                  {
                     int n = i - c - 2;
                     if(n > 0)
                     {
                        if(!strnicmp(&expr[c + 2], "Config", n) || !strnicmp(&expr[c + 2], "Config", n))
                        {
                           buffer[d] = '\0';
                           strcat(buffer, configName);
                           CamelCase(&buffer[d]);
                           d += strlen(configName);
                           c = i;
                        }
                        else if(!strnicmp(&expr[c + 2], "Module", n) || !strnicmp(&expr[c + 2], "Project", n))
                        {
                           buffer[d] = '\0';
                           strcat(buffer, moduleName);
                           //CamelCase(&buffer[d]);
                           d += strlen(moduleName);
                           c = i;
                        }
                        else if(!strnicmp(&expr[c + 2], "Platform", n))
                        {
                           buffer[d] = '\0';
                           strcat(buffer, targetPlatformName);
                           CamelCase(&buffer[d]);
                           d += strlen(targetPlatformName);
                           c = i;
                        }
                        else if(!strnicmp(&expr[c + 2], "Compiler", n))
                        {
                           buffer[d] = '\0';
                           strcat(buffer, compilerName);
                           CamelCase(&buffer[d]);
                           d += strlen(compilerName);
                           c = i;
                        }
                        else if(!strnicmp(&expr[c + 2], "Debug_Suffix", n))
                        {
                           // We don't support .debug from the IDE yet...
                           c = i;
                        }
                        else if(!strnicmp(&expr[c + 2], "Compiler_Suffix", n))
                        {
                           if(compilerName[0] && strcmpi(compilerName, "default"))
                           {
                              buffer[d] = '.';
                              buffer[d+1] = '\0';
                              strcat(buffer, compilerName);
                              CamelCase(&buffer[d]);
                              d += strlen(compilerName)+1;
                              c = i;
                           }
                           else
                              c = i;
                        }
                        else
                        {
                           buffer[d++] = expr[c];
                        }
                     }
                     else
                     {
                        buffer[d++] = expr[c];
                     }
                     i = len - 1;
                     break;
                  }
                  else if(expr[i] == '\\' || expr[i] == '/')
                  {
                     buffer[d++] = '\0';
                     strncat(buffer, &expr[i], i - c);
                     d += i - c;
                     c = i;
                     i = len - 1;
                     break;
                  }
               }
               if(i == len)
                  buffer[d++] = expr[c];
            }
            else
            {
               buffer[d++] = expr[c];
            }
         }
         buffer[d] = '\0';
         if(dir && strcmp(buffer, dir))
            delete dir;
         if(!dir)
            dir = CopyString(buffer);
      }
      else
      {
         delete dir;
         dir = CopyString("");
      }
   }
}

public enum TargetTypes { unset, executable, sharedLibrary, staticLibrary };
public enum OptimizationStrategy { unset, none, speed, size };
public enum WarningsOption { unset, normal, none, all }; // TOCHECK: More options?
public enum BuildBitDepth { all, bits32, bits64 };

Array<String> CopyArrayString(Array<String> array)
{
   Array<String> copy = null;
   if(array)
   {
      copy = { };
      for(s : array) copy.Add(CopyString(s));
   }
   return copy;
}

public class ProjectOptions
{
public:
   // Compiler Options
   property SetBool allWarnings
   {
      set
      {
         if(value == true)
            warnings = all;
      }
   }
   WarningsOption warnings;
   SetBool debug;
   SetBool memoryGuard;
   SetBool profile;
   SetBool noLineNumbers;
   OptimizationStrategy optimization;
   Array<String> preprocessorDefinitions;
   property Array<String> includeDirs
   {
      set
      {
         if(includeDirs)
            includeDirs.Free();
         if(value && value.count)
         {
            if(!includeDirs)
               includeDirs = { };
            for(s : value)
               includeDirs.Add(CopyValidateMakefilePath(s));
            value.Free();
            delete value;
         }
         else
            delete includeDirs;
      }
      get { return includeDirs; }
      isset { return  includeDirs && includeDirs.count; }
   }
   String defaultNameSpace;
   SetBool strictNameSpaces;

   // Linker Options
   TargetTypes targetType;
   // NOTE: The JSON Parser deletes strings after setting a String property, so we do a copy here.
   //       (This behavior is different from Objects (class instances) values which are not deleted)
   //       Code calling these properties should *NOT* use CopyString().
   property char * targetFileName
   {
      set { delete targetFileName; if(value && value[0]) targetFileName = CopyValidateMakefilePath(value); }
      get { return targetFileName; }
      isset { return targetFileName && targetFileName[0]; }
   }
   property char * targetDirectory
   {
      set { delete targetDirectory; if(value /*&& value[0]*/) targetDirectory = CopyValidateMakefilePath(value); }
      get { return targetDirectory; }
      isset { return targetDirectory != null/*&& targetDirectory[0]*/; }
   }
   property char * objectsDirectory
   {
      set { delete objectsDirectory; if(value /*&& value[0]*/) objectsDirectory = CopyValidateMakefilePath(value); }
      get { return objectsDirectory; }
      isset { return objectsDirectory != null/*&& objectsDirectory[0]*/; }
   }
   Array<String> libraries;
   Array<String> linkerOptions;
   property Array<String> libraryDirs
   {
      set
      {
         if(libraryDirs)
            libraryDirs.Free();
         if(value && value.count)
         {
            if(!libraryDirs)
               libraryDirs = { };
            for(s : value)
               libraryDirs.Add(CopyValidateMakefilePath(s));
            value.Free(); // why do I have to do this here? it's a property, shouldn't json deal with this?
            delete value;
         }
         else
            delete libraryDirs;
      }
      get { return libraryDirs; }
      isset { return  libraryDirs && libraryDirs.count; }
   }
   SetBool console;
   SetBool compress;

   SetBool excludeFromBuild;
   BuildBitDepth buildBitDepth;

   property Array<String> prebuildCommands
   {
      set
      {
         if(prebuildCommands)
            prebuildCommands.Free();
         if(value && value.count)
         {
            if(!prebuildCommands)
               prebuildCommands = { };
            for(s : value)
               prebuildCommands.Add(CopyValidateMakefilePath(s));
            value.Free();
            delete value;
         }
         else
            delete prebuildCommands;
      }
      get { return prebuildCommands; }
      isset { return  prebuildCommands && prebuildCommands.count; }
   }
   property Array<String> postbuildCommands
   {
      set
      {
         if(postbuildCommands)
            postbuildCommands.Free();
         if(value && value.count)
         {
            if(!postbuildCommands)
               postbuildCommands = { };
            for(s : value)
               postbuildCommands.Add(CopyValidateMakefilePath(s));
            value.Free();
            delete value;
         }
         else
            delete postbuildCommands;
      }
      get { return postbuildCommands; }
      isset { return  postbuildCommands && postbuildCommands.count; }
   }

   ProjectOptions Copy()
   {
      // TODO: We'll want some solution so that we can use OnCopy for copying containers (Array<String>)
      return
      {
         warnings = warnings,
         debug = debug,
         memoryGuard = memoryGuard,
         profile = profile,
         noLineNumbers = noLineNumbers;
         optimization = optimization,
         defaultNameSpace = CopyString(defaultNameSpace),
         strictNameSpaces = strictNameSpaces,
         targetType = targetType,
         targetFileName = /*CopyString(*/targetFileName/*)*/,
         targetDirectory = /*CopyString(*/targetDirectory/*)*/,
         objectsDirectory = /*CopyString(*/objectsDirectory/*)*/,
         console = console,
         compress = compress,
         excludeFromBuild = excludeFromBuild,
         preprocessorDefinitions = CopyArrayString(preprocessorDefinitions),
         includeDirs = CopyArrayString(includeDirs),
         libraries = CopyArrayString(libraries),
         linkerOptions = CopyArrayString(linkerOptions),
         libraryDirs = CopyArrayString(libraryDirs),
         prebuildCommands = CopyArrayString(prebuildCommands),
         postbuildCommands = CopyArrayString(postbuildCommands)
      };
   }

   ~ProjectOptions()
   {
      if(preprocessorDefinitions) { preprocessorDefinitions.Free(); delete preprocessorDefinitions; }
      if(includeDirs) { includeDirs.Free(); delete includeDirs; }
      delete defaultNameSpace;
      delete targetFileName;
      delete targetDirectory;
      delete objectsDirectory;
      if(libraries) { libraries.Free(); delete libraries; }
      if(linkerOptions) { linkerOptions.Free(); delete linkerOptions; }
      if(libraryDirs) { libraryDirs.Free(); delete libraryDirs; }
      if(prebuildCommands) { prebuildCommands.Free(); delete prebuildCommands; }
      if(postbuildCommands) { postbuildCommands.Free(); delete postbuildCommands; }
   }
private:
   Array<String> includeDirs;
   String targetFileName;
   String targetDirectory;
   String objectsDirectory;
   Array<String> libraryDirs;
   Array<String> prebuildCommands;
   Array<String> postbuildCommands;

   property bool isEmpty
   {
      get
      {
         if(warnings == unset &&
            debug == unset &&
            memoryGuard == unset &&
            profile == unset &&
            noLineNumbers == unset &&
            optimization == unset &&
            !preprocessorDefinitions &&
            (!includeDirs || !includeDirs.count) &&
            !defaultNameSpace &&
            strictNameSpaces == unset &&
            targetType == unset &&
            !targetFileName &&
            !targetDirectory &&
            !objectsDirectory &&
            !libraries &&
            !linkerOptions &&
            (!libraryDirs || !libraryDirs.count) &&
            console == unset &&
            compress == unset &&
            excludeFromBuild == unset &&
            (!prebuildCommands || !prebuildCommands.count) &&
            (!postbuildCommands || !postbuildCommands.count) )
            return true;
         return false;          
      }
   }
}

public class PlatformOptions
{
public:
   String name;
   property ProjectOptions options { get { return options; } set { options = value; } isset { return options && !options.isEmpty; } }

   ~PlatformOptions()
   {
      delete name;
      delete options;
   }

   PlatformOptions Copy()
   {
      return
      {
         CopyString(name),
         options ? options.Copy() : null
      };
   }
private:
   ProjectOptions options;
}

class ProjectConfig : struct
{
public:
   String name;
   property ProjectOptions options { get { return options; } set { options = value; } isset { return options && !options.isEmpty; } }
   property Array<PlatformOptions> platforms
   {
      get { return platforms; }
      set
      {
         if(platforms) { platforms.Free(); delete platforms; }
         if(value)
         {
            List<PlatformOptions> empty { };
            Iterator<PlatformOptions> it { value };
            platforms = value;
            for(p : platforms; !p.options || p.options.isEmpty) empty.Add(p);
            for(p : empty; it.Find(p)) platforms.Delete(it.pointer);
            delete empty;
         }
      }
      isset
      {
         if(platforms)
         {
            for(p : platforms)
            {
               if(p.options && !p.options.isEmpty)
                  return true;
            }
         }
         return false;
      }
   }

private:
   ProjectOptions options;
   bool makingModified;
   bool compilingModified, linkingModified, symbolGenModified;
   Array<PlatformOptions> platforms;

   ~ProjectConfig()
   {
      // Configuration
      delete name;
      delete options;
      if(platforms) { platforms.Free(); delete platforms; }
   }

   ProjectConfig Copy()
   {
      Array<PlatformOptions> platforms = null;
      if(this.platforms)
      {
         platforms = { };
         for(p : this.platforms)
         {
            platforms.Add(p.Copy());
         }
      }
      return
      {
         CopyString(name),
         options ? options.Copy() : null,
         platforms
      };
   }
}
