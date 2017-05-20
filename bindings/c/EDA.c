#include "EDA.h"



// Global Functions Pointers

LIB_EXPORT C(GlobalFunction) * FUNCTION(convertToASCII);
LIB_EXPORT C(GlobalFunction) * FUNCTION(eRSProgressAdvance);
LIB_EXPORT C(GlobalFunction) * FUNCTION(eRSProgressAdvanceLevelCheck);
LIB_EXPORT C(GlobalFunction) * FUNCTION(setDefaultIdField);
LIB_EXPORT C(GlobalFunction) * FUNCTION(setDefaultNameField);
LIB_EXPORT C(GlobalFunction) * FUNCTION(setEDBIndexOptions);
LIB_EXPORT C(GlobalFunction) * FUNCTION(toASCII);



// Virtual Methods

LIB_EXPORT C(Method) * METHOD(DataSource, connect);
LIB_EXPORT C(Method) * METHOD(DataSource, deleteDatabase);
LIB_EXPORT C(Method) * METHOD(DataSource, openDatabase);
LIB_EXPORT C(Method) * METHOD(DataSource, renameDatabase);
LIB_EXPORT C(Method) * METHOD(DataSource, status);

LIB_EXPORT C(Method) * METHOD(DataSourceDriver, buildLocator);
LIB_EXPORT C(Method) * METHOD(DataSourceDriver, connect);
LIB_EXPORT C(Method) * METHOD(DataSourceDriver, deleteDatabase);
LIB_EXPORT C(Method) * METHOD(DataSourceDriver, getDatabases);
LIB_EXPORT C(Method) * METHOD(DataSourceDriver, getDatabasesCount);
LIB_EXPORT C(Method) * METHOD(DataSourceDriver, openDatabase);
LIB_EXPORT C(Method) * METHOD(DataSourceDriver, renameDatabase);
LIB_EXPORT C(Method) * METHOD(DataSourceDriver, status);

LIB_EXPORT C(Method) * METHOD(Database, begin);
LIB_EXPORT C(Method) * METHOD(Database, commit);
LIB_EXPORT C(Method) * METHOD(Database, createCustomFunction);
LIB_EXPORT C(Method) * METHOD(Database, deleteObject);
LIB_EXPORT C(Method) * METHOD(Database, getName);
LIB_EXPORT C(Method) * METHOD(Database, getTables);
LIB_EXPORT C(Method) * METHOD(Database, linkTable);
LIB_EXPORT C(Method) * METHOD(Database, objectsCount);
LIB_EXPORT C(Method) * METHOD(Database, openTable);
LIB_EXPORT C(Method) * METHOD(Database, renameObject);

LIB_EXPORT C(Method) * METHOD(DirFilesDataSourceDriver, isDatabaseFile);
LIB_EXPORT C(Method) * METHOD(DirFilesDataSourceDriver, makeDatabasePath);

LIB_EXPORT C(Method) * METHOD(DriverRow, add);
LIB_EXPORT C(Method) * METHOD(DriverRow, bindQueryData);
LIB_EXPORT C(Method) * METHOD(DriverRow, delete);
LIB_EXPORT C(Method) * METHOD(DriverRow, find);
LIB_EXPORT C(Method) * METHOD(DriverRow, findMultiple);
LIB_EXPORT C(Method) * METHOD(DriverRow, getColumn);
LIB_EXPORT C(Method) * METHOD(DriverRow, getData);
LIB_EXPORT C(Method) * METHOD(DriverRow, getDataFieldValue);
LIB_EXPORT C(Method) * METHOD(DriverRow, getQueryData);
LIB_EXPORT C(Method) * METHOD(DriverRow, getRowData);
LIB_EXPORT C(Method) * METHOD(DriverRow, getSysID);
LIB_EXPORT C(Method) * METHOD(DriverRow, goToSysID);
LIB_EXPORT C(Method) * METHOD(DriverRow, nil);
LIB_EXPORT C(Method) * METHOD(DriverRow, query);
LIB_EXPORT C(Method) * METHOD(DriverRow, select);
LIB_EXPORT C(Method) * METHOD(DriverRow, setData);
LIB_EXPORT C(Method) * METHOD(DriverRow, setQueryParam);
LIB_EXPORT C(Method) * METHOD(DriverRow, setQueryParam64);
LIB_EXPORT C(Method) * METHOD(DriverRow, setQueryParamObject);
LIB_EXPORT C(Method) * METHOD(DriverRow, setQueryParamText);
LIB_EXPORT C(Method) * METHOD(DriverRow, synch);

LIB_EXPORT C(Method) * METHOD(DropDataBox, refill);
LIB_EXPORT C(Method) * METHOD(DropDataBox, refillFunction);

LIB_EXPORT C(Method) * METHOD(EditFieldDropDataBox, onAddTextEntry);

LIB_EXPORT C(Method) * METHOD(EditSection, addFieldEditor);
LIB_EXPORT C(Method) * METHOD(EditSection, editClear);
LIB_EXPORT C(Method) * METHOD(EditSection, editLoad);
LIB_EXPORT C(Method) * METHOD(EditSection, editNew);
LIB_EXPORT C(Method) * METHOD(EditSection, editSave);
LIB_EXPORT C(Method) * METHOD(EditSection, initFields);
LIB_EXPORT C(Method) * METHOD(EditSection, notifyEditClear);
LIB_EXPORT C(Method) * METHOD(EditSection, notifyEditLoad);
LIB_EXPORT C(Method) * METHOD(EditSection, notifyEditSave);
LIB_EXPORT C(Method) * METHOD(EditSection, notifyInitFields);

LIB_EXPORT C(Method) * METHOD(Field, getData);
LIB_EXPORT C(Method) * METHOD(Field, getLength);
LIB_EXPORT C(Method) * METHOD(Field, getName);
LIB_EXPORT C(Method) * METHOD(Field, getNext);
LIB_EXPORT C(Method) * METHOD(Field, getPrev);
LIB_EXPORT C(Method) * METHOD(Field, getTable);
LIB_EXPORT C(Method) * METHOD(Field, getType);
LIB_EXPORT C(Method) * METHOD(Field, setData);

LIB_EXPORT C(Method) * METHOD(FieldDataBox, clear);
LIB_EXPORT C(Method) * METHOD(FieldDataBox, init);
LIB_EXPORT C(Method) * METHOD(FieldDataBox, load);
LIB_EXPORT C(Method) * METHOD(FieldDataBox, save);

LIB_EXPORT C(Method) * METHOD(FieldDropDataBox, refill);
LIB_EXPORT C(Method) * METHOD(FieldDropDataBox, refillFunction);

LIB_EXPORT C(Method) * METHOD(FieldValue, compareInt);
LIB_EXPORT C(Method) * METHOD(FieldValue, compareReal);
LIB_EXPORT C(Method) * METHOD(FieldValue, compareText);
LIB_EXPORT C(Method) * METHOD(FieldValue, stringify);

LIB_EXPORT C(Method) * METHOD(GetMemberString, function);

LIB_EXPORT C(Method) * METHOD(Grouping, advance);
LIB_EXPORT C(Method) * METHOD(Grouping, shouldSkip);

LIB_EXPORT C(Method) * METHOD(IdFilter, rowMatch);

LIB_EXPORT C(Method) * METHOD(IdList, add);
LIB_EXPORT C(Method) * METHOD(IdList, clear);
LIB_EXPORT C(Method) * METHOD(IdList, delete);
LIB_EXPORT C(Method) * METHOD(IdList, includes);

LIB_EXPORT C(Method) * METHOD(IdList32Includes, function);

LIB_EXPORT C(Method) * METHOD(IdListIncludes, function);

LIB_EXPORT C(Method) * METHOD(ListSection, filterNotifyChanged);
LIB_EXPORT C(Method) * METHOD(ListSection, notifyDeleteConfirmation);
LIB_EXPORT C(Method) * METHOD(ListSection, notifyDeleted);
LIB_EXPORT C(Method) * METHOD(ListSection, notifyDeleting);
LIB_EXPORT C(Method) * METHOD(ListSection, notifyNew);
LIB_EXPORT C(Method) * METHOD(ListSection, notifyRefillList);
LIB_EXPORT C(Method) * METHOD(ListSection, notifySaveConfirmation);
LIB_EXPORT C(Method) * METHOD(ListSection, notifySelectListRow);
LIB_EXPORT C(Method) * METHOD(ListSection, refillList);
LIB_EXPORT C(Method) * METHOD(ListSection, refreshState);
LIB_EXPORT C(Method) * METHOD(ListSection, selectFirst);
LIB_EXPORT C(Method) * METHOD(ListSection, selectListRow);

LIB_EXPORT C(Method) * METHOD(NoCaseAccent, function);

LIB_EXPORT C(Method) * METHOD(Report, advance);
LIB_EXPORT C(Method) * METHOD(Report, executeData);
LIB_EXPORT C(Method) * METHOD(Report, executeRowData);
LIB_EXPORT C(Method) * METHOD(Report, onReset);

LIB_EXPORT C(Method) * METHOD(ReportDestination, addPage);
LIB_EXPORT C(Method) * METHOD(ReportDestination, endPage);
LIB_EXPORT C(Method) * METHOD(ReportDestination, getReport);

LIB_EXPORT C(Method) * METHOD(ReportRender, getPageNumber);
LIB_EXPORT C(Method) * METHOD(ReportRender, render);

LIB_EXPORT C(Method) * METHOD(Row, add);
LIB_EXPORT C(Method) * METHOD(Row, addID);
LIB_EXPORT C(Method) * METHOD(Row, bindQueryData);
LIB_EXPORT C(Method) * METHOD(Row, delete);
LIB_EXPORT C(Method) * METHOD(Row, find);
LIB_EXPORT C(Method) * METHOD(Row, findMultiple);
LIB_EXPORT C(Method) * METHOD(Row, first);
LIB_EXPORT C(Method) * METHOD(Row, gUIDataRowSetData);
LIB_EXPORT C(Method) * METHOD(Row, getColumn);
LIB_EXPORT C(Method) * METHOD(Row, getData);
LIB_EXPORT C(Method) * METHOD(Row, getDataFieldValue);
LIB_EXPORT C(Method) * METHOD(Row, getQueryData);
LIB_EXPORT C(Method) * METHOD(Row, getRowData);
LIB_EXPORT C(Method) * METHOD(Row, last);
LIB_EXPORT C(Method) * METHOD(Row, next);
LIB_EXPORT C(Method) * METHOD(Row, previous);
LIB_EXPORT C(Method) * METHOD(Row, query);
LIB_EXPORT C(Method) * METHOD(Row, select);
LIB_EXPORT C(Method) * METHOD(Row, setData);
LIB_EXPORT C(Method) * METHOD(Row, setQueryParam);
LIB_EXPORT C(Method) * METHOD(Row, setQueryParam64);
LIB_EXPORT C(Method) * METHOD(Row, setQueryParamObject);
LIB_EXPORT C(Method) * METHOD(Row, setQueryParamText);
LIB_EXPORT C(Method) * METHOD(Row, synch);

LIB_EXPORT C(Method) * METHOD(Table, addField);
LIB_EXPORT C(Method) * METHOD(Table, createRow);
LIB_EXPORT C(Method) * METHOD(Table, findField);
LIB_EXPORT C(Method) * METHOD(Table, gUIListBoxAddFields);
LIB_EXPORT C(Method) * METHOD(Table, gUIListBoxAddRows);
LIB_EXPORT C(Method) * METHOD(Table, gUIListBoxAddRowsField);
LIB_EXPORT C(Method) * METHOD(Table, generateIndex);
LIB_EXPORT C(Method) * METHOD(Table, getFields);
LIB_EXPORT C(Method) * METHOD(Table, getFieldsCount);
LIB_EXPORT C(Method) * METHOD(Table, getFirstField);
LIB_EXPORT C(Method) * METHOD(Table, getName);
LIB_EXPORT C(Method) * METHOD(Table, getPrimaryKey);
LIB_EXPORT C(Method) * METHOD(Table, getRecordSize);
LIB_EXPORT C(Method) * METHOD(Table, getRowsCount);
LIB_EXPORT C(Method) * METHOD(Table, index);

LIB_EXPORT C(Method) * METHOD(TableDropBox, editNotifyCharsAdded);
LIB_EXPORT C(Method) * METHOD(TableDropBox, editNotifyUpdate);
LIB_EXPORT C(Method) * METHOD(TableDropBox, refill);

LIB_EXPORT C(Method) * METHOD(TableEditor, createRow);
LIB_EXPORT C(Method) * METHOD(TableEditor, enumerate);
LIB_EXPORT C(Method) * METHOD(TableEditor, filter);
LIB_EXPORT C(Method) * METHOD(TableEditor, listSelect);
LIB_EXPORT C(Method) * METHOD(TableEditor, load);
LIB_EXPORT C(Method) * METHOD(TableEditor, notifyClosing);
LIB_EXPORT C(Method) * METHOD(TableEditor, notifyModifiedDocument);
LIB_EXPORT C(Method) * METHOD(TableEditor, onCreateDynamicLookupEditors);
LIB_EXPORT C(Method) * METHOD(TableEditor, onInitialize);
LIB_EXPORT C(Method) * METHOD(TableEditor, onLeavingModifiedDocument);
LIB_EXPORT C(Method) * METHOD(TableEditor, onList);
LIB_EXPORT C(Method) * METHOD(TableEditor, onLoad);
LIB_EXPORT C(Method) * METHOD(TableEditor, onRemovalRequest);
LIB_EXPORT C(Method) * METHOD(TableEditor, onStateChanged);
LIB_EXPORT C(Method) * METHOD(TableEditor, remove);
LIB_EXPORT C(Method) * METHOD(TableEditor, select);
LIB_EXPORT C(Method) * METHOD(TableEditor, selectListRow);
LIB_EXPORT C(Method) * METHOD(TableEditor, selectNext);
LIB_EXPORT C(Method) * METHOD(TableEditor, selectPrevious);
LIB_EXPORT C(Method) * METHOD(TableEditor, write);




// Methods Function Pointers

LIB_EXPORT C(bool) (* DataSource_connect)(C(DataSource) __this);
LIB_EXPORT C(bool) (* DataSource_deleteDatabase)(C(DataSource) __this, constString name);
LIB_EXPORT C(Database) (* DataSource_openDatabase)(C(DataSource) __this, constString name, C(CreateOptions) create);
LIB_EXPORT C(bool) (* DataSource_renameDatabase)(C(DataSource) __this, constString name, constString rename);
LIB_EXPORT void (* DataSource_status)(C(DataSource) __this);


LIB_EXPORT void (* Database_linkTable)(C(Database) __this, C(Table) tbl);

LIB_EXPORT C(String) (* DirFilesDataSourceDriver_makeDatabasePath)(C(DirFilesDataSourceDriver) __this, constString name);


LIB_EXPORT void (* DropDataBox_refill)(C(DropDataBox) __this);


LIB_EXPORT void (* EditSection_addFieldEditor)(C(EditSection) __this, C(FieldDataBox) box);
LIB_EXPORT void (* EditSection_editClear)(C(EditSection) __this);
LIB_EXPORT void (* EditSection_editLoad)(C(EditSection) __this);
LIB_EXPORT void (* EditSection_editNew)(C(EditSection) __this);
LIB_EXPORT void (* EditSection_editSave)(C(EditSection) __this);
LIB_EXPORT void (* EditSection_initFields)(C(EditSection) __this);

LIB_EXPORT C(bool) (* Field_getData)(C(Field) __this, C(Row) row, C(Class) * class_data, void * data);
LIB_EXPORT C(bool) (* Field_setData)(C(Field) __this, C(Row) row, C(Class) * class_data, void * data);

LIB_EXPORT void (* FieldDataBox_clear)(C(FieldDataBox) __this);
LIB_EXPORT void (* FieldDataBox_init)(C(FieldDataBox) __this);
LIB_EXPORT void (* FieldDataBox_load)(C(FieldDataBox) __this);

LIB_EXPORT void (* FieldDropDataBox_refill)(C(FieldDropDataBox) __this);

