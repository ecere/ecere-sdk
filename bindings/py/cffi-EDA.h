typedef Window TableEditor;
typedef DropBox TableDropBox;
typedef Instance Table;
typedef int StringSearchIndexingMethod;
enum
{
   StringSearchIndexingMethod_fullString = 0x0,
   StringSearchIndexingMethod_allSubstrings = 0x1
};

typedef Instance SQLCustomFunction;
typedef Instance Row;
typedef Instance ReportRender;
typedef Window ReportDestination;
struct class_members_Report
{
   Size pageSize;
   Anchor insideMarginAnchor;
   Array groupings;
   String title;
   ReportRender render;
   Class * reportHeader;
   Class * reportFooter;
   Class * pageHeader;
   Class * pageFooter;
   Class * rowDetail;
};
typedef Instance Report;
typedef int PageFormat;
enum
{
   PageFormat_custom = 0x0,
   PageFormat_letter = 0x1,
   PageFormat_legal = 0x2,
   PageFormat_ledger = 0x3
};

typedef Window Page;
typedef int Orientation;
enum
{
   Orientation_portrait = 0x0,
   Orientation_landscape = 0x1
};

typedef uint32 OpenOptions;
typedef int ObjectType;
enum
{
   ObjectType_table = 0x0,
   ObjectType_view = 0x1
};

typedef SQLCustomFunction NoCaseAccent;
typedef int MoveOptions;
enum
{
   MoveOptions_nil = 0x0,
   MoveOptions_first = 0x1,
   MoveOptions_last = 0x2,
   MoveOptions_next = 0x3,
   MoveOptions_previous = 0x4,
   MoveOptions_middle = 0x5,
   MoveOptions_here = 0x6
};

typedef int MatchOptions;
enum
{
   MatchOptions_nil = 0x0
};

typedef Instance Field;
typedef Button ButtonStyle;
struct class_members_ListSection
{
   Field fldId;
   Field fldName;
   Field fldActive;
   ButtonStyle btnNew;
   ButtonStyle btnDelete;
   ListBox list;
};
typedef Window Group;
typedef Group ListSection;
typedef int IndexOrder;
enum
{
   IndexOrder_ascending = 0x0,
   IndexOrder_descending = 0x1
};

typedef SQLCustomFunction IdListIncludes;
typedef SQLCustomFunction IdList32Includes;
typedef Instance IdList;
typedef IdList IdList32;
typedef uint64 Id;
typedef struct IdFilter IdFilter;
typedef Instance Grouping;
struct class_members_Grouping
{
   Id groupId;
   Row row;
   Field field;
   Field fieldLink;
   bool filtered;
   Array filters;
   Field listFieldLink;
   Field reverseListFieldLink;
   Grouping reverseLink;
   bool activeOnly;
   Field activeField;
   uint rowsCount;
   Class * header;
   Class * continuation;
   Class * footer;
};
typedef NoCaseAccent GetMemberString;
typedef struct FieldValue FieldValue;
typedef uint32 FieldTypeEx;
typedef struct FieldIndex FieldIndex;
typedef struct FieldFindData FieldFindData;
typedef DataBox FieldDataBox;
typedef FieldDataBox FieldDropDataBox;
typedef Group EditSection;
struct class_members_EditSection
{
   ListSection list;
   Table table;
   Row editRow;
   DataRow listRow;
   OldList editBoxes;
   Window editArea;
   ButtonStyle btnSave;
   ButtonStyle btnReload;
};
typedef FieldDropDataBox EditFieldDropDataBox;
typedef DataBox DropDataBox;
typedef Instance DriverRow;
typedef Instance DataSourceDriver;
typedef DataSourceDriver DirFilesDataSourceDriver;
typedef Instance Database;
typedef Instance DataSource;
typedef int CreateOptions;
enum
{
   CreateOptions_no = 0x0,
   CreateOptions_create = 0x1,
   CreateOptions_readOnly = 0x2
};

typedef int AccessOptions;
enum
{
   AccessOptions_integral = 0x0,
   AccessOptions_random = 0x1
};

typedef ReportDestination CSVReport;
typedef bool CheckBool;

typedef struct OldList DataList;
typedef Window Detail;
typedef uint32 EDBIndexOptions;
typedef DropDataBox EditDropDataBox;
typedef DataBox FieldBox;
typedef FieldDataBox FieldCheckButton;
typedef int FieldType;
enum
{
   FieldType_integer = 0x1,
   FieldType_real = 0x2,
   FieldType_text = 0x3,
   FieldType_blob = 0x4,
   FieldType_nil = 0x5
};

typedef String FixedMultiLineString;
typedef struct ListField ListField;
typedef Instance Lookup;
typedef struct LookupEditor LookupEditor;
typedef Instance MemberStringSample;
typedef int OpenType;
enum
{
   OpenType_queryRows = 0x0,
   OpenType_tableRows = 0x1,
   OpenType_viewRows = 0x2,
   OpenType_processesList = 0x3,
   OpenType_databasesList = 0x4,
   OpenType_tablesList = 0x5,
   OpenType_fieldsList = 0x6
};

typedef ReportDestination PrintedReport;
typedef int RenderAction;
enum
{
   RenderAction_addPage = 0x0,
   RenderAction_closePage = 0x1,
   RenderAction_levelStart = 0x2,
   RenderAction_levelFinish = 0x3,
   RenderAction_groupStart = 0x4,
   RenderAction_groupFinish = 0x5,
   RenderAction_actualRows = 0x6
};

