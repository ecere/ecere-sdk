import "EDA"

enum MediaType { unknown, tape, dvd, bluRay };

dbtable "Borrowers" Borrower
{
   Borrower id          "ID";
   String   name        "Name";
   String   phoneNumber "Phone Number";
};

dbtable "Movies" Movie
{
   Movie          id             "ID";
   String         name           "Name";
   MediaType      mediaType      "Media Type";
   Date           dateAdded      "Date Added";
   Borrower       borrower       "Borrower";
   Date           dateBorrowed   "Date Borrowed";
};

DataSource ds;
Database db;

class MovieCollectionApp : GuiApplication
{
   MovieCollectionApp()
   {
      SetDefaultIdField("ID");
      SetDefaultNameField("Name");
      ds = DataSource { driver = "SQLite" };
      //ds = DataSource { driver = "Oracle", host = "localhost", port = "1521", user = "test", pass = "test" };

      db = database_open(ds, "collection");
   }
   ~MovieCollectionApp()
   {
      delete db;
      delete ds;
   }
}
