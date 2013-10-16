default:

#ifdef __WIN32__
#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <stdio.h>
//#include <tchar.h>
//#include <strsafe.h>
//#include <tlhelp32.h>
#else
extern char **environ;
#endif

#if 0
#define BUFSIZE 4096
    TCHAR chNewEnv[BUFSIZE];
    LPTSTR lpszCurrentVariable;
    DWORD dwFlags=0;
    TCHAR szAppName[]=TEXT("ex3.exe");
    STARTUPINFO si;
    PROCESS_INFORMATION pi;
    BOOL fSuccess;
    // Copy environment strings into an environment block.
    lpszCurrentVariable = (LPTSTR) chNewEnv;
    if(FAILED(StringCchCopy(lpszCurrentVariable, BUFSIZE, TEXT("MySetting=A"))))
    {
        printf("String copy failed\n");
        return FALSE;
    }
    lpszCurrentVariable += lstrlen(lpszCurrentVariable) + 1;
    if(FAILED(StringCchCopy(lpszCurrentVariable, BUFSIZE, TEXT("MyVersion=2"))))
    {
        printf("String copy failed\n");
        return FALSE;
    }
    // Terminate the block with a NULL byte.
    lpszCurrentVariable += lstrlen(lpszCurrentVariable) + 1;
    *lpszCurrentVariable = (TCHAR)0;
    // Create the child process, specifying a new environment block.
    SecureZeroMemory(&si, sizeof(STARTUPINFO));
    si.cb = sizeof(STARTUPINFO);
#ifdef UNICODE
    dwFlags = CREATE_UNICODE_ENVIRONMENT;
#endif
    fSuccess = CreateProcess(szAppName, NULL, NULL, NULL, TRUE, dwFlags,
        (LPVOID) chNewEnv,   // new environment block
        NULL, &si, &pi);
    if(!fSuccess)
    {
        printf("CreateProcess failed (%d)\n", GetLastError());
        return FALSE;
    }
    WaitForSingleObject(pi.hProcess, INFINITE);
    return TRUE;
}
#endif

private:

import "ecere"

public class SystemEnvironment
{
   property char * { get { return (char *)env; } } // This does not work: property char ** { get { return env; } }
private:                                           // unresolved identifier __ecereProp_SystemEnvironment_char__PTR__PTR
   char ** env;
   ~SystemEnvironment()
   {
#ifndef __WIN32__
      char ** p = env;
      for(; *p; *p++)
         delete *p;
#endif
      delete env;
   }
}

void PrintCurrentEnvironment(char * headerLine)
{
   EnvironmentVariables env { };
   env.AddCurrentEnvVars();
   if(headerLine)
      PrintLn(headerLine);
   env.Print();
   env.Free();
   delete env;
}

public class EnvironmentVariables : Map<String, String>
{
   void Print()
   {
      if(count)
      {
         MapNode<String, String> node;
         for(node = this.root.minimum; node; node = node.next)
            PrintLn(node.key, "=", node.value);
      }
      else
         PrintLn("Empty environment!");
   }

   bool AddCurrentEnvVars()
   {
      // TODO: Test char type and unicode correct
#ifndef __WIN32__
      char ** env = environ;
#else
      char * env = GetEnvironmentStrings(); // char * vs LPTCH // TODO: Call GetEnvironmentStringsW function #ifdef UNICODE or something
#endif
      if(env)
      {
#ifndef __WIN32__
         char * var = *env;
         for(; var; *env++, var = *env)
#else
         char * var = env; // char * vs LPTSTR
         for(; *var; var += strlen(var) + 1) // strlen vs lstrlen
#endif
         {
            char * equal = strstr(var, "=");
            if(equal && equal != var)
            {
               // TODO: check this again, delete varName or not? this[CopyString(varName)] or not?
               int nameLen = equal-var;
               char * varName = new char[nameLen+1];
               char * varVal = equal+1;
               char * oldVar;
               strncpy(varName, var, nameLen);
               varName[nameLen] = '\0';
               oldVar = this[varName];
               //*equal = '\0';
               delete oldVar;
               this[varName] = CopyString(varVal);
               //delete varName;
            }
         }
#ifdef __WIN32__
         FreeEnvironmentStrings(env);
#endif
      }
      return (bool)env;
   }

