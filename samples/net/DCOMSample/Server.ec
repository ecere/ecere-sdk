import "main"

ChatConnection serverConnection;

public remote class ChatConnection
{
public:
   ~ChatConnection()
   {
      if(serverConnection == this && form1)
         form1.btnSend.disabled = false;
   }

   void Join()
   {
      serverConnection = this;
      form1.btnSend.disabled = false;
   }

   void SendMessage(const String msg)
   {
      form1.log.PutS(" < ");
      form1.log.PutS(msg);
      form1.log.PutS("\n");
   }

   virtual void NotifyMessage(const String msg);

private:
}

void SendBackMessage(const String msg)
{
   serverConnection.NotifyMessage(msg);
}