typedef ReportDestination ReportPreviewArea;
typedef ReportRender ReportRenderNormal;
typedef Window ReportTitle;
typedef Instance SQLiteSearchField;
typedef Instance SQLiteSearchTable;
typedef int SeekOptions;
enum
{
   SeekOptions_none = 0x0,
   SeekOptions_reset = 0x1,
   SeekOptions_first = 0x2,
   SeekOptions_last = 0x3,
   SeekOptions_firstEqual = 0x4,
   SeekOptions_lastEqual = 0x5
};

typedef int State;
enum
{
   State_none = 0x0,
   State_driver = 0x1,
   State_connected = 0x2,
   State_opened = 0x3,
   State_closed = 0x4,
   State_errorDriver = 0x5
};

typedef Instance StringList;
typedef Instance StringSearchField;
typedef Instance StringSearchTable;
typedef uint64_t tparam_GetMemberString_NT;
extern bool (* DataSource_connect)(DataSource __this);

extern bool (* DataSource_deleteDatabase)(DataSource __this, constString name);

extern Database (* DataSource_openDatabase)(DataSource __this, constString name, CreateOptions create);

extern bool (* DataSource_renameDatabase)(DataSource __this, constString name, constString rename);

extern void (* DataSource_status)(DataSource __this);

extern Property * property_DataSource_driver;
extern void (* DataSource_set_driver)(DataSource d, constString value);
extern constString (* DataSource_get_driver)(DataSource d);

extern Property * property_DataSource_host;
extern void (* DataSource_set_host)(DataSource d, constString value);
extern constString (* DataSource_get_host)(DataSource d);

extern Property * property_DataSource_port;
extern void (* DataSource_set_port)(DataSource d, constString value);
extern constString (* DataSource_get_port)(DataSource d);

extern Property * property_DataSource_user;
extern void (* DataSource_set_user)(DataSource d, constString value);
extern constString (* DataSource_get_user)(DataSource d);

extern Property * property_DataSource_pass;
extern void (* DataSource_set_pass)(DataSource d, constString value);
extern constString (* DataSource_get_pass)(DataSource d);

extern Property * property_DataSource_locator;
extern void (* DataSource_set_locator)(DataSource d, constString value);
extern constString (* DataSource_get_locator)(DataSource d);

extern Property * property_DataSource_databasesCount;
extern uint (* DataSource_get_databasesCount)(DataSource d);

extern Property * property_DataSource_databases;
extern Array (* DataSource_get_databases)(DataSource d);

extern int DataSourceDriver_buildLocator_vTblID;
String DataSourceDriver_buildLocator(DataSourceDriver __i, DataSource ds);
extern Method * method_DataSourceDriver_buildLocator;

extern int DataSourceDriver_connect_vTblID;
bool DataSourceDriver_connect(DataSourceDriver __i, constString locator);
extern Method * method_DataSourceDriver_connect;

extern int DataSourceDriver_deleteDatabase_vTblID;
bool DataSourceDriver_deleteDatabase(DataSourceDriver __i, constString name);
extern Method * method_DataSourceDriver_deleteDatabase;

extern int DataSourceDriver_getDatabases_vTblID;
Array DataSourceDriver_getDatabases(DataSourceDriver __i);
extern Method * method_DataSourceDriver_getDatabases;

extern int DataSourceDriver_getDatabasesCount_vTblID;
uint DataSourceDriver_getDatabasesCount(DataSourceDriver __i);
extern Method * method_DataSourceDriver_getDatabasesCount;

extern int DataSourceDriver_openDatabase_vTblID;
Database DataSourceDriver_openDatabase(DataSourceDriver __i, constString name, CreateOptions create, DataSource ds);
extern Method * method_DataSourceDriver_openDatabase;

extern int DataSourceDriver_renameDatabase_vTblID;
bool DataSourceDriver_renameDatabase(DataSourceDriver __i, constString name, constString rename);
extern Method * method_DataSourceDriver_renameDatabase;

extern int DataSourceDriver_status_vTblID;
void DataSourceDriver_status(DataSourceDriver __i);
extern Method * method_DataSourceDriver_status;

extern int Database_begin_vTblID;
bool Database_begin(Database __i);
extern Method * method_Database_begin;

extern int Database_commit_vTblID;
bool Database_commit(Database __i);
extern Method * method_Database_commit;

extern int Database_createCustomFunction_vTblID;
bool Database_createCustomFunction(Database __i, const char * name, SQLCustomFunction customFunction);
extern Method * method_Database_createCustomFunction;

extern int Database_deleteObject_vTblID;
bool Database_deleteObject(Database __i, ObjectType type, constString name);
extern Method * method_Database_deleteObject;

extern int Database_getName_vTblID;
String Database_getName(Database __i);
extern Method * method_Database_getName;

extern int Database_getTables_vTblID;
Array Database_getTables(Database __i);
extern Method * method_Database_getTables;

extern void (* Database_linkTable)(Database __this, Table tbl);

extern int Database_objectsCount_vTblID;
uint Database_objectsCount(Database __i, ObjectType type);
extern Method * method_Database_objectsCount;

extern int Database_openTable_vTblID;
Table Database_openTable(Database __i, constString name, OpenOptions open);
extern Method * method_Database_openTable;

extern int Database_renameObject_vTblID;
bool Database_renameObject(Database __i, ObjectType type, constString name, constString rename);
extern Method * method_Database_renameObject;

extern Property * property_Database_name;
extern String (* Database_get_name)(Database d);

extern Property * property_Database_tablesCount;
extern uint (* Database_get_tablesCount)(Database d);

extern Property * property_Database_viewsCount;
extern uint (* Database_get_viewsCount)(Database d);

