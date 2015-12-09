import "GlobalAppSettings"
import "JSON"

public class JSONGlobalSettings : GlobalSettingsDriver
{
   class_property(name) = "JSON";

public:
   SettingsIOResult ::Load(File f, GlobalSettings globalSettings)
   {
      SettingsIOResult result = error;
      //if(globalSettings.data)
      {
         JSONParser parser { f = f };
         JSONResult jsonResult;
         subclass(GlobalSettingsData) dataClass = globalSettings.dataClass;
         if(!dataClass && globalSettings.data)
            dataClass = (subclass(GlobalSettingsData))globalSettings.data._class;
         //incref dataBackup;
         //incref dataBackup;
         jsonResult = parser.GetObject(dataClass, &globalSettings.data);
         if(globalSettings.data)
         {
            if(globalSettings.dataOwner)
            {
               delete *globalSettings.dataOwner;
               *globalSettings.dataOwner = globalSettings.data;
            }
            result = success;
         }
         else if(jsonResult == syntaxError || jsonResult == noItem)
         {
            delete globalSettings.data;
            globalSettings.data = *globalSettings.dataOwner;
            result = fileNotCompatibleWithDriver;
         }
         delete parser;
      }
      return result;
   }

   SettingsIOResult ::Save(File f, GlobalSettings globalSettings)
   {
      SettingsIOResult result = error;
      if(globalSettings && WriteJSONObject(f, globalSettings.data._class, globalSettings.data, 0, false))
         result = success;
      return result;
   }
}
