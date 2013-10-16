import "ecere"

class ClientApp : GuiApplication
{
   void Main()
   {
      FileServerConnection connection = ConnectToFileServer("hitomi", 7649);
      if(connection)
      {
         File f;
         Log("Connected\n");
         f = connection.Open("c:/boot.ini", read);
         if(f)
         {
            int newsize;
            uint * indexfs = null;
            int c;

            f.Seek(0, end);
            newsize = f.Tell();
            f.Seek(0, 0);

            indexfs = renew indexfs byte[newsize];
            c = f.Read(indexfs, newsize, 1);
            delete f;

            f = FileOpen("test.ini", write);
            f.Write(indexfs, 1, c);
            delete f;

            // while(true) Sleep(1);
         }
         delete connection;
      }
   }
}