LIB_EXPORT int (* FieldValue_compareInt)(C(FieldValue) * __this, C(FieldValue) * b);
LIB_EXPORT int (* FieldValue_compareReal)(C(FieldValue) * __this, C(FieldValue) * b);
LIB_EXPORT int (* FieldValue_compareText)(C(FieldValue) * __this, C(FieldValue) * b);
LIB_EXPORT C(String) (* FieldValue_stringify)(C(FieldValue) * __this);

LIB_EXPORT C(String) (* GetMemberString_function)(C(GetMemberString) __this, TP(GetMemberString, NT) pn);


LIB_EXPORT C(bool) (* IdFilter_rowMatch)(C(IdFilter) * __this, C(Row) row);

LIB_EXPORT C(bool) (* IdList_add)(C(IdList) __this, C(Id) id);
LIB_EXPORT void (* IdList_clear)(C(IdList) __this);
LIB_EXPORT C(bool) (* IdList_delete)(C(IdList) __this, C(Id) id);
LIB_EXPORT C(bool) (* IdList_includes)(C(IdList) __this, C(Id) id);

LIB_EXPORT C(bool) (* IdList32Includes_function)(C(IdList32Includes) __this, C(IdList32) list, C(Id) id);

LIB_EXPORT C(bool) (* IdListIncludes_function)(C(IdListIncludes) __this, C(IdList) list, C(Id) id);

LIB_EXPORT C(bool) (* ListSection_filterNotifyChanged)(C(ListSection) __this, C(DataBox) dataBox, C(bool) closeDropDown);
LIB_EXPORT void (* ListSection_refillList)(C(ListSection) __this);
LIB_EXPORT void (* ListSection_refreshState)(C(ListSection) __this);
LIB_EXPORT void (* ListSection_selectFirst)(C(ListSection) __this);
LIB_EXPORT void (* ListSection_selectListRow)(C(ListSection) __this, C(DataRow) row);

LIB_EXPORT C(String) (* NoCaseAccent_function)(C(NoCaseAccent) __this, C(String) text);




LIB_EXPORT C(bool) (* Row_add)(C(Row) __this);
LIB_EXPORT C(bool) (* Row_addID)(C(Row) __this, uint64 id);
LIB_EXPORT C(bool) (* Row_bindQueryData)(C(Row) __this, int paramID, C(Field) fld, C(Class) * class_value, void * value);
LIB_EXPORT C(bool) (* Row_delete)(C(Row) __this);
LIB_EXPORT C(bool) (* Row_find)(C(Row) __this, C(Field) field, C(MoveOptions) move, C(MatchOptions) match, C(Class) * class_data, void * data);
LIB_EXPORT C(bool) (* Row_findMultiple)(C(Row) __this, C(FieldFindData) * findData, C(MoveOptions) move, int numFields);
LIB_EXPORT C(bool) (* Row_first)(C(Row) __this);
LIB_EXPORT C(bool) (* Row_gUIDataRowSetData)(C(Row) __this, C(DataRow) dr, C(DataField) df, C(Field) fld);
LIB_EXPORT const char * (* Row_getColumn)(C(Row) __this, int paramID);
LIB_EXPORT C(bool) (* Row_getData)(C(Row) __this, C(Field) field, C(Class) * class_data, void * data);
LIB_EXPORT C(bool) (* Row_getDataFieldValue)(C(Row) __this, C(Field) field, C(FieldValue) * value);
LIB_EXPORT C(bool) (* Row_getQueryData)(C(Row) __this, int paramID, C(Field) fld, C(Class) * class_value, void * value);
LIB_EXPORT const void * (* Row_getRowData)(C(Row) __this);
LIB_EXPORT C(bool) (* Row_last)(C(Row) __this);
LIB_EXPORT C(bool) (* Row_next)(C(Row) __this);
LIB_EXPORT C(bool) (* Row_previous)(C(Row) __this);
LIB_EXPORT C(bool) (* Row_query)(C(Row) __this, const char * query);
LIB_EXPORT C(bool) (* Row_select)(C(Row) __this, C(MoveOptions) move);
LIB_EXPORT C(bool) (* Row_setData)(C(Row) __this, C(Field) field, C(Class) * class_data, void * data);
LIB_EXPORT C(bool) (* Row_setQueryParam)(C(Row) __this, int paramID, int value);
LIB_EXPORT C(bool) (* Row_setQueryParam64)(C(Row) __this, int paramID, int64 value);
LIB_EXPORT C(bool) (* Row_setQueryParamObject)(C(Row) __this, int paramID, void * value, C(Class) * type);
LIB_EXPORT C(bool) (* Row_setQueryParamText)(C(Row) __this, int paramID, const char * value);
LIB_EXPORT C(bool) (* Row_synch)(C(Row) __this, C(Row) to);

LIB_EXPORT void (* Table_gUIListBoxAddFields)(C(Table) __this, C(ListBox) list);
LIB_EXPORT void (* Table_gUIListBoxAddRows)(C(Table) __this, C(ListBox) list);
LIB_EXPORT void (* Table_gUIListBoxAddRowsField)(C(Table) __this, C(ListBox) list, constString fieldName);
LIB_EXPORT C(bool) (* Table_index)(C(Table) __this, int count, C(FieldIndex) * fieldIndexes);

LIB_EXPORT void (* TableDropBox_editNotifyCharsAdded)(C(TableDropBox) __this);
LIB_EXPORT void (* TableDropBox_editNotifyUpdate)(C(TableDropBox) __this, C(EditBox) editBox);

LIB_EXPORT void (* TableEditor_createRow)(C(TableEditor) __this);
LIB_EXPORT void (* TableEditor_enumerate)(C(TableEditor) __this);
LIB_EXPORT C(bool) (* TableEditor_filter)(C(TableEditor) __this, C(Id) id);
LIB_EXPORT C(bool) (* TableEditor_listSelect)(C(TableEditor) __this, C(DataRow) row);
LIB_EXPORT void (* TableEditor_load)(C(TableEditor) __this);
LIB_EXPORT C(bool) (* TableEditor_notifyClosing)(C(TableEditor) __this);
LIB_EXPORT void (* TableEditor_notifyModifiedDocument)(C(TableEditor) __this);
LIB_EXPORT void (* TableEditor_remove)(C(TableEditor) __this);
LIB_EXPORT C(bool) (* TableEditor_select)(C(TableEditor) __this, C(Id) id);
LIB_EXPORT void (* TableEditor_selectListRow)(C(TableEditor) __this, C(DataRow) row);
LIB_EXPORT C(bool) (* TableEditor_selectNext)(C(TableEditor) __this, C(bool) loopAround);
LIB_EXPORT C(bool) (* TableEditor_selectPrevious)(C(TableEditor) __this, C(bool) loopAround);
LIB_EXPORT void (* TableEditor_write)(C(TableEditor) __this);



LIB_EXPORT C(Property) * PROPERTY(DataSource, driver);
LIB_EXPORT void (* DataSource_set_driver)(C(DataSource) d, constString value);
LIB_EXPORT constString (* DataSource_get_driver)(C(DataSource) d);

LIB_EXPORT C(Property) * PROPERTY(DataSource, host);
LIB_EXPORT void (* DataSource_set_host)(C(DataSource) d, constString value);
LIB_EXPORT constString (* DataSource_get_host)(C(DataSource) d);

LIB_EXPORT C(Property) * PROPERTY(DataSource, port);
LIB_EXPORT void (* DataSource_set_port)(C(DataSource) d, constString value);
LIB_EXPORT constString (* DataSource_get_port)(C(DataSource) d);

LIB_EXPORT C(Property) * PROPERTY(DataSource, user);
LIB_EXPORT void (* DataSource_set_user)(C(DataSource) d, constString value);
LIB_EXPORT constString (* DataSource_get_user)(C(DataSource) d);

LIB_EXPORT C(Property) * PROPERTY(DataSource, pass);
LIB_EXPORT void (* DataSource_set_pass)(C(DataSource) d, constString value);
LIB_EXPORT constString (* DataSource_get_pass)(C(DataSource) d);

LIB_EXPORT C(Property) * PROPERTY(DataSource, locator);
LIB_EXPORT void (* DataSource_set_locator)(C(DataSource) d, constString value);
LIB_EXPORT constString (* DataSource_get_locator)(C(DataSource) d);

LIB_EXPORT C(Property) * PROPERTY(DataSource, databasesCount);
LIB_EXPORT uint (* DataSource_get_databasesCount)(C(DataSource) d);

LIB_EXPORT C(Property) * PROPERTY(DataSource, databases);
LIB_EXPORT C(Array) (* DataSource_get_databases)(C(DataSource) d);

LIB_EXPORT C(Property) * PROPERTY(Database, name);
LIB_EXPORT C(String) (* Database_get_name)(C(Database) d);

LIB_EXPORT C(Property) * PROPERTY(Database, tablesCount);
LIB_EXPORT uint (* Database_get_tablesCount)(C(Database) d);

LIB_EXPORT C(Property) * PROPERTY(Database, viewsCount);
LIB_EXPORT uint (* Database_get_viewsCount)(C(Database) d);

LIB_EXPORT C(Property) * PROPERTY(Database, tables);
LIB_EXPORT C(Array) (* Database_get_tables)(C(Database) d);

LIB_EXPORT C(Property) * PROPERTY(DropDataBox, filter);
LIB_EXPORT void (* DropDataBox_set_filter)(C(DropDataBox) d, C(Id) value);
LIB_EXPORT C(Id) (* DropDataBox_get_filter)(C(DropDataBox) d);

LIB_EXPORT C(Property) * PROPERTY(DropDataBox, filtered);
LIB_EXPORT void (* DropDataBox_set_filtered)(C(DropDataBox) d, C(bool) value);

LIB_EXPORT C(Property) * PROPERTY(DropDataBox, exclusion);
LIB_EXPORT void (* DropDataBox_set_exclusion)(C(DropDataBox) d, C(Id) value);

LIB_EXPORT C(Property) * PROPERTY(DropDataBox, filterField);
LIB_EXPORT void (* DropDataBox_set_filterField)(C(DropDataBox) d, C(Field) value);

LIB_EXPORT C(Property) * PROPERTY(DropDataBox, nameField);
LIB_EXPORT void (* DropDataBox_set_nameField)(C(DropDataBox) d, C(Field) value);

LIB_EXPORT C(Property) * PROPERTY(DropDataBox, showNone);
LIB_EXPORT void (* DropDataBox_set_showNone)(C(DropDataBox) d, C(bool) value);

LIB_EXPORT C(Property) * PROPERTY(EditSection, table);
LIB_EXPORT void (* EditSection_set_table)(C(EditSection) e, C(Table) value);

LIB_EXPORT C(Property) * PROPERTY(Field, name);
LIB_EXPORT constString (* Field_get_name)(C(Field) f);

LIB_EXPORT C(Property) * PROPERTY(Field, type);
LIB_EXPORT C(Class) * (* Field_get_type)(C(Field) f);

LIB_EXPORT C(Property) * PROPERTY(Field, length);
LIB_EXPORT int (* Field_get_length)(C(Field) f);

LIB_EXPORT C(Property) * PROPERTY(Field, prev);
LIB_EXPORT C(Field) (* Field_get_prev)(C(Field) f);

LIB_EXPORT C(Property) * PROPERTY(Field, next);
LIB_EXPORT C(Field) (* Field_get_next)(C(Field) f);

LIB_EXPORT C(Property) * PROPERTY(Field, table);
LIB_EXPORT C(Table) (* Field_get_table)(C(Field) f);

LIB_EXPORT C(Property) * PROPERTY(FieldBox, editor);
LIB_EXPORT void (* FieldBox_set_editor)(C(FieldBox) f, C(TableEditor) value);

LIB_EXPORT C(Property) * PROPERTY(FieldBox, field);
LIB_EXPORT void (* FieldBox_set_field)(C(FieldBox) f, C(Field) value);

LIB_EXPORT C(Property) * PROPERTY(FieldDataBox, row);
LIB_EXPORT void (* FieldDataBox_set_row)(C(FieldDataBox) f, C(Row) value);
LIB_EXPORT C(Row) (* FieldDataBox_get_row)(C(FieldDataBox) f);

LIB_EXPORT C(Property) * PROPERTY(FieldDataBox, editor);
LIB_EXPORT void (* FieldDataBox_set_editor)(C(FieldDataBox) f, C(EditSection) value);

LIB_EXPORT C(Property) * PROPERTY(FieldDataBox, field);
LIB_EXPORT void (* FieldDataBox_set_field)(C(FieldDataBox) f, C(Field) value);

LIB_EXPORT C(Property) * PROPERTY(FieldDropDataBox, filter);
LIB_EXPORT void (* FieldDropDataBox_set_filter)(C(FieldDropDataBox) f, C(Id) value);
LIB_EXPORT C(Id) (* FieldDropDataBox_get_filter)(C(FieldDropDataBox) f);

LIB_EXPORT C(Property) * PROPERTY(FieldDropDataBox, filtered);
LIB_EXPORT void (* FieldDropDataBox_set_filtered)(C(FieldDropDataBox) f, C(bool) value);

LIB_EXPORT C(Property) * PROPERTY(FieldDropDataBox, exclusion);
LIB_EXPORT void (* FieldDropDataBox_set_exclusion)(C(FieldDropDataBox) f, C(Id) value);

LIB_EXPORT C(Property) * PROPERTY(FieldDropDataBox, filterField);
LIB_EXPORT void (* FieldDropDataBox_set_filterField)(C(FieldDropDataBox) f, C(Field) value);

LIB_EXPORT C(Property) * PROPERTY(FieldDropDataBox, nameField);
LIB_EXPORT void (* FieldDropDataBox_set_nameField)(C(FieldDropDataBox) f, C(Field) value);

LIB_EXPORT C(Property) * PROPERTY(FieldDropDataBox, showNone);
LIB_EXPORT void (* FieldDropDataBox_set_showNone)(C(FieldDropDataBox) f, C(bool) value);

LIB_EXPORT C(Property) * PROPERTY(ListSection, editor);
LIB_EXPORT void (* ListSection_set_editor)(C(ListSection) l, C(EditSection) value);

LIB_EXPORT C(Property) * PROPERTY(ListSection, table);
LIB_EXPORT void (* ListSection_set_table)(C(ListSection) l, C(Table) value);

LIB_EXPORT C(Property) * PROPERTY(Page, report);
LIB_EXPORT void (* Page_set_report)(C(Page) p, C(Report) value);
LIB_EXPORT C(Report) (* Page_get_report)(C(Page) p);

LIB_EXPORT C(Property) * PROPERTY(Report, orientation);
LIB_EXPORT void (* Report_set_orientation)(C(Report) r, C(Orientation) value);
LIB_EXPORT C(Orientation) (* Report_get_orientation)(C(Report) r);

LIB_EXPORT C(Property) * PROPERTY(Report, pageFormat);
LIB_EXPORT void (* Report_set_pageFormat)(C(Report) r, C(PageFormat) value);
LIB_EXPORT C(PageFormat) (* Report_get_pageFormat)(C(Report) r);

LIB_EXPORT C(Property) * PROPERTY(Report, title);
LIB_EXPORT void (* Report_set_title)(C(Report) r, constString value);

LIB_EXPORT C(Property) * PROPERTY(Report, nil);
LIB_EXPORT C(bool) (* Report_get_nil)(C(Report) r);

LIB_EXPORT C(Property) * PROPERTY(ReportDestination, report);
LIB_EXPORT void (* ReportDestination_set_report)(C(ReportDestination) r, C(Report) value);
LIB_EXPORT C(Report) (* ReportDestination_get_report)(C(ReportDestination) r);

LIB_EXPORT C(Property) * PROPERTY(Row, tbl);
LIB_EXPORT void (* Row_set_tbl)(C(Row) r, C(Table) value);
LIB_EXPORT C(Table) (* Row_get_tbl)(C(Row) r);

LIB_EXPORT C(Property) * PROPERTY(Row, nil);
LIB_EXPORT C(bool) (* Row_get_nil)(C(Row) r);