extern Property * property_Database_tables;
extern Array (* Database_get_tables)(Database d);

struct class_members_Detail
{
   bool keepTogether;
   bool isLast;
   int level;
   Class * rowDetail;
};
struct class_members_DirFilesDataSourceDriver
{
   constString path;
   constString databaseFileExt;
   constString tableFileExt;
};
extern int DirFilesDataSourceDriver_isDatabaseFile_vTblID;
bool DirFilesDataSourceDriver_isDatabaseFile(DirFilesDataSourceDriver __i, const char * fullPath);
extern Method * method_DirFilesDataSourceDriver_isDatabaseFile;

extern String (* DirFilesDataSourceDriver_makeDatabasePath)(DirFilesDataSourceDriver __this, constString name);

extern int DriverRow_add_vTblID;
bool DriverRow_add(DriverRow __i, uint64 id);
extern Method * method_DriverRow_add;

extern int DriverRow_bindQueryData_vTblID;
bool DriverRow_bindQueryData(DriverRow __i, int paramID, Field fld, Class * class_value, void * value);
extern Method * method_DriverRow_bindQueryData;

extern int DriverRow_delete_vTblID;
bool DriverRow_delete(DriverRow __i);
extern Method * method_DriverRow_delete;

extern int DriverRow_find_vTblID;
bool DriverRow_find(DriverRow __i, Field fld, MoveOptions move, MatchOptions match, Class * class_data, void * data);
extern Method * method_DriverRow_find;

extern int DriverRow_findMultiple_vTblID;
bool DriverRow_findMultiple(DriverRow __i, FieldFindData * findData, MoveOptions move, int numFields);
extern Method * method_DriverRow_findMultiple;

extern int DriverRow_getColumn_vTblID;
const char * DriverRow_getColumn(DriverRow __i, int paramID);
extern Method * method_DriverRow_getColumn;

extern int DriverRow_getData_vTblID;
bool DriverRow_getData(DriverRow __i, Field fld, Class * class_data, void * data);
extern Method * method_DriverRow_getData;

extern int DriverRow_getDataFieldValue_vTblID;
bool DriverRow_getDataFieldValue(DriverRow __i, Field fld, FieldValue * value);
extern Method * method_DriverRow_getDataFieldValue;

extern int DriverRow_getQueryData_vTblID;
bool DriverRow_getQueryData(DriverRow __i, int paramID, Field fld, Class * class_value, void * value);
extern Method * method_DriverRow_getQueryData;

extern int DriverRow_getRowData_vTblID;
const void * DriverRow_getRowData(DriverRow __i);
extern Method * method_DriverRow_getRowData;

extern int DriverRow_getSysID_vTblID;
uint64 DriverRow_getSysID(DriverRow __i);
extern Method * method_DriverRow_getSysID;

extern int DriverRow_goToSysID_vTblID;
bool DriverRow_goToSysID(DriverRow __i, uint64 id);
extern Method * method_DriverRow_goToSysID;

extern int DriverRow_nil_vTblID;
bool DriverRow_nil(DriverRow __i);
extern Method * method_DriverRow_nil;

extern int DriverRow_query_vTblID;
bool DriverRow_query(DriverRow __i, const char * queryString);
extern Method * method_DriverRow_query;

extern int DriverRow_select_vTblID;
bool DriverRow_select(DriverRow __i, MoveOptions move);
extern Method * method_DriverRow_select;

extern int DriverRow_setData_vTblID;
bool DriverRow_setData(DriverRow __i, Field fld, Class * class_data, void * data);
extern Method * method_DriverRow_setData;

extern int DriverRow_setQueryParam_vTblID;
bool DriverRow_setQueryParam(DriverRow __i, int paramID, int value);
extern Method * method_DriverRow_setQueryParam;

extern int DriverRow_setQueryParam64_vTblID;
bool DriverRow_setQueryParam64(DriverRow __i, int paramID, int64 value);
extern Method * method_DriverRow_setQueryParam64;

extern int DriverRow_setQueryParamObject_vTblID;
bool DriverRow_setQueryParamObject(DriverRow __i, int paramID, const void * data, Class * type);
extern Method * method_DriverRow_setQueryParamObject;

extern int DriverRow_setQueryParamText_vTblID;
bool DriverRow_setQueryParamText(DriverRow __i, int paramID, const char * value);
extern Method * method_DriverRow_setQueryParamText;

extern int DriverRow_synch_vTblID;
bool DriverRow_synch(DriverRow __i, DriverRow to);
extern Method * method_DriverRow_synch;

extern void (* DropDataBox_refill)(DropDataBox __this);

extern int DropDataBox_refillFunction_vTblID;
void DropDataBox_refillFunction(DropDataBox __i, TableDropBox __t);
extern Method * method_DropDataBox_refillFunction;

extern Property * property_DropDataBox_filter;
extern void (* DropDataBox_set_filter)(DropDataBox d, Id value);
extern Id (* DropDataBox_get_filter)(DropDataBox d);

extern Property * property_DropDataBox_filtered;
extern void (* DropDataBox_set_filtered)(DropDataBox d, bool value);

extern Property * property_DropDataBox_exclusion;
extern void (* DropDataBox_set_exclusion)(DropDataBox d, Id value);

extern Property * property_DropDataBox_filterField;
extern void (* DropDataBox_set_filterField)(DropDataBox d, Field value);

extern Property * property_DropDataBox_nameField;
extern void (* DropDataBox_set_nameField)(DropDataBox d, Field value);

extern Property * property_DropDataBox_showNone;
extern void (* DropDataBox_set_showNone)(DropDataBox d, bool value);

