#define IMPORT_STATIC
import IMPORT_STATIC "ecere"
import IMPORT_STATIC "EDA"
import "Serveda"

import "commonServeda"

class ServedaConfiguration
{
   String driver;
   String host; // host also used for path for certain drivers (SQLite, etc)
   String port;
   String user;
   String pass;
   //String locator;

   // users and passords <-- todo
}

ServedaConfiguration cfg { driver = "SQLite", host = "" };

DataSource ds { };

class ServerDisplay : Window
{
   caption = $"Serveda";
   background = formColor;
   borderStyle = sizable;
   minClientSize = { 340, 200 };
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
   clientSize = { 640, 460 };
   tabCycle = true;

   EditBox log { this, anchor = { left = 4, top = 4, right = 4, bottom = 4 }, multiLine = true };

   bool OnPostCreate()
   {
      ds.driver = cfg.driver;
      //ds.locator = cfg.locator;
      ds.host = cfg.host;
      ds.port = cfg.port;
      ds.user = cfg.user;
      ds.pass = cfg.pass;
      if(ds.Connect())
      {
         log.PutS(" . data source configured\n");
         {
            Array<const String> a = ds.databases;
            for(d : a)
            {
               log.PutS("    - ");
               log.PutS(d);
               log.PutS("\n");
            }
         }
         service.Start();
         log.PutS(" . service started\n");
      }
      else
      {
         log.PutS(" ! error configuring the data source\n");
      }
      return true;
   }
}

ServerDisplay display { };

DCOMService service { port = servedaPort };