LIB_EXPORT C(Property) * PROPERTY(Row, query);
LIB_EXPORT void (* Row_set_query)(C(Row) r, const char * value);
LIB_EXPORT const char * (* Row_get_query)(C(Row) r);

LIB_EXPORT C(Property) * PROPERTY(Row, rowsCount);
LIB_EXPORT uint (* Row_get_rowsCount)(C(Row) r);

LIB_EXPORT C(Property) * PROPERTY(Row, sysID);
LIB_EXPORT void (* Row_set_sysID)(C(Row) r, uint64 value);
LIB_EXPORT uint64 (* Row_get_sysID)(C(Row) r);

LIB_EXPORT C(Property) * PROPERTY(Table, name);
LIB_EXPORT constString (* Table_get_name)(C(Table) t);

LIB_EXPORT C(Property) * PROPERTY(Table, firstField);
LIB_EXPORT C(Field) (* Table_get_firstField)(C(Table) t);

LIB_EXPORT C(Property) * PROPERTY(Table, primaryKey);
LIB_EXPORT C(Field) (* Table_get_primaryKey)(C(Table) t);

LIB_EXPORT C(Property) * PROPERTY(Table, fieldsCount);
LIB_EXPORT uint (* Table_get_fieldsCount)(C(Table) t);

LIB_EXPORT C(Property) * PROPERTY(Table, rowsCount);
LIB_EXPORT uint (* Table_get_rowsCount)(C(Table) t);

LIB_EXPORT C(Property) * PROPERTY(Table, fields);
LIB_EXPORT C(Container) (* Table_get_fields)(C(Table) t);

LIB_EXPORT C(Property) * PROPERTY(TableDropBox, filter);
LIB_EXPORT void (* TableDropBox_set_filter)(C(TableDropBox) t, C(Id) value);
LIB_EXPORT C(Id) (* TableDropBox_get_filter)(C(TableDropBox) t);

LIB_EXPORT C(Property) * PROPERTY(TableDropBox, nameField);
LIB_EXPORT void (* TableDropBox_set_nameField)(C(TableDropBox) t, C(Field) value);

LIB_EXPORT C(Property) * PROPERTY(TableDropBox, exclusion);
LIB_EXPORT void (* TableDropBox_set_exclusion)(C(TableDropBox) t, C(Id) value);

LIB_EXPORT C(Property) * PROPERTY(TableDropBox, table);
LIB_EXPORT void (* TableDropBox_set_table)(C(TableDropBox) t, C(Table) value);

LIB_EXPORT C(Property) * PROPERTY(TableDropBox, filterField);
LIB_EXPORT void (* TableDropBox_set_filterField)(C(TableDropBox) t, C(Field) value);

LIB_EXPORT C(Property) * PROPERTY(TableEditor, table);
LIB_EXPORT void (* TableEditor_set_table)(C(TableEditor) t, C(Table) value);
LIB_EXPORT C(Table) (* TableEditor_get_table)(C(TableEditor) t);

LIB_EXPORT C(Property) * PROPERTY(TableEditor, index);
LIB_EXPORT void (* TableEditor_set_index)(C(TableEditor) t, C(Table) value);
LIB_EXPORT C(Table) (* TableEditor_get_index)(C(TableEditor) t);

LIB_EXPORT C(Property) * PROPERTY(TableEditor, list);
LIB_EXPORT void (* TableEditor_set_list)(C(TableEditor) t, C(ListBox) value);

LIB_EXPORT C(Property) * PROPERTY(TableEditor, listFields);
LIB_EXPORT void (* TableEditor_set_listFields)(C(TableEditor) t, C(Array) value);

LIB_EXPORT C(Property) * PROPERTY(TableEditor, listSortOrder);
LIB_EXPORT void (* TableEditor_set_listSortOrder)(C(TableEditor) t, int value);
LIB_EXPORT int (* TableEditor_get_listSortOrder)(C(TableEditor) t);

LIB_EXPORT C(Property) * PROPERTY(TableEditor, listSortField);
LIB_EXPORT void (* TableEditor_set_listSortField)(C(TableEditor) t, C(DataField) value);
LIB_EXPORT C(DataField) (* TableEditor_get_listSortField)(C(TableEditor) t);

LIB_EXPORT C(Property) * PROPERTY(TableEditor, disabledFullListing);
LIB_EXPORT void (* TableEditor_set_disabledFullListing)(C(TableEditor) t, C(bool) value);
LIB_EXPORT C(bool) (* TableEditor_get_disabledFullListing)(C(TableEditor) t);

LIB_EXPORT C(Property) * PROPERTY(TableEditor, searchFields);
LIB_EXPORT void (* TableEditor_set_searchFields)(C(TableEditor) t, C(Array) value);

LIB_EXPORT C(Property) * PROPERTY(TableEditor, searchTables);
LIB_EXPORT void (* TableEditor_set_searchTables)(C(TableEditor) t, C(Array) value);

LIB_EXPORT C(Property) * PROPERTY(TableEditor, sqliteSearchTables);
LIB_EXPORT void (* TableEditor_set_sqliteSearchTables)(C(TableEditor) t, C(Array) value);

LIB_EXPORT C(Property) * PROPERTY(TableEditor, searchString);
LIB_EXPORT void (* TableEditor_set_searchString)(C(TableEditor) t, constString value);

LIB_EXPORT C(Property) * PROPERTY(TableEditor, dynamicLookupEditors);
LIB_EXPORT void (* TableEditor_set_dynamicLookupEditors)(C(TableEditor) t, C(Array) value);

LIB_EXPORT C(Property) * PROPERTY(TableEditor, selectedId);
LIB_EXPORT C(Id) (* TableEditor_get_selectedId)(C(TableEditor) t);

LIB_EXPORT C(Property) * PROPERTY(TableEditor, idField);
LIB_EXPORT void (* TableEditor_set_idField)(C(TableEditor) t, C(Field) value);
LIB_EXPORT C(Field) (* TableEditor_get_idField)(C(TableEditor) t);

LIB_EXPORT C(Property) * PROPERTY(TableEditor, stringField);
LIB_EXPORT void (* TableEditor_set_stringField)(C(TableEditor) t, C(Field) value);
LIB_EXPORT C(Field) (* TableEditor_get_stringField)(C(TableEditor) t);

LIB_EXPORT C(Property) * PROPERTY(TableEditor, indexFilterField);
LIB_EXPORT void (* TableEditor_set_indexFilterField)(C(TableEditor) t, C(Field) value);
LIB_EXPORT C(Field) (* TableEditor_get_indexFilterField)(C(TableEditor) t);

LIB_EXPORT C(Property) * PROPERTY(TableEditor, readOnly);
LIB_EXPORT void (* TableEditor_set_readOnly)(C(TableEditor) t, C(bool) value);
LIB_EXPORT C(bool) (* TableEditor_get_readOnly)(C(TableEditor) t);

LIB_EXPORT C(Property) * PROPERTY(TableEditor, masterEditor);
LIB_EXPORT void (* TableEditor_set_masterEditor)(C(TableEditor) t, C(TableEditor) value);
LIB_EXPORT C(TableEditor) (* TableEditor_get_masterEditor)(C(TableEditor) t);


// Properties




// Classes

// bitClass
LIB_EXPORT C(Class) * CO(EDBIndexOptions);
LIB_EXPORT C(Class) * CO(FieldTypeEx);
LIB_EXPORT C(Class) * CO(OpenOptions);
// enumClass
LIB_EXPORT C(Class) * CO(AccessOptions);
LIB_EXPORT C(Class) * CO(CheckBool);
LIB_EXPORT C(Class) * CO(CreateOptions);
LIB_EXPORT C(Class) * CO(FieldType);
LIB_EXPORT C(Class) * CO(IndexOrder);
LIB_EXPORT C(Class) * CO(MatchOptions);
LIB_EXPORT C(Class) * CO(MoveOptions);
LIB_EXPORT C(Class) * CO(ObjectType);
LIB_EXPORT C(Class) * CO(OpenType);
LIB_EXPORT C(Class) * CO(Orientation);
LIB_EXPORT C(Class) * CO(PageFormat);
LIB_EXPORT C(Class) * CO(RenderAction);
LIB_EXPORT C(Class) * CO(SeekOptions);
LIB_EXPORT C(Class) * CO(State);
LIB_EXPORT C(Class) * CO(StringSearchIndexingMethod);
// unitClass
LIB_EXPORT C(Class) * CO(Id);
// systemClass
// structClass
LIB_EXPORT C(Class) * CO(DataList);
LIB_EXPORT C(Class) * CO(FieldFindData);
LIB_EXPORT C(Class) * CO(FieldIndex);
LIB_EXPORT C(Class) * CO(FieldValue);
// noHeadClass
LIB_EXPORT C(Class) * CO(IdFilter);
LIB_EXPORT C(Class) * CO(ListField);
LIB_EXPORT C(Class) * CO(LookupEditor);
// normalClass
LIB_EXPORT C(Class) * CO(ButtonStyle);
LIB_EXPORT C(Class) * CO(CSVReport);
LIB_EXPORT C(Class) * CO(DataSource);
LIB_EXPORT C(Class) * CO(DataSourceDriver);
LIB_EXPORT C(Class) * CO(Database);
LIB_EXPORT C(Class) * CO(Detail);
LIB_EXPORT C(Class) * CO(DirFilesDataSourceDriver);
LIB_EXPORT C(Class) * CO(DriverRow);
LIB_EXPORT C(Class) * CO(DropDataBox);
LIB_EXPORT C(Class) * CO(EditDropDataBox);
LIB_EXPORT C(Class) * CO(EditFieldDropDataBox);
LIB_EXPORT C(Class) * CO(EditSection);
LIB_EXPORT C(Class) * CO(Field);
LIB_EXPORT C(Class) * CO(FieldBox);
LIB_EXPORT C(Class) * CO(FieldCheckButton);
LIB_EXPORT C(Class) * CO(FieldDataBox);
LIB_EXPORT C(Class) * CO(FieldDropDataBox);
LIB_EXPORT C(Class) * CO(FixedMultiLineString);
LIB_EXPORT C(Class) * CO(GetMemberString);
LIB_EXPORT C(Class) * CO(Group);
LIB_EXPORT C(Class) * CO(Grouping);
LIB_EXPORT C(Class) * CO(IdList);
LIB_EXPORT C(Class) * CO(IdList32);
LIB_EXPORT C(Class) * CO(IdList32Includes);
LIB_EXPORT C(Class) * CO(IdListIncludes);
LIB_EXPORT C(Class) * CO(ListSection);
LIB_EXPORT C(Class) * CO(Lookup);
LIB_EXPORT C(Class) * CO(MemberStringSample);
LIB_EXPORT C(Class) * CO(NoCaseAccent);
LIB_EXPORT C(Class) * CO(Page);
LIB_EXPORT C(Class) * CO(PrintedReport);
LIB_EXPORT C(Class) * CO(Report);
LIB_EXPORT C(Class) * CO(ReportDestination);
LIB_EXPORT C(Class) * CO(ReportPreviewArea);
LIB_EXPORT C(Class) * CO(ReportRender);
LIB_EXPORT C(Class) * CO(ReportRenderNormal);
LIB_EXPORT C(Class) * CO(ReportTitle);
LIB_EXPORT C(Class) * CO(Row);
LIB_EXPORT C(Class) * CO(SQLCustomFunction);
LIB_EXPORT C(Class) * CO(SQLiteSearchField);
LIB_EXPORT C(Class) * CO(SQLiteSearchTable);
LIB_EXPORT C(Class) * CO(StringList);
LIB_EXPORT C(Class) * CO(StringSearchField);
LIB_EXPORT C(Class) * CO(StringSearchTable);
LIB_EXPORT C(Class) * CO(Table);
LIB_EXPORT C(Class) * CO(TableDropBox);
LIB_EXPORT C(Class) * CO(TableEditor);



// Virtual Method IDs

LIB_EXPORT int M_VTBLID(DataSourceDriver, buildLocator);
LIB_EXPORT int M_VTBLID(DataSourceDriver, connect);
LIB_EXPORT int M_VTBLID(DataSourceDriver, deleteDatabase);
LIB_EXPORT int M_VTBLID(DataSourceDriver, getDatabases);
LIB_EXPORT int M_VTBLID(DataSourceDriver, getDatabasesCount);
LIB_EXPORT int M_VTBLID(DataSourceDriver, openDatabase);
LIB_EXPORT int M_VTBLID(DataSourceDriver, renameDatabase);
LIB_EXPORT int M_VTBLID(DataSourceDriver, status);

LIB_EXPORT int M_VTBLID(Database, begin);
LIB_EXPORT int M_VTBLID(Database, commit);
LIB_EXPORT int M_VTBLID(Database, createCustomFunction);
LIB_EXPORT int M_VTBLID(Database, deleteObject);
LIB_EXPORT int M_VTBLID(Database, getName);
LIB_EXPORT int M_VTBLID(Database, getTables);
LIB_EXPORT int M_VTBLID(Database, objectsCount);
LIB_EXPORT int M_VTBLID(Database, openTable);
LIB_EXPORT int M_VTBLID(Database, renameObject);

LIB_EXPORT int M_VTBLID(DirFilesDataSourceDriver, isDatabaseFile);

LIB_EXPORT int M_VTBLID(DriverRow, add);
LIB_EXPORT int M_VTBLID(DriverRow, bindQueryData);
LIB_EXPORT int M_VTBLID(DriverRow, delete);
LIB_EXPORT int M_VTBLID(DriverRow, find);
LIB_EXPORT int M_VTBLID(DriverRow, findMultiple);
LIB_EXPORT int M_VTBLID(DriverRow, getColumn);
LIB_EXPORT int M_VTBLID(DriverRow, getData);
LIB_EXPORT int M_VTBLID(DriverRow, getDataFieldValue);
LIB_EXPORT int M_VTBLID(DriverRow, getQueryData);
LIB_EXPORT int M_VTBLID(DriverRow, getRowData);
LIB_EXPORT int M_VTBLID(DriverRow, getSysID);
LIB_EXPORT int M_VTBLID(DriverRow, goToSysID);
LIB_EXPORT int M_VTBLID(DriverRow, nil);
LIB_EXPORT int M_VTBLID(DriverRow, query);
LIB_EXPORT int M_VTBLID(DriverRow, select);
LIB_EXPORT int M_VTBLID(DriverRow, setData);
LIB_EXPORT int M_VTBLID(DriverRow, setQueryParam);
LIB_EXPORT int M_VTBLID(DriverRow, setQueryParam64);
LIB_EXPORT int M_VTBLID(DriverRow, setQueryParamObject);
LIB_EXPORT int M_VTBLID(DriverRow, setQueryParamText);
LIB_EXPORT int M_VTBLID(DriverRow, synch);

LIB_EXPORT int M_VTBLID(DropDataBox, refillFunction);

LIB_EXPORT int M_VTBLID(EditFieldDropDataBox, onAddTextEntry);

LIB_EXPORT int M_VTBLID(EditSection, notifyEditClear);
LIB_EXPORT int M_VTBLID(EditSection, notifyEditLoad);
LIB_EXPORT int M_VTBLID(EditSection, notifyEditSave);
LIB_EXPORT int M_VTBLID(EditSection, notifyInitFields);

LIB_EXPORT int M_VTBLID(Field, getLength);
LIB_EXPORT int M_VTBLID(Field, getName);
LIB_EXPORT int M_VTBLID(Field, getNext);
LIB_EXPORT int M_VTBLID(Field, getPrev);
LIB_EXPORT int M_VTBLID(Field, getTable);
LIB_EXPORT int M_VTBLID(Field, getType);

LIB_EXPORT int M_VTBLID(FieldDataBox, save);

LIB_EXPORT int M_VTBLID(FieldDropDataBox, refillFunction);

LIB_EXPORT int M_VTBLID(Grouping, advance);
LIB_EXPORT int M_VTBLID(Grouping, shouldSkip);

