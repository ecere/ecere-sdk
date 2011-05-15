import "EDB"

static class EDBMemoryDataSource : DataSourceDriver
{
   class_property(name) = "MemoryEDB";
   
   Database OpenDatabase(const String name, CreateOptions createOptions, DataSource ds)
   {
      return EDBDatabase { path = null, archive = ArchiveOpen(null, ArchiveOpenFlags { true }) };
   }
}
