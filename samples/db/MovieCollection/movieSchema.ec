import "EDA"

MediaType workAround; // A work around to use enums defined in this module in the schema.
                      // A future version of the SDK will remove the need for this.
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
      db = database_open(ds, "collection");
   }
   ~MovieCollectionApp()
   {
      delete db;
      delete ds;
   }
}
