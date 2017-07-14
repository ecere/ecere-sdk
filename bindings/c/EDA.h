//////////////////////////////////////////////////////////////////////////////// ////////////////////////
//////////////////////////////////////////////////////////////////////////////// ////////////////////////
////                                                                        //// ////////////////////////
////    EDA Module                                                          //// ////////////////////////
////                                                                        //// ////////////////////////
//////////////////////////////////////////////////////////////////////////////// ////////////////////////
//////////////////////////////////////////////////////////////////////////////// ////////////////////////


#if !defined(__EDA_H__)
#define __EDA_H__

#define CPP11 (defined(__cplusplus) && __cplusplus >= 201103L)

#ifdef __cplusplus

extern "C" {

#endif

////////////////////////////////////////////////////////////// includes //////// ////////////////
//////////////////////////////////////////////////////////////////////////////// ////////////////
//////////////////////////////////////////////////////////////////////////////// ////////////////

#include "ecere.h"


#if !defined(EDA_MODULE_NAME)
#define EDA_MODULE_NAME "EDA"
#endif

#undef THIS_LIB_IMPORT
#ifdef EDA_EXPORT
#define THIS_LIB_IMPORT LIB_EXPORT
#elif defined(BINDINGS_SHARED)
#define THIS_LIB_IMPORT LIB_IMPORT
#else
#define THIS_LIB_IMPORT
#endif


#define EDA_APP_INTRO(c) \
      APP_INTRO(true) \
      ecere_init(app); \
      EDA_init(app); \
      loadTranslatedStrings(null, MODULE_NAME); \
      Instance_evolve(&app, class_ ## c);

#define EDA_GUIAPP_INTRO EDA_APP_INTRO(GuiApplication)


// namespace /////////////// //////////////////////////////////////////////////////////////////// ////////////////////////////////
// namespace /////////////// ////////    //////////////////////////////////////////////////////// ////////////////////////////////
// namespace /////////////// //////////////////////////////////////////////////////////////////// ////////////////////////////////



// namespace /////////////// //////////////////////////////////////////////////////////////////// ////////////////////////////////
// namespace /////////////// ////////  eda  ///////////////////////////////////////////////////// ////////////////////////////////
// namespace /////////////// //////////////////////////////////////////////////////////////////// ////////////////////////////////


// start -- moved backwards outputs
#if CPP11
enum C(IndexOrder) : int
#else
typedef int C(IndexOrder);
enum C(IndexOrder)
#endif
{
   IndexOrder_ascending = 0x0,
   IndexOrder_descending = 0x1
};

typedef C(Instance) C(IdList);
typedef C(IdList) C(IdList32);
typedef C(Instance) C(SQLCustomFunction);
typedef C(SQLCustomFunction) C(IdList32Includes);
typedef C(SQLCustomFunction) C(IdListIncludes);
typedef C(DataBox) C(DropDataBox);
typedef C(DataBox) C(FieldDataBox);
typedef C(FieldDataBox) C(FieldDropDataBox);
typedef C(FieldDropDataBox) C(EditFieldDropDataBox);
typedef C(Button) C(ButtonStyle);
typedef C(Window) C(Group);
typedef C(Group) C(ListSection);
typedef C(Instance) C(Field);
struct CM(ListSection)
{
   C(Field) fldId;
   C(Field) fldName;
   C(Field) fldActive;
   C(ButtonStyle) btnNew;
   C(ButtonStyle) btnDelete;
   C(ListBox) list;
};
typedef C(Instance) C(Row);
typedef C(Instance) C(Table);
struct CM(EditSection)
{
   C(ListSection) list;
   C(Table) table;
   C(Row) editRow;
   C(DataRow) listRow;
   C(OldList) editBoxes;
   C(Window) editArea;
   C(ButtonStyle) btnSave;
   C(ButtonStyle) btnReload;
};
typedef struct C(IdFilter) C(IdFilter);
typedef uint64 C(Id);
typedef C(Group) C(EditSection);
typedef C(Instance) C(Grouping);
struct CM(Grouping)
{
   C(Id) groupId;
   C(Row) row;
   C(Field) field;
   C(Field) fieldLink;
   C(bool) filtered;
   C(Array) filters;
   C(Field) listFieldLink;
   C(Field) reverseListFieldLink;
   C(Grouping) reverseLink;
   C(bool) activeOnly;
   C(Field) activeField;
   uint rowsCount;
   subclass(Detail) header;
   subclass(Detail) continuation;
   subclass(Detail) footer;
};
typedef struct C(FieldFindData) C(FieldFindData);
typedef struct C(FieldIndex) C(FieldIndex);
typedef uint32 C(FieldTypeEx);
typedef struct C(FieldValue) C(FieldValue);
#if CPP11
enum C(CreateOptions) : int
#else
typedef int C(CreateOptions);
enum C(CreateOptions)
#endif
{
   CreateOptions_no = 0x0,
   CreateOptions_create = 0x1,
   CreateOptions_readOnly = 0x2
};

typedef C(Instance) C(Database);
typedef C(Instance) C(DataSource);
typedef C(SQLCustomFunction) C(NoCaseAccent);
typedef C(NoCaseAccent) C(GetMemberString);
typedef C(Instance) C(DriverRow);
typedef C(Instance) C(DataSourceDriver);
typedef C(DataSourceDriver) C(DirFilesDataSourceDriver);
#if CPP11
enum C(MatchOptions) : int
#else
typedef int C(MatchOptions);
enum C(MatchOptions)
#endif
{
   MatchOptions_nil = 0x0
};

#if CPP11
enum C(MoveOptions) : int
#else
typedef int C(MoveOptions);
enum C(MoveOptions)
#endif
{
   MoveOptions_nil = 0x0,
   MoveOptions_first = 0x1,
   MoveOptions_last = 0x2,
   MoveOptions_next = 0x3,
   MoveOptions_previous = 0x4,
   MoveOptions_middle = 0x5,
   MoveOptions_here = 0x6
};

#if CPP11
enum C(ObjectType) : int
#else
typedef int C(ObjectType);
enum C(ObjectType)
#endif
{
   ObjectType_table = 0x0,
   ObjectType_view = 0x1
};

typedef uint32 C(OpenOptions);
typedef C(Window) C(Page);
#if CPP11
enum C(Orientation) : int
#else
typedef int C(Orientation);
enum C(Orientation)
#endif
{
   Orientation_portrait = 0x0,
   Orientation_landscape = 0x1
};

#if CPP11
enum C(PageFormat) : int
#else
typedef int C(PageFormat);
enum C(PageFormat)
#endif
{
   PageFormat_custom = 0x0,
   PageFormat_letter = 0x1,
   PageFormat_legal = 0x2,
   PageFormat_ledger = 0x3
};

typedef C(Instance) C(ReportRender);
struct CM(Report)
{
   C(Size) pageSize;
   C(Anchor) insideMarginAnchor;
   C(Array) groupings;
   C(String) title;
   C(ReportRender) render;
   subclass(Detail) reportHeader;
   subclass(Detail) reportFooter;
   subclass(Detail) pageHeader;
   subclass(Detail) pageFooter;
   subclass(Detail) rowDetail;
};
typedef C(Instance) C(Report);
typedef C(Window) C(ReportDestination);
#if CPP11
enum C(StringSearchIndexingMethod) : int
#else
typedef int C(StringSearchIndexingMethod);
enum C(StringSearchIndexingMethod)
#endif
{
   StringSearchIndexingMethod_fullString = 0x0,
   StringSearchIndexingMethod_allSubstrings = 0x1
};

typedef C(DropBox) C(TableDropBox);
typedef C(Window) C(TableEditor);
// end -- moved backwards outputs
#if CPP11
enum C(AccessOptions) : int
#else
typedef int C(AccessOptions);
enum C(AccessOptions)
#endif
{
   AccessOptions_integral = 0x0,
   AccessOptions_random = 0x1
};

typedef C(ReportDestination) C(CSVReport);
#if CPP11
enum C(CheckBool) : uint;
#else
typedef C(bool) C(CheckBool);
enum C(CheckBool);
#endif



typedef struct C(OldList) C(DataList);
typedef C(Window) C(Detail);
typedef uint32 C(EDBIndexOptions);
typedef C(DropDataBox) C(EditDropDataBox);
typedef C(DataBox) C(FieldBox);
typedef C(FieldDataBox) C(FieldCheckButton);
#if CPP11
enum C(FieldType) : int
#else
typedef int C(FieldType);
enum C(FieldType)
#endif
{
   FieldType_integer = 0x1,
   FieldType_real = 0x2,
   FieldType_text = 0x3,
   FieldType_blob = 0x4,
   FieldType_nil = 0x5
};

typedef C(String) C(FixedMultiLineString);
typedef struct C(ListField) C(ListField);
typedef C(Instance) C(Lookup);
typedef struct C(LookupEditor) C(LookupEditor);
typedef C(Instance) C(MemberStringSample);
#if CPP11
enum C(OpenType) : int
#else
typedef int C(OpenType);
enum C(OpenType)
#endif
{
   OpenType_queryRows = 0x0,
   OpenType_tableRows = 0x1,
   OpenType_viewRows = 0x2,
   OpenType_processesList = 0x3,
   OpenType_databasesList = 0x4,
   OpenType_tablesList = 0x5,
   OpenType_fieldsList = 0x6
};

typedef C(ReportDestination) C(PrintedReport);
#if CPP11
enum C(RenderAction) : int
#else
typedef int C(RenderAction);
enum C(RenderAction)
#endif
{
   RenderAction_addPage = 0x0,
   RenderAction_closePage = 0x1,
   RenderAction_levelStart = 0x2,
   RenderAction_levelFinish = 0x3,
   RenderAction_groupStart = 0x4,
   RenderAction_groupFinish = 0x5,
   RenderAction_actualRows = 0x6
};

typedef C(ReportDestination) C(ReportPreviewArea);
typedef C(ReportRender) C(ReportRenderNormal);
typedef C(Window) C(ReportTitle);
typedef C(Instance) C(SQLiteSearchField);
typedef C(Instance) C(SQLiteSearchTable);
#if CPP11
enum C(SeekOptions) : int
#else
typedef int C(SeekOptions);
enum C(SeekOptions)
#endif
{
   SeekOptions_none = 0x0,
   SeekOptions_reset = 0x1,
   SeekOptions_first = 0x2,
   SeekOptions_last = 0x3,
   SeekOptions_firstEqual = 0x4,
   SeekOptions_lastEqual = 0x5
};

#if CPP11
enum C(State) : int
#else
typedef int C(State);
enum C(State)
#endif
{
   State_none = 0x0,
   State_driver = 0x1,
   State_connected = 0x2,
   State_opened = 0x3,
   State_closed = 0x4,
   State_errorDriver = 0x5
};

typedef C(Instance) C(StringList);
typedef C(Instance) C(StringSearchField);
typedef C(Instance) C(StringSearchTable);
typedef uint64_t TP(GetMemberString, NT);
extern THIS_LIB_IMPORT C(bool) (* DataSource_connect)(C(DataSource) __this);

extern THIS_LIB_IMPORT C(bool) (* DataSource_deleteDatabase)(C(DataSource) __this, constString name);

extern THIS_LIB_IMPORT C(Database) (* DataSource_openDatabase)(C(DataSource) __this, constString name, C(CreateOptions) create);

extern THIS_LIB_IMPORT C(bool) (* DataSource_renameDatabase)(C(DataSource) __this, constString name, constString rename);

extern THIS_LIB_IMPORT void (* DataSource_status)(C(DataSource) __this);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(DataSource, driver);
extern THIS_LIB_IMPORT void (* DataSource_set_driver)(C(DataSource) d, constString value);
extern THIS_LIB_IMPORT constString (* DataSource_get_driver)(C(DataSource) d);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(DataSource, host);
extern THIS_LIB_IMPORT void (* DataSource_set_host)(C(DataSource) d, constString value);
extern THIS_LIB_IMPORT constString (* DataSource_get_host)(C(DataSource) d);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(DataSource, port);
extern THIS_LIB_IMPORT void (* DataSource_set_port)(C(DataSource) d, constString value);
extern THIS_LIB_IMPORT constString (* DataSource_get_port)(C(DataSource) d);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(DataSource, user);
extern THIS_LIB_IMPORT void (* DataSource_set_user)(C(DataSource) d, constString value);
extern THIS_LIB_IMPORT constString (* DataSource_get_user)(C(DataSource) d);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(DataSource, pass);
extern THIS_LIB_IMPORT void (* DataSource_set_pass)(C(DataSource) d, constString value);
extern THIS_LIB_IMPORT constString (* DataSource_get_pass)(C(DataSource) d);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(DataSource, locator);
extern THIS_LIB_IMPORT void (* DataSource_set_locator)(C(DataSource) d, constString value);
extern THIS_LIB_IMPORT constString (* DataSource_get_locator)(C(DataSource) d);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(DataSource, databasesCount);
extern THIS_LIB_IMPORT uint (* DataSource_get_databasesCount)(C(DataSource) d);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(DataSource, databases);
extern THIS_LIB_IMPORT C(Array) (* DataSource_get_databases)(C(DataSource) d);

extern THIS_LIB_IMPORT int M_VTBLID(DataSourceDriver, buildLocator);
// C(String) DataSourceDriver_buildLocator(C(DataSourceDriver) __i, C(DataSource) ds);
#define DataSourceDriver_buildLocator(__i, ds) \
   VMETHOD(CO(DataSourceDriver), DataSourceDriver, buildLocator, __i, C(String), \
      C(DataSourceDriver) _ARG C(DataSource), \
      __i _ARG ds)
extern THIS_LIB_IMPORT C(Method) * METHOD(DataSourceDriver, buildLocator);

extern THIS_LIB_IMPORT int M_VTBLID(DataSourceDriver, connect);
// C(bool) DataSourceDriver_connect(C(DataSourceDriver) __i, constString locator);
#define DataSourceDriver_connect(__i, locator) \
   VMETHOD(CO(DataSourceDriver), DataSourceDriver, connect, __i, C(bool), \
      C(DataSourceDriver) _ARG constString, \
      __i _ARG locator)
extern THIS_LIB_IMPORT C(Method) * METHOD(DataSourceDriver, connect);

extern THIS_LIB_IMPORT int M_VTBLID(DataSourceDriver, deleteDatabase);
// C(bool) DataSourceDriver_deleteDatabase(C(DataSourceDriver) __i, constString name);
#define DataSourceDriver_deleteDatabase(__i, name) \
   VMETHOD(CO(DataSourceDriver), DataSourceDriver, deleteDatabase, __i, C(bool), \
      C(DataSourceDriver) _ARG constString, \
      __i _ARG name)
extern THIS_LIB_IMPORT C(Method) * METHOD(DataSourceDriver, deleteDatabase);

extern THIS_LIB_IMPORT int M_VTBLID(DataSourceDriver, getDatabases);
// C(Array) DataSourceDriver_getDatabases(C(DataSourceDriver) __i);
#define DataSourceDriver_getDatabases(__i) \
   VMETHOD(CO(DataSourceDriver), DataSourceDriver, getDatabases, __i, C(Array), \
      C(DataSourceDriver), \
      __i)
extern THIS_LIB_IMPORT C(Method) * METHOD(DataSourceDriver, getDatabases);

extern THIS_LIB_IMPORT int M_VTBLID(DataSourceDriver, getDatabasesCount);
// uint DataSourceDriver_getDatabasesCount(C(DataSourceDriver) __i);
#define DataSourceDriver_getDatabasesCount(__i) \
   VMETHOD(CO(DataSourceDriver), DataSourceDriver, getDatabasesCount, __i, uint, \
      C(DataSourceDriver), \
      __i)
extern THIS_LIB_IMPORT C(Method) * METHOD(DataSourceDriver, getDatabasesCount);

extern THIS_LIB_IMPORT int M_VTBLID(DataSourceDriver, openDatabase);
// C(Database) DataSourceDriver_openDatabase(C(DataSourceDriver) __i, constString name, C(CreateOptions) create, C(DataSource) ds);
#define DataSourceDriver_openDatabase(__i, name, create, ds) \
   VMETHOD(CO(DataSourceDriver), DataSourceDriver, openDatabase, __i, C(Database), \
      C(DataSourceDriver) _ARG constString _ARG C(CreateOptions) _ARG C(DataSource), \
      __i _ARG name _ARG create _ARG ds)
extern THIS_LIB_IMPORT C(Method) * METHOD(DataSourceDriver, openDatabase);

extern THIS_LIB_IMPORT int M_VTBLID(DataSourceDriver, renameDatabase);
// C(bool) DataSourceDriver_renameDatabase(C(DataSourceDriver) __i, constString name, constString rename);
#define DataSourceDriver_renameDatabase(__i, name, rename) \
   VMETHOD(CO(DataSourceDriver), DataSourceDriver, renameDatabase, __i, C(bool), \
      C(DataSourceDriver) _ARG constString _ARG constString, \
      __i _ARG name _ARG rename)
extern THIS_LIB_IMPORT C(Method) * METHOD(DataSourceDriver, renameDatabase);

extern THIS_LIB_IMPORT int M_VTBLID(DataSourceDriver, status);
// void DataSourceDriver_status(C(DataSourceDriver) __i);
#define DataSourceDriver_status(__i) \
   VMETHOD(CO(DataSourceDriver), DataSourceDriver, status, __i, void, \
      C(DataSourceDriver), \
      __i)
extern THIS_LIB_IMPORT C(Method) * METHOD(DataSourceDriver, status);

extern THIS_LIB_IMPORT int M_VTBLID(Database, begin);
// C(bool) Database_begin(C(Database) __i);
#define Database_begin(__i) \
   VMETHOD(CO(Database), Database, begin, __i, C(bool), \
      C(Database), \
      __i)
extern THIS_LIB_IMPORT C(Method) * METHOD(Database, begin);

extern THIS_LIB_IMPORT int M_VTBLID(Database, commit);
// C(bool) Database_commit(C(Database) __i);
#define Database_commit(__i) \
   VMETHOD(CO(Database), Database, commit, __i, C(bool), \
      C(Database), \
      __i)
extern THIS_LIB_IMPORT C(Method) * METHOD(Database, commit);

extern THIS_LIB_IMPORT int M_VTBLID(Database, createCustomFunction);
// C(bool) Database_createCustomFunction(C(Database) __i, const char * name, C(SQLCustomFunction) customFunction);
#define Database_createCustomFunction(__i, name, customFunction) \
   VMETHOD(CO(Database), Database, createCustomFunction, __i, C(bool), \
      C(Database) _ARG const char * _ARG C(SQLCustomFunction), \
      __i _ARG name _ARG customFunction)
extern THIS_LIB_IMPORT C(Method) * METHOD(Database, createCustomFunction);

extern THIS_LIB_IMPORT int M_VTBLID(Database, deleteObject);
// C(bool) Database_deleteObject(C(Database) __i, C(ObjectType) type, constString name);
#define Database_deleteObject(__i, type, name) \
   VMETHOD(CO(Database), Database, deleteObject, __i, C(bool), \
      C(Database) _ARG C(ObjectType) _ARG constString, \
      __i _ARG type _ARG name)
extern THIS_LIB_IMPORT C(Method) * METHOD(Database, deleteObject);

extern THIS_LIB_IMPORT int M_VTBLID(Database, getName);
// C(String) Database_getName(C(Database) __i);
#define Database_getName(__i) \
   VMETHOD(CO(Database), Database, getName, __i, C(String), \
      C(Database), \
      __i)
extern THIS_LIB_IMPORT C(Method) * METHOD(Database, getName);

extern THIS_LIB_IMPORT int M_VTBLID(Database, getTables);
// C(Array) Database_getTables(C(Database) __i);
#define Database_getTables(__i) \
   VMETHOD(CO(Database), Database, getTables, __i, C(Array), \
      C(Database), \
      __i)
extern THIS_LIB_IMPORT C(Method) * METHOD(Database, getTables);

extern THIS_LIB_IMPORT void (* Database_linkTable)(C(Database) __this, C(Table) tbl);

extern THIS_LIB_IMPORT int M_VTBLID(Database, objectsCount);
// uint Database_objectsCount(C(Database) __i, C(ObjectType) type);
#define Database_objectsCount(__i, type) \
   VMETHOD(CO(Database), Database, objectsCount, __i, uint, \
      C(Database) _ARG C(ObjectType), \
      __i _ARG type)
extern THIS_LIB_IMPORT C(Method) * METHOD(Database, objectsCount);

extern THIS_LIB_IMPORT int M_VTBLID(Database, openTable);
// C(Table) Database_openTable(C(Database) __i, constString name, C(OpenOptions) open);
#define Database_openTable(__i, name, open) \
   VMETHOD(CO(Database), Database, openTable, __i, C(Table), \
      C(Database) _ARG constString _ARG C(OpenOptions), \
      __i _ARG name _ARG open)
extern THIS_LIB_IMPORT C(Method) * METHOD(Database, openTable);

extern THIS_LIB_IMPORT int M_VTBLID(Database, renameObject);
// C(bool) Database_renameObject(C(Database) __i, C(ObjectType) type, constString name, constString rename);
#define Database_renameObject(__i, type, name, rename) \
   VMETHOD(CO(Database), Database, renameObject, __i, C(bool), \
      C(Database) _ARG C(ObjectType) _ARG constString _ARG constString, \
      __i _ARG type _ARG name _ARG rename)
extern THIS_LIB_IMPORT C(Method) * METHOD(Database, renameObject);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(Database, name);
extern THIS_LIB_IMPORT C(String) (* Database_get_name)(C(Database) d);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(Database, tablesCount);
extern THIS_LIB_IMPORT uint (* Database_get_tablesCount)(C(Database) d);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(Database, viewsCount);
extern THIS_LIB_IMPORT uint (* Database_get_viewsCount)(C(Database) d);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(Database, tables);
extern THIS_LIB_IMPORT C(Array) (* Database_get_tables)(C(Database) d);

struct CM(Detail)
{
   C(bool) keepTogether;
   C(bool) isLast;
   int level;
   subclass(Detail) rowDetail;
};
struct CM(DirFilesDataSourceDriver)
{
   constString path;
   constString databaseFileExt;
   constString tableFileExt;
};
extern THIS_LIB_IMPORT int M_VTBLID(DirFilesDataSourceDriver, isDatabaseFile);
// C(bool) DirFilesDataSourceDriver_isDatabaseFile(C(DirFilesDataSourceDriver) __i, const char * fullPath);
#define DirFilesDataSourceDriver_isDatabaseFile(__i, fullPath) \
   VMETHOD(CO(DirFilesDataSourceDriver), DirFilesDataSourceDriver, isDatabaseFile, __i, C(bool), \
      C(DirFilesDataSourceDriver) _ARG const char *, \
      __i _ARG fullPath)
extern THIS_LIB_IMPORT C(Method) * METHOD(DirFilesDataSourceDriver, isDatabaseFile);

extern THIS_LIB_IMPORT C(String) (* DirFilesDataSourceDriver_makeDatabasePath)(C(DirFilesDataSourceDriver) __this, constString name);

extern THIS_LIB_IMPORT int M_VTBLID(DriverRow, add);
// C(bool) DriverRow_add(C(DriverRow) __i, uint64 id);
#define DriverRow_add(__i, id) \
   VMETHOD(CO(DriverRow), DriverRow, add, __i, C(bool), \
      C(DriverRow) _ARG uint64, \
      __i _ARG id)
extern THIS_LIB_IMPORT C(Method) * METHOD(DriverRow, add);

extern THIS_LIB_IMPORT int M_VTBLID(DriverRow, bindQueryData);
// C(bool) DriverRow_bindQueryData(C(DriverRow) __i, int paramID, C(Field) fld, C(Class) * class_value, void * value);
#define DriverRow_bindQueryData(__i, paramID, fld, class_value, value) \
   VMETHOD(CO(DriverRow), DriverRow, bindQueryData, __i, C(bool), \
      C(DriverRow) _ARG int _ARG C(Field) _ARG C(Class) * _ARG void *, \
      __i _ARG paramID _ARG fld _ARG class_value _ARG value)
extern THIS_LIB_IMPORT C(Method) * METHOD(DriverRow, bindQueryData);

extern THIS_LIB_IMPORT int M_VTBLID(DriverRow, delete);
// C(bool) DriverRow_delete(C(DriverRow) __i);
#define DriverRow_delete(__i) \
   VMETHOD(CO(DriverRow), DriverRow, delete, __i, C(bool), \
      C(DriverRow), \
      __i)
extern THIS_LIB_IMPORT C(Method) * METHOD(DriverRow, delete);

extern THIS_LIB_IMPORT int M_VTBLID(DriverRow, find);
// C(bool) DriverRow_find(C(DriverRow) __i, C(Field) fld, C(MoveOptions) move, C(MatchOptions) match, C(Class) * class_data, void * data);
#define DriverRow_find(__i, fld, move, match, class_data, data) \
   VMETHOD(CO(DriverRow), DriverRow, find, __i, C(bool), \
      C(DriverRow) _ARG C(Field) _ARG C(MoveOptions) _ARG C(MatchOptions) _ARG C(Class) * _ARG void *, \
      __i _ARG fld _ARG move _ARG match _ARG class_data _ARG data)
extern THIS_LIB_IMPORT C(Method) * METHOD(DriverRow, find);

extern THIS_LIB_IMPORT int M_VTBLID(DriverRow, findMultiple);
// C(bool) DriverRow_findMultiple(C(DriverRow) __i, C(FieldFindData) * findData, C(MoveOptions) move, int numFields);
#define DriverRow_findMultiple(__i, findData, move, numFields) \
   VMETHOD(CO(DriverRow), DriverRow, findMultiple, __i, C(bool), \
      C(DriverRow) _ARG C(FieldFindData) * _ARG C(MoveOptions) _ARG int, \
      __i _ARG findData _ARG move _ARG numFields)
extern THIS_LIB_IMPORT C(Method) * METHOD(DriverRow, findMultiple);

extern THIS_LIB_IMPORT int M_VTBLID(DriverRow, getColumn);
// const char * DriverRow_getColumn(C(DriverRow) __i, int paramID);
#define DriverRow_getColumn(__i, paramID) \
   VMETHOD(CO(DriverRow), DriverRow, getColumn, __i, const char *, \
      C(DriverRow) _ARG int, \
      __i _ARG paramID)
extern THIS_LIB_IMPORT C(Method) * METHOD(DriverRow, getColumn);

extern THIS_LIB_IMPORT int M_VTBLID(DriverRow, getData);
// C(bool) DriverRow_getData(C(DriverRow) __i, C(Field) fld, C(Class) * class_data, void * data);
#define DriverRow_getData(__i, fld, class_data, data) \
   VMETHOD(CO(DriverRow), DriverRow, getData, __i, C(bool), \
      C(DriverRow) _ARG C(Field) _ARG C(Class) * _ARG void *, \
      __i _ARG fld _ARG class_data _ARG data)
extern THIS_LIB_IMPORT C(Method) * METHOD(DriverRow, getData);

extern THIS_LIB_IMPORT int M_VTBLID(DriverRow, getDataFieldValue);
// C(bool) DriverRow_getDataFieldValue(C(DriverRow) __i, C(Field) fld, C(FieldValue) * value);
#define DriverRow_getDataFieldValue(__i, fld, value) \
   VMETHOD(CO(DriverRow), DriverRow, getDataFieldValue, __i, C(bool), \
      C(DriverRow) _ARG C(Field) _ARG C(FieldValue) *, \
      __i _ARG fld _ARG value)
extern THIS_LIB_IMPORT C(Method) * METHOD(DriverRow, getDataFieldValue);

extern THIS_LIB_IMPORT int M_VTBLID(DriverRow, getQueryData);
// C(bool) DriverRow_getQueryData(C(DriverRow) __i, int paramID, C(Field) fld, C(Class) * class_value, void * value);
#define DriverRow_getQueryData(__i, paramID, fld, class_value, value) \
   VMETHOD(CO(DriverRow), DriverRow, getQueryData, __i, C(bool), \
      C(DriverRow) _ARG int _ARG C(Field) _ARG C(Class) * _ARG void *, \
      __i _ARG paramID _ARG fld _ARG class_value _ARG value)
extern THIS_LIB_IMPORT C(Method) * METHOD(DriverRow, getQueryData);

extern THIS_LIB_IMPORT int M_VTBLID(DriverRow, getRowData);
// const void * DriverRow_getRowData(C(DriverRow) __i);
#define DriverRow_getRowData(__i) \
   VMETHOD(CO(DriverRow), DriverRow, getRowData, __i, const void *, \
      C(DriverRow), \
      __i)
extern THIS_LIB_IMPORT C(Method) * METHOD(DriverRow, getRowData);

extern THIS_LIB_IMPORT int M_VTBLID(DriverRow, getSysID);
// uint64 DriverRow_getSysID(C(DriverRow) __i);
#define DriverRow_getSysID(__i) \
   VMETHOD(CO(DriverRow), DriverRow, getSysID, __i, uint64, \
      C(DriverRow), \
      __i)
extern THIS_LIB_IMPORT C(Method) * METHOD(DriverRow, getSysID);

extern THIS_LIB_IMPORT int M_VTBLID(DriverRow, goToSysID);
// C(bool) DriverRow_goToSysID(C(DriverRow) __i, uint64 id);
#define DriverRow_goToSysID(__i, id) \
   VMETHOD(CO(DriverRow), DriverRow, goToSysID, __i, C(bool), \
      C(DriverRow) _ARG uint64, \
      __i _ARG id)
extern THIS_LIB_IMPORT C(Method) * METHOD(DriverRow, goToSysID);

extern THIS_LIB_IMPORT int M_VTBLID(DriverRow, nil);
// C(bool) DriverRow_nil(C(DriverRow) __i);
#define DriverRow_nil(__i) \
   VMETHOD(CO(DriverRow), DriverRow, nil, __i, C(bool), \
      C(DriverRow), \
      __i)
extern THIS_LIB_IMPORT C(Method) * METHOD(DriverRow, nil);

extern THIS_LIB_IMPORT int M_VTBLID(DriverRow, query);
// C(bool) DriverRow_query(C(DriverRow) __i, const char * queryString);
#define DriverRow_query(__i, queryString) \
   VMETHOD(CO(DriverRow), DriverRow, query, __i, C(bool), \
      C(DriverRow) _ARG const char *, \
      __i _ARG queryString)
extern THIS_LIB_IMPORT C(Method) * METHOD(DriverRow, query);

extern THIS_LIB_IMPORT int M_VTBLID(DriverRow, select);
// C(bool) DriverRow_select(C(DriverRow) __i, C(MoveOptions) move);
#define DriverRow_select(__i, move) \
   VMETHOD(CO(DriverRow), DriverRow, select, __i, C(bool), \
      C(DriverRow) _ARG C(MoveOptions), \
      __i _ARG move)
extern THIS_LIB_IMPORT C(Method) * METHOD(DriverRow, select);

extern THIS_LIB_IMPORT int M_VTBLID(DriverRow, setData);
// C(bool) DriverRow_setData(C(DriverRow) __i, C(Field) fld, C(Class) * class_data, void * data);
#define DriverRow_setData(__i, fld, class_data, data) \
   VMETHOD(CO(DriverRow), DriverRow, setData, __i, C(bool), \
      C(DriverRow) _ARG C(Field) _ARG C(Class) * _ARG void *, \
      __i _ARG fld _ARG class_data _ARG data)
extern THIS_LIB_IMPORT C(Method) * METHOD(DriverRow, setData);

extern THIS_LIB_IMPORT int M_VTBLID(DriverRow, setQueryParam);
// C(bool) DriverRow_setQueryParam(C(DriverRow) __i, int paramID, int value);
#define DriverRow_setQueryParam(__i, paramID, value) \
   VMETHOD(CO(DriverRow), DriverRow, setQueryParam, __i, C(bool), \
      C(DriverRow) _ARG int _ARG int, \
      __i _ARG paramID _ARG value)
extern THIS_LIB_IMPORT C(Method) * METHOD(DriverRow, setQueryParam);

extern THIS_LIB_IMPORT int M_VTBLID(DriverRow, setQueryParam64);
// C(bool) DriverRow_setQueryParam64(C(DriverRow) __i, int paramID, int64 value);
#define DriverRow_setQueryParam64(__i, paramID, value) \
   VMETHOD(CO(DriverRow), DriverRow, setQueryParam64, __i, C(bool), \
      C(DriverRow) _ARG int _ARG int64, \
      __i _ARG paramID _ARG value)
extern THIS_LIB_IMPORT C(Method) * METHOD(DriverRow, setQueryParam64);

extern THIS_LIB_IMPORT int M_VTBLID(DriverRow, setQueryParamObject);
// C(bool) DriverRow_setQueryParamObject(C(DriverRow) __i, int paramID, const void * data, C(Class) * type);
#define DriverRow_setQueryParamObject(__i, paramID, data, type) \
   VMETHOD(CO(DriverRow), DriverRow, setQueryParamObject, __i, C(bool), \
      C(DriverRow) _ARG int _ARG const void * _ARG C(Class) *, \
      __i _ARG paramID _ARG data _ARG type)
extern THIS_LIB_IMPORT C(Method) * METHOD(DriverRow, setQueryParamObject);

extern THIS_LIB_IMPORT int M_VTBLID(DriverRow, setQueryParamText);
// C(bool) DriverRow_setQueryParamText(C(DriverRow) __i, int paramID, const char * value);
#define DriverRow_setQueryParamText(__i, paramID, value) \
   VMETHOD(CO(DriverRow), DriverRow, setQueryParamText, __i, C(bool), \
      C(DriverRow) _ARG int _ARG const char *, \
      __i _ARG paramID _ARG value)
extern THIS_LIB_IMPORT C(Method) * METHOD(DriverRow, setQueryParamText);

extern THIS_LIB_IMPORT int M_VTBLID(DriverRow, synch);
// C(bool) DriverRow_synch(C(DriverRow) __i, C(DriverRow) to);
#define DriverRow_synch(__i, to) \
   VMETHOD(CO(DriverRow), DriverRow, synch, __i, C(bool), \
      C(DriverRow) _ARG C(DriverRow), \
      __i _ARG to)
extern THIS_LIB_IMPORT C(Method) * METHOD(DriverRow, synch);

extern THIS_LIB_IMPORT void (* DropDataBox_refill)(C(DropDataBox) __this);

extern THIS_LIB_IMPORT int M_VTBLID(DropDataBox, refillFunction);
// void DropDataBox_refillFunction(C(DropDataBox) __i, C(TableDropBox) __t);
#define DropDataBox_refillFunction(__i, __t) \
   VMETHOD(CO(DropDataBox), DropDataBox, refillFunction, __i, void, \
      C(TableDropBox), \
      __t)
extern THIS_LIB_IMPORT C(Method) * METHOD(DropDataBox, refillFunction);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(DropDataBox, filter);
extern THIS_LIB_IMPORT void (* DropDataBox_set_filter)(C(DropDataBox) d, C(Id) value);
extern THIS_LIB_IMPORT C(Id) (* DropDataBox_get_filter)(C(DropDataBox) d);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(DropDataBox, filtered);
extern THIS_LIB_IMPORT void (* DropDataBox_set_filtered)(C(DropDataBox) d, C(bool) value);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(DropDataBox, exclusion);
extern THIS_LIB_IMPORT void (* DropDataBox_set_exclusion)(C(DropDataBox) d, C(Id) value);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(DropDataBox, filterField);
extern THIS_LIB_IMPORT void (* DropDataBox_set_filterField)(C(DropDataBox) d, C(Field) value);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(DropDataBox, nameField);
extern THIS_LIB_IMPORT void (* DropDataBox_set_nameField)(C(DropDataBox) d, C(Field) value);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(DropDataBox, showNone);
extern THIS_LIB_IMPORT void (* DropDataBox_set_showNone)(C(DropDataBox) d, C(bool) value);

#define EDBINDEXOPTIONS_saveIndex_SHIFT                  0
#define EDBINDEXOPTIONS_saveIndex_MASK                   0x1
#define EDBINDEXOPTIONS_saveIndex(x)                     ((((EDBIndexOptions)(x)) & EDBINDEXOPTIONS_saveIndex_MASK) >> EDBINDEXOPTIONS_saveIndex_SHIFT)
#define EDBINDEXOPTIONS_SET_saveIndex(x, saveIndex)              (x) = ((EDBIndexOptions)(x) & ~((EDBIndexOptions)EDBINDEXOPTIONS_saveIndex_MASK)) | (((EDBIndexOptions)(saveIndex)) << EDBINDEXOPTIONS_saveIndex_SHIFT)
#define EDBINDEXOPTIONS_deleteIndex_SHIFT                1
#define EDBINDEXOPTIONS_deleteIndex_MASK                 0x2
#define EDBINDEXOPTIONS_deleteIndex(x)                   ((((EDBIndexOptions)(x)) & EDBINDEXOPTIONS_deleteIndex_MASK) >> EDBINDEXOPTIONS_deleteIndex_SHIFT)
#define EDBINDEXOPTIONS_SET_deleteIndex(x, deleteIndex)            (x) = ((EDBIndexOptions)(x) & ~((EDBIndexOptions)EDBINDEXOPTIONS_deleteIndex_MASK)) | (((EDBIndexOptions)(deleteIndex)) << EDBINDEXOPTIONS_deleteIndex_SHIFT)
#define EDBINDEXOPTIONS(saveIndex, deleteIndex)                           ((((EDBIndexOptions)(saveIndex)) << EDBINDEXOPTIONS_saveIndex_SHIFT) | ((EDBIndexOptions)(deleteIndex)) << EDBINDEXOPTIONS_deleteIndex_SHIFT)


extern THIS_LIB_IMPORT int M_VTBLID(EditFieldDropDataBox, onAddTextEntry);
// C(bool) EditFieldDropDataBox_onAddTextEntry(C(EditFieldDropDataBox) __i, C(Row) row, C(TableDropBox) dropBox, const char * entry);
#define EditFieldDropDataBox_onAddTextEntry(__i, row, dropBox, entry) \
   VMETHOD(CO(EditFieldDropDataBox), EditFieldDropDataBox, onAddTextEntry, __i, C(bool), \
      C(EditFieldDropDataBox) _ARG C(Row) _ARG C(TableDropBox) _ARG const char *, \
      __i _ARG row _ARG dropBox _ARG entry)
extern THIS_LIB_IMPORT C(Method) * METHOD(EditFieldDropDataBox, onAddTextEntry);

extern THIS_LIB_IMPORT void (* EditSection_addFieldEditor)(C(EditSection) __this, C(FieldDataBox) box);

extern THIS_LIB_IMPORT void (* EditSection_editClear)(C(EditSection) __this);

extern THIS_LIB_IMPORT void (* EditSection_editLoad)(C(EditSection) __this);

extern THIS_LIB_IMPORT void (* EditSection_editNew)(C(EditSection) __this);

extern THIS_LIB_IMPORT void (* EditSection_editSave)(C(EditSection) __this);

extern THIS_LIB_IMPORT void (* EditSection_initFields)(C(EditSection) __this);

extern THIS_LIB_IMPORT int M_VTBLID(EditSection, notifyEditClear);
// void EditSection_notifyEditClear(C(EditSection) __i, C(Window) __t, C(EditSection) editSection);
#define EditSection_notifyEditClear(__i, __t, editSection) \
   VMETHOD(CO(EditSection), EditSection, notifyEditClear, __i, void, \
      C(Window) _ARG C(EditSection), \
      __t _ARG editSection)
extern THIS_LIB_IMPORT C(Method) * METHOD(EditSection, notifyEditClear);

extern THIS_LIB_IMPORT int M_VTBLID(EditSection, notifyEditLoad);
// void EditSection_notifyEditLoad(C(EditSection) __i, C(Window) __t, C(EditSection) editSection);
#define EditSection_notifyEditLoad(__i, __t, editSection) \
   VMETHOD(CO(EditSection), EditSection, notifyEditLoad, __i, void, \
      C(Window) _ARG C(EditSection), \
      __t _ARG editSection)
extern THIS_LIB_IMPORT C(Method) * METHOD(EditSection, notifyEditLoad);

extern THIS_LIB_IMPORT int M_VTBLID(EditSection, notifyEditSave);
// void EditSection_notifyEditSave(C(EditSection) __i, C(Window) __t, C(EditSection) edit, C(String) name);
#define EditSection_notifyEditSave(__i, __t, edit, name) \
   VMETHOD(CO(EditSection), EditSection, notifyEditSave, __i, void, \
      C(Window) _ARG C(EditSection) _ARG C(String), \
      __t _ARG edit _ARG name)
extern THIS_LIB_IMPORT C(Method) * METHOD(EditSection, notifyEditSave);

extern THIS_LIB_IMPORT int M_VTBLID(EditSection, notifyInitFields);
// void EditSection_notifyInitFields(C(EditSection) __i, C(Window) __t, C(EditSection) editSection);
#define EditSection_notifyInitFields(__i, __t, editSection) \
   VMETHOD(CO(EditSection), EditSection, notifyInitFields, __i, void, \
      C(Window) _ARG C(EditSection), \
      __t _ARG editSection)
extern THIS_LIB_IMPORT C(Method) * METHOD(EditSection, notifyInitFields);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(EditSection, table);
extern THIS_LIB_IMPORT void (* EditSection_set_table)(C(EditSection) e, C(Table) value);

extern THIS_LIB_IMPORT C(bool) (* Field_getData)(C(Field) __this, C(Row) row, C(Class) * class_data, void * data);

extern THIS_LIB_IMPORT int M_VTBLID(Field, getLength);
// int Field_getLength(C(Field) __i);
#define Field_getLength(__i) \
   VMETHOD(CO(Field), Field, getLength, __i, int, \
      C(Field), \
      __i)
extern THIS_LIB_IMPORT C(Method) * METHOD(Field, getLength);

extern THIS_LIB_IMPORT int M_VTBLID(Field, getName);
// constString Field_getName(C(Field) __i);
#define Field_getName(__i) \
   VMETHOD(CO(Field), Field, getName, __i, constString, \
      C(Field), \
      __i)
extern THIS_LIB_IMPORT C(Method) * METHOD(Field, getName);

extern THIS_LIB_IMPORT int M_VTBLID(Field, getNext);
// C(Field) Field_getNext(C(Field) __i);
#define Field_getNext(__i) \
   VMETHOD(CO(Field), Field, getNext, __i, C(Field), \
      C(Field), \
      __i)
extern THIS_LIB_IMPORT C(Method) * METHOD(Field, getNext);

extern THIS_LIB_IMPORT int M_VTBLID(Field, getPrev);
// C(Field) Field_getPrev(C(Field) __i);
#define Field_getPrev(__i) \
   VMETHOD(CO(Field), Field, getPrev, __i, C(Field), \
      C(Field), \
      __i)
extern THIS_LIB_IMPORT C(Method) * METHOD(Field, getPrev);

extern THIS_LIB_IMPORT int M_VTBLID(Field, getTable);
// C(Table) Field_getTable(C(Field) __i);
#define Field_getTable(__i) \
   VMETHOD(CO(Field), Field, getTable, __i, C(Table), \
      C(Field), \
      __i)
extern THIS_LIB_IMPORT C(Method) * METHOD(Field, getTable);

extern THIS_LIB_IMPORT int M_VTBLID(Field, getType);
// C(Class) * Field_getType(C(Field) __i);
#define Field_getType(__i) \
   VMETHOD(CO(Field), Field, getType, __i, C(Class) *, \
      C(Field), \
      __i)
extern THIS_LIB_IMPORT C(Method) * METHOD(Field, getType);

extern THIS_LIB_IMPORT C(bool) (* Field_setData)(C(Field) __this, C(Row) row, C(Class) * class_data, void * data);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(Field, name);
extern THIS_LIB_IMPORT constString (* Field_get_name)(C(Field) f);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(Field, type);
extern THIS_LIB_IMPORT C(Class) * (* Field_get_type)(C(Field) f);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(Field, length);
extern THIS_LIB_IMPORT int (* Field_get_length)(C(Field) f);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(Field, prev);
extern THIS_LIB_IMPORT C(Field) (* Field_get_prev)(C(Field) f);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(Field, next);
extern THIS_LIB_IMPORT C(Field) (* Field_get_next)(C(Field) f);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(Field, table);
extern THIS_LIB_IMPORT C(Table) (* Field_get_table)(C(Field) f);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(FieldBox, editor);
extern THIS_LIB_IMPORT void (* FieldBox_set_editor)(C(FieldBox) f, C(TableEditor) value);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(FieldBox, field);
extern THIS_LIB_IMPORT void (* FieldBox_set_field)(C(FieldBox) f, C(Field) value);

extern THIS_LIB_IMPORT void (* FieldDataBox_clear)(C(FieldDataBox) __this);

extern THIS_LIB_IMPORT void (* FieldDataBox_init)(C(FieldDataBox) __this);

extern THIS_LIB_IMPORT void (* FieldDataBox_load)(C(FieldDataBox) __this);

extern THIS_LIB_IMPORT int M_VTBLID(FieldDataBox, save);
// void FieldDataBox_save(C(FieldDataBox) __i);
#define FieldDataBox_save(__i) \
   VMETHOD(CO(FieldDataBox), FieldDataBox, save, __i, void, \
      C(FieldDataBox), \
      __i)
extern THIS_LIB_IMPORT C(Method) * METHOD(FieldDataBox, save);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(FieldDataBox, row);
extern THIS_LIB_IMPORT void (* FieldDataBox_set_row)(C(FieldDataBox) f, C(Row) value);
extern THIS_LIB_IMPORT C(Row) (* FieldDataBox_get_row)(C(FieldDataBox) f);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(FieldDataBox, editor);
extern THIS_LIB_IMPORT void (* FieldDataBox_set_editor)(C(FieldDataBox) f, C(EditSection) value);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(FieldDataBox, field);
extern THIS_LIB_IMPORT void (* FieldDataBox_set_field)(C(FieldDataBox) f, C(Field) value);

extern THIS_LIB_IMPORT void (* FieldDropDataBox_refill)(C(FieldDropDataBox) __this);

extern THIS_LIB_IMPORT int M_VTBLID(FieldDropDataBox, refillFunction);
// void FieldDropDataBox_refillFunction(C(FieldDropDataBox) __i, C(TableDropBox) __t);
#define FieldDropDataBox_refillFunction(__i, __t) \
   VMETHOD(CO(FieldDropDataBox), FieldDropDataBox, refillFunction, __i, void, \
      C(TableDropBox), \
      __t)
extern THIS_LIB_IMPORT C(Method) * METHOD(FieldDropDataBox, refillFunction);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(FieldDropDataBox, filter);
extern THIS_LIB_IMPORT void (* FieldDropDataBox_set_filter)(C(FieldDropDataBox) f, C(Id) value);
extern THIS_LIB_IMPORT C(Id) (* FieldDropDataBox_get_filter)(C(FieldDropDataBox) f);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(FieldDropDataBox, filtered);
extern THIS_LIB_IMPORT void (* FieldDropDataBox_set_filtered)(C(FieldDropDataBox) f, C(bool) value);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(FieldDropDataBox, exclusion);
extern THIS_LIB_IMPORT void (* FieldDropDataBox_set_exclusion)(C(FieldDropDataBox) f, C(Id) value);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(FieldDropDataBox, filterField);
extern THIS_LIB_IMPORT void (* FieldDropDataBox_set_filterField)(C(FieldDropDataBox) f, C(Field) value);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(FieldDropDataBox, nameField);
extern THIS_LIB_IMPORT void (* FieldDropDataBox_set_nameField)(C(FieldDropDataBox) f, C(Field) value);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(FieldDropDataBox, showNone);
extern THIS_LIB_IMPORT void (* FieldDropDataBox_set_showNone)(C(FieldDropDataBox) f, C(bool) value);

struct C(FieldFindData)
{
   C(Field) field;
   C(DataValue) value;
};
struct C(FieldIndex)
{
   C(Field) field;
   C(IndexOrder) order;
   C(Field) memberField;
   C(Table) memberTable;
   C(Field) memberIdField;
};
#define FIELDTYPEEX_type_SHIFT                           0
#define FIELDTYPEEX_type_MASK                            0x7
#define FIELDTYPEEX_type(x)                              ((((FieldTypeEx)(x)) & FIELDTYPEEX_type_MASK) >> FIELDTYPEEX_type_SHIFT)
#define FIELDTYPEEX_SET_type(x, type)                       (x) = ((FieldTypeEx)(x) & ~((FieldTypeEx)FIELDTYPEEX_type_MASK)) | (((FieldTypeEx)(type)) << FIELDTYPEEX_type_SHIFT)
#define FIELDTYPEEX_mustFree_SHIFT                       3
#define FIELDTYPEEX_mustFree_MASK                        0x8
#define FIELDTYPEEX_mustFree(x)                          ((((FieldTypeEx)(x)) & FIELDTYPEEX_mustFree_MASK) >> FIELDTYPEEX_mustFree_SHIFT)
#define FIELDTYPEEX_SET_mustFree(x, mustFree)                   (x) = ((FieldTypeEx)(x) & ~((FieldTypeEx)FIELDTYPEEX_mustFree_MASK)) | (((FieldTypeEx)(mustFree)) << FIELDTYPEEX_mustFree_SHIFT)
#define FIELDTYPEEX(type, mustFree)                               ((((FieldTypeEx)(type)) << FIELDTYPEEX_type_SHIFT) | ((FieldTypeEx)(mustFree)) << FIELDTYPEEX_mustFree_SHIFT)


struct C(FieldValue)
{
   C(FieldTypeEx) type;
   union
   {
      int i;
      double r;
      C(String) s;
      void * b;
   };
};
extern THIS_LIB_IMPORT int (* FieldValue_compareInt)(C(FieldValue) * __this, C(FieldValue) * b);

extern THIS_LIB_IMPORT int (* FieldValue_compareReal)(C(FieldValue) * __this, C(FieldValue) * b);

extern THIS_LIB_IMPORT int (* FieldValue_compareText)(C(FieldValue) * __this, C(FieldValue) * b);

extern THIS_LIB_IMPORT C(String) (* FieldValue_stringify)(C(FieldValue) * __this);

extern THIS_LIB_IMPORT C(String) (* GetMemberString_function)(C(GetMemberString) __this, TP(GetMemberString, NT) pn);

struct CM(Group)
{
   C(Label) title;
};
extern THIS_LIB_IMPORT int M_VTBLID(Grouping, advance);
// C(bool) Grouping_advance(C(Grouping) __i, C(Array) groupings, int level, C(bool) * dontAdvance);
#define Grouping_advance(__i, groupings, level, dontAdvance) \
   VMETHOD(CO(Grouping), Grouping, advance, __i, C(bool), \
      C(Grouping) _ARG C(Array) _ARG int _ARG C(bool) *, \
      __i _ARG groupings _ARG level _ARG dontAdvance)
extern THIS_LIB_IMPORT C(Method) * METHOD(Grouping, advance);

extern THIS_LIB_IMPORT int M_VTBLID(Grouping, shouldSkip);
// C(bool) Grouping_shouldSkip(C(Grouping) __i);
#define Grouping_shouldSkip(__i) \
   VMETHOD(CO(Grouping), Grouping, shouldSkip, __i, C(bool), \
      C(Grouping), \
      __i)
extern THIS_LIB_IMPORT C(Method) * METHOD(Grouping, shouldSkip);

struct C(IdFilter)
{
   C(Id) id;
   C(Field) field;
};
extern THIS_LIB_IMPORT C(bool) (* IdFilter_rowMatch)(C(IdFilter) * __this, C(Row) row);

struct CM(IdList)
{
   int count;
   C(Id) * ids;
};
extern THIS_LIB_IMPORT C(bool) (* IdList_add)(C(IdList) __this, C(Id) id);

extern THIS_LIB_IMPORT void (* IdList_clear)(C(IdList) __this);

extern THIS_LIB_IMPORT C(bool) (* IdList_delete)(C(IdList) __this, C(Id) id);

extern THIS_LIB_IMPORT C(bool) (* IdList_includes)(C(IdList) __this, C(Id) id);

extern THIS_LIB_IMPORT C(bool) (* IdList32Includes_function)(C(IdList32Includes) __this, C(IdList32) list, C(Id) id);

extern THIS_LIB_IMPORT C(bool) (* IdListIncludes_function)(C(IdListIncludes) __this, C(IdList) list, C(Id) id);

struct C(ListField)
{
   C(Field) field;
   C(DataField) dataField;
   C(Field) lookupFindField;
   C(Field) lookupValueField;
   C(Table) lookupFindIndex;
   C(String) (* CustomLookup)(C(Id));
};
extern THIS_LIB_IMPORT C(bool) (* ListSection_filterNotifyChanged)(C(ListSection) __this, C(DataBox) dataBox, C(bool) closeDropDown);

extern THIS_LIB_IMPORT int M_VTBLID(ListSection, notifyDeleteConfirmation);
// C(bool) ListSection_notifyDeleteConfirmation(C(ListSection) __i, C(Window) __t, C(ListSection) listSection);
#define ListSection_notifyDeleteConfirmation(__i, __t, listSection) \
   VMETHOD(CO(ListSection), ListSection, notifyDeleteConfirmation, __i, C(bool), \
      C(Window) _ARG C(ListSection), \
      __t _ARG listSection)
extern THIS_LIB_IMPORT C(Method) * METHOD(ListSection, notifyDeleteConfirmation);

extern THIS_LIB_IMPORT int M_VTBLID(ListSection, notifyDeleted);
// void ListSection_notifyDeleted(C(ListSection) __i, C(Window) __t, C(ListSection) listSection);
#define ListSection_notifyDeleted(__i, __t, listSection) \
   VMETHOD(CO(ListSection), ListSection, notifyDeleted, __i, void, \
      C(Window) _ARG C(ListSection), \
      __t _ARG listSection)
extern THIS_LIB_IMPORT C(Method) * METHOD(ListSection, notifyDeleted);

extern THIS_LIB_IMPORT int M_VTBLID(ListSection, notifyDeleting);
// void ListSection_notifyDeleting(C(ListSection) __i, C(Window) __t, C(ListSection) listSection);
#define ListSection_notifyDeleting(__i, __t, listSection) \
   VMETHOD(CO(ListSection), ListSection, notifyDeleting, __i, void, \
      C(Window) _ARG C(ListSection), \
      __t _ARG listSection)
extern THIS_LIB_IMPORT C(Method) * METHOD(ListSection, notifyDeleting);

extern THIS_LIB_IMPORT int M_VTBLID(ListSection, notifyNew);
// C(bool) ListSection_notifyNew(C(ListSection) __i, C(Window) __t, C(ListSection) listSection, C(Row) r);
#define ListSection_notifyNew(__i, __t, listSection, r) \
   VMETHOD(CO(ListSection), ListSection, notifyNew, __i, C(bool), \
      C(Window) _ARG C(ListSection) _ARG C(Row), \
      __t _ARG listSection _ARG r)
extern THIS_LIB_IMPORT C(Method) * METHOD(ListSection, notifyNew);

extern THIS_LIB_IMPORT int M_VTBLID(ListSection, notifyRefillList);
// void ListSection_notifyRefillList(C(ListSection) __i, C(Window) __t, C(ListSection) listSection, C(Row) r);
#define ListSection_notifyRefillList(__i, __t, listSection, r) \
   VMETHOD(CO(ListSection), ListSection, notifyRefillList, __i, void, \
      C(Window) _ARG C(ListSection) _ARG C(Row), \
      __t _ARG listSection _ARG r)
extern THIS_LIB_IMPORT C(Method) * METHOD(ListSection, notifyRefillList);

extern THIS_LIB_IMPORT int M_VTBLID(ListSection, notifySaveConfirmation);
// C(DialogResult) ListSection_notifySaveConfirmation(C(ListSection) __i, C(Window) __t, C(ListSection) listSection);
#define ListSection_notifySaveConfirmation(__i, __t, listSection) \
   VMETHOD(CO(ListSection), ListSection, notifySaveConfirmation, __i, C(DialogResult), \
      C(Window) _ARG C(ListSection), \
      __t _ARG listSection)
extern THIS_LIB_IMPORT C(Method) * METHOD(ListSection, notifySaveConfirmation);

extern THIS_LIB_IMPORT int M_VTBLID(ListSection, notifySelectListRow);
// void ListSection_notifySelectListRow(C(ListSection) __i, C(Window) __t, C(ListSection) listSection, C(Id) id);
#define ListSection_notifySelectListRow(__i, __t, listSection, id) \
   VMETHOD(CO(ListSection), ListSection, notifySelectListRow, __i, void, \
      C(Window) _ARG C(ListSection) _ARG C(Id), \
      __t _ARG listSection _ARG id)
extern THIS_LIB_IMPORT C(Method) * METHOD(ListSection, notifySelectListRow);

extern THIS_LIB_IMPORT void (* ListSection_refillList)(C(ListSection) __this);

extern THIS_LIB_IMPORT void (* ListSection_refreshState)(C(ListSection) __this);

extern THIS_LIB_IMPORT void (* ListSection_selectFirst)(C(ListSection) __this);

extern THIS_LIB_IMPORT void (* ListSection_selectListRow)(C(ListSection) __this, C(DataRow) row);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(ListSection, editor);
extern THIS_LIB_IMPORT void (* ListSection_set_editor)(C(ListSection) l, C(EditSection) value);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(ListSection, table);
extern THIS_LIB_IMPORT void (* ListSection_set_table)(C(ListSection) l, C(Table) value);

struct CM(Lookup)
{
   C(Field) valueField;
   C(Field) findField;
   C(Table) findIndex;
};
struct C(LookupEditor)
{
   subclass(TableEditor) editorClass;
   C(Window) parentWindow;
   C(Field) lookupValueField;
   C(Field) lookupFindField;
   C(Field) lookupIdField;
   C(Table) lookupFindIndex;
};
extern THIS_LIB_IMPORT C(String) (* NoCaseAccent_function)(C(NoCaseAccent) __this, C(String) text);

#define OPENOPTIONS_type_SHIFT                           0
#define OPENOPTIONS_type_MASK                            0xFF
#define OPENOPTIONS_type(x)                              ((((OpenOptions)(x)) & OPENOPTIONS_type_MASK) >> OPENOPTIONS_type_SHIFT)
#define OPENOPTIONS_SET_type(x, type)                       (x) = ((OpenOptions)(x) & ~((OpenOptions)OPENOPTIONS_type_MASK)) | (((OpenOptions)(type)) << OPENOPTIONS_type_SHIFT)
#define OPENOPTIONS_create_SHIFT                         8
#define OPENOPTIONS_create_MASK                          0x300
#define OPENOPTIONS_create(x)                            ((((OpenOptions)(x)) & OPENOPTIONS_create_MASK) >> OPENOPTIONS_create_SHIFT)
#define OPENOPTIONS_SET_create(x, create)                     (x) = ((OpenOptions)(x) & ~((OpenOptions)OPENOPTIONS_create_MASK)) | (((OpenOptions)(create)) << OPENOPTIONS_create_SHIFT)
#define OPENOPTIONS_access_SHIFT                         10
#define OPENOPTIONS_access_MASK                          0xC00
#define OPENOPTIONS_access(x)                            ((((OpenOptions)(x)) & OPENOPTIONS_access_MASK) >> OPENOPTIONS_access_SHIFT)
#define OPENOPTIONS_SET_access(x, access)                     (x) = ((OpenOptions)(x) & ~((OpenOptions)OPENOPTIONS_access_MASK)) | (((OpenOptions)(access)) << OPENOPTIONS_access_SHIFT)
#define OPENOPTIONS(type, create, access)                             (((((OpenOptions)(type)) << OPENOPTIONS_type_SHIFT) | ((OpenOptions)(create)) << OPENOPTIONS_create_SHIFT) | ((OpenOptions)(access)) << OPENOPTIONS_access_SHIFT)


struct CM(Page)
{
   C(Window) inside;
   int headerHeight;
};
extern THIS_LIB_IMPORT C(Property) * PROPERTY(Page, report);
extern THIS_LIB_IMPORT void (* Page_set_report)(C(Page) p, C(Report) value);
extern THIS_LIB_IMPORT C(Report) (* Page_get_report)(C(Page) p);

extern THIS_LIB_IMPORT int M_VTBLID(Report, advance);
// C(bool) Report_advance(C(Report) __i, int level, C(bool) * dontAdvance);
#define Report_advance(__i, level, dontAdvance) \
   VMETHOD(CO(Report), Report, advance, __i, C(bool), \
      C(Report) _ARG int _ARG C(bool) *, \
      __i _ARG level _ARG dontAdvance)
extern THIS_LIB_IMPORT C(Method) * METHOD(Report, advance);

extern THIS_LIB_IMPORT int M_VTBLID(Report, executeData);
// C(bool) Report_executeData(C(Report) __i, C(Database) db);
#define Report_executeData(__i, db) \
   VMETHOD(CO(Report), Report, executeData, __i, C(bool), \
      C(Report) _ARG C(Database), \
      __i _ARG db)
extern THIS_LIB_IMPORT C(Method) * METHOD(Report, executeData);

extern THIS_LIB_IMPORT int M_VTBLID(Report, executeRowData);
// void Report_executeRowData(C(Report) __i, int group);
#define Report_executeRowData(__i, group) \
   VMETHOD(CO(Report), Report, executeRowData, __i, void, \
      C(Report) _ARG int, \
      __i _ARG group)
extern THIS_LIB_IMPORT C(Method) * METHOD(Report, executeRowData);

extern THIS_LIB_IMPORT int M_VTBLID(Report, onReset);
// void Report_onReset(C(Report) __i);
#define Report_onReset(__i) \
   VMETHOD(CO(Report), Report, onReset, __i, void, \
      C(Report), \
      __i)
extern THIS_LIB_IMPORT C(Method) * METHOD(Report, onReset);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(Report, orientation);
extern THIS_LIB_IMPORT void (* Report_set_orientation)(C(Report) r, C(Orientation) value);
extern THIS_LIB_IMPORT C(Orientation) (* Report_get_orientation)(C(Report) r);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(Report, pageFormat);
extern THIS_LIB_IMPORT void (* Report_set_pageFormat)(C(Report) r, C(PageFormat) value);
extern THIS_LIB_IMPORT C(PageFormat) (* Report_get_pageFormat)(C(Report) r);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(Report, title);
extern THIS_LIB_IMPORT void (* Report_set_title)(C(Report) r, constString value);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(Report, nil);
extern THIS_LIB_IMPORT C(bool) (* Report_get_nil)(C(Report) r);

extern THIS_LIB_IMPORT int M_VTBLID(ReportDestination, addPage);
// void ReportDestination_addPage(C(ReportDestination) __i, C(Page) page);
#define ReportDestination_addPage(__i, page) \
   VMETHOD(CO(ReportDestination), ReportDestination, addPage, __i, void, \
      C(ReportDestination) _ARG C(Page), \
      __i _ARG page)
extern THIS_LIB_IMPORT C(Method) * METHOD(ReportDestination, addPage);

extern THIS_LIB_IMPORT int M_VTBLID(ReportDestination, endPage);
// void ReportDestination_endPage(C(ReportDestination) __i, C(Page) page);
#define ReportDestination_endPage(__i, page) \
   VMETHOD(CO(ReportDestination), ReportDestination, endPage, __i, void, \
      C(ReportDestination) _ARG C(Page), \
      __i _ARG page)
extern THIS_LIB_IMPORT C(Method) * METHOD(ReportDestination, endPage);

extern THIS_LIB_IMPORT int M_VTBLID(ReportDestination, getReport);
// C(Report) ReportDestination_getReport(C(ReportDestination) __i);
#define ReportDestination_getReport(__i) \
   VMETHOD(CO(ReportDestination), ReportDestination, getReport, __i, C(Report), \
      C(ReportDestination), \
      __i)
extern THIS_LIB_IMPORT C(Method) * METHOD(ReportDestination, getReport);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(ReportDestination, report);
extern THIS_LIB_IMPORT void (* ReportDestination_set_report)(C(ReportDestination) r, C(Report) value);
extern THIS_LIB_IMPORT C(Report) (* ReportDestination_get_report)(C(ReportDestination) r);

extern THIS_LIB_IMPORT int M_VTBLID(ReportRender, getPageNumber);
// int ReportRender_getPageNumber(C(ReportRender) __i);
#define ReportRender_getPageNumber(__i) \
   VMETHOD(CO(ReportRender), ReportRender, getPageNumber, __i, int, \
      C(ReportRender), \
      __i)
extern THIS_LIB_IMPORT C(Method) * METHOD(ReportRender, getPageNumber);

extern THIS_LIB_IMPORT int M_VTBLID(ReportRender, render);
// void ReportRender_render(C(ReportRender) __i, C(ReportDestination) destination, C(Report) report);
#define ReportRender_render(__i, destination, report) \
   VMETHOD(CO(ReportRender), ReportRender, render, __i, void, \
      C(ReportRender) _ARG C(ReportDestination) _ARG C(Report), \
      __i _ARG destination _ARG report)
extern THIS_LIB_IMPORT C(Method) * METHOD(ReportRender, render);

struct CM(ReportRenderNormal)
{
   int pageNumber;
   int level;
};
extern THIS_LIB_IMPORT C(bool) (* Row_add)(C(Row) __this);

extern THIS_LIB_IMPORT C(bool) (* Row_addID)(C(Row) __this, uint64 id);

extern THIS_LIB_IMPORT C(bool) (* Row_bindQueryData)(C(Row) __this, int paramID, C(Field) fld, C(Class) * class_value, void * value);

extern THIS_LIB_IMPORT C(bool) (* Row_delete)(C(Row) __this);

extern THIS_LIB_IMPORT C(bool) (* Row_find)(C(Row) __this, C(Field) field, C(MoveOptions) move, C(MatchOptions) match, C(Class) * class_data, void * data);

extern THIS_LIB_IMPORT C(bool) (* Row_findMultiple)(C(Row) __this, C(FieldFindData) * findData, C(MoveOptions) move, int numFields);

extern THIS_LIB_IMPORT C(bool) (* Row_first)(C(Row) __this);

extern THIS_LIB_IMPORT C(bool) (* Row_gUIDataRowSetData)(C(Row) __this, C(DataRow) dr, C(DataField) df, C(Field) fld);

extern THIS_LIB_IMPORT const char * (* Row_getColumn)(C(Row) __this, int paramID);

extern THIS_LIB_IMPORT C(bool) (* Row_getData)(C(Row) __this, C(Field) field, C(Class) * class_data, void * data);

extern THIS_LIB_IMPORT C(bool) (* Row_getDataFieldValue)(C(Row) __this, C(Field) field, C(FieldValue) * value);

extern THIS_LIB_IMPORT C(bool) (* Row_getQueryData)(C(Row) __this, int paramID, C(Field) fld, C(Class) * class_value, void * value);

extern THIS_LIB_IMPORT const void * (* Row_getRowData)(C(Row) __this);

extern THIS_LIB_IMPORT C(bool) (* Row_last)(C(Row) __this);

extern THIS_LIB_IMPORT C(bool) (* Row_next)(C(Row) __this);

extern THIS_LIB_IMPORT C(bool) (* Row_previous)(C(Row) __this);

extern THIS_LIB_IMPORT C(bool) (* Row_query)(C(Row) __this, const char * query);

extern THIS_LIB_IMPORT C(bool) (* Row_select)(C(Row) __this, C(MoveOptions) move);

extern THIS_LIB_IMPORT C(bool) (* Row_setData)(C(Row) __this, C(Field) field, C(Class) * class_data, void * data);

extern THIS_LIB_IMPORT C(bool) (* Row_setQueryParam)(C(Row) __this, int paramID, int value);

extern THIS_LIB_IMPORT C(bool) (* Row_setQueryParam64)(C(Row) __this, int paramID, int64 value);

extern THIS_LIB_IMPORT C(bool) (* Row_setQueryParamObject)(C(Row) __this, int paramID, void * value, C(Class) * type);

extern THIS_LIB_IMPORT C(bool) (* Row_setQueryParamText)(C(Row) __this, int paramID, const char * value);

extern THIS_LIB_IMPORT C(bool) (* Row_synch)(C(Row) __this, C(Row) to);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(Row, tbl);
extern THIS_LIB_IMPORT void (* Row_set_tbl)(C(Row) r, C(Table) value);
extern THIS_LIB_IMPORT C(Table) (* Row_get_tbl)(C(Row) r);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(Row, nil);
extern THIS_LIB_IMPORT C(bool) (* Row_get_nil)(C(Row) r);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(Row, query);
extern THIS_LIB_IMPORT void (* Row_set_query)(C(Row) r, const char * value);
extern THIS_LIB_IMPORT const char * (* Row_get_query)(C(Row) r);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(Row, rowsCount);
extern THIS_LIB_IMPORT uint (* Row_get_rowsCount)(C(Row) r);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(Row, sysID);
extern THIS_LIB_IMPORT void (* Row_set_sysID)(C(Row) r, uint64 value);
extern THIS_LIB_IMPORT uint64 (* Row_get_sysID)(C(Row) r);

struct CM(SQLCustomFunction)
{
   C(Method) * method;
   C(Class) * returnType;
   C(Array) args;
   void * rType;
   C(Array) argTypes;
   void * cif;
};
struct CM(SQLiteSearchField)
{
   C(Field) field;
};
struct CM(SQLiteSearchTable)
{
   C(Table) table;
   C(Field) idField;
   C(Array) searchFields;
};
struct CM(StringSearchField)
{
   C(Field) field;
   C(StringSearchIndexingMethod) method;
   C(Field) lookupFindField;
   C(Field) lookupValueField;
};
struct CM(StringSearchTable)
{
   C(Table) table;
   C(Field) idField;
   C(Array) searchFields;
};
extern THIS_LIB_IMPORT int M_VTBLID(Table, addField);
// C(Field) Table_addField(C(Table) __i, constString name, C(Class) * type, int length);
#define Table_addField(__i, name, type, length) \
   VMETHOD(CO(Table), Table, addField, __i, C(Field), \
      C(Table) _ARG constString _ARG C(Class) * _ARG int, \
      __i _ARG name _ARG type _ARG length)
extern THIS_LIB_IMPORT C(Method) * METHOD(Table, addField);

extern THIS_LIB_IMPORT int M_VTBLID(Table, createRow);
// C(DriverRow) Table_createRow(C(Table) __i);
#define Table_createRow(__i) \
   VMETHOD(CO(Table), Table, createRow, __i, C(DriverRow), \
      C(Table), \
      __i)
extern THIS_LIB_IMPORT C(Method) * METHOD(Table, createRow);

extern THIS_LIB_IMPORT int M_VTBLID(Table, findField);
// C(Field) Table_findField(C(Table) __i, constString name);
#define Table_findField(__i, name) \
   VMETHOD(CO(Table), Table, findField, __i, C(Field), \
      C(Table) _ARG constString, \
      __i _ARG name)
extern THIS_LIB_IMPORT C(Method) * METHOD(Table, findField);

extern THIS_LIB_IMPORT void (* Table_gUIListBoxAddFields)(C(Table) __this, C(ListBox) list);

extern THIS_LIB_IMPORT void (* Table_gUIListBoxAddRows)(C(Table) __this, C(ListBox) list);

extern THIS_LIB_IMPORT void (* Table_gUIListBoxAddRowsField)(C(Table) __this, C(ListBox) list, constString fieldName);

extern THIS_LIB_IMPORT int M_VTBLID(Table, generateIndex);
// C(bool) Table_generateIndex(C(Table) __i, int count, C(FieldIndex) * fieldIndexes, C(bool) init);
#define Table_generateIndex(__i, count, fieldIndexes, init) \
   VMETHOD(CO(Table), Table, generateIndex, __i, C(bool), \
      C(Table) _ARG int _ARG C(FieldIndex) * _ARG C(bool), \
      __i _ARG count _ARG fieldIndexes _ARG init)
extern THIS_LIB_IMPORT C(Method) * METHOD(Table, generateIndex);

extern THIS_LIB_IMPORT int M_VTBLID(Table, getFields);
// C(Container) Table_getFields(C(Table) __i);
#define Table_getFields(__i) \
   VMETHOD(CO(Table), Table, getFields, __i, C(Container), \
      C(Table), \
      __i)
extern THIS_LIB_IMPORT C(Method) * METHOD(Table, getFields);

extern THIS_LIB_IMPORT int M_VTBLID(Table, getFieldsCount);
// uint Table_getFieldsCount(C(Table) __i);
#define Table_getFieldsCount(__i) \
   VMETHOD(CO(Table), Table, getFieldsCount, __i, uint, \
      C(Table), \
      __i)
extern THIS_LIB_IMPORT C(Method) * METHOD(Table, getFieldsCount);

extern THIS_LIB_IMPORT int M_VTBLID(Table, getFirstField);
// C(Field) Table_getFirstField(C(Table) __i);
#define Table_getFirstField(__i) \
   VMETHOD(CO(Table), Table, getFirstField, __i, C(Field), \
      C(Table), \
      __i)
extern THIS_LIB_IMPORT C(Method) * METHOD(Table, getFirstField);

extern THIS_LIB_IMPORT int M_VTBLID(Table, getName);
// constString Table_getName(C(Table) __i);
#define Table_getName(__i) \
   VMETHOD(CO(Table), Table, getName, __i, constString, \
      C(Table), \
      __i)
extern THIS_LIB_IMPORT C(Method) * METHOD(Table, getName);

extern THIS_LIB_IMPORT int M_VTBLID(Table, getPrimaryKey);
// C(Field) Table_getPrimaryKey(C(Table) __i);
#define Table_getPrimaryKey(__i) \
   VMETHOD(CO(Table), Table, getPrimaryKey, __i, C(Field), \
      C(Table), \
      __i)
extern THIS_LIB_IMPORT C(Method) * METHOD(Table, getPrimaryKey);

extern THIS_LIB_IMPORT int M_VTBLID(Table, getRecordSize);
// uint Table_getRecordSize(C(Table) __i);
#define Table_getRecordSize(__i) \
   VMETHOD(CO(Table), Table, getRecordSize, __i, uint, \
      C(Table), \
      __i)
extern THIS_LIB_IMPORT C(Method) * METHOD(Table, getRecordSize);

extern THIS_LIB_IMPORT int M_VTBLID(Table, getRowsCount);
// uint Table_getRowsCount(C(Table) __i);
#define Table_getRowsCount(__i) \
   VMETHOD(CO(Table), Table, getRowsCount, __i, uint, \
      C(Table), \
      __i)
extern THIS_LIB_IMPORT C(Method) * METHOD(Table, getRowsCount);

extern THIS_LIB_IMPORT C(bool) (* Table_index)(C(Table) __this, int count, C(FieldIndex) * fieldIndexes);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(Table, name);
extern THIS_LIB_IMPORT constString (* Table_get_name)(C(Table) t);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(Table, firstField);
extern THIS_LIB_IMPORT C(Field) (* Table_get_firstField)(C(Table) t);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(Table, primaryKey);
extern THIS_LIB_IMPORT C(Field) (* Table_get_primaryKey)(C(Table) t);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(Table, fieldsCount);
extern THIS_LIB_IMPORT uint (* Table_get_fieldsCount)(C(Table) t);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(Table, rowsCount);
extern THIS_LIB_IMPORT uint (* Table_get_rowsCount)(C(Table) t);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(Table, fields);
extern THIS_LIB_IMPORT C(Container) (* Table_get_fields)(C(Table) t);

struct CM(TableDropBox)
{
   C(Id) filter;
   C(bool) filtered;
   C(Field) nameField;
   C(Id) exclusion;
   C(Table) table;
   C(Field) filterField;
};
extern THIS_LIB_IMPORT void (* TableDropBox_editNotifyCharsAdded)(C(TableDropBox) __this);

extern THIS_LIB_IMPORT void (* TableDropBox_editNotifyUpdate)(C(TableDropBox) __this, C(EditBox) editBox);

extern THIS_LIB_IMPORT int M_VTBLID(TableDropBox, refill);
// void TableDropBox_refill(C(TableDropBox) __i);
#define TableDropBox_refill(__i) \
   VMETHOD(CO(TableDropBox), TableDropBox, refill, __i, void, \
      C(TableDropBox), \
      __i)
extern THIS_LIB_IMPORT C(Method) * METHOD(TableDropBox, refill);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(TableDropBox, filter);
extern THIS_LIB_IMPORT void (* TableDropBox_set_filter)(C(TableDropBox) t, C(Id) value);
extern THIS_LIB_IMPORT C(Id) (* TableDropBox_get_filter)(C(TableDropBox) t);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(TableDropBox, nameField);
extern THIS_LIB_IMPORT void (* TableDropBox_set_nameField)(C(TableDropBox) t, C(Field) value);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(TableDropBox, exclusion);
extern THIS_LIB_IMPORT void (* TableDropBox_set_exclusion)(C(TableDropBox) t, C(Id) value);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(TableDropBox, table);
extern THIS_LIB_IMPORT void (* TableDropBox_set_table)(C(TableDropBox) t, C(Table) value);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(TableDropBox, filterField);
extern THIS_LIB_IMPORT void (* TableDropBox_set_filterField)(C(TableDropBox) t, C(Field) value);

extern THIS_LIB_IMPORT void (* TableEditor_createRow)(C(TableEditor) __this);

extern THIS_LIB_IMPORT void (* TableEditor_enumerate)(C(TableEditor) __this);

extern THIS_LIB_IMPORT C(bool) (* TableEditor_filter)(C(TableEditor) __this, C(Id) id);

extern THIS_LIB_IMPORT C(bool) (* TableEditor_listSelect)(C(TableEditor) __this, C(DataRow) row);

extern THIS_LIB_IMPORT void (* TableEditor_load)(C(TableEditor) __this);

extern THIS_LIB_IMPORT C(bool) (* TableEditor_notifyClosing)(C(TableEditor) __this);

extern THIS_LIB_IMPORT void (* TableEditor_notifyModifiedDocument)(C(TableEditor) __this);

extern THIS_LIB_IMPORT int M_VTBLID(TableEditor, onCreateDynamicLookupEditors);
// void TableEditor_onCreateDynamicLookupEditors(C(TableEditor) __i);
#define TableEditor_onCreateDynamicLookupEditors(__i) \
   VMETHOD(CO(TableEditor), TableEditor, onCreateDynamicLookupEditors, __i, void, \
      C(TableEditor), \
      __i)
extern THIS_LIB_IMPORT C(Method) * METHOD(TableEditor, onCreateDynamicLookupEditors);

extern THIS_LIB_IMPORT int M_VTBLID(TableEditor, onInitialize);
// void TableEditor_onInitialize(C(TableEditor) __i);
#define TableEditor_onInitialize(__i) \
   VMETHOD(CO(TableEditor), TableEditor, onInitialize, __i, void, \
      C(TableEditor), \
      __i)
extern THIS_LIB_IMPORT C(Method) * METHOD(TableEditor, onInitialize);

extern THIS_LIB_IMPORT int M_VTBLID(TableEditor, onLeavingModifiedDocument);
// C(DialogResult) TableEditor_onLeavingModifiedDocument(C(TableEditor) __i);
#define TableEditor_onLeavingModifiedDocument(__i) \
   VMETHOD(CO(TableEditor), TableEditor, onLeavingModifiedDocument, __i, C(DialogResult), \
      C(TableEditor), \
      __i)
extern THIS_LIB_IMPORT C(Method) * METHOD(TableEditor, onLeavingModifiedDocument);

extern THIS_LIB_IMPORT int M_VTBLID(TableEditor, onList);
// void TableEditor_onList(C(TableEditor) __i, C(Row) r, C(Array) matches);
#define TableEditor_onList(__i, r, matches) \
   VMETHOD(CO(TableEditor), TableEditor, onList, __i, void, \
      C(TableEditor) _ARG C(Row) _ARG C(Array), \
      __i _ARG r _ARG matches)
extern THIS_LIB_IMPORT C(Method) * METHOD(TableEditor, onList);

extern THIS_LIB_IMPORT int M_VTBLID(TableEditor, onLoad);
// void TableEditor_onLoad(C(TableEditor) __i);
#define TableEditor_onLoad(__i) \
   VMETHOD(CO(TableEditor), TableEditor, onLoad, __i, void, \
      C(TableEditor), \
      __i)
extern THIS_LIB_IMPORT C(Method) * METHOD(TableEditor, onLoad);

extern THIS_LIB_IMPORT int M_VTBLID(TableEditor, onRemovalRequest);
// C(bool) TableEditor_onRemovalRequest(C(TableEditor) __i);
#define TableEditor_onRemovalRequest(__i) \
   VMETHOD(CO(TableEditor), TableEditor, onRemovalRequest, __i, C(bool), \
      C(TableEditor), \
      __i)
extern THIS_LIB_IMPORT C(Method) * METHOD(TableEditor, onRemovalRequest);

extern THIS_LIB_IMPORT int M_VTBLID(TableEditor, onStateChanged);
// void TableEditor_onStateChanged(C(TableEditor) __i);
#define TableEditor_onStateChanged(__i) \
   VMETHOD(CO(TableEditor), TableEditor, onStateChanged, __i, void, \
      C(TableEditor), \
      __i)
extern THIS_LIB_IMPORT C(Method) * METHOD(TableEditor, onStateChanged);

extern THIS_LIB_IMPORT void (* TableEditor_remove)(C(TableEditor) __this);

extern THIS_LIB_IMPORT C(bool) (* TableEditor_select)(C(TableEditor) __this, C(Id) id);

extern THIS_LIB_IMPORT void (* TableEditor_selectListRow)(C(TableEditor) __this, C(DataRow) row);

extern THIS_LIB_IMPORT C(bool) (* TableEditor_selectNext)(C(TableEditor) __this, C(bool) loopAround);

extern THIS_LIB_IMPORT C(bool) (* TableEditor_selectPrevious)(C(TableEditor) __this, C(bool) loopAround);

extern THIS_LIB_IMPORT void (* TableEditor_write)(C(TableEditor) __this);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(TableEditor, table);
extern THIS_LIB_IMPORT void (* TableEditor_set_table)(C(TableEditor) t, C(Table) value);
extern THIS_LIB_IMPORT C(Table) (* TableEditor_get_table)(C(TableEditor) t);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(TableEditor, index);
extern THIS_LIB_IMPORT void (* TableEditor_set_index)(C(TableEditor) t, C(Table) value);
extern THIS_LIB_IMPORT C(Table) (* TableEditor_get_index)(C(TableEditor) t);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(TableEditor, list);
extern THIS_LIB_IMPORT void (* TableEditor_set_list)(C(TableEditor) t, C(ListBox) value);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(TableEditor, listFields);
extern THIS_LIB_IMPORT void (* TableEditor_set_listFields)(C(TableEditor) t, C(Array) value);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(TableEditor, listSortOrder);
extern THIS_LIB_IMPORT void (* TableEditor_set_listSortOrder)(C(TableEditor) t, int value);
extern THIS_LIB_IMPORT int (* TableEditor_get_listSortOrder)(C(TableEditor) t);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(TableEditor, listSortField);
extern THIS_LIB_IMPORT void (* TableEditor_set_listSortField)(C(TableEditor) t, C(DataField) value);
extern THIS_LIB_IMPORT C(DataField) (* TableEditor_get_listSortField)(C(TableEditor) t);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(TableEditor, disabledFullListing);
extern THIS_LIB_IMPORT void (* TableEditor_set_disabledFullListing)(C(TableEditor) t, C(bool) value);
extern THIS_LIB_IMPORT C(bool) (* TableEditor_get_disabledFullListing)(C(TableEditor) t);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(TableEditor, searchFields);
extern THIS_LIB_IMPORT void (* TableEditor_set_searchFields)(C(TableEditor) t, C(Array) value);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(TableEditor, searchTables);
extern THIS_LIB_IMPORT void (* TableEditor_set_searchTables)(C(TableEditor) t, C(Array) value);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(TableEditor, sqliteSearchTables);
extern THIS_LIB_IMPORT void (* TableEditor_set_sqliteSearchTables)(C(TableEditor) t, C(Array) value);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(TableEditor, searchString);
extern THIS_LIB_IMPORT void (* TableEditor_set_searchString)(C(TableEditor) t, constString value);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(TableEditor, dynamicLookupEditors);
extern THIS_LIB_IMPORT void (* TableEditor_set_dynamicLookupEditors)(C(TableEditor) t, C(Array) value);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(TableEditor, selectedId);
extern THIS_LIB_IMPORT C(Id) (* TableEditor_get_selectedId)(C(TableEditor) t);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(TableEditor, idField);
extern THIS_LIB_IMPORT void (* TableEditor_set_idField)(C(TableEditor) t, C(Field) value);
extern THIS_LIB_IMPORT C(Field) (* TableEditor_get_idField)(C(TableEditor) t);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(TableEditor, stringField);
extern THIS_LIB_IMPORT void (* TableEditor_set_stringField)(C(TableEditor) t, C(Field) value);
extern THIS_LIB_IMPORT C(Field) (* TableEditor_get_stringField)(C(TableEditor) t);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(TableEditor, indexFilterField);
extern THIS_LIB_IMPORT void (* TableEditor_set_indexFilterField)(C(TableEditor) t, C(Field) value);
extern THIS_LIB_IMPORT C(Field) (* TableEditor_get_indexFilterField)(C(TableEditor) t);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(TableEditor, readOnly);
extern THIS_LIB_IMPORT void (* TableEditor_set_readOnly)(C(TableEditor) t, C(bool) value);
extern THIS_LIB_IMPORT C(bool) (* TableEditor_get_readOnly)(C(TableEditor) t);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(TableEditor, masterEditor);
extern THIS_LIB_IMPORT void (* TableEditor_set_masterEditor)(C(TableEditor) t, C(TableEditor) value);
extern THIS_LIB_IMPORT C(TableEditor) (* TableEditor_get_masterEditor)(C(TableEditor) t);

extern THIS_LIB_IMPORT char * (* convertToASCII)(const char * string, char * newString, int * len, C(bool) lowerCase);
extern THIS_LIB_IMPORT void (* eRSProgressAdvance)(void);
extern THIS_LIB_IMPORT void (* eRSProgressAdvanceLevelCheck)(void);
extern THIS_LIB_IMPORT void (* setDefaultIdField)(const char * value);
extern THIS_LIB_IMPORT void (* setDefaultNameField)(const char * value);
extern THIS_LIB_IMPORT void (* setEDBIndexOptions)(C(EDBIndexOptions) options);
extern THIS_LIB_IMPORT char (* toASCII)(unichar ch);
extern THIS_LIB_IMPORT C(Class) * CO(AccessOptions);
extern THIS_LIB_IMPORT C(Class) * CO(ButtonStyle);
extern THIS_LIB_IMPORT C(Class) * CO(CSVReport);
extern THIS_LIB_IMPORT C(Class) * CO(CheckBool);
extern THIS_LIB_IMPORT C(Class) * CO(CreateOptions);
extern THIS_LIB_IMPORT C(Class) * CO(DataList);
extern THIS_LIB_IMPORT C(Class) * CO(DataSource);
extern THIS_LIB_IMPORT C(Class) * CO(DataSourceDriver);
extern THIS_LIB_IMPORT C(Class) * CO(Database);
extern THIS_LIB_IMPORT C(Class) * CO(Detail);
extern THIS_LIB_IMPORT C(Class) * CO(DirFilesDataSourceDriver);
extern THIS_LIB_IMPORT C(Class) * CO(DriverRow);
extern THIS_LIB_IMPORT C(Class) * CO(DropDataBox);
extern THIS_LIB_IMPORT C(Class) * CO(EDBIndexOptions);
extern THIS_LIB_IMPORT C(Class) * CO(EditDropDataBox);
extern THIS_LIB_IMPORT C(Class) * CO(EditFieldDropDataBox);
extern THIS_LIB_IMPORT C(Class) * CO(EditSection);
extern THIS_LIB_IMPORT C(Class) * CO(Field);
extern THIS_LIB_IMPORT C(Class) * CO(FieldBox);
extern THIS_LIB_IMPORT C(Class) * CO(FieldCheckButton);
extern THIS_LIB_IMPORT C(Class) * CO(FieldDataBox);
extern THIS_LIB_IMPORT C(Class) * CO(FieldDropDataBox);
extern THIS_LIB_IMPORT C(Class) * CO(FieldFindData);
extern THIS_LIB_IMPORT C(Class) * CO(FieldIndex);
extern THIS_LIB_IMPORT C(Class) * CO(FieldType);
extern THIS_LIB_IMPORT C(Class) * CO(FieldTypeEx);
extern THIS_LIB_IMPORT C(Class) * CO(FieldValue);
extern THIS_LIB_IMPORT C(Class) * CO(FixedMultiLineString);
extern THIS_LIB_IMPORT C(Class) * CO(GetMemberString);
extern THIS_LIB_IMPORT C(Class) * CO(Group);
extern THIS_LIB_IMPORT C(Class) * CO(Grouping);
extern THIS_LIB_IMPORT C(Class) * CO(Id);
extern THIS_LIB_IMPORT C(Class) * CO(IdFilter);
extern THIS_LIB_IMPORT C(Class) * CO(IdList);
extern THIS_LIB_IMPORT C(Class) * CO(IdList32);
extern THIS_LIB_IMPORT C(Class) * CO(IdList32Includes);
extern THIS_LIB_IMPORT C(Class) * CO(IdListIncludes);
extern THIS_LIB_IMPORT C(Class) * CO(IndexOrder);
extern THIS_LIB_IMPORT C(Class) * CO(ListField);
extern THIS_LIB_IMPORT C(Class) * CO(ListSection);
extern THIS_LIB_IMPORT C(Class) * CO(Lookup);
extern THIS_LIB_IMPORT C(Class) * CO(LookupEditor);
extern THIS_LIB_IMPORT C(Class) * CO(MatchOptions);
extern THIS_LIB_IMPORT C(Class) * CO(MemberStringSample);
extern THIS_LIB_IMPORT C(Class) * CO(MoveOptions);
extern THIS_LIB_IMPORT C(Class) * CO(NoCaseAccent);
extern THIS_LIB_IMPORT C(Class) * CO(ObjectType);
extern THIS_LIB_IMPORT C(Class) * CO(OpenOptions);
extern THIS_LIB_IMPORT C(Class) * CO(OpenType);
extern THIS_LIB_IMPORT C(Class) * CO(Orientation);
extern THIS_LIB_IMPORT C(Class) * CO(Page);
extern THIS_LIB_IMPORT C(Class) * CO(PageFormat);
extern THIS_LIB_IMPORT C(Class) * CO(PrintedReport);
extern THIS_LIB_IMPORT C(Class) * CO(RenderAction);
extern THIS_LIB_IMPORT C(Class) * CO(Report);
extern THIS_LIB_IMPORT C(Class) * CO(ReportDestination);
extern THIS_LIB_IMPORT C(Class) * CO(ReportPreviewArea);
extern THIS_LIB_IMPORT C(Class) * CO(ReportRender);
extern THIS_LIB_IMPORT C(Class) * CO(ReportRenderNormal);
extern THIS_LIB_IMPORT C(Class) * CO(ReportTitle);
extern THIS_LIB_IMPORT C(Class) * CO(Row);
extern THIS_LIB_IMPORT C(Class) * CO(SQLCustomFunction);
extern THIS_LIB_IMPORT C(Class) * CO(SQLiteSearchField);
extern THIS_LIB_IMPORT C(Class) * CO(SQLiteSearchTable);
extern THIS_LIB_IMPORT C(Class) * CO(SeekOptions);
extern THIS_LIB_IMPORT C(Class) * CO(State);
extern THIS_LIB_IMPORT C(Class) * CO(StringList);
extern THIS_LIB_IMPORT C(Class) * CO(StringSearchField);
extern THIS_LIB_IMPORT C(Class) * CO(StringSearchIndexingMethod);
extern THIS_LIB_IMPORT C(Class) * CO(StringSearchTable);
extern THIS_LIB_IMPORT C(Class) * CO(Table);
extern THIS_LIB_IMPORT C(Class) * CO(TableDropBox);
extern THIS_LIB_IMPORT C(Class) * CO(TableEditor);

extern THIS_LIB_IMPORT C(Module) EDA_init(C(Module) fromModule);



#ifdef __cplusplus

};

#endif

#endif // !defined(__EDA_H__)