#define EDBINDEXOPTIONS_saveIndex_SHIFT                  0
#define EDBINDEXOPTIONS_saveIndex_MASK                   0x1
#define EDBINDEXOPTIONS_deleteIndex_SHIFT                1
#define EDBINDEXOPTIONS_deleteIndex_MASK                 0x2


extern int EditFieldDropDataBox_onAddTextEntry_vTblID;
bool EditFieldDropDataBox_onAddTextEntry(EditFieldDropDataBox __i, Row row, TableDropBox dropBox, const char * entry);
extern Method * method_EditFieldDropDataBox_onAddTextEntry;

extern void (* EditSection_addFieldEditor)(EditSection __this, FieldDataBox box);

extern void (* EditSection_editClear)(EditSection __this);

extern void (* EditSection_editLoad)(EditSection __this);

extern void (* EditSection_editNew)(EditSection __this);

extern void (* EditSection_editSave)(EditSection __this);

extern void (* EditSection_initFields)(EditSection __this);

extern int EditSection_notifyEditClear_vTblID;
void EditSection_notifyEditClear(EditSection __i, Window __t, EditSection editSection);
extern Method * method_EditSection_notifyEditClear;

extern int EditSection_notifyEditLoad_vTblID;
void EditSection_notifyEditLoad(EditSection __i, Window __t, EditSection editSection);
extern Method * method_EditSection_notifyEditLoad;

extern int EditSection_notifyEditSave_vTblID;
void EditSection_notifyEditSave(EditSection __i, Window __t, EditSection edit, String name);
extern Method * method_EditSection_notifyEditSave;

extern int EditSection_notifyInitFields_vTblID;
void EditSection_notifyInitFields(EditSection __i, Window __t, EditSection editSection);
extern Method * method_EditSection_notifyInitFields;

extern Property * property_EditSection_table;
extern void (* EditSection_set_table)(EditSection e, Table value);

extern bool (* Field_getData)(Field __this, Row row, Class * class_data, void * data);

extern int Field_getLength_vTblID;
int Field_getLength(Field __i);
extern Method * method_Field_getLength;

extern int Field_getName_vTblID;
constString Field_getName(Field __i);
extern Method * method_Field_getName;

extern int Field_getNext_vTblID;
Field Field_getNext(Field __i);
extern Method * method_Field_getNext;

extern int Field_getPrev_vTblID;
Field Field_getPrev(Field __i);
extern Method * method_Field_getPrev;

extern int Field_getTable_vTblID;
Table Field_getTable(Field __i);
extern Method * method_Field_getTable;

extern int Field_getType_vTblID;
Class * Field_getType(Field __i);
extern Method * method_Field_getType;

extern bool (* Field_setData)(Field __this, Row row, Class * class_data, void * data);

extern Property * property_Field_name;
extern constString (* Field_get_name)(Field f);

extern Property * property_Field_type;
extern Class * (* Field_get_type)(Field f);

extern Property * property_Field_length;
extern int (* Field_get_length)(Field f);

extern Property * property_Field_prev;
extern Field (* Field_get_prev)(Field f);

extern Property * property_Field_next;
extern Field (* Field_get_next)(Field f);

extern Property * property_Field_table;
extern Table (* Field_get_table)(Field f);

extern Property * property_FieldBox_editor;
extern void (* FieldBox_set_editor)(FieldBox f, TableEditor value);

extern Property * property_FieldBox_field;
extern void (* FieldBox_set_field)(FieldBox f, Field value);

extern void (* FieldDataBox_clear)(FieldDataBox __this);

extern void (* FieldDataBox_init)(FieldDataBox __this);

extern void (* FieldDataBox_load)(FieldDataBox __this);

extern int FieldDataBox_save_vTblID;
void FieldDataBox_save(FieldDataBox __i);
extern Method * method_FieldDataBox_save;

extern Property * property_FieldDataBox_row;
extern void (* FieldDataBox_set_row)(FieldDataBox f, Row value);
extern Row (* FieldDataBox_get_row)(FieldDataBox f);

extern Property * property_FieldDataBox_editor;
extern void (* FieldDataBox_set_editor)(FieldDataBox f, EditSection value);

extern Property * property_FieldDataBox_field;
extern void (* FieldDataBox_set_field)(FieldDataBox f, Field value);

extern void (* FieldDropDataBox_refill)(FieldDropDataBox __this);

extern int FieldDropDataBox_refillFunction_vTblID;
void FieldDropDataBox_refillFunction(FieldDropDataBox __i, TableDropBox __t);
extern Method * method_FieldDropDataBox_refillFunction;

extern Property * property_FieldDropDataBox_filter;
extern void (* FieldDropDataBox_set_filter)(FieldDropDataBox f, Id value);
extern Id (* FieldDropDataBox_get_filter)(FieldDropDataBox f);

extern Property * property_FieldDropDataBox_filtered;
extern void (* FieldDropDataBox_set_filtered)(FieldDropDataBox f, bool value);

extern Property * property_FieldDropDataBox_exclusion;
extern void (* FieldDropDataBox_set_exclusion)(FieldDropDataBox f, Id value);

extern Property * property_FieldDropDataBox_filterField;
extern void (* FieldDropDataBox_set_filterField)(FieldDropDataBox f, Field value);

extern Property * property_FieldDropDataBox_nameField;
extern void (* FieldDropDataBox_set_nameField)(FieldDropDataBox f, Field value);

extern Property * property_FieldDropDataBox_showNone;
extern void (* FieldDropDataBox_set_showNone)(FieldDropDataBox f, bool value);

