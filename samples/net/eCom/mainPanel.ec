import "ecere"
import "connection"

define ECOMMUNICATOR_PORT = 3113;//7778;//

class eComApp;

define app = (eComApp) __thisModule;

class ConnectionSocket;
class Connection;
class eComService;

class MainPanel : Window
{
   eComService service { mainPanel = this };
   OldList connections;

   background = activeBorder, tabCycle = true;
   borderStyle = sizable, hasClose = true, hasMinimize = true, text = app.appName, size = Size { 500, 320 }, minClientSize = Size { 320, 200 };

   Button connect
   {
      this, isDefault = true, text = "Connect", position = Point { 220, 30 }, size = Size { 80, 0 }, hotKey = altC;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         ConnectionSocket { mainPanel = this }.Connect(address.contents, service.port);
         return true;
      }
   };
   Button host
   {
      this, text = "Host", position = Point { 220, 60 }, size = Size { 80, 0 }, hotKey = altH;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         if(service.Start())
         {
            log.End();
            log.Printf("\nHosting on port %d", service.port);
            host.disabled = true;
            stopHosting.disabled = false;
         }
         return true;
      }
   };
   Button localHost
   {
      this, text = "Local Host", position = Point { 320, 30 }, size = Size { 80, 0 }, hotKey = altL;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         char hostName[256], address[64];
         GetHostName(hostName, sizeof(hostName));
         GetAddressFromName(hostName, address);
         log.End();
         log.Printf("\nLocal Host: %s => %s", hostName, address);
         return true;
      }
   };
   Button stopHosting
   {
       this, text = "Stop", position = Point { 320, 60 }, size = Size { 80, 0 }, hotKey = altS;

       bool NotifyClicked(Button button, int x, int y, Modifiers mods)
       {
         service.Stop();
         stopHosting.disabled = true;
         host.disabled = false;
         return true;
       }
   };

   EditBox log
   {
      this, readOnly = true, multiLine = true, autoEmpty = true, hasVertScroll = true, hasHorzScroll = true, inactive = true,
      text = "Communication Log",
      anchor = Anchor { left = 10, top = 100, right = 10, bottom = 30 },
      contents = app.appName
   };
   Label logLabel
   {
      this, position = Point { 10, 80 }, labeledWindow = log
   };
   EditBox nameBox
   {
      this, text = "Name", contents = "redj", position = Point { 50, 55 }, size = Size { 160,20 };

      void NotifyUpdate(EditBox editBox)
      {
         const char * string = nameBox.contents;
         OldLink link;
         for(link = connections.first; link; link = link.next)
            ((Connection)link.data).SendName(string);
      }
   };
   Label nameLabel
   {
      this, position = Point { 10, 55 }, labeledWindow = nameBox
   };

   Button clear
   {
      this, text = "Clear", anchor = Anchor { left = 10, bottom = 5 }, size = Size { 80, 0 }, hotKey = altR;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         log.Clear();
         return true;
      }
   };
   Button exit
   {
      this, text = "Exit", size = Size { 80, 0 }, anchor = Anchor { right = 10, bottom = 5 }, hotKey = altX;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         Destroy(0);
         return true;
      }
   };

   EditBox address
   {
      this, contents = "localhost", hasHorzScroll = true, text = "Internet Address", position = Point { 10, 30 }, size = Size { 200,20 }, hotKey = altA;

      void NotifyUpdate(EditBox editBox)
      {
         connect.disabled = address.contents[0] ? false : true;
      }
   };
   Label addressLabel
   {
      this, position = Point { 10, 10 }, labeledWindow = address
   };

   void ConnectionDestroyed(Connection connection)
   {
      log.End();
      log.Printf("\n%s disconnected", connection.text);
      connections.Delete(connections.FindLink(connection));
   }

   void OnConnect(Connection connection, const char * inetAddress, const char * address)
   {
      log.End();
      log.Printf("\nConnected to %s (%s)", inetAddress, address);
      connection.SendName(nameBox.contents);
      connections.Add(OldLink{data = connection});
   }
}

MainPanel mainPanel {};

class eComApp : GuiApplication
{
   appName = "ECERE Communicator (Build 0002.5)";
}

class eComService : Service
{
   MainPanel mainPanel;

   port = ECOMMUNICATOR_PORT;

   void OnAccept()
   {
      char address[256] = "";
      Connection connection;

      ConnectionSocket socket { this, mainPanel = mainPanel };

      GetNameFromAddress(socket.inetAddress, address);
      mainPanel.log.End();
      mainPanel.log.Printf("\nConnection accepted from %s (%s)", socket.inetAddress, address);

      socket.connection = connection = Connection { text = "Incoming Connection...", socket = socket, master = mainPanel };
      mainPanel.connections.Add(OldLink{data = connection});

      connection.Create();
      connection.SendName(mainPanel.nameBox.contents);
   }

   property MainPanel mainPanel { set { mainPanel = value; } }
}