LIB_EXPORT int M_VTBLID(ListSection, notifyDeleteConfirmation);
LIB_EXPORT int M_VTBLID(ListSection, notifyDeleted);
LIB_EXPORT int M_VTBLID(ListSection, notifyDeleting);
LIB_EXPORT int M_VTBLID(ListSection, notifyNew);
LIB_EXPORT int M_VTBLID(ListSection, notifyRefillList);
LIB_EXPORT int M_VTBLID(ListSection, notifySaveConfirmation);
LIB_EXPORT int M_VTBLID(ListSection, notifySelectListRow);

LIB_EXPORT int M_VTBLID(Report, advance);
LIB_EXPORT int M_VTBLID(Report, executeData);
LIB_EXPORT int M_VTBLID(Report, executeRowData);
LIB_EXPORT int M_VTBLID(Report, onReset);

LIB_EXPORT int M_VTBLID(ReportDestination, addPage);
LIB_EXPORT int M_VTBLID(ReportDestination, endPage);
LIB_EXPORT int M_VTBLID(ReportDestination, getReport);

LIB_EXPORT int M_VTBLID(ReportRender, getPageNumber);
LIB_EXPORT int M_VTBLID(ReportRender, render);

LIB_EXPORT int M_VTBLID(Table, addField);
LIB_EXPORT int M_VTBLID(Table, createRow);
LIB_EXPORT int M_VTBLID(Table, findField);
LIB_EXPORT int M_VTBLID(Table, generateIndex);
LIB_EXPORT int M_VTBLID(Table, getFields);
LIB_EXPORT int M_VTBLID(Table, getFieldsCount);
LIB_EXPORT int M_VTBLID(Table, getFirstField);
LIB_EXPORT int M_VTBLID(Table, getName);
LIB_EXPORT int M_VTBLID(Table, getPrimaryKey);
LIB_EXPORT int M_VTBLID(Table, getRecordSize);
LIB_EXPORT int M_VTBLID(Table, getRowsCount);

LIB_EXPORT int M_VTBLID(TableDropBox, refill);

LIB_EXPORT int M_VTBLID(TableEditor, onCreateDynamicLookupEditors);
LIB_EXPORT int M_VTBLID(TableEditor, onInitialize);
LIB_EXPORT int M_VTBLID(TableEditor, onLeavingModifiedDocument);
LIB_EXPORT int M_VTBLID(TableEditor, onList);
LIB_EXPORT int M_VTBLID(TableEditor, onLoad);
LIB_EXPORT int M_VTBLID(TableEditor, onRemovalRequest);
LIB_EXPORT int M_VTBLID(TableEditor, onStateChanged);




// Global Functions

LIB_EXPORT char * (* convertToASCII)(const char * string, char * newString, int * len, C(bool) lowerCase);
LIB_EXPORT void (* eRSProgressAdvance)(void);
LIB_EXPORT void (* eRSProgressAdvanceLevelCheck)(void);
LIB_EXPORT void (* setDefaultIdField)(const char * value);
LIB_EXPORT void (* setDefaultNameField)(const char * value);
LIB_EXPORT void (* setEDBIndexOptions)(C(EDBIndexOptions) options);
LIB_EXPORT char (* toASCII)(unichar ch);