struct FieldFindData
{
   Field field;
   DataValue value;
};
struct FieldIndex
{
   Field field;
   IndexOrder order;
   Field memberField;
   Table memberTable;
   Field memberIdField;
};
#define FIELDTYPEEX_type_SHIFT                           0
#define FIELDTYPEEX_type_MASK                            0x7
#define FIELDTYPEEX_mustFree_SHIFT                       3
#define FIELDTYPEEX_mustFree_MASK                        0x8


struct FieldValue
{
   FieldTypeEx type;
   union
   {
      int i;
      double r;
      String s;
      void * b;
   };
};
extern int (* FieldValue_compareInt)(FieldValue * __this, FieldValue * b);

extern int (* FieldValue_compareReal)(FieldValue * __this, FieldValue * b);

extern int (* FieldValue_compareText)(FieldValue * __this, FieldValue * b);

extern String (* FieldValue_stringify)(FieldValue * __this);

extern String (* GetMemberString_function)(GetMemberString __this, tparam_GetMemberString_NT pn);

struct class_members_Group
{
   Label title;
};
extern int Grouping_advance_vTblID;
bool Grouping_advance(Grouping __i, Array groupings, int level, bool * dontAdvance);
extern Method * method_Grouping_advance;

extern int Grouping_shouldSkip_vTblID;
bool Grouping_shouldSkip(Grouping __i);
extern Method * method_Grouping_shouldSkip;

struct IdFilter
{
   Id id;
   Field field;
};
extern bool (* IdFilter_rowMatch)(IdFilter * __this, Row row);

struct class_members_IdList
{
   int count;
   Id * ids;
};
extern bool (* IdList_add)(IdList __this, Id id);

extern void (* IdList_clear)(IdList __this);

extern bool (* IdList_delete)(IdList __this, Id id);

extern bool (* IdList_includes)(IdList __this, Id id);

extern bool (* IdList32Includes_function)(IdList32Includes __this, IdList32 list, Id id);

extern bool (* IdListIncludes_function)(IdListIncludes __this, IdList list, Id id);

struct ListField
{
   Field field;
   DataField dataField;
   Field lookupFindField;
   Field lookupValueField;
   Table lookupFindIndex;
   String (* CustomLookup)(Id);
};
extern bool (* ListSection_filterNotifyChanged)(ListSection __this, DataBox dataBox, bool closeDropDown);

extern int ListSection_notifyDeleteConfirmation_vTblID;
bool ListSection_notifyDeleteConfirmation(ListSection __i, Window __t, ListSection listSection);
extern Method * method_ListSection_notifyDeleteConfirmation;

extern int ListSection_notifyDeleted_vTblID;
void ListSection_notifyDeleted(ListSection __i, Window __t, ListSection listSection);
extern Method * method_ListSection_notifyDeleted;

extern int ListSection_notifyDeleting_vTblID;
void ListSection_notifyDeleting(ListSection __i, Window __t, ListSection listSection);
extern Method * method_ListSection_notifyDeleting;

extern int ListSection_notifyNew_vTblID;
bool ListSection_notifyNew(ListSection __i, Window __t, ListSection listSection, Row r);
extern Method * method_ListSection_notifyNew;

extern int ListSection_notifyRefillList_vTblID;
void ListSection_notifyRefillList(ListSection __i, Window __t, ListSection listSection, Row r);
extern Method * method_ListSection_notifyRefillList;

extern int ListSection_notifySaveConfirmation_vTblID;
DialogResult ListSection_notifySaveConfirmation(ListSection __i, Window __t, ListSection listSection);
extern Method * method_ListSection_notifySaveConfirmation;

extern int ListSection_notifySelectListRow_vTblID;
void ListSection_notifySelectListRow(ListSection __i, Window __t, ListSection listSection, Id id);
extern Method * method_ListSection_notifySelectListRow;

extern void (* ListSection_refillList)(ListSection __this);

extern void (* ListSection_refreshState)(ListSection __this);

extern void (* ListSection_selectFirst)(ListSection __this);

extern void (* ListSection_selectListRow)(ListSection __this, DataRow row);

extern Property * property_ListSection_editor;
extern void (* ListSection_set_editor)(ListSection l, EditSection value);

extern Property * property_ListSection_table;
extern void (* ListSection_set_table)(ListSection l, Table value);

struct class_members_Lookup
{
   Field valueField;
   Field findField;
   Table findIndex;
};
struct LookupEditor
{
   Class * editorClass;
   Window parentWindow;
   Field lookupValueField;
   Field lookupFindField;
   Field lookupIdField;
   Table lookupFindIndex;
};
extern String (* NoCaseAccent_function)(NoCaseAccent __this, String text);

#define OPENOPTIONS_type_SHIFT                           0
#define OPENOPTIONS_type_MASK                            0xFF
#define OPENOPTIONS_create_SHIFT                         8
#define OPENOPTIONS_create_MASK                          0x300
#define OPENOPTIONS_access_SHIFT                         10
#define OPENOPTIONS_access_MASK                          0xC00


struct class_members_Page
{
   Window inside;
   int headerHeight;
};
extern Property * property_Page_report;
extern void (* Page_set_report)(Page p, Report value);
extern Report (* Page_get_report)(Page p);

extern int Report_advance_vTblID;
bool Report_advance(Report __i, int level, bool * dontAdvance);
extern Method * method_Report_advance;

extern int Report_executeData_vTblID;
bool Report_executeData(Report __i, Database db);
extern Method * method_Report_executeData;

extern int Report_executeRowData_vTblID;
void Report_executeRowData(Report __i, int group);
extern Method * method_Report_executeRowData;