   void Merge(EnvironmentVariables vars, bool merge)
   {
      MapNode<String, String> node;
      for(node = vars.root.minimum; node; node = node.next)
      {
         if(merge)
            MergeVariableValue(node.key, node.value);
         else
            ReplaceVariableValue(node.key, node.value);
      }
   }

   void ReplaceVariableValue(char * varName, char * varValue)
   {
      char * oldValue = this[varName];
      delete oldValue;
      this[varName] = CopyString(varValue);
   }

   void MergeVariableValue(char * varName, char * varValue)
   {
      int dollarStyleRefIdLen, percentStyleRefIdLen;
      char * dollarStyleRefId, * dollarStyleRef, * percentStyleRefId, * percentStyleRef;
      char * oldValue = CopyString(this[varName]);

      dollarStyleRefIdLen = strlen(varName)+3;
      dollarStyleRefId = new char[dollarStyleRefIdLen+1];
      sprintf(dollarStyleRefId, "$(%s)", varName);
      dollarStyleRef = strstr(varValue, dollarStyleRefId);

      percentStyleRefIdLen = strlen(varName)+2;
      percentStyleRefId = new char[percentStyleRefIdLen+1];
      sprintf(percentStyleRefId, "%%%s%%", varName);
      percentStyleRef = strstr(varValue, percentStyleRefId);

      // TODO: Make this a loop to replace multiple instances of both dollar and percent style references
      if(dollarStyleRef)
      {
         int beforeLen, oldValLen, afterLen;
         char * mergedValue;
         beforeLen = dollarStyleRef - varValue;
         dollarStyleRef += dollarStyleRefIdLen;
         afterLen = strlen(dollarStyleRef);
         oldValLen = oldValue ? strlen(oldValue) : 0;
         mergedValue = new char[beforeLen + oldValLen + afterLen + 1];
         strncpy(mergedValue, varValue, beforeLen);
         mergedValue[beforeLen] = '\0';
         if(oldValue)
            strcat(mergedValue, oldValue);
         strcat(mergedValue, dollarStyleRef);
         this[varName] = mergedValue;
      }
      else if(percentStyleRef)
      {
         int beforeLen, oldValLen, afterLen;
         char * mergedValue;
         beforeLen = percentStyleRef - varValue;
         percentStyleRef += percentStyleRefIdLen;
         afterLen = strlen(percentStyleRef);
         oldValLen = oldValue ? strlen(oldValue) : 0;
         mergedValue = new char[beforeLen + oldValLen + afterLen + 1];
         strncpy(mergedValue, varValue, beforeLen);
         mergedValue[beforeLen] = '\0';
         if(oldValue)
            strcat(mergedValue, oldValue);
         strcat(mergedValue, percentStyleRef);
         this[varName] = mergedValue;
      }
      else
         this[varName] = CopyString(varValue);

      delete dollarStyleRefId;
      delete percentStyleRefId;
      delete oldValue;
   }

   void SetAll()
   {
      MapNode<String, String> node;
      for(node = this.root.minimum; node; node = node.next)
         SetEnvironment(node.key, node.value);
   }

   SystemEnvironment GetSystemEnvStrings(int * bufferSize)
   {
      MapNode<String, String> node;
      SystemEnvironment output { };
#ifndef __WIN32__
      char ** env = output.env = new char * [this.count+1];
      for(node = this.root.minimum; node; node = node.next)
      {
         *env = new char [strlen(node.key) + strlen(node.value) + 2];
         sprintf(*env, "%s=%s", node.key, node.value);
         *env++;
      }
      *env = null;
#else
      // TODO: Make sure len vs byte len, unicode and all that is correct
      int len = 0;
      char * string;
      for(node = this.root.minimum; node; node = node.next)
         len += strlen(node.key) + strlen(node.value) + 2;
      len++;
      if(bufferSize)
         *bufferSize = len;
      output.env = (char **)new char[len];
      string = (char *)output.env;
      for(node = this.root.minimum; node; node = node.next)
      {
         sprintf(string, "%s=%s", node.key, node.value);
         string += strlen(node.key) + strlen(node.value) + 2;
      }
      *string = '\0';
#endif
      return output;
   }

   ~EnvironmentVariables()
   {
      for(string : this)
         delete string;
   }
}