LIB_EXPORT C(Module) EDA_init(Module fromModule)
{
   C(Module) module = Module_load(fromModule, EDA_MODULE_NAME, AccessMode_publicAccess);
   if(module)
   {
      // Set up all the CO(x) *, property, method, ...


      CO(AccessOptions) = eC_findClass(module, "AccessOptions");
      CO(ButtonStyle) = eC_findClass(module, "ButtonStyle");
      CO(CSVReport) = eC_findClass(module, "CSVReport");
      CO(CheckBool) = eC_findClass(module, "CheckBool");
      CO(CreateOptions) = eC_findClass(module, "CreateOptions");
      CO(DataList) = eC_findClass(module, "DataList");
      CO(DataSource) = eC_findClass(module, "DataSource");
      if(CO(DataSource))
      {
         METHOD(DataSource, connect) = Class_findMethod(CO(DataSource), "Connect", module);
         if(METHOD(DataSource, connect))
            DataSource_connect = (C(bool) (*)(C(DataSource)))METHOD(DataSource, connect)->function;

         METHOD(DataSource, deleteDatabase) = Class_findMethod(CO(DataSource), "DeleteDatabase", module);
         if(METHOD(DataSource, deleteDatabase))
            DataSource_deleteDatabase = (C(bool) (*)(C(DataSource), constString))METHOD(DataSource, deleteDatabase)->function;

         METHOD(DataSource, openDatabase) = Class_findMethod(CO(DataSource), "OpenDatabase", module);
         if(METHOD(DataSource, openDatabase))
            DataSource_openDatabase = (C(Database) (*)(C(DataSource), constString, C(CreateOptions)))METHOD(DataSource, openDatabase)->function;

         METHOD(DataSource, renameDatabase) = Class_findMethod(CO(DataSource), "RenameDatabase", module);
         if(METHOD(DataSource, renameDatabase))
            DataSource_renameDatabase = (C(bool) (*)(C(DataSource), constString, constString))METHOD(DataSource, renameDatabase)->function;

         METHOD(DataSource, status) = Class_findMethod(CO(DataSource), "Status", module);
         if(METHOD(DataSource, status))
            DataSource_status = (void (*)(C(DataSource)))METHOD(DataSource, status)->function;

         PROPERTY(DataSource, driver) = Class_findProperty(CO(DataSource), "driver", module);
         if(PROPERTY(DataSource, driver))
         {
            DataSource_set_driver = (void *)PROPERTY(DataSource, driver)->Set;
            DataSource_get_driver = (void *)PROPERTY(DataSource, driver)->Get;
         }

         PROPERTY(DataSource, host) = Class_findProperty(CO(DataSource), "host", module);
         if(PROPERTY(DataSource, host))
         {
            DataSource_set_host = (void *)PROPERTY(DataSource, host)->Set;
            DataSource_get_host = (void *)PROPERTY(DataSource, host)->Get;
         }

         PROPERTY(DataSource, port) = Class_findProperty(CO(DataSource), "port", module);
         if(PROPERTY(DataSource, port))
         {
            DataSource_set_port = (void *)PROPERTY(DataSource, port)->Set;
            DataSource_get_port = (void *)PROPERTY(DataSource, port)->Get;
         }

         PROPERTY(DataSource, user) = Class_findProperty(CO(DataSource), "user", module);
         if(PROPERTY(DataSource, user))
         {
            DataSource_set_user = (void *)PROPERTY(DataSource, user)->Set;
            DataSource_get_user = (void *)PROPERTY(DataSource, user)->Get;
         }

         PROPERTY(DataSource, pass) = Class_findProperty(CO(DataSource), "pass", module);
         if(PROPERTY(DataSource, pass))
         {
            DataSource_set_pass = (void *)PROPERTY(DataSource, pass)->Set;
            DataSource_get_pass = (void *)PROPERTY(DataSource, pass)->Get;
         }

         PROPERTY(DataSource, locator) = Class_findProperty(CO(DataSource), "locator", module);
         if(PROPERTY(DataSource, locator))
         {
            DataSource_set_locator = (void *)PROPERTY(DataSource, locator)->Set;
            DataSource_get_locator = (void *)PROPERTY(DataSource, locator)->Get;
         }

         PROPERTY(DataSource, databasesCount) = Class_findProperty(CO(DataSource), "databasesCount", module);
         if(PROPERTY(DataSource, databasesCount))
            DataSource_get_databasesCount = (void *)PROPERTY(DataSource, databasesCount)->Get;

         PROPERTY(DataSource, databases) = Class_findProperty(CO(DataSource), "databases", module);
         if(PROPERTY(DataSource, databases))
            DataSource_get_databases = (void *)PROPERTY(DataSource, databases)->Get;
      }
      CO(DataSourceDriver) = eC_findClass(module, "DataSourceDriver");
      if(CO(DataSourceDriver))
      {
         METHOD(DataSourceDriver, buildLocator) = Class_findMethod(CO(DataSourceDriver), "BuildLocator", module);
         if(METHOD(DataSourceDriver, buildLocator))
            M_VTBLID(DataSourceDriver, buildLocator) = METHOD(DataSourceDriver, buildLocator)->vid;

         METHOD(DataSourceDriver, connect) = Class_findMethod(CO(DataSourceDriver), "Connect", module);
         if(METHOD(DataSourceDriver, connect))
            M_VTBLID(DataSourceDriver, connect) = METHOD(DataSourceDriver, connect)->vid;

         METHOD(DataSourceDriver, deleteDatabase) = Class_findMethod(CO(DataSourceDriver), "DeleteDatabase", module);
         if(METHOD(DataSourceDriver, deleteDatabase))
            M_VTBLID(DataSourceDriver, deleteDatabase) = METHOD(DataSourceDriver, deleteDatabase)->vid;

         METHOD(DataSourceDriver, getDatabases) = Class_findMethod(CO(DataSourceDriver), "GetDatabases", module);
         if(METHOD(DataSourceDriver, getDatabases))
            M_VTBLID(DataSourceDriver, getDatabases) = METHOD(DataSourceDriver, getDatabases)->vid;

         METHOD(DataSourceDriver, getDatabasesCount) = Class_findMethod(CO(DataSourceDriver), "GetDatabasesCount", module);
         if(METHOD(DataSourceDriver, getDatabasesCount))
            M_VTBLID(DataSourceDriver, getDatabasesCount) = METHOD(DataSourceDriver, getDatabasesCount)->vid;

         METHOD(DataSourceDriver, openDatabase) = Class_findMethod(CO(DataSourceDriver), "OpenDatabase", module);
         if(METHOD(DataSourceDriver, openDatabase))
            M_VTBLID(DataSourceDriver, openDatabase) = METHOD(DataSourceDriver, openDatabase)->vid;

         METHOD(DataSourceDriver, renameDatabase) = Class_findMethod(CO(DataSourceDriver), "RenameDatabase", module);
         if(METHOD(DataSourceDriver, renameDatabase))
            M_VTBLID(DataSourceDriver, renameDatabase) = METHOD(DataSourceDriver, renameDatabase)->vid;

         METHOD(DataSourceDriver, status) = Class_findMethod(CO(DataSourceDriver), "Status", module);
         if(METHOD(DataSourceDriver, status))
            M_VTBLID(DataSourceDriver, status) = METHOD(DataSourceDriver, status)->vid;
      }
      CO(Database) = eC_findClass(module, "Database");
      if(CO(Database))
      {
         METHOD(Database, begin) = Class_findMethod(CO(Database), "Begin", module);
         if(METHOD(Database, begin))
            M_VTBLID(Database, begin) = METHOD(Database, begin)->vid;

         METHOD(Database, commit) = Class_findMethod(CO(Database), "Commit", module);
         if(METHOD(Database, commit))
            M_VTBLID(Database, commit) = METHOD(Database, commit)->vid;

         METHOD(Database, createCustomFunction) = Class_findMethod(CO(Database), "CreateCustomFunction", module);
         if(METHOD(Database, createCustomFunction))
            M_VTBLID(Database, createCustomFunction) = METHOD(Database, createCustomFunction)->vid;

         METHOD(Database, deleteObject) = Class_findMethod(CO(Database), "DeleteObject", module);
         if(METHOD(Database, deleteObject))
            M_VTBLID(Database, deleteObject) = METHOD(Database, deleteObject)->vid;

         METHOD(Database, getName) = Class_findMethod(CO(Database), "GetName", module);
         if(METHOD(Database, getName))
            M_VTBLID(Database, getName) = METHOD(Database, getName)->vid;

         METHOD(Database, getTables) = Class_findMethod(CO(Database), "GetTables", module);
         if(METHOD(Database, getTables))
            M_VTBLID(Database, getTables) = METHOD(Database, getTables)->vid;

         METHOD(Database, linkTable) = Class_findMethod(CO(Database), "LinkTable", module);
         if(METHOD(Database, linkTable))
            Database_linkTable = (void (*)(C(Database), C(Table)))METHOD(Database, linkTable)->function;

         METHOD(Database, objectsCount) = Class_findMethod(CO(Database), "ObjectsCount", module);
         if(METHOD(Database, objectsCount))
            M_VTBLID(Database, objectsCount) = METHOD(Database, objectsCount)->vid;

         METHOD(Database, openTable) = Class_findMethod(CO(Database), "OpenTable", module);
         if(METHOD(Database, openTable))
            M_VTBLID(Database, openTable) = METHOD(Database, openTable)->vid;

         METHOD(Database, renameObject) = Class_findMethod(CO(Database), "RenameObject", module);
         if(METHOD(Database, renameObject))
            M_VTBLID(Database, renameObject) = METHOD(Database, renameObject)->vid;

         PROPERTY(Database, name) = Class_findProperty(CO(Database), "name", module);
         if(PROPERTY(Database, name))
            Database_get_name = (void *)PROPERTY(Database, name)->Get;

         PROPERTY(Database, tablesCount) = Class_findProperty(CO(Database), "tablesCount", module);
         if(PROPERTY(Database, tablesCount))
            Database_get_tablesCount = (void *)PROPERTY(Database, tablesCount)->Get;

         PROPERTY(Database, viewsCount) = Class_findProperty(CO(Database), "viewsCount", module);
         if(PROPERTY(Database, viewsCount))
            Database_get_viewsCount = (void *)PROPERTY(Database, viewsCount)->Get;

         PROPERTY(Database, tables) = Class_findProperty(CO(Database), "tables", module);
         if(PROPERTY(Database, tables))
            Database_get_tables = (void *)PROPERTY(Database, tables)->Get;
      }
      CO(Detail) = eC_findClass(module, "Detail");
      CO(DirFilesDataSourceDriver) = eC_findClass(module, "DirFilesDataSourceDriver");
      if(CO(DirFilesDataSourceDriver))
      {
         METHOD(DirFilesDataSourceDriver, isDatabaseFile) = Class_findMethod(CO(DirFilesDataSourceDriver), "IsDatabaseFile", module);
         if(METHOD(DirFilesDataSourceDriver, isDatabaseFile))
            M_VTBLID(DirFilesDataSourceDriver, isDatabaseFile) = METHOD(DirFilesDataSourceDriver, isDatabaseFile)->vid;

         METHOD(DirFilesDataSourceDriver, makeDatabasePath) = Class_findMethod(CO(DirFilesDataSourceDriver), "MakeDatabasePath", module);
         if(METHOD(DirFilesDataSourceDriver, makeDatabasePath))
            DirFilesDataSourceDriver_makeDatabasePath = (C(String) (*)(C(DirFilesDataSourceDriver), constString))METHOD(DirFilesDataSourceDriver, makeDatabasePath)->function;
      }
      CO(DriverRow) = eC_findClass(module, "DriverRow");
      if(CO(DriverRow))
      {
         METHOD(DriverRow, add) = Class_findMethod(CO(DriverRow), "Add", module);
         if(METHOD(DriverRow, add))
            M_VTBLID(DriverRow, add) = METHOD(DriverRow, add)->vid;

         METHOD(DriverRow, bindQueryData) = Class_findMethod(CO(DriverRow), "BindQueryData", module);
         if(METHOD(DriverRow, bindQueryData))
            M_VTBLID(DriverRow, bindQueryData) = METHOD(DriverRow, bindQueryData)->vid;

         METHOD(DriverRow, delete) = Class_findMethod(CO(DriverRow), "Delete", module);
         if(METHOD(DriverRow, delete))
            M_VTBLID(DriverRow, delete) = METHOD(DriverRow, delete)->vid;

         METHOD(DriverRow, find) = Class_findMethod(CO(DriverRow), "Find", module);
         if(METHOD(DriverRow, find))
            M_VTBLID(DriverRow, find) = METHOD(DriverRow, find)->vid;

         METHOD(DriverRow, findMultiple) = Class_findMethod(CO(DriverRow), "FindMultiple", module);
         if(METHOD(DriverRow, findMultiple))
            M_VTBLID(DriverRow, findMultiple) = METHOD(DriverRow, findMultiple)->vid;

         METHOD(DriverRow, getColumn) = Class_findMethod(CO(DriverRow), "GetColumn", module);
         if(METHOD(DriverRow, getColumn))
            M_VTBLID(DriverRow, getColumn) = METHOD(DriverRow, getColumn)->vid;

         METHOD(DriverRow, getData) = Class_findMethod(CO(DriverRow), "GetData", module);
         if(METHOD(DriverRow, getData))
            M_VTBLID(DriverRow, getData) = METHOD(DriverRow, getData)->vid;

         METHOD(DriverRow, getDataFieldValue) = Class_findMethod(CO(DriverRow), "GetDataFieldValue", module);
         if(METHOD(DriverRow, getDataFieldValue))
            M_VTBLID(DriverRow, getDataFieldValue) = METHOD(DriverRow, getDataFieldValue)->vid;

         METHOD(DriverRow, getQueryData) = Class_findMethod(CO(DriverRow), "GetQueryData", module);
         if(METHOD(DriverRow, getQueryData))
            M_VTBLID(DriverRow, getQueryData) = METHOD(DriverRow, getQueryData)->vid;

         METHOD(DriverRow, getRowData) = Class_findMethod(CO(DriverRow), "GetRowData", module);
         if(METHOD(DriverRow, getRowData))
            M_VTBLID(DriverRow, getRowData) = METHOD(DriverRow, getRowData)->vid;

         METHOD(DriverRow, getSysID) = Class_findMethod(CO(DriverRow), "GetSysID", module);
         if(METHOD(DriverRow, getSysID))
            M_VTBLID(DriverRow, getSysID) = METHOD(DriverRow, getSysID)->vid;

         METHOD(DriverRow, goToSysID) = Class_findMethod(CO(DriverRow), "GoToSysID", module);
         if(METHOD(DriverRow, goToSysID))
            M_VTBLID(DriverRow, goToSysID) = METHOD(DriverRow, goToSysID)->vid;

         METHOD(DriverRow, nil) = Class_findMethod(CO(DriverRow), "Nil", module);
         if(METHOD(DriverRow, nil))
            M_VTBLID(DriverRow, nil) = METHOD(DriverRow, nil)->vid;

         METHOD(DriverRow, query) = Class_findMethod(CO(DriverRow), "Query", module);
         if(METHOD(DriverRow, query))
            M_VTBLID(DriverRow, query) = METHOD(DriverRow, query)->vid;

         METHOD(DriverRow, select) = Class_findMethod(CO(DriverRow), "Select", module);
         if(METHOD(DriverRow, select))
            M_VTBLID(DriverRow, select) = METHOD(DriverRow, select)->vid;

         METHOD(DriverRow, setData) = Class_findMethod(CO(DriverRow), "SetData", module);
         if(METHOD(DriverRow, setData))
            M_VTBLID(DriverRow, setData) = METHOD(DriverRow, setData)->vid;

         METHOD(DriverRow, setQueryParam) = Class_findMethod(CO(DriverRow), "SetQueryParam", module);
         if(METHOD(DriverRow, setQueryParam))
            M_VTBLID(DriverRow, setQueryParam) = METHOD(DriverRow, setQueryParam)->vid;

         METHOD(DriverRow, setQueryParam64) = Class_findMethod(CO(DriverRow), "SetQueryParam64", module);
         if(METHOD(DriverRow, setQueryParam64))
            M_VTBLID(DriverRow, setQueryParam64) = METHOD(DriverRow, setQueryParam64)->vid;

         METHOD(DriverRow, setQueryParamObject) = Class_findMethod(CO(DriverRow), "SetQueryParamObject", module);
         if(METHOD(DriverRow, setQueryParamObject))
            M_VTBLID(DriverRow, setQueryParamObject) = METHOD(DriverRow, setQueryParamObject)->vid;

         METHOD(DriverRow, setQueryParamText) = Class_findMethod(CO(DriverRow), "SetQueryParamText", module);
         if(METHOD(DriverRow, setQueryParamText))
            M_VTBLID(DriverRow, setQueryParamText) = METHOD(DriverRow, setQueryParamText)->vid;

         METHOD(DriverRow, synch) = Class_findMethod(CO(DriverRow), "Synch", module);
         if(METHOD(DriverRow, synch))
            M_VTBLID(DriverRow, synch) = METHOD(DriverRow, synch)->vid;
      }
      CO(DropDataBox) = eC_findClass(module, "DropDataBox");
      if(CO(DropDataBox))
      {
         METHOD(DropDataBox, refill) = Class_findMethod(CO(DropDataBox), "Refill", module);
         if(METHOD(DropDataBox, refill))
            DropDataBox_refill = (void (*)(C(DropDataBox)))METHOD(DropDataBox, refill)->function;

         METHOD(DropDataBox, refillFunction) = Class_findMethod(CO(DropDataBox), "RefillFunction", module);
         if(METHOD(DropDataBox, refillFunction))
            M_VTBLID(DropDataBox, refillFunction) = METHOD(DropDataBox, refillFunction)->vid;

         PROPERTY(DropDataBox, filter) = Class_findProperty(CO(DropDataBox), "filter", module);
         if(PROPERTY(DropDataBox, filter))
         {
            DropDataBox_set_filter = (void *)PROPERTY(DropDataBox, filter)->Set;
            DropDataBox_get_filter = (void *)PROPERTY(DropDataBox, filter)->Get;
         }

         PROPERTY(DropDataBox, filtered) = Class_findProperty(CO(DropDataBox), "filtered", module);
         if(PROPERTY(DropDataBox, filtered))
            DropDataBox_set_filtered = (void *)PROPERTY(DropDataBox, filtered)->Set;

         PROPERTY(DropDataBox, exclusion) = Class_findProperty(CO(DropDataBox), "exclusion", module);
         if(PROPERTY(DropDataBox, exclusion))
            DropDataBox_set_exclusion = (void *)PROPERTY(DropDataBox, exclusion)->Set;

         PROPERTY(DropDataBox, filterField) = Class_findProperty(CO(DropDataBox), "filterField", module);
         if(PROPERTY(DropDataBox, filterField))
            DropDataBox_set_filterField = (void *)PROPERTY(DropDataBox, filterField)->Set;

         PROPERTY(DropDataBox, nameField) = Class_findProperty(CO(DropDataBox), "nameField", module);
         if(PROPERTY(DropDataBox, nameField))
            DropDataBox_set_nameField = (void *)PROPERTY(DropDataBox, nameField)->Set;

         PROPERTY(DropDataBox, showNone) = Class_findProperty(CO(DropDataBox), "showNone", module);
         if(PROPERTY(DropDataBox, showNone))
            DropDataBox_set_showNone = (void *)PROPERTY(DropDataBox, showNone)->Set;
      }
      CO(EDBIndexOptions) = eC_findClass(module, "EDBIndexOptions");
      CO(EditDropDataBox) = eC_findClass(module, "EditDropDataBox");
      CO(EditFieldDropDataBox) = eC_findClass(module, "EditFieldDropDataBox");
      if(CO(EditFieldDropDataBox))
      {
         METHOD(EditFieldDropDataBox, onAddTextEntry) = Class_findMethod(CO(EditFieldDropDataBox), "OnAddTextEntry", module);
         if(METHOD(EditFieldDropDataBox, onAddTextEntry))
            M_VTBLID(EditFieldDropDataBox, onAddTextEntry) = METHOD(EditFieldDropDataBox, onAddTextEntry)->vid;
      }
      CO(EditSection) = eC_findClass(module, "EditSection");
      if(CO(EditSection))
      {
         METHOD(EditSection, addFieldEditor) = Class_findMethod(CO(EditSection), "AddFieldEditor", module);
         if(METHOD(EditSection, addFieldEditor))
            EditSection_addFieldEditor = (void (*)(C(EditSection), C(FieldDataBox)))METHOD(EditSection, addFieldEditor)->function;

         METHOD(EditSection, editClear) = Class_findMethod(CO(EditSection), "EditClear", module);
         if(METHOD(EditSection, editClear))
            EditSection_editClear = (void (*)(C(EditSection)))METHOD(EditSection, editClear)->function;

         METHOD(EditSection, editLoad) = Class_findMethod(CO(EditSection), "EditLoad", module);
         if(METHOD(EditSection, editLoad))
            EditSection_editLoad = (void (*)(C(EditSection)))METHOD(EditSection, editLoad)->function;

         METHOD(EditSection, editNew) = Class_findMethod(CO(EditSection), "EditNew", module);
         if(METHOD(EditSection, editNew))
            EditSection_editNew = (void (*)(C(EditSection)))METHOD(EditSection, editNew)->function;

         METHOD(EditSection, editSave) = Class_findMethod(CO(EditSection), "EditSave", module);
         if(METHOD(EditSection, editSave))
            EditSection_editSave = (void (*)(C(EditSection)))METHOD(EditSection, editSave)->function;

         METHOD(EditSection, initFields) = Class_findMethod(CO(EditSection), "InitFields", module);
         if(METHOD(EditSection, initFields))
            EditSection_initFields = (void (*)(C(EditSection)))METHOD(EditSection, initFields)->function;

         METHOD(EditSection, notifyEditClear) = Class_findMethod(CO(EditSection), "NotifyEditClear", module);
         if(METHOD(EditSection, notifyEditClear))
            M_VTBLID(EditSection, notifyEditClear) = METHOD(EditSection, notifyEditClear)->vid;

         METHOD(EditSection, notifyEditLoad) = Class_findMethod(CO(EditSection), "NotifyEditLoad", module);
         if(METHOD(EditSection, notifyEditLoad))
            M_VTBLID(EditSection, notifyEditLoad) = METHOD(EditSection, notifyEditLoad)->vid;

         METHOD(EditSection, notifyEditSave) = Class_findMethod(CO(EditSection), "NotifyEditSave", module);
         if(METHOD(EditSection, notifyEditSave))
            M_VTBLID(EditSection, notifyEditSave) = METHOD(EditSection, notifyEditSave)->vid;

         METHOD(EditSection, notifyInitFields) = Class_findMethod(CO(EditSection), "NotifyInitFields", module);
         if(METHOD(EditSection, notifyInitFields))
            M_VTBLID(EditSection, notifyInitFields) = METHOD(EditSection, notifyInitFields)->vid;

         PROPERTY(EditSection, table) = Class_findProperty(CO(EditSection), "table", module);
         if(PROPERTY(EditSection, table))
            EditSection_set_table = (void *)PROPERTY(EditSection, table)->Set;
      }
      CO(Field) = eC_findClass(module, "Field");
      if(CO(Field))
      {
         METHOD(Field, getData) = Class_findMethod(CO(Field), "GetData", module);
         if(METHOD(Field, getData))
            Field_getData = (C(bool) (*)(C(Field), C(Row), C(Class) *, void *))METHOD(Field, getData)->function;

         METHOD(Field, getLength) = Class_findMethod(CO(Field), "GetLength", module);
         if(METHOD(Field, getLength))
            M_VTBLID(Field, getLength) = METHOD(Field, getLength)->vid;

         METHOD(Field, getName) = Class_findMethod(CO(Field), "GetName", module);
         if(METHOD(Field, getName))
            M_VTBLID(Field, getName) = METHOD(Field, getName)->vid;

         METHOD(Field, getNext) = Class_findMethod(CO(Field), "GetNext", module);
         if(METHOD(Field, getNext))
            M_VTBLID(Field, getNext) = METHOD(Field, getNext)->vid;

         METHOD(Field, getPrev) = Class_findMethod(CO(Field), "GetPrev", module);
         if(METHOD(Field, getPrev))
            M_VTBLID(Field, getPrev) = METHOD(Field, getPrev)->vid;

         METHOD(Field, getTable) = Class_findMethod(CO(Field), "GetTable", module);
         if(METHOD(Field, getTable))
            M_VTBLID(Field, getTable) = METHOD(Field, getTable)->vid;

         METHOD(Field, getType) = Class_findMethod(CO(Field), "GetType", module);
         if(METHOD(Field, getType))
            M_VTBLID(Field, getType) = METHOD(Field, getType)->vid;

         METHOD(Field, setData) = Class_findMethod(CO(Field), "SetData", module);
         if(METHOD(Field, setData))
            Field_setData = (C(bool) (*)(C(Field), C(Row), C(Class) *, void *))METHOD(Field, setData)->function;

         PROPERTY(Field, name) = Class_findProperty(CO(Field), "name", module);
         if(PROPERTY(Field, name))
            Field_get_name = (void *)PROPERTY(Field, name)->Get;

         PROPERTY(Field, type) = Class_findProperty(CO(Field), "type", module);
         if(PROPERTY(Field, type))
            Field_get_type = (void *)PROPERTY(Field, type)->Get;

         PROPERTY(Field, length) = Class_findProperty(CO(Field), "length", module);
         if(PROPERTY(Field, length))
            Field_get_length = (void *)PROPERTY(Field, length)->Get;

         PROPERTY(Field, prev) = Class_findProperty(CO(Field), "prev", module);
         if(PROPERTY(Field, prev))
            Field_get_prev = (void *)PROPERTY(Field, prev)->Get;

         PROPERTY(Field, next) = Class_findProperty(CO(Field), "next", module);
         if(PROPERTY(Field, next))
            Field_get_next = (void *)PROPERTY(Field, next)->Get;

         PROPERTY(Field, table) = Class_findProperty(CO(Field), "table", module);
         if(PROPERTY(Field, table))
            Field_get_table = (void *)PROPERTY(Field, table)->Get;
      }
      CO(FieldBox) = eC_findClass(module, "FieldBox");
      if(CO(FieldBox))
      {
         PROPERTY(FieldBox, editor) = Class_findProperty(CO(FieldBox), "editor", module);
         if(PROPERTY(FieldBox, editor))
            FieldBox_set_editor = (void *)PROPERTY(FieldBox, editor)->Set;

         PROPERTY(FieldBox, field) = Class_findProperty(CO(FieldBox), "field", module);
         if(PROPERTY(FieldBox, field))
            FieldBox_set_field = (void *)PROPERTY(FieldBox, field)->Set;
      }
      CO(FieldCheckButton) = eC_findClass(module, "FieldCheckButton");
      CO(FieldDataBox) = eC_findClass(module, "FieldDataBox");
      if(CO(FieldDataBox))
      {
         METHOD(FieldDataBox, clear) = Class_findMethod(CO(FieldDataBox), "Clear", module);
         if(METHOD(FieldDataBox, clear))
            FieldDataBox_clear = (void (*)(C(FieldDataBox)))METHOD(FieldDataBox, clear)->function;

         METHOD(FieldDataBox, init) = Class_findMethod(CO(FieldDataBox), "Init", module);
         if(METHOD(FieldDataBox, init))
            FieldDataBox_init = (void (*)(C(FieldDataBox)))METHOD(FieldDataBox, init)->function;

         METHOD(FieldDataBox, load) = Class_findMethod(CO(FieldDataBox), "Load", module);
         if(METHOD(FieldDataBox, load))
            FieldDataBox_load = (void (*)(C(FieldDataBox)))METHOD(FieldDataBox, load)->function;

         METHOD(FieldDataBox, save) = Class_findMethod(CO(FieldDataBox), "Save", module);
         if(METHOD(FieldDataBox, save))
            M_VTBLID(FieldDataBox, save) = METHOD(FieldDataBox, save)->vid;

         PROPERTY(FieldDataBox, row) = Class_findProperty(CO(FieldDataBox), "row", module);
         if(PROPERTY(FieldDataBox, row))
         {
            FieldDataBox_set_row = (void *)PROPERTY(FieldDataBox, row)->Set;
            FieldDataBox_get_row = (void *)PROPERTY(FieldDataBox, row)->Get;
         }

         PROPERTY(FieldDataBox, editor) = Class_findProperty(CO(FieldDataBox), "editor", module);
         if(PROPERTY(FieldDataBox, editor))
            FieldDataBox_set_editor = (void *)PROPERTY(FieldDataBox, editor)->Set;

         PROPERTY(FieldDataBox, field) = Class_findProperty(CO(FieldDataBox), "field", module);
         if(PROPERTY(FieldDataBox, field))
            FieldDataBox_set_field = (void *)PROPERTY(FieldDataBox, field)->Set;
      }
      CO(FieldDropDataBox) = eC_findClass(module, "FieldDropDataBox");
      if(CO(FieldDropDataBox))
      {
         METHOD(FieldDropDataBox, refill) = Class_findMethod(CO(FieldDropDataBox), "Refill", module);
         if(METHOD(FieldDropDataBox, refill))
            FieldDropDataBox_refill = (void (*)(C(FieldDropDataBox)))METHOD(FieldDropDataBox, refill)->function;

         METHOD(FieldDropDataBox, refillFunction) = Class_findMethod(CO(FieldDropDataBox), "RefillFunction", module);
         if(METHOD(FieldDropDataBox, refillFunction))
            M_VTBLID(FieldDropDataBox, refillFunction) = METHOD(FieldDropDataBox, refillFunction)->vid;

         PROPERTY(FieldDropDataBox, filter) = Class_findProperty(CO(FieldDropDataBox), "filter", module);
         if(PROPERTY(FieldDropDataBox, filter))
         {
            FieldDropDataBox_set_filter = (void *)PROPERTY(FieldDropDataBox, filter)->Set;
            FieldDropDataBox_get_filter = (void *)PROPERTY(FieldDropDataBox, filter)->Get;
         }

         PROPERTY(FieldDropDataBox, filtered) = Class_findProperty(CO(FieldDropDataBox), "filtered", module);
         if(PROPERTY(FieldDropDataBox, filtered))
            FieldDropDataBox_set_filtered = (void *)PROPERTY(FieldDropDataBox, filtered)->Set;

         PROPERTY(FieldDropDataBox, exclusion) = Class_findProperty(CO(FieldDropDataBox), "exclusion", module);
         if(PROPERTY(FieldDropDataBox, exclusion))
            FieldDropDataBox_set_exclusion = (void *)PROPERTY(FieldDropDataBox, exclusion)->Set;

         PROPERTY(FieldDropDataBox, filterField) = Class_findProperty(CO(FieldDropDataBox), "filterField", module);
         if(PROPERTY(FieldDropDataBox, filterField))
            FieldDropDataBox_set_filterField = (void *)PROPERTY(FieldDropDataBox, filterField)->Set;

         PROPERTY(FieldDropDataBox, nameField) = Class_findProperty(CO(FieldDropDataBox), "nameField", module);
         if(PROPERTY(FieldDropDataBox, nameField))
            FieldDropDataBox_set_nameField = (void *)PROPERTY(FieldDropDataBox, nameField)->Set;

         PROPERTY(FieldDropDataBox, showNone) = Class_findProperty(CO(FieldDropDataBox), "showNone", module);
         if(PROPERTY(FieldDropDataBox, showNone))
            FieldDropDataBox_set_showNone = (void *)PROPERTY(FieldDropDataBox, showNone)->Set;
      }
      CO(FieldFindData) = eC_findClass(module, "FieldFindData");
      CO(FieldIndex) = eC_findClass(module, "FieldIndex");
      CO(FieldType) = eC_findClass(module, "FieldType");
      CO(FieldTypeEx) = eC_findClass(module, "FieldTypeEx");
      CO(FieldValue) = eC_findClass(module, "FieldValue");
      if(CO(FieldValue))
      {
         METHOD(FieldValue, compareInt) = Class_findMethod(CO(FieldValue), "compareInt", module);
         if(METHOD(FieldValue, compareInt))
            FieldValue_compareInt = (int (*)(C(FieldValue) *, C(FieldValue) *))METHOD(FieldValue, compareInt)->function;

         METHOD(FieldValue, compareReal) = Class_findMethod(CO(FieldValue), "compareReal", module);
         if(METHOD(FieldValue, compareReal))
            FieldValue_compareReal = (int (*)(C(FieldValue) *, C(FieldValue) *))METHOD(FieldValue, compareReal)->function;

         METHOD(FieldValue, compareText) = Class_findMethod(CO(FieldValue), "compareText", module);
         if(METHOD(FieldValue, compareText))
            FieldValue_compareText = (int (*)(C(FieldValue) *, C(FieldValue) *))METHOD(FieldValue, compareText)->function;

         METHOD(FieldValue, stringify) = Class_findMethod(CO(FieldValue), "stringify", module);
         if(METHOD(FieldValue, stringify))
            FieldValue_stringify = (C(String) (*)(C(FieldValue) *))METHOD(FieldValue, stringify)->function;
      }
      CO(FixedMultiLineString) = eC_findClass(module, "FixedMultiLineString");
      CO(GetMemberString) = eC_findClass(module, "GetMemberString");
      if(CO(GetMemberString))
      {
         METHOD(GetMemberString, function) = Class_findMethod(CO(GetMemberString), "function", module);
         if(METHOD(GetMemberString, function))
            GetMemberString_function = (C(String) (*)(C(GetMemberString), TP(GetMemberString, NT)))METHOD(GetMemberString, function)->function;
      }
      CO(Group) = eC_findClass(module, "Group");
      CO(Grouping) = eC_findClass(module, "Grouping");
      if(CO(Grouping))
      {
         METHOD(Grouping, advance) = Class_findMethod(CO(Grouping), "Advance", module);
         if(METHOD(Grouping, advance))
            M_VTBLID(Grouping, advance) = METHOD(Grouping, advance)->vid;

         METHOD(Grouping, shouldSkip) = Class_findMethod(CO(Grouping), "ShouldSkip", module);
         if(METHOD(Grouping, shouldSkip))
            M_VTBLID(Grouping, shouldSkip) = METHOD(Grouping, shouldSkip)->vid;
      }
      CO(Id) = eC_findClass(module, "Id");
      CO(IdFilter) = eC_findClass(module, "IdFilter");
      if(CO(IdFilter))
      {
         METHOD(IdFilter, rowMatch) = Class_findMethod(CO(IdFilter), "RowMatch", module);
         if(METHOD(IdFilter, rowMatch))
            IdFilter_rowMatch = (C(bool) (*)(C(IdFilter) *, C(Row)))METHOD(IdFilter, rowMatch)->function;
      }
      CO(IdList) = eC_findClass(module, "IdList");
      if(CO(IdList))
      {
         METHOD(IdList, add) = Class_findMethod(CO(IdList), "Add", module);
         if(METHOD(IdList, add))
            IdList_add = (C(bool) (*)(C(IdList), C(Id)))METHOD(IdList, add)->function;

         METHOD(IdList, clear) = Class_findMethod(CO(IdList), "Clear", module);
         if(METHOD(IdList, clear))
            IdList_clear = (void (*)(C(IdList)))METHOD(IdList, clear)->function;

         METHOD(IdList, delete) = Class_findMethod(CO(IdList), "Delete", module);
         if(METHOD(IdList, delete))
            IdList_delete = (C(bool) (*)(C(IdList), C(Id)))METHOD(IdList, delete)->function;

         METHOD(IdList, includes) = Class_findMethod(CO(IdList), "Includes", module);
         if(METHOD(IdList, includes))
            IdList_includes = (C(bool) (*)(C(IdList), C(Id)))METHOD(IdList, includes)->function;
      }
      CO(IdList32) = eC_findClass(module, "IdList32");
      CO(IdList32Includes) = eC_findClass(module, "IdList32Includes");
      if(CO(IdList32Includes))
      {
         METHOD(IdList32Includes, function) = Class_findMethod(CO(IdList32Includes), "function", module);
         if(METHOD(IdList32Includes, function))
            IdList32Includes_function = (C(bool) (*)(C(IdList32Includes), C(IdList32), C(Id)))METHOD(IdList32Includes, function)->function;
      }
      CO(IdListIncludes) = eC_findClass(module, "IdListIncludes");
      if(CO(IdListIncludes))
      {
         METHOD(IdListIncludes, function) = Class_findMethod(CO(IdListIncludes), "function", module);
         if(METHOD(IdListIncludes, function))
            IdListIncludes_function = (C(bool) (*)(C(IdListIncludes), C(IdList), C(Id)))METHOD(IdListIncludes, function)->function;
      }
      CO(IndexOrder) = eC_findClass(module, "IndexOrder");
      CO(ListField) = eC_findClass(module, "ListField");
      CO(ListSection) = eC_findClass(module, "ListSection");
      if(CO(ListSection))
      {
         METHOD(ListSection, filterNotifyChanged) = Class_findMethod(CO(ListSection), "FilterNotifyChanged", module);
         if(METHOD(ListSection, filterNotifyChanged))
            ListSection_filterNotifyChanged = (C(bool) (*)(C(ListSection), C(DataBox), C(bool)))METHOD(ListSection, filterNotifyChanged)->function;

         METHOD(ListSection, notifyDeleteConfirmation) = Class_findMethod(CO(ListSection), "NotifyDeleteConfirmation", module);
         if(METHOD(ListSection, notifyDeleteConfirmation))
            M_VTBLID(ListSection, notifyDeleteConfirmation) = METHOD(ListSection, notifyDeleteConfirmation)->vid;

         METHOD(ListSection, notifyDeleted) = Class_findMethod(CO(ListSection), "NotifyDeleted", module);
         if(METHOD(ListSection, notifyDeleted))
            M_VTBLID(ListSection, notifyDeleted) = METHOD(ListSection, notifyDeleted)->vid;

         METHOD(ListSection, notifyDeleting) = Class_findMethod(CO(ListSection), "NotifyDeleting", module);
         if(METHOD(ListSection, notifyDeleting))
            M_VTBLID(ListSection, notifyDeleting) = METHOD(ListSection, notifyDeleting)->vid;

         METHOD(ListSection, notifyNew) = Class_findMethod(CO(ListSection), "NotifyNew", module);
         if(METHOD(ListSection, notifyNew))
            M_VTBLID(ListSection, notifyNew) = METHOD(ListSection, notifyNew)->vid;

         METHOD(ListSection, notifyRefillList) = Class_findMethod(CO(ListSection), "NotifyRefillList", module);
         if(METHOD(ListSection, notifyRefillList))
            M_VTBLID(ListSection, notifyRefillList) = METHOD(ListSection, notifyRefillList)->vid;

         METHOD(ListSection, notifySaveConfirmation) = Class_findMethod(CO(ListSection), "NotifySaveConfirmation", module);
         if(METHOD(ListSection, notifySaveConfirmation))
            M_VTBLID(ListSection, notifySaveConfirmation) = METHOD(ListSection, notifySaveConfirmation)->vid;

         METHOD(ListSection, notifySelectListRow) = Class_findMethod(CO(ListSection), "NotifySelectListRow", module);
         if(METHOD(ListSection, notifySelectListRow))
            M_VTBLID(ListSection, notifySelectListRow) = METHOD(ListSection, notifySelectListRow)->vid;

         METHOD(ListSection, refillList) = Class_findMethod(CO(ListSection), "RefillList", module);
         if(METHOD(ListSection, refillList))
            ListSection_refillList = (void (*)(C(ListSection)))METHOD(ListSection, refillList)->function;

         METHOD(ListSection, refreshState) = Class_findMethod(CO(ListSection), "RefreshState", module);
         if(METHOD(ListSection, refreshState))
            ListSection_refreshState = (void (*)(C(ListSection)))METHOD(ListSection, refreshState)->function;

         METHOD(ListSection, selectFirst) = Class_findMethod(CO(ListSection), "SelectFirst", module);
         if(METHOD(ListSection, selectFirst))
            ListSection_selectFirst = (void (*)(C(ListSection)))METHOD(ListSection, selectFirst)->function;

         METHOD(ListSection, selectListRow) = Class_findMethod(CO(ListSection), "SelectListRow", module);
         if(METHOD(ListSection, selectListRow))
            ListSection_selectListRow = (void (*)(C(ListSection), C(DataRow)))METHOD(ListSection, selectListRow)->function;

         PROPERTY(ListSection, editor) = Class_findProperty(CO(ListSection), "editor", module);
         if(PROPERTY(ListSection, editor))
            ListSection_set_editor = (void *)PROPERTY(ListSection, editor)->Set;

         PROPERTY(ListSection, table) = Class_findProperty(CO(ListSection), "table", module);
         if(PROPERTY(ListSection, table))
            ListSection_set_table = (void *)PROPERTY(ListSection, table)->Set;
      }
      CO(Lookup) = eC_findClass(module, "Lookup");
      CO(LookupEditor) = eC_findClass(module, "LookupEditor");
      CO(MatchOptions) = eC_findClass(module, "MatchOptions");
      CO(MemberStringSample) = eC_findClass(module, "MemberStringSample");
      CO(MoveOptions) = eC_findClass(module, "MoveOptions");
      CO(NoCaseAccent) = eC_findClass(module, "NoCaseAccent");
      if(CO(NoCaseAccent))
      {
         METHOD(NoCaseAccent, function) = Class_findMethod(CO(NoCaseAccent), "function", module);
         if(METHOD(NoCaseAccent, function))
            NoCaseAccent_function = (C(String) (*)(C(NoCaseAccent), C(String)))METHOD(NoCaseAccent, function)->function;
      }
      CO(ObjectType) = eC_findClass(module, "ObjectType");
      CO(OpenOptions) = eC_findClass(module, "OpenOptions");
      CO(OpenType) = eC_findClass(module, "OpenType");
      CO(Orientation) = eC_findClass(module, "Orientation");
      CO(Page) = eC_findClass(module, "Page");
      if(CO(Page))
      {
         PROPERTY(Page, report) = Class_findProperty(CO(Page), "report", module);
         if(PROPERTY(Page, report))
         {
            Page_set_report = (void *)PROPERTY(Page, report)->Set;
            Page_get_report = (void *)PROPERTY(Page, report)->Get;
         }
      }
      CO(PageFormat) = eC_findClass(module, "PageFormat");
      CO(PrintedReport) = eC_findClass(module, "PrintedReport");
      CO(RenderAction) = eC_findClass(module, "RenderAction");
      CO(Report) = eC_findClass(module, "Report");
      if(CO(Report))
      {
         METHOD(Report, advance) = Class_findMethod(CO(Report), "Advance", module);
         if(METHOD(Report, advance))
            M_VTBLID(Report, advance) = METHOD(Report, advance)->vid;

         METHOD(Report, executeData) = Class_findMethod(CO(Report), "ExecuteData", module);
         if(METHOD(Report, executeData))
            M_VTBLID(Report, executeData) = METHOD(Report, executeData)->vid;

         METHOD(Report, executeRowData) = Class_findMethod(CO(Report), "ExecuteRowData", module);
         if(METHOD(Report, executeRowData))
            M_VTBLID(Report, executeRowData) = METHOD(Report, executeRowData)->vid;

         METHOD(Report, onReset) = Class_findMethod(CO(Report), "OnReset", module);
         if(METHOD(Report, onReset))
            M_VTBLID(Report, onReset) = METHOD(Report, onReset)->vid;

         PROPERTY(Report, orientation) = Class_findProperty(CO(Report), "orientation", module);
         if(PROPERTY(Report, orientation))
         {
            Report_set_orientation = (void *)PROPERTY(Report, orientation)->Set;
            Report_get_orientation = (void *)PROPERTY(Report, orientation)->Get;
         }

         PROPERTY(Report, pageFormat) = Class_findProperty(CO(Report), "pageFormat", module);
         if(PROPERTY(Report, pageFormat))
         {
            Report_set_pageFormat = (void *)PROPERTY(Report, pageFormat)->Set;
            Report_get_pageFormat = (void *)PROPERTY(Report, pageFormat)->Get;
         }

         PROPERTY(Report, title) = Class_findProperty(CO(Report), "title", module);
         if(PROPERTY(Report, title))
            Report_set_title = (void *)PROPERTY(Report, title)->Set;

         PROPERTY(Report, nil) = Class_findProperty(CO(Report), "nil", module);
         if(PROPERTY(Report, nil))
            Report_get_nil = (void *)PROPERTY(Report, nil)->Get;
      }
      CO(ReportDestination) = eC_findClass(module, "ReportDestination");
      if(CO(ReportDestination))
      {
         METHOD(ReportDestination, addPage) = Class_findMethod(CO(ReportDestination), "AddPage", module);
         if(METHOD(ReportDestination, addPage))
            M_VTBLID(ReportDestination, addPage) = METHOD(ReportDestination, addPage)->vid;

         METHOD(ReportDestination, endPage) = Class_findMethod(CO(ReportDestination), "EndPage", module);
         if(METHOD(ReportDestination, endPage))
            M_VTBLID(ReportDestination, endPage) = METHOD(ReportDestination, endPage)->vid;

         METHOD(ReportDestination, getReport) = Class_findMethod(CO(ReportDestination), "GetReport", module);
         if(METHOD(ReportDestination, getReport))
            M_VTBLID(ReportDestination, getReport) = METHOD(ReportDestination, getReport)->vid;

         PROPERTY(ReportDestination, report) = Class_findProperty(CO(ReportDestination), "report", module);
         if(PROPERTY(ReportDestination, report))
         {
            ReportDestination_set_report = (void *)PROPERTY(ReportDestination, report)->Set;
            ReportDestination_get_report = (void *)PROPERTY(ReportDestination, report)->Get;
         }
      }
      CO(ReportPreviewArea) = eC_findClass(module, "ReportPreviewArea");
      CO(ReportRender) = eC_findClass(module, "ReportRender");
      if(CO(ReportRender))
      {
         METHOD(ReportRender, getPageNumber) = Class_findMethod(CO(ReportRender), "GetPageNumber", module);
         if(METHOD(ReportRender, getPageNumber))
            M_VTBLID(ReportRender, getPageNumber) = METHOD(ReportRender, getPageNumber)->vid;

         METHOD(ReportRender, render) = Class_findMethod(CO(ReportRender), "Render", module);
         if(METHOD(ReportRender, render))
            M_VTBLID(ReportRender, render) = METHOD(ReportRender, render)->vid;
      }
      CO(ReportRenderNormal) = eC_findClass(module, "ReportRenderNormal");
      CO(ReportTitle) = eC_findClass(module, "ReportTitle");
      CO(Row) = eC_findClass(module, "Row");
      if(CO(Row))
      {
         METHOD(Row, add) = Class_findMethod(CO(Row), "Add", module);
         if(METHOD(Row, add))
            Row_add = (C(bool) (*)(C(Row)))METHOD(Row, add)->function;

         METHOD(Row, addID) = Class_findMethod(CO(Row), "AddID", module);
         if(METHOD(Row, addID))
            Row_addID = (C(bool) (*)(C(Row), uint64))METHOD(Row, addID)->function;

         METHOD(Row, bindQueryData) = Class_findMethod(CO(Row), "BindQueryData", module);
         if(METHOD(Row, bindQueryData))
            Row_bindQueryData = (C(bool) (*)(C(Row), int, C(Field), C(Class) *, void *))METHOD(Row, bindQueryData)->function;

         METHOD(Row, delete) = Class_findMethod(CO(Row), "Delete", module);
         if(METHOD(Row, delete))
            Row_delete = (C(bool) (*)(C(Row)))METHOD(Row, delete)->function;

         METHOD(Row, find) = Class_findMethod(CO(Row), "Find", module);
         if(METHOD(Row, find))
            Row_find = (C(bool) (*)(C(Row), C(Field), C(MoveOptions), C(MatchOptions), C(Class) *, void *))METHOD(Row, find)->function;

         METHOD(Row, findMultiple) = Class_findMethod(CO(Row), "FindMultiple", module);
         if(METHOD(Row, findMultiple))
            Row_findMultiple = (C(bool) (*)(C(Row), C(FieldFindData) *, C(MoveOptions), int))METHOD(Row, findMultiple)->function;

         METHOD(Row, first) = Class_findMethod(CO(Row), "First", module);
         if(METHOD(Row, first))
            Row_first = (C(bool) (*)(C(Row)))METHOD(Row, first)->function;

         METHOD(Row, gUIDataRowSetData) = Class_findMethod(CO(Row), "GUIDataRowSetData", module);
         if(METHOD(Row, gUIDataRowSetData))
            Row_gUIDataRowSetData = (C(bool) (*)(C(Row), C(DataRow), C(DataField), C(Field)))METHOD(Row, gUIDataRowSetData)->function;

         METHOD(Row, getColumn) = Class_findMethod(CO(Row), "GetColumn", module);
         if(METHOD(Row, getColumn))
            Row_getColumn = (const char * (*)(C(Row), int))METHOD(Row, getColumn)->function;

         METHOD(Row, getData) = Class_findMethod(CO(Row), "GetData", module);
         if(METHOD(Row, getData))
            Row_getData = (C(bool) (*)(C(Row), C(Field), C(Class) *, void *))METHOD(Row, getData)->function;

         METHOD(Row, getDataFieldValue) = Class_findMethod(CO(Row), "GetDataFieldValue", module);
         if(METHOD(Row, getDataFieldValue))
            Row_getDataFieldValue = (C(bool) (*)(C(Row), C(Field), C(FieldValue) *))METHOD(Row, getDataFieldValue)->function;

         METHOD(Row, getQueryData) = Class_findMethod(CO(Row), "GetQueryData", module);
         if(METHOD(Row, getQueryData))
            Row_getQueryData = (C(bool) (*)(C(Row), int, C(Field), C(Class) *, void *))METHOD(Row, getQueryData)->function;

         METHOD(Row, getRowData) = Class_findMethod(CO(Row), "GetRowData", module);
         if(METHOD(Row, getRowData))
            Row_getRowData = (const void * (*)(C(Row)))METHOD(Row, getRowData)->function;

         METHOD(Row, last) = Class_findMethod(CO(Row), "Last", module);
         if(METHOD(Row, last))
            Row_last = (C(bool) (*)(C(Row)))METHOD(Row, last)->function;

         METHOD(Row, next) = Class_findMethod(CO(Row), "Next", module);
         if(METHOD(Row, next))
            Row_next = (C(bool) (*)(C(Row)))METHOD(Row, next)->function;

         METHOD(Row, previous) = Class_findMethod(CO(Row), "Previous", module);
         if(METHOD(Row, previous))
            Row_previous = (C(bool) (*)(C(Row)))METHOD(Row, previous)->function;

         METHOD(Row, query) = Class_findMethod(CO(Row), "Query", module);
         if(METHOD(Row, query))
            Row_query = (C(bool) (*)(C(Row), const char *))METHOD(Row, query)->function;

         METHOD(Row, select) = Class_findMethod(CO(Row), "Select", module);
         if(METHOD(Row, select))
            Row_select = (C(bool) (*)(C(Row), C(MoveOptions)))METHOD(Row, select)->function;

         METHOD(Row, setData) = Class_findMethod(CO(Row), "SetData", module);
         if(METHOD(Row, setData))
            Row_setData = (C(bool) (*)(C(Row), C(Field), C(Class) *, void *))METHOD(Row, setData)->function;

         METHOD(Row, setQueryParam) = Class_findMethod(CO(Row), "SetQueryParam", module);
         if(METHOD(Row, setQueryParam))
            Row_setQueryParam = (C(bool) (*)(C(Row), int, int))METHOD(Row, setQueryParam)->function;

         METHOD(Row, setQueryParam64) = Class_findMethod(CO(Row), "SetQueryParam64", module);
         if(METHOD(Row, setQueryParam64))
            Row_setQueryParam64 = (C(bool) (*)(C(Row), int, int64))METHOD(Row, setQueryParam64)->function;

         METHOD(Row, setQueryParamObject) = Class_findMethod(CO(Row), "SetQueryParamObject", module);
         if(METHOD(Row, setQueryParamObject))
            Row_setQueryParamObject = (C(bool) (*)(C(Row), int, void *, C(Class) *))METHOD(Row, setQueryParamObject)->function;

         METHOD(Row, setQueryParamText) = Class_findMethod(CO(Row), "SetQueryParamText", module);
         if(METHOD(Row, setQueryParamText))
            Row_setQueryParamText = (C(bool) (*)(C(Row), int, const char *))METHOD(Row, setQueryParamText)->function;

         METHOD(Row, synch) = Class_findMethod(CO(Row), "Synch", module);
         if(METHOD(Row, synch))
            Row_synch = (C(bool) (*)(C(Row), C(Row)))METHOD(Row, synch)->function;

         PROPERTY(Row, tbl) = Class_findProperty(CO(Row), "tbl", module);
         if(PROPERTY(Row, tbl))
         {
            Row_set_tbl = (void *)PROPERTY(Row, tbl)->Set;
            Row_get_tbl = (void *)PROPERTY(Row, tbl)->Get;
         }

         PROPERTY(Row, nil) = Class_findProperty(CO(Row), "nil", module);
         if(PROPERTY(Row, nil))
            Row_get_nil = (void *)PROPERTY(Row, nil)->Get;

         PROPERTY(Row, query) = Class_findProperty(CO(Row), "query", module);
         if(PROPERTY(Row, query))
         {
            Row_set_query = (void *)PROPERTY(Row, query)->Set;
            Row_get_query = (void *)PROPERTY(Row, query)->Get;
         }

         PROPERTY(Row, rowsCount) = Class_findProperty(CO(Row), "rowsCount", module);
         if(PROPERTY(Row, rowsCount))
            Row_get_rowsCount = (void *)PROPERTY(Row, rowsCount)->Get;

         PROPERTY(Row, sysID) = Class_findProperty(CO(Row), "sysID", module);
         if(PROPERTY(Row, sysID))
         {
            Row_set_sysID = (void *)PROPERTY(Row, sysID)->Set;
            Row_get_sysID = (void *)PROPERTY(Row, sysID)->Get;
         }
      }
      CO(SQLCustomFunction) = eC_findClass(module, "SQLCustomFunction");
      CO(SQLiteSearchField) = eC_findClass(module, "SQLiteSearchField");
      CO(SQLiteSearchTable) = eC_findClass(module, "SQLiteSearchTable");
      CO(SeekOptions) = eC_findClass(module, "SeekOptions");
      CO(State) = eC_findClass(module, "State");
      CO(StringList) = eC_findClass(module, "StringList");
      CO(StringSearchField) = eC_findClass(module, "StringSearchField");
      CO(StringSearchIndexingMethod) = eC_findClass(module, "StringSearchIndexingMethod");
      CO(StringSearchTable) = eC_findClass(module, "StringSearchTable");
      CO(Table) = eC_findClass(module, "Table");
      if(CO(Table))
      {
         METHOD(Table, addField) = Class_findMethod(CO(Table), "AddField", module);
         if(METHOD(Table, addField))
            M_VTBLID(Table, addField) = METHOD(Table, addField)->vid;

         METHOD(Table, createRow) = Class_findMethod(CO(Table), "CreateRow", module);
         if(METHOD(Table, createRow))
            M_VTBLID(Table, createRow) = METHOD(Table, createRow)->vid;

         METHOD(Table, findField) = Class_findMethod(CO(Table), "FindField", module);
         if(METHOD(Table, findField))
            M_VTBLID(Table, findField) = METHOD(Table, findField)->vid;

         METHOD(Table, gUIListBoxAddFields) = Class_findMethod(CO(Table), "GUIListBoxAddFields", module);
         if(METHOD(Table, gUIListBoxAddFields))
            Table_gUIListBoxAddFields = (void (*)(C(Table), C(ListBox)))METHOD(Table, gUIListBoxAddFields)->function;

         METHOD(Table, gUIListBoxAddRows) = Class_findMethod(CO(Table), "GUIListBoxAddRows", module);
         if(METHOD(Table, gUIListBoxAddRows))
            Table_gUIListBoxAddRows = (void (*)(C(Table), C(ListBox)))METHOD(Table, gUIListBoxAddRows)->function;

         METHOD(Table, gUIListBoxAddRowsField) = Class_findMethod(CO(Table), "GUIListBoxAddRowsField", module);
         if(METHOD(Table, gUIListBoxAddRowsField))
            Table_gUIListBoxAddRowsField = (void (*)(C(Table), C(ListBox), constString))METHOD(Table, gUIListBoxAddRowsField)->function;

         METHOD(Table, generateIndex) = Class_findMethod(CO(Table), "GenerateIndex", module);
         if(METHOD(Table, generateIndex))
            M_VTBLID(Table, generateIndex) = METHOD(Table, generateIndex)->vid;

         METHOD(Table, getFields) = Class_findMethod(CO(Table), "GetFields", module);
         if(METHOD(Table, getFields))
            M_VTBLID(Table, getFields) = METHOD(Table, getFields)->vid;

         METHOD(Table, getFieldsCount) = Class_findMethod(CO(Table), "GetFieldsCount", module);
         if(METHOD(Table, getFieldsCount))
            M_VTBLID(Table, getFieldsCount) = METHOD(Table, getFieldsCount)->vid;

         METHOD(Table, getFirstField) = Class_findMethod(CO(Table), "GetFirstField", module);
         if(METHOD(Table, getFirstField))
            M_VTBLID(Table, getFirstField) = METHOD(Table, getFirstField)->vid;

         METHOD(Table, getName) = Class_findMethod(CO(Table), "GetName", module);
         if(METHOD(Table, getName))
            M_VTBLID(Table, getName) = METHOD(Table, getName)->vid;

         METHOD(Table, getPrimaryKey) = Class_findMethod(CO(Table), "GetPrimaryKey", module);
         if(METHOD(Table, getPrimaryKey))
            M_VTBLID(Table, getPrimaryKey) = METHOD(Table, getPrimaryKey)->vid;

         METHOD(Table, getRecordSize) = Class_findMethod(CO(Table), "GetRecordSize", module);
         if(METHOD(Table, getRecordSize))
            M_VTBLID(Table, getRecordSize) = METHOD(Table, getRecordSize)->vid;

         METHOD(Table, getRowsCount) = Class_findMethod(CO(Table), "GetRowsCount", module);
         if(METHOD(Table, getRowsCount))
            M_VTBLID(Table, getRowsCount) = METHOD(Table, getRowsCount)->vid;

         METHOD(Table, index) = Class_findMethod(CO(Table), "Index", module);
         if(METHOD(Table, index))
            Table_index = (C(bool) (*)(C(Table), int, C(FieldIndex) *))METHOD(Table, index)->function;

         PROPERTY(Table, name) = Class_findProperty(CO(Table), "name", module);
         if(PROPERTY(Table, name))
            Table_get_name = (void *)PROPERTY(Table, name)->Get;

         PROPERTY(Table, firstField) = Class_findProperty(CO(Table), "firstField", module);
         if(PROPERTY(Table, firstField))
            Table_get_firstField = (void *)PROPERTY(Table, firstField)->Get;

         PROPERTY(Table, primaryKey) = Class_findProperty(CO(Table), "primaryKey", module);
         if(PROPERTY(Table, primaryKey))
            Table_get_primaryKey = (void *)PROPERTY(Table, primaryKey)->Get;

         PROPERTY(Table, fieldsCount) = Class_findProperty(CO(Table), "fieldsCount", module);
         if(PROPERTY(Table, fieldsCount))
            Table_get_fieldsCount = (void *)PROPERTY(Table, fieldsCount)->Get;

         PROPERTY(Table, rowsCount) = Class_findProperty(CO(Table), "rowsCount", module);
         if(PROPERTY(Table, rowsCount))
            Table_get_rowsCount = (void *)PROPERTY(Table, rowsCount)->Get;

         PROPERTY(Table, fields) = Class_findProperty(CO(Table), "fields", module);
         if(PROPERTY(Table, fields))
            Table_get_fields = (void *)PROPERTY(Table, fields)->Get;
      }
      CO(TableDropBox) = eC_findClass(module, "TableDropBox");
      if(CO(TableDropBox))
      {
         METHOD(TableDropBox, editNotifyCharsAdded) = Class_findMethod(CO(TableDropBox), "EditNotifyCharsAdded", module);
         if(METHOD(TableDropBox, editNotifyCharsAdded))
            TableDropBox_editNotifyCharsAdded = (void (*)(C(TableDropBox)))METHOD(TableDropBox, editNotifyCharsAdded)->function;

         METHOD(TableDropBox, editNotifyUpdate) = Class_findMethod(CO(TableDropBox), "EditNotifyUpdate", module);
         if(METHOD(TableDropBox, editNotifyUpdate))
            TableDropBox_editNotifyUpdate = (void (*)(C(TableDropBox), C(EditBox)))METHOD(TableDropBox, editNotifyUpdate)->function;

         METHOD(TableDropBox, refill) = Class_findMethod(CO(TableDropBox), "Refill", module);
         if(METHOD(TableDropBox, refill))
            M_VTBLID(TableDropBox, refill) = METHOD(TableDropBox, refill)->vid;

         PROPERTY(TableDropBox, filter) = Class_findProperty(CO(TableDropBox), "filter", module);
         if(PROPERTY(TableDropBox, filter))
         {
            TableDropBox_set_filter = (void *)PROPERTY(TableDropBox, filter)->Set;
            TableDropBox_get_filter = (void *)PROPERTY(TableDropBox, filter)->Get;
         }

         PROPERTY(TableDropBox, nameField) = Class_findProperty(CO(TableDropBox), "nameField", module);
         if(PROPERTY(TableDropBox, nameField))
            TableDropBox_set_nameField = (void *)PROPERTY(TableDropBox, nameField)->Set;

         PROPERTY(TableDropBox, exclusion) = Class_findProperty(CO(TableDropBox), "exclusion", module);
         if(PROPERTY(TableDropBox, exclusion))
            TableDropBox_set_exclusion = (void *)PROPERTY(TableDropBox, exclusion)->Set;

         PROPERTY(TableDropBox, table) = Class_findProperty(CO(TableDropBox), "table", module);
         if(PROPERTY(TableDropBox, table))
            TableDropBox_set_table = (void *)PROPERTY(TableDropBox, table)->Set;

         PROPERTY(TableDropBox, filterField) = Class_findProperty(CO(TableDropBox), "filterField", module);
         if(PROPERTY(TableDropBox, filterField))
            TableDropBox_set_filterField = (void *)PROPERTY(TableDropBox, filterField)->Set;
      }
      CO(TableEditor) = eC_findClass(module, "TableEditor");
      if(CO(TableEditor))
      {
         METHOD(TableEditor, createRow) = Class_findMethod(CO(TableEditor), "CreateRow", module);
         if(METHOD(TableEditor, createRow))
            TableEditor_createRow = (void (*)(C(TableEditor)))METHOD(TableEditor, createRow)->function;

         METHOD(TableEditor, enumerate) = Class_findMethod(CO(TableEditor), "Enumerate", module);
         if(METHOD(TableEditor, enumerate))
            TableEditor_enumerate = (void (*)(C(TableEditor)))METHOD(TableEditor, enumerate)->function;

         METHOD(TableEditor, filter) = Class_findMethod(CO(TableEditor), "Filter", module);
         if(METHOD(TableEditor, filter))
            TableEditor_filter = (C(bool) (*)(C(TableEditor), C(Id)))METHOD(TableEditor, filter)->function;

         METHOD(TableEditor, listSelect) = Class_findMethod(CO(TableEditor), "ListSelect", module);
         if(METHOD(TableEditor, listSelect))
            TableEditor_listSelect = (C(bool) (*)(C(TableEditor), C(DataRow)))METHOD(TableEditor, listSelect)->function;

         METHOD(TableEditor, load) = Class_findMethod(CO(TableEditor), "Load", module);
         if(METHOD(TableEditor, load))
            TableEditor_load = (void (*)(C(TableEditor)))METHOD(TableEditor, load)->function;

         METHOD(TableEditor, notifyClosing) = Class_findMethod(CO(TableEditor), "NotifyClosing", module);
         if(METHOD(TableEditor, notifyClosing))
            TableEditor_notifyClosing = (C(bool) (*)(C(TableEditor)))METHOD(TableEditor, notifyClosing)->function;

         METHOD(TableEditor, notifyModifiedDocument) = Class_findMethod(CO(TableEditor), "NotifyModifiedDocument", module);
         if(METHOD(TableEditor, notifyModifiedDocument))
            TableEditor_notifyModifiedDocument = (void (*)(C(TableEditor)))METHOD(TableEditor, notifyModifiedDocument)->function;

         METHOD(TableEditor, onCreateDynamicLookupEditors) = Class_findMethod(CO(TableEditor), "OnCreateDynamicLookupEditors", module);
         if(METHOD(TableEditor, onCreateDynamicLookupEditors))
            M_VTBLID(TableEditor, onCreateDynamicLookupEditors) = METHOD(TableEditor, onCreateDynamicLookupEditors)->vid;

         METHOD(TableEditor, onInitialize) = Class_findMethod(CO(TableEditor), "OnInitialize", module);
         if(METHOD(TableEditor, onInitialize))
            M_VTBLID(TableEditor, onInitialize) = METHOD(TableEditor, onInitialize)->vid;

         METHOD(TableEditor, onLeavingModifiedDocument) = Class_findMethod(CO(TableEditor), "OnLeavingModifiedDocument", module);
         if(METHOD(TableEditor, onLeavingModifiedDocument))
            M_VTBLID(TableEditor, onLeavingModifiedDocument) = METHOD(TableEditor, onLeavingModifiedDocument)->vid;

         METHOD(TableEditor, onList) = Class_findMethod(CO(TableEditor), "OnList", module);
         if(METHOD(TableEditor, onList))
            M_VTBLID(TableEditor, onList) = METHOD(TableEditor, onList)->vid;

         METHOD(TableEditor, onLoad) = Class_findMethod(CO(TableEditor), "OnLoad", module);
         if(METHOD(TableEditor, onLoad))
            M_VTBLID(TableEditor, onLoad) = METHOD(TableEditor, onLoad)->vid;

         METHOD(TableEditor, onRemovalRequest) = Class_findMethod(CO(TableEditor), "OnRemovalRequest", module);
         if(METHOD(TableEditor, onRemovalRequest))
            M_VTBLID(TableEditor, onRemovalRequest) = METHOD(TableEditor, onRemovalRequest)->vid;

         METHOD(TableEditor, onStateChanged) = Class_findMethod(CO(TableEditor), "OnStateChanged", module);
         if(METHOD(TableEditor, onStateChanged))
            M_VTBLID(TableEditor, onStateChanged) = METHOD(TableEditor, onStateChanged)->vid;

         METHOD(TableEditor, remove) = Class_findMethod(CO(TableEditor), "Remove", module);
         if(METHOD(TableEditor, remove))
            TableEditor_remove = (void (*)(C(TableEditor)))METHOD(TableEditor, remove)->function;

         METHOD(TableEditor, select) = Class_findMethod(CO(TableEditor), "Select", module);
         if(METHOD(TableEditor, select))
            TableEditor_select = (C(bool) (*)(C(TableEditor), C(Id)))METHOD(TableEditor, select)->function;

         METHOD(TableEditor, selectListRow) = Class_findMethod(CO(TableEditor), "SelectListRow", module);
         if(METHOD(TableEditor, selectListRow))
            TableEditor_selectListRow = (void (*)(C(TableEditor), C(DataRow)))METHOD(TableEditor, selectListRow)->function;

         METHOD(TableEditor, selectNext) = Class_findMethod(CO(TableEditor), "SelectNext", module);
         if(METHOD(TableEditor, selectNext))
            TableEditor_selectNext = (C(bool) (*)(C(TableEditor), C(bool)))METHOD(TableEditor, selectNext)->function;

         METHOD(TableEditor, selectPrevious) = Class_findMethod(CO(TableEditor), "SelectPrevious", module);
         if(METHOD(TableEditor, selectPrevious))
            TableEditor_selectPrevious = (C(bool) (*)(C(TableEditor), C(bool)))METHOD(TableEditor, selectPrevious)->function;

         METHOD(TableEditor, write) = Class_findMethod(CO(TableEditor), "Write", module);
         if(METHOD(TableEditor, write))
            TableEditor_write = (void (*)(C(TableEditor)))METHOD(TableEditor, write)->function;

         PROPERTY(TableEditor, table) = Class_findProperty(CO(TableEditor), "table", module);
         if(PROPERTY(TableEditor, table))
         {
            TableEditor_set_table = (void *)PROPERTY(TableEditor, table)->Set;
            TableEditor_get_table = (void *)PROPERTY(TableEditor, table)->Get;
         }

         PROPERTY(TableEditor, index) = Class_findProperty(CO(TableEditor), "index", module);
         if(PROPERTY(TableEditor, index))
         {
            TableEditor_set_index = (void *)PROPERTY(TableEditor, index)->Set;
            TableEditor_get_index = (void *)PROPERTY(TableEditor, index)->Get;
         }

         PROPERTY(TableEditor, list) = Class_findProperty(CO(TableEditor), "list", module);
         if(PROPERTY(TableEditor, list))
            TableEditor_set_list = (void *)PROPERTY(TableEditor, list)->Set;

         PROPERTY(TableEditor, listFields) = Class_findProperty(CO(TableEditor), "listFields", module);
         if(PROPERTY(TableEditor, listFields))
            TableEditor_set_listFields = (void *)PROPERTY(TableEditor, listFields)->Set;

         PROPERTY(TableEditor, listSortOrder) = Class_findProperty(CO(TableEditor), "listSortOrder", module);
         if(PROPERTY(TableEditor, listSortOrder))
         {
            TableEditor_set_listSortOrder = (void *)PROPERTY(TableEditor, listSortOrder)->Set;
            TableEditor_get_listSortOrder = (void *)PROPERTY(TableEditor, listSortOrder)->Get;
         }

         PROPERTY(TableEditor, listSortField) = Class_findProperty(CO(TableEditor), "listSortField", module);
         if(PROPERTY(TableEditor, listSortField))
         {
            TableEditor_set_listSortField = (void *)PROPERTY(TableEditor, listSortField)->Set;
            TableEditor_get_listSortField = (void *)PROPERTY(TableEditor, listSortField)->Get;
         }

         PROPERTY(TableEditor, disabledFullListing) = Class_findProperty(CO(TableEditor), "disabledFullListing", module);
         if(PROPERTY(TableEditor, disabledFullListing))
         {
            TableEditor_set_disabledFullListing = (void *)PROPERTY(TableEditor, disabledFullListing)->Set;
            TableEditor_get_disabledFullListing = (void *)PROPERTY(TableEditor, disabledFullListing)->Get;
         }

         PROPERTY(TableEditor, searchFields) = Class_findProperty(CO(TableEditor), "searchFields", module);
         if(PROPERTY(TableEditor, searchFields))
            TableEditor_set_searchFields = (void *)PROPERTY(TableEditor, searchFields)->Set;

         PROPERTY(TableEditor, searchTables) = Class_findProperty(CO(TableEditor), "searchTables", module);
         if(PROPERTY(TableEditor, searchTables))
            TableEditor_set_searchTables = (void *)PROPERTY(TableEditor, searchTables)->Set;

         PROPERTY(TableEditor, sqliteSearchTables) = Class_findProperty(CO(TableEditor), "sqliteSearchTables", module);
         if(PROPERTY(TableEditor, sqliteSearchTables))
            TableEditor_set_sqliteSearchTables = (void *)PROPERTY(TableEditor, sqliteSearchTables)->Set;

         PROPERTY(TableEditor, searchString) = Class_findProperty(CO(TableEditor), "searchString", module);
         if(PROPERTY(TableEditor, searchString))
            TableEditor_set_searchString = (void *)PROPERTY(TableEditor, searchString)->Set;

         PROPERTY(TableEditor, dynamicLookupEditors) = Class_findProperty(CO(TableEditor), "dynamicLookupEditors", module);
         if(PROPERTY(TableEditor, dynamicLookupEditors))
            TableEditor_set_dynamicLookupEditors = (void *)PROPERTY(TableEditor, dynamicLookupEditors)->Set;

         PROPERTY(TableEditor, selectedId) = Class_findProperty(CO(TableEditor), "selectedId", module);
         if(PROPERTY(TableEditor, selectedId))
            TableEditor_get_selectedId = (void *)PROPERTY(TableEditor, selectedId)->Get;

         PROPERTY(TableEditor, idField) = Class_findProperty(CO(TableEditor), "idField", module);
         if(PROPERTY(TableEditor, idField))
         {
            TableEditor_set_idField = (void *)PROPERTY(TableEditor, idField)->Set;
            TableEditor_get_idField = (void *)PROPERTY(TableEditor, idField)->Get;
         }

         PROPERTY(TableEditor, stringField) = Class_findProperty(CO(TableEditor), "stringField", module);
         if(PROPERTY(TableEditor, stringField))
         {
            TableEditor_set_stringField = (void *)PROPERTY(TableEditor, stringField)->Set;
            TableEditor_get_stringField = (void *)PROPERTY(TableEditor, stringField)->Get;
         }

         PROPERTY(TableEditor, indexFilterField) = Class_findProperty(CO(TableEditor), "indexFilterField", module);
         if(PROPERTY(TableEditor, indexFilterField))
         {
            TableEditor_set_indexFilterField = (void *)PROPERTY(TableEditor, indexFilterField)->Set;
            TableEditor_get_indexFilterField = (void *)PROPERTY(TableEditor, indexFilterField)->Get;
         }

         PROPERTY(TableEditor, readOnly) = Class_findProperty(CO(TableEditor), "readOnly", module);
         if(PROPERTY(TableEditor, readOnly))
         {
            TableEditor_set_readOnly = (void *)PROPERTY(TableEditor, readOnly)->Set;
            TableEditor_get_readOnly = (void *)PROPERTY(TableEditor, readOnly)->Get;
         }

         PROPERTY(TableEditor, masterEditor) = Class_findProperty(CO(TableEditor), "masterEditor", module);
         if(PROPERTY(TableEditor, masterEditor))
         {
            TableEditor_set_masterEditor = (void *)PROPERTY(TableEditor, masterEditor)->Set;
            TableEditor_get_masterEditor = (void *)PROPERTY(TableEditor, masterEditor)->Get;
         }
      }



         // Set up all the function pointers, ...

      FUNCTION(convertToASCII) = eC_findFunction(module, "ConvertToASCII");
      if(FUNCTION(convertToASCII))
         convertToASCII = (void *)FUNCTION(convertToASCII)->function;

      FUNCTION(eRSProgressAdvance) = eC_findFunction(module, "ERSProgressAdvance");
      if(FUNCTION(eRSProgressAdvance))
         eRSProgressAdvance = (void *)FUNCTION(eRSProgressAdvance)->function;

      FUNCTION(eRSProgressAdvanceLevelCheck) = eC_findFunction(module, "ERSProgressAdvanceLevelCheck");
      if(FUNCTION(eRSProgressAdvanceLevelCheck))
         eRSProgressAdvanceLevelCheck = (void *)FUNCTION(eRSProgressAdvanceLevelCheck)->function;

      FUNCTION(setDefaultIdField) = eC_findFunction(module, "SetDefaultIdField");
      if(FUNCTION(setDefaultIdField))
         setDefaultIdField = (void *)FUNCTION(setDefaultIdField)->function;

      FUNCTION(setDefaultNameField) = eC_findFunction(module, "SetDefaultNameField");
      if(FUNCTION(setDefaultNameField))
         setDefaultNameField = (void *)FUNCTION(setDefaultNameField)->function;

      FUNCTION(setEDBIndexOptions) = eC_findFunction(module, "SetEDBIndexOptions");
      if(FUNCTION(setEDBIndexOptions))
         setEDBIndexOptions = (void *)FUNCTION(setEDBIndexOptions)->function;

      FUNCTION(toASCII) = eC_findFunction(module, "ToASCII");
      if(FUNCTION(toASCII))
         toASCII = (void *)FUNCTION(toASCII)->function;

   }
   else
      printf("Unable to load eC module: %s\n", EDA_MODULE_NAME);
   return module;
}