extern int Report_onReset_vTblID;
void Report_onReset(Report __i);
extern Method * method_Report_onReset;

extern Property * property_Report_orientation;
extern void (* Report_set_orientation)(Report r, Orientation value);
extern Orientation (* Report_get_orientation)(Report r);

extern Property * property_Report_pageFormat;
extern void (* Report_set_pageFormat)(Report r, PageFormat value);
extern PageFormat (* Report_get_pageFormat)(Report r);

extern Property * property_Report_title;
extern void (* Report_set_title)(Report r, constString value);

extern Property * property_Report_nil;
extern bool (* Report_get_nil)(Report r);

extern int ReportDestination_addPage_vTblID;
void ReportDestination_addPage(ReportDestination __i, Page page);
extern Method * method_ReportDestination_addPage;

extern int ReportDestination_endPage_vTblID;
void ReportDestination_endPage(ReportDestination __i, Page page);
extern Method * method_ReportDestination_endPage;

extern int ReportDestination_getReport_vTblID;
Report ReportDestination_getReport(ReportDestination __i);
extern Method * method_ReportDestination_getReport;

extern Property * property_ReportDestination_report;
extern void (* ReportDestination_set_report)(ReportDestination r, Report value);
extern Report (* ReportDestination_get_report)(ReportDestination r);

extern int ReportRender_getPageNumber_vTblID;
int ReportRender_getPageNumber(ReportRender __i);
extern Method * method_ReportRender_getPageNumber;

extern int ReportRender_render_vTblID;
void ReportRender_render(ReportRender __i, ReportDestination destination, Report report);
extern Method * method_ReportRender_render;

struct class_members_ReportRenderNormal
{
   int pageNumber;
   int level;
};
extern bool (* Row_add)(Row __this);

extern bool (* Row_addID)(Row __this, uint64 id);

extern bool (* Row_bindQueryData)(Row __this, int paramID, Field fld, Class * class_value, void * value);

extern bool (* Row_delete)(Row __this);

extern bool (* Row_find)(Row __this, Field field, MoveOptions move, MatchOptions match, Class * class_data, void * data);

extern bool (* Row_findMultiple)(Row __this, FieldFindData * findData, MoveOptions move, int numFields);

extern bool (* Row_first)(Row __this);

extern bool (* Row_gUIDataRowSetData)(Row __this, DataRow dr, DataField df, Field fld);

extern const char * (* Row_getColumn)(Row __this, int paramID);

extern bool (* Row_getData)(Row __this, Field field, Class * class_data, void * data);

extern bool (* Row_getDataFieldValue)(Row __this, Field field, FieldValue * value);

extern bool (* Row_getQueryData)(Row __this, int paramID, Field fld, Class * class_value, void * value);

extern const void * (* Row_getRowData)(Row __this);

extern bool (* Row_last)(Row __this);

extern bool (* Row_next)(Row __this);

extern bool (* Row_previous)(Row __this);

extern bool (* Row_query)(Row __this, const char * query);

extern bool (* Row_select)(Row __this, MoveOptions move);

extern bool (* Row_setData)(Row __this, Field field, Class * class_data, void * data);

extern bool (* Row_setQueryParam)(Row __this, int paramID, int value);

extern bool (* Row_setQueryParam64)(Row __this, int paramID, int64 value);

extern bool (* Row_setQueryParamObject)(Row __this, int paramID, void * value, Class * type);

extern bool (* Row_setQueryParamText)(Row __this, int paramID, const char * value);

extern bool (* Row_synch)(Row __this, Row to);

extern Property * property_Row_tbl;
extern void (* Row_set_tbl)(Row r, Table value);
extern Table (* Row_get_tbl)(Row r);

extern Property * property_Row_nil;
extern bool (* Row_get_nil)(Row r);

extern Property * property_Row_query;
extern void (* Row_set_query)(Row r, const char * value);
extern const char * (* Row_get_query)(Row r);

extern Property * property_Row_rowsCount;
extern uint (* Row_get_rowsCount)(Row r);

extern Property * property_Row_sysID;
extern void (* Row_set_sysID)(Row r, uint64 value);
extern uint64 (* Row_get_sysID)(Row r);

struct class_members_SQLCustomFunction
{
   Method * method;
   Class * returnType;
   Array args;
   void * rType;
   Array argTypes;
   void * cif;
};
struct class_members_SQLiteSearchField
{
   Field field;
};
struct class_members_SQLiteSearchTable
{
   Table table;
   Field idField;
   Array searchFields;
};
struct class_members_StringSearchField
{
   Field field;
   StringSearchIndexingMethod method;
   Field lookupFindField;
   Field lookupValueField;
};
struct class_members_StringSearchTable
{
   Table table;
   Field idField;
   Array searchFields;
};
extern int Table_addField_vTblID;
Field Table_addField(Table __i, constString name, Class * type, int length);
extern Method * method_Table_addField;

extern int Table_createRow_vTblID;
DriverRow Table_createRow(Table __i);
extern Method * method_Table_createRow;

extern int Table_findField_vTblID;
Field Table_findField(Table __i, constString name);
extern Method * method_Table_findField;

extern void (* Table_gUIListBoxAddFields)(Table __this, ListBox list);

extern void (* Table_gUIListBoxAddRows)(Table __this, ListBox list);

extern void (* Table_gUIListBoxAddRowsField)(Table __this, ListBox list, constString fieldName);

extern int Table_generateIndex_vTblID;
bool Table_generateIndex(Table __i, int count, FieldIndex * fieldIndexes, bool init);
extern Method * method_Table_generateIndex;

extern int Table_getFields_vTblID;
Container Table_getFields(Table __i);
extern Method * method_Table_getFields;

extern int Table_getFieldsCount_vTblID;
uint Table_getFieldsCount(Table __i);
extern Method * method_Table_getFieldsCount;

extern int Table_getFirstField_vTblID;
Field Table_getFirstField(Table __i);
extern Method * method_Table_getFirstField;

extern int Table_getName_vTblID;
constString Table_getName(Table __i);
extern Method * method_Table_getName;

extern int Table_getPrimaryKey_vTblID;
Field Table_getPrimaryKey(Table __i);
extern Method * method_Table_getPrimaryKey;

extern int Table_getRecordSize_vTblID;
uint Table_getRecordSize(Table __i);
extern Method * method_Table_getRecordSize;

extern int Table_getRowsCount_vTblID;
uint Table_getRowsCount(Table __i);
extern Method * method_Table_getRowsCount;

extern bool (* Table_index)(Table __this, int count, FieldIndex * fieldIndexes);

extern Property * property_Table_name;
extern constString (* Table_get_name)(Table t);

extern Property * property_Table_firstField;
extern Field (* Table_get_firstField)(Table t);

extern Property * property_Table_primaryKey;
extern Field (* Table_get_primaryKey)(Table t);

extern Property * property_Table_fieldsCount;
extern uint (* Table_get_fieldsCount)(Table t);

extern Property * property_Table_rowsCount;
extern uint (* Table_get_rowsCount)(Table t);

extern Property * property_Table_fields;
extern Container (* Table_get_fields)(Table t);

struct class_members_TableDropBox
{
   Id filter;
   bool filtered;
   Field nameField;
   Id exclusion;
   Table table;
   Field filterField;
};
extern void (* TableDropBox_editNotifyCharsAdded)(TableDropBox __this);

extern void (* TableDropBox_editNotifyUpdate)(TableDropBox __this, EditBox editBox);

extern int TableDropBox_refill_vTblID;
void TableDropBox_refill(TableDropBox __i);
extern Method * method_TableDropBox_refill;

extern Property * property_TableDropBox_filter;
extern void (* TableDropBox_set_filter)(TableDropBox t, Id value);
extern Id (* TableDropBox_get_filter)(TableDropBox t);

extern Property * property_TableDropBox_nameField;
extern void (* TableDropBox_set_nameField)(TableDropBox t, Field value);

extern Property * property_TableDropBox_exclusion;
extern void (* TableDropBox_set_exclusion)(TableDropBox t, Id value);

extern Property * property_TableDropBox_table;
extern void (* TableDropBox_set_table)(TableDropBox t, Table value);

extern Property * property_TableDropBox_filterField;
extern void (* TableDropBox_set_filterField)(TableDropBox t, Field value);

extern void (* TableEditor_createRow)(TableEditor __this);

extern void (* TableEditor_enumerate)(TableEditor __this);

extern bool (* TableEditor_filter)(TableEditor __this, Id id);

extern bool (* TableEditor_listSelect)(TableEditor __this, DataRow row);

extern void (* TableEditor_load)(TableEditor __this);

extern bool (* TableEditor_notifyClosing)(TableEditor __this);

extern void (* TableEditor_notifyModifiedDocument)(TableEditor __this);

extern int TableEditor_onCreateDynamicLookupEditors_vTblID;
void TableEditor_onCreateDynamicLookupEditors(TableEditor __i);
extern Method * method_TableEditor_onCreateDynamicLookupEditors;

extern int TableEditor_onInitialize_vTblID;
void TableEditor_onInitialize(TableEditor __i);
extern Method * method_TableEditor_onInitialize;

extern int TableEditor_onLeavingModifiedDocument_vTblID;
DialogResult TableEditor_onLeavingModifiedDocument(TableEditor __i);
extern Method * method_TableEditor_onLeavingModifiedDocument;

extern int TableEditor_onList_vTblID;
void TableEditor_onList(TableEditor __i, Row r, Array matches);
extern Method * method_TableEditor_onList;

extern int TableEditor_onLoad_vTblID;
void TableEditor_onLoad(TableEditor __i);
extern Method * method_TableEditor_onLoad;

extern int TableEditor_onRemovalRequest_vTblID;
bool TableEditor_onRemovalRequest(TableEditor __i);
extern Method * method_TableEditor_onRemovalRequest;

extern int TableEditor_onStateChanged_vTblID;
void TableEditor_onStateChanged(TableEditor __i);
extern Method * method_TableEditor_onStateChanged;

extern void (* TableEditor_remove)(TableEditor __this);

extern bool (* TableEditor_select)(TableEditor __this, Id id);

extern void (* TableEditor_selectListRow)(TableEditor __this, DataRow row);

extern bool (* TableEditor_selectNext)(TableEditor __this, bool loopAround);

extern bool (* TableEditor_selectPrevious)(TableEditor __this, bool loopAround);

extern void (* TableEditor_write)(TableEditor __this);

extern Property * property_TableEditor_table;
extern void (* TableEditor_set_table)(TableEditor t, Table value);
extern Table (* TableEditor_get_table)(TableEditor t);

extern Property * property_TableEditor_index;
extern void (* TableEditor_set_index)(TableEditor t, Table value);
extern Table (* TableEditor_get_index)(TableEditor t);

extern Property * property_TableEditor_list;
extern void (* TableEditor_set_list)(TableEditor t, ListBox value);

extern Property * property_TableEditor_listFields;
extern void (* TableEditor_set_listFields)(TableEditor t, Array value);

extern Property * property_TableEditor_listSortOrder;
extern void (* TableEditor_set_listSortOrder)(TableEditor t, int value);
extern int (* TableEditor_get_listSortOrder)(TableEditor t);

extern Property * property_TableEditor_listSortField;
extern void (* TableEditor_set_listSortField)(TableEditor t, DataField value);
extern DataField (* TableEditor_get_listSortField)(TableEditor t);

extern Property * property_TableEditor_disabledFullListing;
extern void (* TableEditor_set_disabledFullListing)(TableEditor t, bool value);
extern bool (* TableEditor_get_disabledFullListing)(TableEditor t);

extern Property * property_TableEditor_searchFields;
extern void (* TableEditor_set_searchFields)(TableEditor t, Array value);

extern Property * property_TableEditor_searchTables;
extern void (* TableEditor_set_searchTables)(TableEditor t, Array value);

extern Property * property_TableEditor_sqliteSearchTables;
extern void (* TableEditor_set_sqliteSearchTables)(TableEditor t, Array value);

extern Property * property_TableEditor_searchString;
extern void (* TableEditor_set_searchString)(TableEditor t, constString value);

extern Property * property_TableEditor_dynamicLookupEditors;
extern void (* TableEditor_set_dynamicLookupEditors)(TableEditor t, Array value);

extern Property * property_TableEditor_selectedId;
extern Id (* TableEditor_get_selectedId)(TableEditor t);

extern Property * property_TableEditor_idField;
extern void (* TableEditor_set_idField)(TableEditor t, Field value);
extern Field (* TableEditor_get_idField)(TableEditor t);

extern Property * property_TableEditor_stringField;
extern void (* TableEditor_set_stringField)(TableEditor t, Field value);
extern Field (* TableEditor_get_stringField)(TableEditor t);

extern Property * property_TableEditor_indexFilterField;
extern void (* TableEditor_set_indexFilterField)(TableEditor t, Field value);
extern Field (* TableEditor_get_indexFilterField)(TableEditor t);

extern Property * property_TableEditor_readOnly;
extern void (* TableEditor_set_readOnly)(TableEditor t, bool value);
extern bool (* TableEditor_get_readOnly)(TableEditor t);

extern Property * property_TableEditor_masterEditor;
extern void (* TableEditor_set_masterEditor)(TableEditor t, TableEditor value);
extern TableEditor (* TableEditor_get_masterEditor)(TableEditor t);

extern char * (* convertToASCII)(const char * string, char * newString, int * len, bool lowerCase);
extern void (* eRSProgressAdvance)(void);
extern void (* eRSProgressAdvanceLevelCheck)(void);
extern void (* setDefaultIdField)(const char * value);
extern void (* setDefaultNameField)(const char * value);
extern void (* setEDBIndexOptions)(EDBIndexOptions options);
extern char (* toASCII)(unichar ch);
extern Class * class_AccessOptions;
extern Class * class_ButtonStyle;
extern Class * class_CSVReport;
extern Class * class_CheckBool;
extern Class * class_CreateOptions;
extern Class * class_DataList;
extern Class * class_DataSource;
extern Class * class_DataSourceDriver;
extern Class * class_Database;
extern Class * class_Detail;
extern Class * class_DirFilesDataSourceDriver;
extern Class * class_DriverRow;
extern Class * class_DropDataBox;
extern Class * class_EDBIndexOptions;
extern Class * class_EditDropDataBox;
extern Class * class_EditFieldDropDataBox;
extern Class * class_EditSection;
extern Class * class_Field;
extern Class * class_FieldBox;
extern Class * class_FieldCheckButton;
extern Class * class_FieldDataBox;
extern Class * class_FieldDropDataBox;
extern Class * class_FieldFindData;
extern Class * class_FieldIndex;
extern Class * class_FieldType;
extern Class * class_FieldTypeEx;
extern Class * class_FieldValue;
extern Class * class_FixedMultiLineString;
extern Class * class_GetMemberString;
extern Class * class_Group;
extern Class * class_Grouping;
extern Class * class_Id;
extern Class * class_IdFilter;
extern Class * class_IdList;
extern Class * class_IdList32;
extern Class * class_IdList32Includes;
extern Class * class_IdListIncludes;
extern Class * class_IndexOrder;
extern Class * class_ListField;
extern Class * class_ListSection;
extern Class * class_Lookup;
extern Class * class_LookupEditor;
extern Class * class_MatchOptions;
extern Class * class_MemberStringSample;
extern Class * class_MoveOptions;
extern Class * class_NoCaseAccent;
extern Class * class_ObjectType;
extern Class * class_OpenOptions;
extern Class * class_OpenType;
extern Class * class_Orientation;
extern Class * class_Page;
extern Class * class_PageFormat;
extern Class * class_PrintedReport;
extern Class * class_RenderAction;
extern Class * class_Report;
extern Class * class_ReportDestination;
extern Class * class_ReportPreviewArea;
extern Class * class_ReportRender;
extern Class * class_ReportRenderNormal;
extern Class * class_ReportTitle;
extern Class * class_Row;
extern Class * class_SQLCustomFunction;
extern Class * class_SQLiteSearchField;
extern Class * class_SQLiteSearchTable;
extern Class * class_SeekOptions;
extern Class * class_State;
extern Class * class_StringList;
extern Class * class_StringSearchField;
extern Class * class_StringSearchIndexingMethod;
extern Class * class_StringSearchTable;
extern Class * class_Table;
extern Class * class_TableDropBox;
extern Class * class_TableEditor;

extern Module EDA_init(Module fromModule);

