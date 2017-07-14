typedef double Time;
typedef int ThreadPriority;
enum
{
   ThreadPriority_normal = 0x0,
   ThreadPriority_aboveNormal = 0x1,
   ThreadPriority_belowNormal = -1,
   ThreadPriority_highest = 0x2,
   ThreadPriority_lowest = -2,
   ThreadPriority_idle = -15,
   ThreadPriority_timeCritical = 0xF
};

typedef Instance Thread;
typedef int SettingsIOResult;
enum
{
   SettingsIOResult_error = 0x0,
   SettingsIOResult_success = 0x1,
   SettingsIOResult_fileNotFound = 0x2,
   SettingsIOResult_fileNotCompatibleWithDriver = 0x3
};

typedef struct Semaphore Semaphore;
typedef int64 SecSince1970;
typedef struct Point Point;
typedef int Month;
enum
{
   Month_january = 0x0,
   Month_february = 0x1,
   Month_march = 0x2,
   Month_april = 0x3,
   Month_may = 0x4,
   Month_june = 0x5,
   Month_july = 0x6,
   Month_august = 0x7,
   Month_september = 0x8,
   Month_october = 0x9,
   Month_november = 0xA,
   Month_december = 0xB
};

typedef int JSONResult;
enum
{
   JSONResult_syntaxError = 0x0,
   JSONResult_success = 0x1,
   JSONResult_typeMismatch = 0x2,
   JSONResult_noItem = 0x3
};

typedef Instance JSONParser;
typedef Instance GlobalSettingsDriver;
typedef Instance GlobalSettingsData;
typedef Instance GlobalSettings;
typedef int GlobalSettingType;
enum
{
   GlobalSettingType_integer = 0x0,
   GlobalSettingType_singleString = 0x1,
   GlobalSettingType_stringList = 0x2
};

typedef GlobalSettings GlobalAppSettings;
typedef uint FileSize;
typedef uint32 FileAttribs;
struct FileStats
{
   FileAttribs attribs;
   FileSize size;
   SecSince1970 accessed;
   SecSince1970 modified;
   SecSince1970 created;
};
typedef struct FileStats FileStats;
typedef int FileSeekMode;
enum
{
   FileSeekMode_start = 0x0,
   FileSeekMode_current = 0x1,
   FileSeekMode_end = 0x2
};

typedef int FileOpenMode;
enum
{
   FileOpenMode_read = 0x1,
   FileOpenMode_write = 0x2,
   FileOpenMode_append = 0x3,
   FileOpenMode_readWrite = 0x4,
   FileOpenMode_writeRead = 0x5,
   FileOpenMode_appendRead = 0x6
};

typedef Instance FileMonitor;
typedef int FileLock;
enum
{
   FileLock_unlocked = 0x0,
   FileLock_shared = 0x1,
   FileLock_exclusive = 0x2
};

typedef struct FileListing FileListing;
typedef uint32 FileChange;
typedef IOChannel File;
typedef int ErrorLevel;
enum
{
   ErrorLevel_veryFatal = 0x0,
   ErrorLevel_fatal = 0x1,
   ErrorLevel_major = 0x2,
   ErrorLevel_minor = 0x3
};

typedef uint32 ErrorCode;
typedef File DualPipe;
typedef int DayOfTheWeek;
enum
{
   DayOfTheWeek_sunday = 0x0,
   DayOfTheWeek_monday = 0x1,
   DayOfTheWeek_tuesday = 0x2,
   DayOfTheWeek_wednesday = 0x3,
   DayOfTheWeek_thursday = 0x4,
   DayOfTheWeek_friday = 0x5,
   DayOfTheWeek_saturday = 0x6
};

typedef struct DateTime DateTime;
typedef struct Date Date;
typedef struct Condition Condition;
typedef uint32 CharCategories;
typedef struct Box Box;
typedef Instance ArchiveDir;
typedef int ArchiveAddMode;
enum
{
   ArchiveAddMode_replace = 0x0,
   ArchiveAddMode_refresh = 0x1,
   ArchiveAddMode_update = 0x2,
   ArchiveAddMode_readOnlyDir = 0x3
};

typedef Instance Archive;
typedef CommonControl Button;
struct class_members_Timer
{
   byte __ecerePrivateData0[16];
   Time _delay;
};
typedef Instance Timer;
static const ErrorLevel AllErrors;

typedef uint32 ArchiveOpenFlags;
typedef File BufferedFile;
typedef int CharCategory;
enum
{
   CharCategory_none = 0x0,
   CharCategory_Mn = 0x1,
   CharCategory_markNonSpacing = 0x1,
   CharCategory_Mc = 0x2,
   CharCategory_markSpacing = 0x2,
   CharCategory_Me = 0x3,
   CharCategory_markEnclosing = 0x3,
   CharCategory_Nd = 0x4,
   CharCategory_numberDecimalDigit = 0x4,
   CharCategory_Nl = 0x5,
   CharCategory_numberLetter = 0x5,
   CharCategory_No = 0x6,
   CharCategory_numberOther = 0x6,
   CharCategory_Zs = 0x7,
   CharCategory_separatorSpace = 0x7,
   CharCategory_Zl = 0x8,
   CharCategory_separatorLine = 0x8,
   CharCategory_Zp = 0x9,
   CharCategory_separatorParagraph = 0x9,
   CharCategory_Cc = 0xA,
   CharCategory_otherControl = 0xA,
   CharCategory_Cf = 0xB,
   CharCategory_otherFormat = 0xB,
   CharCategory_Cs = 0xC,
   CharCategory_otherSurrogate = 0xC,
   CharCategory_Co = 0xD,
   CharCategory_otherPrivateUse = 0xD,
   CharCategory_Cn = 0xE,
   CharCategory_otherNotAssigned = 0xE,
   CharCategory_Lu = 0xF,
   CharCategory_letterUpperCase = 0xF,
   CharCategory_Ll = 0x10,
   CharCategory_letterLowerCase = 0x10,
   CharCategory_Lt = 0x11,
   CharCategory_letterTitleCase = 0x11,
   CharCategory_Lm = 0x12,
   CharCategory_letterModifier = 0x12,
   CharCategory_Lo = 0x13,
   CharCategory_letterOther = 0x13,
   CharCategory_Pc = 0x14,
   CharCategory_punctuationConnector = 0x14,
   CharCategory_Pd = 0x15,
   CharCategory_punctuationDash = 0x15,
   CharCategory_Ps = 0x16,
   CharCategory_punctuationOpen = 0x16,
   CharCategory_Pe = 0x17,
   CharCategory_punctuationClose = 0x17,
   CharCategory_Pi = 0x18,
   CharCategory_punctuationInitial = 0x18,
   CharCategory_Pf = 0x19,
   CharCategory_punctuationFinal = 0x19,
   CharCategory_Po = 0x1A,
   CharCategory_punctuationOther = 0x1A,
   CharCategory_Sm = 0x1B,
   CharCategory_symbolMath = 0x1B,
   CharCategory_Sc = 0x1C,
   CharCategory_symbolCurrency = 0x1C,
   CharCategory_Sk = 0x1D,
   CharCategory_symbolModifier = 0x1D,
   CharCategory_So = 0x1E,
   CharCategory_symbolOther = 0x1E
};

typedef File ConsoleFile;
typedef double Distance;
typedef GlobalSettingsDriver ECONGlobalSettings;
typedef JSONParser ECONParser;
typedef uint64 FileSize64;
typedef ErrorCode GuiErrorCode;
enum
{
   GuiErrorCode_driverNotSupported = 0x101,
   GuiErrorCode_windowCreationFailed = 0x102,
   GuiErrorCode_graphicsLoadingFailed = 0x103,
   GuiErrorCode_modeSwitchFailed = 0x104
};

typedef GlobalSettingsDriver JSONGlobalSettings;
typedef int LoggingMode;
enum
{
   LoggingMode_noLogging = 0x0,
   LoggingMode_stdOut = 0x1,
   LoggingMode_stdErr = 0x2,
   LoggingMode_debug = 0x3,
   LoggingMode_logFile = 0x4,
   LoggingMode_msgBox = 0x5,
   LoggingMode_buffer = 0x6
};

typedef uint32 MoveFileOptions;
typedef uint32 PipeOpenMode;
typedef struct Pointf Pointf;
typedef CharCategories PredefinedCharCategories;
enum
{
   PredefinedCharCategories_none = 0x1,
   PredefinedCharCategories_marks = 0xE,
   PredefinedCharCategories_numbers = 0x70,
   PredefinedCharCategories_separators = 0x380,
   PredefinedCharCategories_others = 0x7C00,
   PredefinedCharCategories_letters = 0xF8000,
   PredefinedCharCategories_punctuation = 0x7F00000,
   PredefinedCharCategories_symbols = 0x78000000,
   PredefinedCharCategories_connector = 0x100000
};

typedef Button RepButton;
typedef uint SetBool;
enum
{
   SetBool_unset = 0x0,
   SetBool_false = 0x1,
   SetBool_true = 0x2
};

typedef ErrorCode SysErrorCode;
enum
{
   SysErrorCode_allocationFailed = 0x1001,
   SysErrorCode_nameInexistant = 0x1002,
   SysErrorCode_nameExists = 0x1003,
   SysErrorCode_missingLibrary = 0x1004,
   SysErrorCode_fileNotFound = 0x3005,
   SysErrorCode_writeFailed = 0x2006
};

typedef File TempFile;
typedef uint TimeStamp32;
extern int Archive_clear_vTblID;
bool Archive_clear(Archive __i);
extern Method * method_Archive_clear;

extern int Archive_fileExists_vTblID;
FileAttribs Archive_fileExists(Archive __i, const char * fileName);
extern Method * method_Archive_fileExists;

extern int Archive_fileOpen_vTblID;
File Archive_fileOpen(Archive __i, const char * fileName);
extern Method * method_Archive_fileOpen;

extern int Archive_fileOpenAtPosition_vTblID;
File Archive_fileOpenAtPosition(Archive __i, uint position);
extern Method * method_Archive_fileOpenAtPosition;

extern int Archive_openDirectory_vTblID;
ArchiveDir Archive_openDirectory(Archive __i, const char * name, FileStats * stats, ArchiveAddMode addMode);
extern Method * method_Archive_openDirectory;

extern int Archive_setBufferRead_vTblID;
void Archive_setBufferRead(Archive __i, uint bufferRead);
extern Method * method_Archive_setBufferRead;

extern int Archive_setBufferSize_vTblID;
void Archive_setBufferSize(Archive __i, uint bufferSize);
extern Method * method_Archive_setBufferSize;

extern Property * property_Archive_totalSize;
extern void (* Archive_set_totalSize)(Archive a, FileSize value);
extern FileSize (* Archive_get_totalSize)(Archive a);

extern Property * property_Archive_bufferSize;
extern void (* Archive_set_bufferSize)(Archive a, uint value);

extern Property * property_Archive_bufferRead;
extern void (* Archive_set_bufferRead)(Archive a, uint value);

extern bool (* ArchiveDir_add)(ArchiveDir __this, const char * name, const char * path, ArchiveAddMode addMode, int compression, int * ratio, uint * newPosition);

extern int ArchiveDir_addFromFile_vTblID;
bool ArchiveDir_addFromFile(ArchiveDir __i, const char * name, File input, FileStats * stats, ArchiveAddMode addMode, int compression, int * ratio, uint * newPosition);
extern Method * method_ArchiveDir_addFromFile;

extern int ArchiveDir_addFromFileAtPosition_vTblID;
bool ArchiveDir_addFromFileAtPosition(ArchiveDir __i, uint position, const char * name, File input, FileStats * stats, ArchiveAddMode addMode, int compression, int * ratio, uint * newPosition);
extern Method * method_ArchiveDir_addFromFileAtPosition;

extern int ArchiveDir_delete_vTblID;
bool ArchiveDir_delete(ArchiveDir __i, const char * fileName);
extern Method * method_ArchiveDir_delete;

extern int ArchiveDir_fileExists_vTblID;
FileAttribs ArchiveDir_fileExists(ArchiveDir __i, const char * fileName);
extern Method * method_ArchiveDir_fileExists;

extern int ArchiveDir_fileOpen_vTblID;
File ArchiveDir_fileOpen(ArchiveDir __i, const char * fileName);
extern Method * method_ArchiveDir_fileOpen;

extern int ArchiveDir_move_vTblID;
bool ArchiveDir_move(ArchiveDir __i, const char * name, ArchiveDir to);
extern Method * method_ArchiveDir_move;

extern int ArchiveDir_openDirectory_vTblID;
ArchiveDir ArchiveDir_openDirectory(ArchiveDir __i, const char * name, FileStats * stats, ArchiveAddMode addMode);
extern Method * method_ArchiveDir_openDirectory;

extern int ArchiveDir_rename_vTblID;
bool ArchiveDir_rename(ArchiveDir __i, const char * name, const char * newName);
extern Method * method_ArchiveDir_rename;

#define ARCHIVEOPENFLAGS_writeAccess_SHIFT               0
#define ARCHIVEOPENFLAGS_writeAccess_MASK                0x1
#define ARCHIVEOPENFLAGS_buffered_SHIFT                  1
#define ARCHIVEOPENFLAGS_buffered_MASK                   0x2
#define ARCHIVEOPENFLAGS_exclusive_SHIFT                 2
#define ARCHIVEOPENFLAGS_exclusive_MASK                  0x4
#define ARCHIVEOPENFLAGS_waitLock_SHIFT                  3
#define ARCHIVEOPENFLAGS_waitLock_MASK                   0x8


struct Box
{
   int left;
   int top;
   int right;
   int bottom;
};
extern void (* Box_clip)(Box * __this, Box * against);

extern void (* Box_clipOffset)(Box * __this, Box * against, int x, int y);

extern bool (* Box_isPointInside)(Box * __this, Point * point);

extern bool (* Box_overlap)(Box * __this, Box * box);

extern Property * property_Box_width;
extern void (* Box_set_width)(Box * b, int value);
extern int (* Box_get_width)(Box * b);

extern Property * property_Box_height;
extern void (* Box_set_height)(Box * b, int value);
extern int (* Box_get_height)(Box * b);

extern Property * property_BufferedFile_handle;
extern void (* BufferedFile_set_handle)(BufferedFile b, File value);
extern File (* BufferedFile_get_handle)(BufferedFile b);

extern Property * property_BufferedFile_bufferSize;
extern void (* BufferedFile_set_bufferSize)(BufferedFile b, uint value);
extern uint (* BufferedFile_get_bufferSize)(BufferedFile b);

extern Property * property_BufferedFile_bufferRead;
extern void (* BufferedFile_set_bufferRead)(BufferedFile b, uint value);
extern uint (* BufferedFile_get_bufferRead)(BufferedFile b);

extern Property * property_Centimeters_Meters;
extern double (* Centimeters_from_Meters)(Distance meters);
extern Distance (* Centimeters_to_Meters)(double centimeters);

#define CHARCATEGORIES_none_SHIFT                        0
#define CHARCATEGORIES_none_MASK                         0x1
#define CHARCATEGORIES_markNonSpacing_SHIFT              1
#define CHARCATEGORIES_markNonSpacing_MASK               0x2
#define CHARCATEGORIES_markSpacing_SHIFT                 2
#define CHARCATEGORIES_markSpacing_MASK                  0x4
#define CHARCATEGORIES_markEnclosing_SHIFT               3
#define CHARCATEGORIES_markEnclosing_MASK                0x8
#define CHARCATEGORIES_numberDecimalDigit_SHIFT          4
#define CHARCATEGORIES_numberDecimalDigit_MASK           0x10
#define CHARCATEGORIES_numberLetter_SHIFT                5
#define CHARCATEGORIES_numberLetter_MASK                 0x20
#define CHARCATEGORIES_numberOther_SHIFT                 6
#define CHARCATEGORIES_numberOther_MASK                  0x40
#define CHARCATEGORIES_separatorSpace_SHIFT              7
#define CHARCATEGORIES_separatorSpace_MASK               0x80
#define CHARCATEGORIES_separatorLine_SHIFT               8
#define CHARCATEGORIES_separatorLine_MASK                0x100
#define CHARCATEGORIES_separatorParagraph_SHIFT          9
#define CHARCATEGORIES_separatorParagraph_MASK           0x200
#define CHARCATEGORIES_otherControl_SHIFT                10
#define CHARCATEGORIES_otherControl_MASK                 0x400
#define CHARCATEGORIES_otherFormat_SHIFT                 11
#define CHARCATEGORIES_otherFormat_MASK                  0x800
#define CHARCATEGORIES_otherSurrogate_SHIFT              12
#define CHARCATEGORIES_otherSurrogate_MASK               0x1000
#define CHARCATEGORIES_otherPrivateUse_SHIFT             13
#define CHARCATEGORIES_otherPrivateUse_MASK              0x2000
#define CHARCATEGORIES_otherNotAssigned_SHIFT            14
#define CHARCATEGORIES_otherNotAssigned_MASK             0x4000
#define CHARCATEGORIES_letterUpperCase_SHIFT             15
#define CHARCATEGORIES_letterUpperCase_MASK              0x8000
#define CHARCATEGORIES_letterLowerCase_SHIFT             16
#define CHARCATEGORIES_letterLowerCase_MASK              0x10000
#define CHARCATEGORIES_letterTitleCase_SHIFT             17
#define CHARCATEGORIES_letterTitleCase_MASK              0x20000
#define CHARCATEGORIES_letterModifier_SHIFT              18
#define CHARCATEGORIES_letterModifier_MASK               0x40000
#define CHARCATEGORIES_letterOther_SHIFT                 19
#define CHARCATEGORIES_letterOther_MASK                  0x80000
#define CHARCATEGORIES_punctuationConnector_SHIFT        20
#define CHARCATEGORIES_punctuationConnector_MASK         0x100000
#define CHARCATEGORIES_punctuationDash_SHIFT             21
#define CHARCATEGORIES_punctuationDash_MASK              0x200000
#define CHARCATEGORIES_punctuationOpen_SHIFT             22
#define CHARCATEGORIES_punctuationOpen_MASK              0x400000
#define CHARCATEGORIES_punctuationClose_SHIFT            23
#define CHARCATEGORIES_punctuationClose_MASK             0x800000
#define CHARCATEGORIES_punctuationInitial_SHIFT          24
#define CHARCATEGORIES_punctuationInitial_MASK           0x1000000
#define CHARCATEGORIES_punctuationFinal_SHIFT            25
#define CHARCATEGORIES_punctuationFinal_MASK             0x2000000
#define CHARCATEGORIES_punctuationOther_SHIFT            26
#define CHARCATEGORIES_punctuationOther_MASK             0x4000000
#define CHARCATEGORIES_symbolMath_SHIFT                  27
#define CHARCATEGORIES_symbolMath_MASK                   0x8000000
#define CHARCATEGORIES_symbolCurrency_SHIFT              28
#define CHARCATEGORIES_symbolCurrency_MASK               0x10000000
#define CHARCATEGORIES_symbolModifier_SHIFT              29
#define CHARCATEGORIES_symbolModifier_MASK               0x20000000
#define CHARCATEGORIES_symbolOther_SHIFT                 30
#define CHARCATEGORIES_symbolOther_MASK                  0x40000000


extern void (* Condition_signal)(Condition * __this);

extern void (* Condition_wait)(Condition * __this, Mutex * mutex);

extern Property * property_Condition_name;
extern void (* Condition_set_name)(Condition * c, const char * value);
extern const char * (* Condition_get_name)(Condition * c);

struct Date
{
   int year;
   Month month;
   int day;
};
extern const char * (* Date_onGetStringEn)(Date * __this, char * stringOutput, void * fieldData, bool * needClass);

extern Property * property_Date_dayOfTheWeek;
extern DayOfTheWeek (* Date_get_dayOfTheWeek)(Date * d);

struct DateTime
{
   int year;
   Month month;
   int day;
   int hour;
   int minute;
   int second;
   DayOfTheWeek dayOfTheWeek;
   int dayInTheYear;
};
extern bool (* DateTime_fixDayOfYear)(DateTime * __this);

extern bool (* DateTime_getLocalTime)(DateTime * __this);

extern Property * property_DateTime_SecSince1970;
extern void (* DateTime_from_SecSince1970)(DateTime * d, SecSince1970 value);
extern SecSince1970 (* DateTime_to_SecSince1970)(DateTime * d);

extern Property * property_DateTime_Date;
extern void (* DateTime_from_Date)(DateTime * d, const Date * value);
extern void (* DateTime_to_Date)(DateTime * d, Date * value);

extern Property * property_DateTime_global;
extern void (* DateTime_set_global)(DateTime * d, const DateTime * value);
extern void (* DateTime_get_global)(DateTime * d, DateTime * value);

extern Property * property_DateTime_local;
extern void (* DateTime_set_local)(DateTime * d, const DateTime * value);
extern void (* DateTime_get_local)(DateTime * d, DateTime * value);

extern Property * property_DateTime_daysSince1970;
extern int64 (* DateTime_get_daysSince1970)(DateTime * d);

extern Property * property_Degrees_Radians;
extern double (* Degrees_from_Radians)(Angle radians);
extern Angle (* Degrees_to_Radians)(double degrees);

extern int (* DualPipe_getExitCode)(DualPipe __this);

extern bool (* DualPipe_getLinePeek)(DualPipe __this, char * s, int max, int * charsRead);

extern int (* DualPipe_getProcessID)(DualPipe __this);

extern bool (* DualPipe_peek)(DualPipe __this);

extern void (* DualPipe_terminate)(DualPipe __this);

extern void (* DualPipe_wait)(DualPipe __this);

#define ERRORCODE_level_SHIFT                            12
#define ERRORCODE_level_MASK                             0x3000
#define ERRORCODE_code_SHIFT                             0
#define ERRORCODE_code_MASK                              0xFFF


extern Property * property_Feet_Meters;
extern double (* Feet_from_Meters)(Distance meters);
extern Distance (* Feet_to_Meters)(double feet);

extern int File_close_vTblID;
void File_close(File __i);
extern Method * method_File_close;

extern int File_closeInput_vTblID;
void File_closeInput(File __i);
extern Method * method_File_closeInput;

extern int File_closeOutput_vTblID;
void File_closeOutput(File __i);
extern Method * method_File_closeOutput;

extern bool (* File_copyTo)(File __this, const char * outputFileName);

extern int File_eof_vTblID;
bool File_eof(File __i);
extern Method * method_File_eof;

extern bool (* File_flush)(File __this);

extern double (* File_getDouble)(File __this);

extern float (* File_getFloat)(File __this);

extern uint (* File_getHexValue)(File __this);

extern bool (* File_getLine)(File __this, char * s, int max);

extern int (* File_getLineEx)(File __this, char * s, int max, bool * hasNewLineChar);

extern int File_getSize_vTblID;
uint File_getSize(File __i);
extern Method * method_File_getSize;

extern bool (* File_getString)(File __this, char * string, int max);

extern int (* File_getValue)(File __this);

extern int File_getc_vTblID;
bool File_getc(File __i, char * ch);
extern Method * method_File_getc;

extern int File_lock_vTblID;
bool File_lock(File __i, FileLock type, uint64 start, uint64 length, bool wait);
extern Method * method_File_lock;

extern void (* File_print)(File __this, Class * class_object, void * object, ...);

extern void (* File_printLn)(File __this, Class * class_object, void * object, ...);

extern int (* File_printf)(File __this, const char * format, ...);

extern int File_putc_vTblID;
bool File_putc(File __i, char ch);
extern Method * method_File_putc;

extern int File_puts_vTblID;
bool File_puts(File __i, const char * string);
extern Method * method_File_puts;

extern int File_read_vTblID;
int File_read(File __i, void * buffer, uint size, uint count);
extern Method * method_File_read;

extern int File_seek_vTblID;
bool File_seek(File __i, int pos, FileSeekMode mode);
extern Method * method_File_seek;

extern int File_seek64_vTblID;
bool File_seek64(File __i, int64 pos, FileSeekMode mode);
extern Method * method_File_seek64;

extern int File_tell_vTblID;
uint File_tell(File __i);
extern Method * method_File_tell;

extern int File_truncate_vTblID;
bool File_truncate(File __i, FileSize size);
extern Method * method_File_truncate;

extern int File_unlock_vTblID;
bool File_unlock(File __i, uint64 start, uint64 length, bool wait);
extern Method * method_File_unlock;

extern int File_write_vTblID;
int File_write(File __i, const void * buffer, uint size, uint count);
extern Method * method_File_write;

extern Property * property_File_input;
extern void (* File_set_input)(File f, void * value);
extern void * (* File_get_input)(File f);

extern Property * property_File_output;
extern void (* File_set_output)(File f, void * value);
extern void * (* File_get_output)(File f);

extern Property * property_File_buffered;
extern void (* File_set_buffered)(File f, bool value);

extern Property * property_File_eof;
extern bool (* File_get_eof)(File f);

#define FILEATTRIBS_isFile_SHIFT                         0
#define FILEATTRIBS_isFile_MASK                          0x1
#define FILEATTRIBS_isArchive_SHIFT                      1
#define FILEATTRIBS_isArchive_MASK                       0x2
#define FILEATTRIBS_isHidden_SHIFT                       2
#define FILEATTRIBS_isHidden_MASK                        0x4
#define FILEATTRIBS_isReadOnly_SHIFT                     3
#define FILEATTRIBS_isReadOnly_MASK                      0x8
#define FILEATTRIBS_isSystem_SHIFT                       4
#define FILEATTRIBS_isSystem_MASK                        0x10
#define FILEATTRIBS_isTemporary_SHIFT                    5
#define FILEATTRIBS_isTemporary_MASK                     0x20
#define FILEATTRIBS_isDirectory_SHIFT                    6
#define FILEATTRIBS_isDirectory_MASK                     0x40
#define FILEATTRIBS_isDrive_SHIFT                        7
#define FILEATTRIBS_isDrive_MASK                         0x80
#define FILEATTRIBS_isCDROM_SHIFT                        8
#define FILEATTRIBS_isCDROM_MASK                         0x100
#define FILEATTRIBS_isRemote_SHIFT                       9
#define FILEATTRIBS_isRemote_MASK                        0x200
#define FILEATTRIBS_isRemovable_SHIFT                    10
#define FILEATTRIBS_isRemovable_MASK                     0x400
#define FILEATTRIBS_isServer_SHIFT                       11
#define FILEATTRIBS_isServer_MASK                        0x800
#define FILEATTRIBS_isShare_SHIFT                        12
#define FILEATTRIBS_isShare_MASK                         0x1000


#define FILECHANGE_created_SHIFT                         0
#define FILECHANGE_created_MASK                          0x1
#define FILECHANGE_renamed_SHIFT                         1
#define FILECHANGE_renamed_MASK                          0x2
#define FILECHANGE_modified_SHIFT                        2
#define FILECHANGE_modified_MASK                         0x4
#define FILECHANGE_deleted_SHIFT                         3
#define FILECHANGE_deleted_MASK                          0x8
#define FILECHANGE_attribs_SHIFT                         4
#define FILECHANGE_attribs_MASK                          0x10


struct FileListing
{
   const char * directory;
   const char * extensions;
};
extern bool (* FileListing_find)(FileListing * __this);

extern void (* FileListing_stop)(FileListing * __this);

extern Property * property_FileListing_name;
extern const char * (* FileListing_get_name)(FileListing * f);

extern Property * property_FileListing_path;
extern const char * (* FileListing_get_path)(FileListing * f);

extern Property * property_FileListing_stats;
extern void (* FileListing_get_stats)(FileListing * f, FileStats * value);

extern int FileMonitor_onDirNotify_vTblID;
bool FileMonitor_onDirNotify(FileMonitor __i, any_object * __t, FileChange action, const char * fileName, const char * param);
extern Method * method_FileMonitor_onDirNotify;

extern int FileMonitor_onFileNotify_vTblID;
bool FileMonitor_onFileNotify(FileMonitor __i, any_object * __t, FileChange action, const char * param);
extern Method * method_FileMonitor_onFileNotify;

extern void (* FileMonitor_startMonitoring)(FileMonitor __this);

extern void (* FileMonitor_stopMonitoring)(FileMonitor __this);

extern Property * property_FileMonitor_userData;
extern void (* FileMonitor_set_userData)(FileMonitor f, void * value);

extern Property * property_FileMonitor_fileChange;
extern void (* FileMonitor_set_fileChange)(FileMonitor f, FileChange value);

extern Property * property_FileMonitor_fileName;
extern void (* FileMonitor_set_fileName)(FileMonitor f, const char * value);
extern const char * (* FileMonitor_get_fileName)(FileMonitor f);

extern Property * property_FileMonitor_directoryName;
extern void (* FileMonitor_set_directoryName)(FileMonitor f, const char * value);
extern const char * (* FileMonitor_get_directoryName)(FileMonitor f);

extern bool (* GlobalAppSettings_getGlobalValue)(GlobalAppSettings __this, const char * section, const char * name, GlobalSettingType type, void * value);

extern bool (* GlobalAppSettings_putGlobalValue)(GlobalAppSettings __this, const char * section, const char * name, GlobalSettingType type, const void * value);

struct class_members_GlobalSettings
{
   GlobalSettingsData data;
   GlobalSettingsData * dataOwner;
   Class * dataClass;
};
extern void (* GlobalSettings_close)(GlobalSettings __this);

extern void (* GlobalSettings_closeAndMonitor)(GlobalSettings __this);

extern int GlobalSettings_load_vTblID;
SettingsIOResult GlobalSettings_load(GlobalSettings __i);
extern Method * method_GlobalSettings_load;

extern int GlobalSettings_onAskReloadSettings_vTblID;
void GlobalSettings_onAskReloadSettings(GlobalSettings __i);
extern Method * method_GlobalSettings_onAskReloadSettings;

extern bool (* GlobalSettings_openAndLock)(GlobalSettings __this, FileSize * fileSize);

extern int GlobalSettings_save_vTblID;
SettingsIOResult GlobalSettings_save(GlobalSettings __i);
extern Method * method_GlobalSettings_save;

extern Property * property_GlobalSettings_settingsName;
extern void (* GlobalSettings_set_settingsName)(GlobalSettings g, const char * value);
extern const char * (* GlobalSettings_get_settingsName)(GlobalSettings g);

extern Property * property_GlobalSettings_settingsExtension;
extern void (* GlobalSettings_set_settingsExtension)(GlobalSettings g, const char * value);
extern const char * (* GlobalSettings_get_settingsExtension)(GlobalSettings g);

extern Property * property_GlobalSettings_settingsDirectory;
extern void (* GlobalSettings_set_settingsDirectory)(GlobalSettings g, const char * value);
extern const char * (* GlobalSettings_get_settingsDirectory)(GlobalSettings g);

extern Property * property_GlobalSettings_settingsLocation;
extern void (* GlobalSettings_set_settingsLocation)(GlobalSettings g, const char * value);
extern const char * (* GlobalSettings_get_settingsLocation)(GlobalSettings g);

extern Property * property_GlobalSettings_settingsFilePath;
extern void (* GlobalSettings_set_settingsFilePath)(GlobalSettings g, const char * value);
extern const char * (* GlobalSettings_get_settingsFilePath)(GlobalSettings g);

extern Property * property_GlobalSettings_allowDefaultLocations;
extern void (* GlobalSettings_set_allowDefaultLocations)(GlobalSettings g, bool value);
extern bool (* GlobalSettings_get_allowDefaultLocations)(GlobalSettings g);

extern Property * property_GlobalSettings_allUsers;
extern void (* GlobalSettings_set_allUsers)(GlobalSettings g, bool value);
extern bool (* GlobalSettings_get_allUsers)(GlobalSettings g);

extern Property * property_GlobalSettings_portable;
extern void (* GlobalSettings_set_portable)(GlobalSettings g, bool value);
extern bool (* GlobalSettings_get_portable)(GlobalSettings g);

extern Property * property_GlobalSettings_driver;
extern void (* GlobalSettings_set_driver)(GlobalSettings g, constString value);
extern constString (* GlobalSettings_get_driver)(GlobalSettings g);

extern Property * property_GlobalSettings_isGlobalPath;
extern bool (* GlobalSettings_get_isGlobalPath)(GlobalSettings g);

extern int GlobalSettingsDriver_load_vTblID;
SettingsIOResult GlobalSettingsDriver_load(GlobalSettingsDriver __i, File f, GlobalSettings globalSettings);
extern Method * method_GlobalSettingsDriver_load;

extern int GlobalSettingsDriver_save_vTblID;
SettingsIOResult GlobalSettingsDriver_save(GlobalSettingsDriver __i, File f, GlobalSettings globalSettings);
extern Method * method_GlobalSettingsDriver_save;

struct class_members_JSONParser
{
   File f;
};
extern JSONResult (* JSONParser_getObject)(JSONParser __this, Class * objectType, void ** object);


extern int (* Month_getNumDays)(Month __this, int year);

#define MOVEFILEOPTIONS_overwrite_SHIFT                  0
#define MOVEFILEOPTIONS_overwrite_MASK                   0x1
#define MOVEFILEOPTIONS_sync_SHIFT                       1
#define MOVEFILEOPTIONS_sync_MASK                        0x2


#define PIPEOPENMODE_output_SHIFT                        0
#define PIPEOPENMODE_output_MASK                         0x1
#define PIPEOPENMODE_error_SHIFT                         1
#define PIPEOPENMODE_error_MASK                          0x2
#define PIPEOPENMODE_input_SHIFT                         2
#define PIPEOPENMODE_input_MASK                          0x4
#define PIPEOPENMODE_showWindow_SHIFT                    3
#define PIPEOPENMODE_showWindow_MASK                     0x8


struct Point
{
   int x;
   int y;
};
struct Pointf
{
   float x;
   float y;
};

struct class_members_RepButton
{
   bool pressing;
   Timer timer;
   Timer timer2;
};
extern Property * property_RepButton_delay;
extern void (* RepButton_set_delay)(RepButton r, Time value);

extern Property * property_RepButton_delay0;
extern void (* RepButton_set_delay0)(RepButton r, Time value);

extern Property * property_SecSince1970_global;
extern SecSince1970 (* SecSince1970_get_global)(int64 s);

extern Property * property_SecSince1970_local;
extern SecSince1970 (* SecSince1970_get_local)(int64 s);


extern void (* Semaphore_release)(Semaphore * __this);

extern bool (* Semaphore_tryWait)(Semaphore * __this);

extern void (* Semaphore_wait)(Semaphore * __this);

extern Property * property_Semaphore_initCount;
extern void (* Semaphore_set_initCount)(Semaphore * s, int value);
extern int (* Semaphore_get_initCount)(Semaphore * s);

extern Property * property_Semaphore_maxCount;
extern void (* Semaphore_set_maxCount)(Semaphore * s, int value);
extern int (* Semaphore_get_maxCount)(Semaphore * s);

extern Property * property_TempFile_openMode;
extern void (* TempFile_set_openMode)(TempFile t, FileOpenMode value);
extern FileOpenMode (* TempFile_get_openMode)(TempFile t);

extern Property * property_TempFile_buffer;
extern byte * (* TempFile_get_buffer)(TempFile t);

extern void (* Thread_create)(Thread __this);

extern void (* Thread_kill)(Thread __this);

extern int Thread_main_vTblID;
uint Thread_main(Thread __i);
extern Method * method_Thread_main;

extern void (* Thread_setPriority)(Thread __this, ThreadPriority priority);

extern void (* Thread_wait)(Thread __this);

extern Property * property_Thread_created;
extern bool (* Thread_get_created)(Thread t);


extern Archive (* archiveOpen)(const char * fileName, ArchiveOpenFlags flags);
extern bool (* archiveQuerySize)(const char * fileName, FileSize * size);
extern bool (* changeWorkingDir)(const char * buf);
extern bool (* charMatchCategories)(unichar ch, CharCategories categories);
extern void (* copyBytes)(void * dest, const void * source, uint count);
extern void (* copyBytesBy2)(void * dest, const void * source, uint count);
extern void (* copyBytesBy4)(void * dest, const void * source, uint count);
extern char * (* copySystemPath)(const char * p);
extern char * (* copyUnixPath)(const char * p);
extern void (* createTemporaryDir)(char * tempFileName, const char * _template);
extern File (* createTemporaryFile)(char * tempFileName, const char * _template);
extern bool (* deleteFile)(const char * fileName);
extern DualPipe (* dualPipeOpen)(PipeOpenMode mode, const char * commandLine);
extern DualPipe (* dualPipeOpenEnv)(PipeOpenMode mode, const char * env, const char * commandLine);
extern DualPipe (* dualPipeOpenEnvf)(PipeOpenMode mode, const char * env, const char * command, ...);
extern DualPipe (* dualPipeOpenf)(PipeOpenMode mode, const char * command, ...);
extern void (* dumpErrors)(bool display);
extern bool (* execute)(const char * command, ...);
extern bool (* executeEnv)(const char * env, const char * command, ...);
extern bool (* executeWait)(const char * command, ...);
extern FileAttribs (* fileExists)(const char * fileName);
extern void (* fileFixCase)(char * file);
extern bool (* fileGetSize)(const char * fileName, FileSize * size);
extern bool (* fileGetStats)(const char * fileName, FileStats * stats);
extern File (* fileOpen)(const char * fileName, FileOpenMode mode);
extern BufferedFile (* fileOpenBuffered)(const char * fileName, FileOpenMode mode);
extern bool (* fileSetAttribs)(const char * fileName, FileAttribs attribs);
extern bool (* fileSetTime)(const char * fileName, SecSince1970 created, SecSince1970 accessed, SecSince1970 modified);
extern bool (* fileTruncate)(const char * fileName, FileSize size);
extern void (* fillBytes)(void * area, byte value, uint count);
extern void (* fillBytesBy2)(void * area, uint16 value, uint count);
extern void (* fillBytesBy4)(void * area, uint value, uint count);
extern bool (* getAlNum)(const char ** input, char * string, int max);
extern CharCategory (* getCharCategory)(unichar ch);
extern char * (* getEnvironment)(const char * envName, char * envValue, int max);
extern void (* getFreeSpace)(const char * path, FileSize64 * size);
extern uint (* getLastErrorCode)(void);
extern int (* getRandom)(int lo, int hi);
extern char * (* getSlashPathBuffer)(char * d, const char * p);
extern char * (* getSystemPathBuffer)(char * d, const char * p);
extern Time (* getTime)(void);
extern char * (* getWorkingDir)(char * buf, int size);
extern void (* __log)(const char * text);
extern void (* logErrorCode)(ErrorCode errorCode, const char * details);
extern void (* __logf)(const char * format, ...);
extern bool (* makeDir)(const char * path);
extern void (* makeSlashPath)(char * p);
extern void (* makeSystemPath)(char * p);
extern void (* moveBytes)(void * dest, const void * source, uint count);
extern bool (* moveFile)(const char * source, const char * dest);
extern bool (* moveFileEx)(const char * source, const char * dest, MoveFileOptions options);
extern void (* randomSeed)(uint seed);
extern bool (* removeDir)(const char * path);
extern bool (* renameFile)(const char * oldName, const char * newName);
extern void (* resetError)(void);
extern void (* setEnvironment)(const char * envName, const char * envValue);
extern void (* setErrorLevel)(ErrorLevel level);
extern void (* setLoggingMode)(LoggingMode mode, void * where);
extern bool (* shellOpen)(const char * fileName, ...);
extern void (* __sleep)(Time seconds);
extern int (* uTF16BEtoUTF8Buffer)(const uint16 * source, byte * dest, int max);
extern int (* uTF8toISO8859_1)(const char * source, char * dest, int max);
extern int (* uTF8toUTF16BufferLen)(const char * source, uint16 * dest, int max, int len);
extern uint16 * (* uTF8toUTF16Len)(const char * source, int byteCount, int * wordCount);
extern void (* unsetEnvironment)(const char * envName);
extern bool (* writeColorAlpha)(File f, Class * type, DataValue * value, int indent, bool eCON);
extern bool (* writeECONObject)(File f, Class * objectType, void * object, int indent);
extern bool (* writeJSONObject)(File f, Class * objectType, void * object, int indent);
struct Vector3Df
{
   float x;
   float y;
   float z;
};
typedef struct Vector3Df Vector3Df;
struct Vector3D
{
   double x;
   double y;
   double z;
};
typedef struct Vector3D Vector3D;
struct Quaternion
{
   double w;
   double x;
   double y;
   double z;
};
typedef struct Quaternion Quaternion;
struct Transform
{
   Vector3D position;
   Quaternion orientation;
   Vector3Df scaling;
};
typedef struct Transform Transform;
typedef struct PrimitiveSingle PrimitiveSingle;
typedef uint32 PrimitiveGroupType;
typedef struct PrimitiveGroup PrimitiveGroup;
typedef uint32 MaterialFlags;
typedef struct Material Material;
struct class_members_Shader
{
   byte __ecerePrivateData0[24];
   uint64 state;
   bool uniformsModified;
};
typedef Instance Shader;
typedef Instance Bitmap;
typedef Bitmap CubeMap;
struct ColorRGB
{
   float r;
   float g;
   float b;
};
typedef struct ColorRGB ColorRGB;
typedef int PixelFormat;
enum
{
   PixelFormat_pixelFormat4 = 0x0,
   PixelFormat_pixelFormat8 = 0x1,
   PixelFormat_pixelFormat444 = 0x2,
   PixelFormat_pixelFormat555 = 0x3,
   PixelFormat_pixelFormat565 = 0x4,
   PixelFormat_pixelFormat888 = 0x5,
   PixelFormat_pixelFormatAlpha = 0x6,
   PixelFormat_pixelFormatText = 0x7,
   PixelFormat_pixelFormatRGBA = 0x8
};

typedef Instance DisplaySystem;
typedef uint32 DisplayFlags;
struct class_members_DisplaySystem
{
   byte __ecerePrivateData0[24];
   PixelFormat pixelFormat;
   DisplayFlags flags;
};
typedef uint32 ColorAlpha;
struct class_members_Bitmap
{
   int width;
   int height;
   PixelFormat pixelFormat;
   byte * picture;
   uint stride;
   uint size;
   uint sizeBytes;
   ColorAlpha * palette;
   bool allocatePalette;
   bool transparent;
   int shadeShift;
   byte * paletteShades;
   bool alphaBlend;
   DisplaySystem displaySystem;
   Class * driver;
   void * driverData;
   bool keepData;
   bool mipMaps;
};
struct Material
{
   Material * prev;
   Material * next;
   char * name;
   float opacity;
   ColorRGB diffuse;
   ColorRGB ambient;
   ColorRGB specular;
   ColorRGB emissive;
   float power;
   Bitmap baseMap;
   Bitmap bumpMap;
   Bitmap specularMap;
   Bitmap reflectMap;
   CubeMap envMap;
   float reflectivity;
   float refractiveIndex;
   float refractiveIndexContainer;
   MaterialFlags flags;
   float uScale;
   float vScale;
   Shader shader;
};
struct PrimitiveGroup
{
   PrimitiveGroup * prev;
   PrimitiveGroup * next;
   PrimitiveGroupType type;
   union
   {
      struct
      {
         union
         {
            uint16 * indices;
            uint * indices32;
         };
         int nIndices;
      };
      struct
      {
         int first;
         int nVertices;
      };
   };
   Material * material;
};
typedef struct Plane Plane;
typedef uint32 ObjectFlags;
struct Object
{
   byte __ecerePrivateData0[128];
   Transform transform;
};
typedef struct Object Object;
typedef uint32 MeshFeatures;
typedef struct Mesh Mesh;
struct Matrix
{
   union
   {
      double array[16];
      double m[4][4];
   };
};
typedef struct Matrix Matrix;
typedef struct Line Line;
typedef int FovDirection;
enum
{
   FovDirection_widest = 0x0,
   FovDirection_horizontal = 0x1,
   FovDirection_vertical = 0x2
};

struct Euler
{
   Angle yaw;
   Angle pitch;
   Angle roll;
};
typedef struct Euler Euler;
typedef int CameraType;
enum
{
   CameraType_fixed = 0x0,
   CameraType_fixedQuaternion = 0x1,
   CameraType_attached = 0x2,
   CameraType_attachedQuaternion = 0x3,
   CameraType_lookAt = 0x4,
   CameraType_lookAtObject = 0x5
};

struct class_members_Camera
{
   byte __ecerePrivateData0[24];
   Vector3D position;
};
typedef Instance Camera;
typedef uint32 LightFlags;
struct Light
{
   LightFlags flags;
   ColorRGB ambient;
   ColorRGB diffuse;
   ColorRGB specular;
   Vector3D direction;
   Quaternion orientation;
   Object * lightObject;
   Object * target;
   Angle fallOff;
   Angle hotSpot;
   float Kc;
   float Kl;
   float Kq;
   Angle start;
   Angle end;
   float multiplier;
};
typedef struct Light Light;
typedef struct ColorRGBAf ColorRGBAf;
typedef int ClippingPlane;
enum
{
   ClippingPlane_left = 0x0,
   ClippingPlane_right = 0x1,
   ClippingPlane_top = 0x2,
   ClippingPlane_bottom = 0x3,
   ClippingPlane_near = 0x4,
   ClippingPlane_far = 0x5
};

typedef struct FrameKey FrameKey;
typedef struct FrameTrack FrameTrack;
typedef uint32 FrameTrackBits;
typedef uint16 FrameTrackType;
enum
{
   FrameTrackType_position = 0x1,
   FrameTrackType_rotation = 0x2,
   FrameTrackType_scaling = 0x3,
   FrameTrackType_fov = 0x4,
   FrameTrackType_roll = 0x5,
   FrameTrackType_colorChange = 0x6,
   FrameTrackType_morph = 0x7,
   FrameTrackType_hotSpot = 0x8,
   FrameTrackType_fallOff = 0x9,
   FrameTrackType_hide = 0xA
};

typedef int FrustumPlacement;
enum
{
   FrustumPlacement_outside = 0x0,
   FrustumPlacement_inside = 0x1,
   FrustumPlacement_intersecting = 0x2
};

typedef Instance ObjectFormat;
typedef PrimitiveGroupType RenderPrimitiveType;
enum
{
   RenderPrimitiveType_dot = 0x0,
   RenderPrimitiveType_lines = 0x1,
   RenderPrimitiveType_triangles = 0x2,
   RenderPrimitiveType_triStrip = 0x3,
   RenderPrimitiveType_triFan = 0x4,
   RenderPrimitiveType_quads = 0x5,
   RenderPrimitiveType_quadStrip = 0x6,
   RenderPrimitiveType_lineStrip = 0x7
};

extern void (* Camera_adjustAngle)(Camera __this, Quaternion * angle);

extern void (* Camera_adjustPosition)(Camera __this, Vector3D * position);

extern void (* Camera_move)(Camera __this, Vector3D * direction);

extern bool (* Camera_pointsVisible)(Camera __this, Vector3D * points, int numPoints, double threshold);

extern bool (* Camera_project)(Camera __this, Vector3D * vector, Vector3D * point);

extern bool (* Camera_projectSize)(Camera __this, Vector3D * vector, Point * point);

extern void (* Camera_rotatePitch)(Camera __this, Angle amount, Angle min, Angle max);

extern void (* Camera_rotateRoll)(Camera __this, Angle amount, Angle min, Angle max);

extern void (* Camera_rotateYaw)(Camera __this, Angle amount, Angle min, Angle max);

extern void (* Camera_setup)(Camera __this, int width, int height, Point * origin);

extern void (* Camera_slerp)(Camera __this, float amount);

extern bool (* Camera_sphereVisible)(Camera __this, Vector3D * center, float radius);

extern void (* Camera_transformMatrix)(Camera __this, Matrix * dest, Matrix * src);

extern void (* Camera_transformNormal)(Camera __this, Vector3D * dest, Vector3D * src);

extern void (* Camera_transformPoint)(Camera __this, Vector3D * dest, Vector3D * src);

extern void (* Camera_unproject)(Camera __this, Vector3D * point, Vector3D * vector);

extern void (* Camera_untransform)(Camera __this, Vector3D * src, Vector3D * result);

extern bool (* Camera_update)(Camera __this);

extern void (* Camera_setCPosition)(Camera __this, Vector3D * value);

extern void (* Camera_setViewMatrix)(Camera __this, Matrix * value);

extern Property * property_Camera_type;
extern void (* Camera_set_type)(Camera c, CameraType value);
extern CameraType (* Camera_get_type)(Camera c);

extern Property * property_Camera_position;
extern void (* Camera_set_position)(Camera c, const Vector3D * value);
extern void (* Camera_get_position)(Camera c, Vector3D * value);

extern Property * property_Camera_orientation;
extern void (* Camera_set_orientation)(Camera c, const Quaternion * value);
extern void (* Camera_get_orientation)(Camera c, Quaternion * value);

extern Property * property_Camera_eulerOrientation;
extern void (* Camera_set_eulerOrientation)(Camera c, const Euler * value);
extern void (* Camera_get_eulerOrientation)(Camera c, Euler * value);

extern Property * property_Camera_cPosition;
extern void (* Camera_get_cPosition)(Camera c, Vector3D * value);

extern Property * property_Camera_cOrientation;
extern void (* Camera_get_cOrientation)(Camera c, Quaternion * value);

extern Property * property_Camera_fov;
extern void (* Camera_set_fov)(Camera c, Angle value);
extern Angle (* Camera_get_fov)(Camera c);

extern Property * property_Camera_zMin;
extern void (* Camera_set_zMin)(Camera c, float value);
extern float (* Camera_get_zMin)(Camera c);

extern Property * property_Camera_zMax;
extern void (* Camera_set_zMax)(Camera c, float value);
extern float (* Camera_get_zMax)(Camera c);

extern Property * property_Camera_target;
extern void (* Camera_set_target)(Camera c, Object * value);
extern Object * (* Camera_get_target)(Camera c);

extern Property * property_Camera_fovDirection;
extern void (* Camera_set_fovDirection)(Camera c, FovDirection value);
extern FovDirection (* Camera_get_fovDirection)(Camera c);

extern Property * property_Camera_aspectRatio;
extern void (* Camera_set_aspectRatio)(Camera c, float value);
extern float (* Camera_get_aspectRatio)(Camera c);

extern Property * property_Camera_focal;
extern void (* Camera_get_focal)(Camera c, Size * value);

extern void (* Euler_add)(Euler * __this, Euler * e1, Euler * e2);

extern Property * property_Euler_Quaternion;
extern void (* Euler_from_Quaternion)(Euler * e, const Quaternion * value);
extern void (* Euler_to_Quaternion)(Euler * e, Quaternion * value);

struct FrameKey
{
   uint frame;
   float tension;
   float continuity;
   float bias;
   float easeFrom;
   float easeTo;
   union
   {
      Vector3Df position;
      Quaternion orientation;
      Vector3Df scaling;
      float roll;
      float fov;
      ColorRGB color;
      float hotSpot;
      float fallOff;
   };
};
#define FRAMETRACKBITS_type_SHIFT                        0
#define FRAMETRACKBITS_type_MASK                         0xFFFF
#define FRAMETRACKBITS_loop_SHIFT                        16
#define FRAMETRACKBITS_loop_MASK                         0x10000


struct Line
{
   Vector3D p0;
   Vector3D delta;
};
extern bool (* Line_intersectSphere)(Line * __this, double radius, double * t);

extern void (* Material_free)(Material * __this);

#define MATERIALFLAGS_doubleSided_SHIFT                  0
#define MATERIALFLAGS_doubleSided_MASK                   0x1
#define MATERIALFLAGS_translucent_SHIFT                  1
#define MATERIALFLAGS_translucent_MASK                   0x2
#define MATERIALFLAGS_tile_SHIFT                         2
#define MATERIALFLAGS_tile_MASK                          0x4
#define MATERIALFLAGS_noFog_SHIFT                        3
#define MATERIALFLAGS_noFog_MASK                         0x8
#define MATERIALFLAGS_singleSideLight_SHIFT              4
#define MATERIALFLAGS_singleSideLight_MASK               0x10
#define MATERIALFLAGS_separateSpecular_SHIFT             5
#define MATERIALFLAGS_separateSpecular_MASK              0x20
#define MATERIALFLAGS_cubeMap_SHIFT                      6
#define MATERIALFLAGS_cubeMap_MASK                       0x40
#define MATERIALFLAGS_noLighting_SHIFT                   7
#define MATERIALFLAGS_noLighting_MASK                    0x80


extern double (* Matrix_determinant)(Matrix * __this);

extern void (* Matrix_identity)(Matrix * __this);

extern void (* Matrix_inverse)(Matrix * __this, Matrix * source);

extern void (* Matrix_multiply)(Matrix * __this, Matrix * a, Matrix * b);

extern void (* Matrix_rotate)(Matrix * __this, Quaternion * quat);

extern void (* Matrix_rotationQuaternion)(Matrix * __this, Quaternion * quat);

extern void (* Matrix_scale)(Matrix * __this, double sx, double sy, double sz);

extern void (* Matrix_toEuler)(Matrix * __this, Euler * euler);

extern void (* Matrix_translate)(Matrix * __this, double tx, double ty, double tz);

extern void (* Matrix_transpose)(Matrix * __this, Matrix * source);

extern Property * property_Matrix_Quaternion;
extern void (* Matrix_from_Quaternion)(Matrix * m, const Quaternion * value);
extern void (* Matrix_to_Quaternion)(Matrix * m, Quaternion * value);

extern PrimitiveGroup * (* Mesh_addPrimitiveGroup)(Mesh * __this, PrimitiveGroupType flags, int nIndices);

extern bool (* Mesh_allocate)(Mesh * __this, MeshFeatures what, int nVertices, DisplaySystem displaySystem);

extern bool (* Mesh_allocatePrimitive)(Mesh * __this, PrimitiveSingle * primitive, PrimitiveGroupType flags, int nIndices);

extern void (* Mesh_applyMaterial)(Mesh * __this, Material * material);

extern bool (* Mesh_applyTranslucency)(Mesh * __this, Object * object);

extern void (* Mesh_computeNormals)(Mesh * __this);

extern void (* Mesh_free)(Mesh * __this, MeshFeatures what);

extern void (* Mesh_freePrimitive)(Mesh * __this, PrimitiveSingle * primitive);

extern void (* Mesh_freePrimitiveGroup)(Mesh * __this, PrimitiveGroup * group);

extern void * (* Mesh_getData)(Mesh * __this);

extern bool (* Mesh_lock)(Mesh * __this, MeshFeatures flags);

extern bool (* Mesh_lockPrimitive)(Mesh * __this, PrimitiveSingle * primitive);

extern bool (* Mesh_lockPrimitiveGroup)(Mesh * __this, PrimitiveGroup * group);

extern void (* Mesh_setData)(Mesh * __this, void * value);

extern void (* Mesh_unlock)(Mesh * __this, MeshFeatures flags);

extern void (* Mesh_unlockPrimitive)(Mesh * __this, PrimitiveSingle * primitive);

extern void (* Mesh_unlockPrimitiveGroup)(Mesh * __this, PrimitiveGroup * group);

extern Property * property_Mesh_texCoords;
extern void (* Mesh_set_texCoords)(Mesh * m, Pointf * value);
extern Pointf * (* Mesh_get_texCoords)(Mesh * m);

extern Property * property_Mesh_nVertices;
extern void (* Mesh_set_nVertices)(Mesh * m, int value);
extern int (* Mesh_get_nVertices)(Mesh * m);

extern Property * property_Mesh_vertices;
extern void (* Mesh_set_vertices)(Mesh * m, Vector3Df * value);
extern Vector3Df * (* Mesh_get_vertices)(Mesh * m);

extern Property * property_Mesh_normals;
extern void (* Mesh_set_normals)(Mesh * m, Vector3Df * value);
extern Vector3Df * (* Mesh_get_normals)(Mesh * m);

extern Property * property_Mesh_tangents;
extern void (* Mesh_set_tangents)(Mesh * m, Vector3Df * value);
extern Vector3Df * (* Mesh_get_tangents)(Mesh * m);

extern Property * property_Mesh_colors;
extern void (* Mesh_set_colors)(Mesh * m, ColorRGBAf * value);
extern ColorRGBAf * (* Mesh_get_colors)(Mesh * m);

extern Property * property_Mesh_lightVectors;
extern void (* Mesh_set_lightVectors)(Mesh * m, ColorRGB * value);
extern ColorRGB * (* Mesh_get_lightVectors)(Mesh * m);

extern Property * property_Mesh_groups;
extern void (* Mesh_get_groups)(Mesh * m, OldList * value);

extern Property * property_Mesh_flags;
extern void (* Mesh_set_flags)(Mesh * m, MeshFeatures value);
extern MeshFeatures (* Mesh_get_flags)(Mesh * m);

#define MESHFEATURES_vertices_SHIFT                      0
#define MESHFEATURES_vertices_MASK                       0x1
#define MESHFEATURES_normals_SHIFT                       1
#define MESHFEATURES_normals_MASK                        0x2
#define MESHFEATURES_texCoords1_SHIFT                    2
#define MESHFEATURES_texCoords1_MASK                     0x4
#define MESHFEATURES_texCoords2_SHIFT                    3
#define MESHFEATURES_texCoords2_MASK                     0x8
#define MESHFEATURES_doubleNormals_SHIFT                 4
#define MESHFEATURES_doubleNormals_MASK                  0x10
#define MESHFEATURES_doubleVertices_SHIFT                5
#define MESHFEATURES_doubleVertices_MASK                 0x20
#define MESHFEATURES_colors_SHIFT                        6
#define MESHFEATURES_colors_MASK                         0x40
#define MESHFEATURES_lightVectors_SHIFT                  7
#define MESHFEATURES_lightVectors_MASK                   0x80
#define MESHFEATURES_tangents_SHIFT                      8
#define MESHFEATURES_tangents_MASK                       0x100
#define MESHFEATURES_intVertices_SHIFT                   9
#define MESHFEATURES_intVertices_MASK                    0x200


extern void (* Object_add)(Object * __this, Object * object);

extern bool (* Object_addName)(Object * __this, Object * object, const char * name);

extern void (* Object_animate)(Object * __this, uint frame);

extern void (* Object_doubleSided)(Object * __this, bool flag);

extern void (* Object_duplicate)(Object * __this, Object * model);

extern Object * (* Object_find)(Object * __this, const char * name);

extern void (* Object_free)(Object * __this, DisplaySystem displaySystem);

extern void (* Object_freeMesh)(Object * __this, DisplaySystem displaySystem);

extern void (* Object_initialize)(Object * __this);

extern Mesh * (* Object_initializeMesh)(Object * __this, DisplaySystem displaySystem);

extern bool (* Object_intersectsGroundPolygon)(Object * __this, int count, Pointf * pointfs);

extern bool (* Object_load)(Object * __this, const char * fileName, const char * type, DisplaySystem displaySystem);

extern bool (* Object_merge)(Object * __this, DisplaySystem displaySystem);

extern void (* Object_move)(Object * __this, Vector3D * direction);

extern void (* Object_rotateEuler)(Object * __this, Euler * rotation, Euler * min, Euler * max);

extern void (* Object_setMinMaxRadius)(Object * __this, bool processMesh);

extern void (* Object_updateTransform)(Object * __this);

extern Property * property_Object_transform;
extern void (* Object_set_transform)(Object * o, const Transform * value);
extern void (* Object_get_transform)(Object * o, Transform * value);

extern Property * property_Object_material;
extern void (* Object_set_material)(Object * o, Material * value);
extern Material * (* Object_get_material)(Object * o);

extern Property * property_Object_max;
extern void (* Object_get_max)(Object * o, Vector3Df * value);

extern Property * property_Object_min;
extern void (* Object_get_min)(Object * o, Vector3Df * value);

extern Property * property_Object_center;
extern void (* Object_get_center)(Object * o, Vector3Df * value);

extern Property * property_Object_radius;
extern float (* Object_get_radius)(Object * o);

extern Property * property_Object_wmax;
extern void (* Object_get_wmax)(Object * o, Vector3D * value);

extern Property * property_Object_wmin;
extern void (* Object_get_wmin)(Object * o, Vector3D * value);

extern Property * property_Object_wcenter;
extern void (* Object_get_wcenter)(Object * o, Vector3D * value);

extern Property * property_Object_wradius;
extern double (* Object_get_wradius)(Object * o);

extern Property * property_Object_tag;
extern void (* Object_set_tag)(Object * o, void * value);
extern void * (* Object_get_tag)(Object * o);

extern Property * property_Object_frame;
extern void (* Object_set_frame)(Object * o, int value);
extern int (* Object_get_frame)(Object * o);

extern Property * property_Object_startFrame;
extern void (* Object_set_startFrame)(Object * o, int value);
extern int (* Object_get_startFrame)(Object * o);

extern Property * property_Object_endFrame;
extern void (* Object_set_endFrame)(Object * o, int value);
extern int (* Object_get_endFrame)(Object * o);

extern Property * property_Object_mesh;
extern void (* Object_set_mesh)(Object * o, Mesh * value);
extern Mesh * (* Object_get_mesh)(Object * o);

extern Property * property_Object_camera;
extern Camera (* Object_get_camera)(Object * o);

extern Property * property_Object_firstChild;
extern Object * (* Object_get_firstChild)(Object * o);

extern Property * property_Object_next;
extern Object * (* Object_get_next)(Object * o);

extern Property * property_Object_name;
extern const char * (* Object_get_name)(Object * o);

extern Property * property_Object_matrix;
extern void (* Object_get_matrix)(Object * o, Matrix * value);

extern Property * property_Object_cameraTarget;
extern void (* Object_set_cameraTarget)(Object * o, Object * value);
extern Object * (* Object_get_cameraTarget)(Object * o);

extern Property * property_Object_tracks;
extern OldList * (* Object_get_tracks)(Object * o);

extern Property * property_Object_flags;
extern void (* Object_set_flags)(Object * o, ObjectFlags value);
extern ObjectFlags (* Object_get_flags)(Object * o);

extern Property * property_Object_parent;
extern Object * (* Object_get_parent)(Object * o);

extern Property * property_Object_numChildren;
extern uint (* Object_get_numChildren)(Object * o);

extern Property * property_Object_localMatrixPtr;
extern Matrix * (* Object_get_localMatrixPtr)(Object * o);

extern Property * property_Object_matrixPtr;
extern Matrix * (* Object_get_matrixPtr)(Object * o);

extern Property * property_Object_light;
extern void (* Object_set_light)(Object * o, const Light * value);
extern void (* Object_get_light)(Object * o, Light * value);

#define OBJECTFLAGS_root_SHIFT                           0
#define OBJECTFLAGS_root_MASK                            0x1
#define OBJECTFLAGS_viewSpace_SHIFT                      1
#define OBJECTFLAGS_viewSpace_MASK                       0x2
#define OBJECTFLAGS_ownMesh_SHIFT                        2
#define OBJECTFLAGS_ownMesh_MASK                         0x4
#define OBJECTFLAGS_translucent_SHIFT                    3
#define OBJECTFLAGS_translucent_MASK                     0x8
#define OBJECTFLAGS_flipWindings_SHIFT                   4
#define OBJECTFLAGS_flipWindings_MASK                    0x10
#define OBJECTFLAGS_keysLoaded_SHIFT                     5
#define OBJECTFLAGS_keysLoaded_MASK                      0x20
#define OBJECTFLAGS_transform_SHIFT                      6
#define OBJECTFLAGS_transform_MASK                       0x40
#define OBJECTFLAGS_mesh_SHIFT                           7
#define OBJECTFLAGS_mesh_MASK                            0x80
#define OBJECTFLAGS_light_SHIFT                          8
#define OBJECTFLAGS_light_MASK                           0x100
#define OBJECTFLAGS_camera_SHIFT                         9
#define OBJECTFLAGS_camera_MASK                          0x200
#define OBJECTFLAGS_localMatrixSet_SHIFT                 10
#define OBJECTFLAGS_localMatrixSet_MASK                  0x400
#define OBJECTFLAGS_computeLightVectors_SHIFT            11
#define OBJECTFLAGS_computeLightVectors_MASK             0x800
#define OBJECTFLAGS_hierarchy_SHIFT                      16
#define OBJECTFLAGS_hierarchy_MASK                       0xFFFF0000


struct Plane
{
   union
   {
      struct
      {
         double a;
         double b;
         double c;
      };
      Vector3D normal;
   };
   double d;
};
extern void (* Plane_fromPointNormal)(Plane * __this, Vector3D * normal, Vector3D * point);

extern void (* Plane_fromPoints)(Plane * __this, Vector3D * v1, Vector3D * v2, Vector3D * v3);

extern void (* Plane_fromPointsf)(Plane * __this, Vector3Df * v1, Vector3Df * v2, Vector3Df * v3);

extern void (* Plane_intersectLine)(Plane * __this, Line * line, Vector3D * result);

extern void (* Plane_intersectLinef)(Plane * __this, Line * line, Vector3Df * result);

extern void (* Plane_multMatrix)(Plane * __this, Plane * source, Matrix * inverseTranspose);

#define PRIMITIVEGROUPTYPE_primitiveType_SHIFT           0
#define PRIMITIVEGROUPTYPE_primitiveType_MASK            0xFF
#define PRIMITIVEGROUPTYPE_vertexRange_SHIFT             8
#define PRIMITIVEGROUPTYPE_vertexRange_MASK              0x100
#define PRIMITIVEGROUPTYPE_indices32bit_SHIFT            9
#define PRIMITIVEGROUPTYPE_indices32bit_MASK             0x200


struct PrimitiveSingle
{
   PrimitiveGroupType type;
   union
   {
      struct
      {
         union
         {
            uint16 * indices;
            uint * indices32;
         };
         int nIndices;
      };
      struct
      {
         int first;
         int nVertices;
      };
   };
   Material * material;
};
extern void (* Quaternion_divide)(Quaternion * __this, Quaternion * q1, Quaternion * q2);

extern void (* Quaternion_identity)(Quaternion * __this);

extern void (* Quaternion_inverse)(Quaternion * __this, Quaternion * source);

extern void (* Quaternion_multiply)(Quaternion * __this, Quaternion * q1, Quaternion * q2);

extern void (* Quaternion_normalize)(Quaternion * __this, Quaternion * source);

extern void (* Quaternion_pitch)(Quaternion * __this, Angle angle);

extern void (* Quaternion_roll)(Quaternion * __this, Angle angle);

extern void (* Quaternion_rotatePitch)(Quaternion * __this, Angle pitch);

extern void (* Quaternion_rotateRoll)(Quaternion * __this, Angle roll);

extern void (* Quaternion_rotateYaw)(Quaternion * __this, Angle yaw);

extern void (* Quaternion_rotateYawPitch)(Quaternion * __this, Angle yaw, Angle pitch);

extern void (* Quaternion_rotationAxis)(Quaternion * __this, Vector3D * axis, Angle angle);

extern void (* Quaternion_rotationDirection)(Quaternion * __this, Vector3D * direction);

extern void (* Quaternion_rotationMatrix)(Quaternion * __this, Matrix * m);

extern void (* Quaternion_rotationYawPitchRoll)(Quaternion * __this, Euler * euler);

extern void (* Quaternion_slerp)(Quaternion * __this, Quaternion * from, Quaternion * to, float t);

extern void (* Quaternion_toDirection)(Quaternion * __this, Vector3D * direction);

extern void (* Quaternion_yaw)(Quaternion * __this, Angle angle);

extern void (* Quaternion_yawPitch)(Quaternion * __this, Angle yaw, Angle pitch);

extern void (* Vector3D_add)(Vector3D * __this, Vector3D * vector1, Vector3D * vector2);

extern void (* Vector3D_crossProduct)(Vector3D * __this, Vector3D * vector1, Vector3D * vector2);

extern void (* Vector3D_divideMatrix)(Vector3D * __this, Vector3D * source, Matrix * matrix);

extern double (* Vector3D_dotProduct)(Vector3D * __this, Vector3D * vector2);

extern double (* Vector3D_dotProductf)(Vector3D * __this, Vector3Df * vector2);

extern void (* Vector3D_multMatrix)(Vector3D * __this, Vector3D * source, Matrix * matrix);

extern void (* Vector3D_multMatrixf)(Vector3D * __this, Vector3Df * source, Matrix * matrix);

extern void (* Vector3D_normalize)(Vector3D * __this, Vector3D * source);

extern void (* Vector3D_scale)(Vector3D * __this, Vector3D * vector1, double s);

extern void (* Vector3D_subtract)(Vector3D * __this, Vector3D * vector1, Vector3D * vector2);

extern Property * property_Vector3D_length;
extern double (* Vector3D_get_length)(Vector3D * v);

extern Property * property_Vector3D_lengthApprox;
extern double (* Vector3D_get_lengthApprox)(Vector3D * v);

extern void (* Vector3Df_add)(Vector3Df * __this, Vector3Df * vector1, Vector3Df * vector2);

extern void (* Vector3Df_crossProduct)(Vector3Df * __this, Vector3Df * vector1, Vector3Df * vector2);

extern void (* Vector3Df_divideMatrix)(Vector3Df * __this, Vector3Df * source, Matrix * matrix);

extern double (* Vector3Df_dotProduct)(Vector3Df * __this, Vector3Df * vector2);

extern void (* Vector3Df_multMatrix)(Vector3Df * __this, Vector3Df * source, Matrix * matrix);

extern void (* Vector3Df_normalize)(Vector3Df * __this, Vector3Df * source);

extern void (* Vector3Df_scale)(Vector3Df * __this, Vector3Df * vector1, float s);

extern void (* Vector3Df_subtract)(Vector3Df * __this, Vector3Df * vector1, Vector3Df * vector2);

extern Property * property_Vector3Df_length;
extern float (* Vector3Df_get_length)(Vector3Df * v);

extern Property * property_Vector3Df_lengthApprox;
extern float (* Vector3Df_get_lengthApprox)(Vector3Df * v);

extern float (* fastInvSqrt)(float x);
extern double (* fastInvSqrtDouble)(double x);
typedef struct OldList Extent;
typedef Instance Resource;
typedef int RenderState;
enum
{
   RenderState_fillMode = 0x1,
   RenderState_depthTest = 0x2,
   RenderState_depthWrite = 0x3,
   RenderState_fogDensity = 0x4,
   RenderState_fogColor = 0x5,
   RenderState_blend = 0x6,
   RenderState_ambient = 0x7,
   RenderState_alphaWrite = 0x8,
   RenderState_antiAlias = 0x9,
   RenderState_vSync = 0xA
};

typedef struct HitRecord HitRecord;
struct HitRecord
{
   HitRecord * prev;
   HitRecord * next;
   uint pos;
   uint numTags;
   Vector3D center;
   void * tags[1];
};
typedef int GradientDirection;
enum
{
   GradientDirection_vertical = 0x0,
   GradientDirection_horizontal = 0x1
};

typedef uint32 GLCapabilities;
typedef Resource FontResource;
typedef Instance FontManagerRenderer;
typedef FontManagerRenderer FontRenderer;
typedef Instance FontManager;
struct class_members_FontManagerRenderer
{
   FontManager fm;
};
typedef uint32 FontFlags;
typedef struct Font Font;
typedef int FillModeValue;
enum
{
   FillModeValue_solid = 0x0,
   FillModeValue_wireframe = 0x1
};

typedef struct FMPathDraw FMPathDraw;
struct FMFont
{
   LinkElement link;
};
typedef struct FMFont FMFont;
typedef Instance DrawManager;
typedef struct DisplaySystemResPtr DisplaySystemResPtr;
typedef Instance DisplayDriver;
struct class_members_Display
{
   int width;
   int height;
   void * driverData;
};
typedef Instance Display;
typedef struct ColorKey ColorKey;
typedef uint32 Color;
typedef int ClearType;
enum
{
   ClearType_colorBuffer = 0x0,
   ClearType_depthBuffer = 0x1,
   ClearType_colorAndDepth = 0x2
};

typedef int AlphaWriteMode;
enum
{
   AlphaWriteMode_dontWrite = 0x0,
   AlphaWriteMode_write = 0x1,
   AlphaWriteMode_blend = 0x2
};

#define NumberOfLights 8

typedef Instance BitmapFormat;
typedef Resource BitmapResource;
typedef uint32 Color444;
typedef uint32 Color555;
typedef uint32 Color565;
typedef struct ColorCMYK ColorCMYK;
typedef struct ColorHSV ColorHSV;
typedef struct ColorLab ColorLab;
typedef uint32 ColorRGBA;
typedef Color DefinedColor;
enum
{
   DefinedColor_black = 0x0,
   DefinedColor_dimGray = 0x696969,
   DefinedColor_gray = 0x808080,
   DefinedColor_darkGray = 0xA9A9A5,
   DefinedColor_silver = 0xC0C0C0,
   DefinedColor_lightGray = 0xD3D3D3,
   DefinedColor_gainsboro = 0xDCDCDC,
   DefinedColor_whiteSmoke = 0xF5F5F5,
   DefinedColor_white = 0xFFFFFF,
   DefinedColor_rosyBrown = 0xBC8F8F,
   DefinedColor_indianRed = 0xCD5C5C,
   DefinedColor_brown = 0xA52A2A,
   DefinedColor_fireBrick = 0xB22222,
   DefinedColor_lightCoral = 0xF08080,
   DefinedColor_maroon = 0x800000,
   DefinedColor_darkRed = 0x8B0000,
   DefinedColor_red = 0xFF0000,
   DefinedColor_snow = 0xFFFAFA,
   DefinedColor_mistyRose = 0xFFE4E1,
   DefinedColor_salmon = 0xFA8072,
   DefinedColor_tomato = 0xFF6347,
   DefinedColor_darkSalmon = 0xE9967A,
   DefinedColor_coral = 0xFF7F50,
   DefinedColor_orangeRed = 0xFF4500,
   DefinedColor_lightSalmon = 0xFFA07A,
   DefinedColor_sienna = 0xA0522D,
   DefinedColor_seaShell = 0xFFF5EE,
   DefinedColor_chocolate = 0xD2691E,
   DefinedColor_saddleBrown = 0x8B4513,
   DefinedColor_sandyBrown = 0xF4A460,
   DefinedColor_peachPuff = 0xFFDAB9,
   DefinedColor_peru = 0xCD853F,
   DefinedColor_linen = 0xFAF0E6,
   DefinedColor_bisque = 0xFFE4C4,
   DefinedColor_darkOrange = 0xFF8C00,
   DefinedColor_burlyWood = 0xDEB887,
   DefinedColor_tan = 0xD2B48C,
   DefinedColor_antiqueWhite = 0xFAEBD7,
   DefinedColor_navajoWhite = 0xFFDEAD,
   DefinedColor_blanchedAlmond = 0xFFEBCD,
   DefinedColor_papayaWhip = 0xFFEFD5,
   DefinedColor_mocassin = 0xFFE4B5,
   DefinedColor_orange = 0xFFA500,
   DefinedColor_wheat = 0xF5DEB3,
   DefinedColor_oldLace = 0xFDF5E6,
   DefinedColor_floralWhite = 0xFFFAF0,
   DefinedColor_darkGoldenrod = 0xB8860B,
   DefinedColor_goldenrod = 0xDAA520,
   DefinedColor_cornsilk = 0xFFF8DC,
   DefinedColor_gold = 0xFFD700,
   DefinedColor_khaki = 0xF0E68C,
   DefinedColor_lemonChiffon = 0xFFFACD,
   DefinedColor_paleGoldenrod = 0xEEE8AA,
   DefinedColor_darkKhaki = 0xBDB76B,
   DefinedColor_beige = 0xF5F5DC,
   DefinedColor_lightGoldenRodYellow = 0xFAFAD2,
   DefinedColor_olive = 0x808000,
   DefinedColor_yellow = 0xFFFF00,
   DefinedColor_lightYellow = 0xFFFFE0,
   DefinedColor_ivory = 0xFFFFF0,
   DefinedColor_oliveDrab = 0x6B8E23,
   DefinedColor_yellowGreen = 0x9ACD32,
   DefinedColor_darkOliveGreen = 0x556B2F,
   DefinedColor_greenYellow = 0xADFF2F,
   DefinedColor_chartreuse = 0x7FFF00,
   DefinedColor_lawnGreen = 0x7CFC00,
   DefinedColor_darkSeaGreen = 0x8FBC8B,
   DefinedColor_forestGreen = 0x228B22,
   DefinedColor_limeGreen = 0x32CD32,
   DefinedColor_lightGreen = 0x90EE90,
   DefinedColor_paleGreen = 0x98FB98,
   DefinedColor_darkGreen = 0x6400,
   DefinedColor_green = 0x8000,
   DefinedColor_lime = 0xFF00,
   DefinedColor_honeyDew = 0xF0FFF0,
   DefinedColor_seaGreen = 0x2E8B57,
   DefinedColor_mediumSeaGreen = 0x3CB371,
   DefinedColor_springGreen = 0xFF7F,
   DefinedColor_mintCream = 0xF5FFFA,
   DefinedColor_mediumSpringGreen = 0xFA9A,
   DefinedColor_mediumAquaMarine = 0x66CDAA,
   DefinedColor_aquamarine = 0x7FFFD4,
   DefinedColor_turquoise = 0x40E0D0,
   DefinedColor_lightSeaGreen = 0x20B2AA,
   DefinedColor_mediumTurquoise = 0x48D1CC,
   DefinedColor_darkSlateGray = 0x2F4F4F,
   DefinedColor_paleTurquoise = 0xAFEEEE,
   DefinedColor_teal = 0x8080,
   DefinedColor_darkCyan = 0x8B8B,
   DefinedColor_aqua = 0xFFFF,
   DefinedColor_cyan = 0xFFFF,
   DefinedColor_lightCyan = 0xE0FFFF,
   DefinedColor_azure = 0xF0FFFF,
   DefinedColor_darkTurquoise = 0xCED1,
   DefinedColor_cadetBlue = 0x5F9EA0,
   DefinedColor_powderBlue = 0xB0E0E6,
   DefinedColor_lightBlue = 0xADD8E6,
   DefinedColor_deepSkyBlue = 0xBFFF,
   DefinedColor_skyBlue = 0x87CEEB,
   DefinedColor_lightSkyBlue = 0x87CEFA,
   DefinedColor_steelBlue = 0x4682B4,
   DefinedColor_aliceBlue = 0xF0F8FF,
   DefinedColor_dodgerBlue = 0x1E90FF,
   DefinedColor_slateGray = 0x708090,
   DefinedColor_lightSlateGray = 0x778899,
   DefinedColor_lightSteelBlue = 0xB0C4DE,
   DefinedColor_cornflowerBlue = 0x6495ED,
   DefinedColor_royalBlue = 0x4169E1,
   DefinedColor_midnightBlue = 0x191970,
   DefinedColor_lavender = 0xE6E6FA,
   DefinedColor_navy = 0x80,
   DefinedColor_darkBlue = 0x8B,
   DefinedColor_mediumBlue = 0xCD,
   DefinedColor_blue = 0xFF,
   DefinedColor_ghostWhite = 0xF8F8FF,
   DefinedColor_slateBlue = 0x6A5ACD,
   DefinedColor_darkSlateBlue = 0x483D8B,
   DefinedColor_mediumSlateBlue = 0x7B68EE,
   DefinedColor_mediumPurple = 0x9370DB,
   DefinedColor_blueViolet = 0x8A2BE2,
   DefinedColor_indigo = 0x4B0082,
   DefinedColor_darkOrchid = 0x9932CC,
   DefinedColor_darkViolet = 0x9400D3,
   DefinedColor_mediumOrchid = 0xBA55D3,
   DefinedColor_thistle = 0xD8BFD8,
   DefinedColor_plum = 0xDDA0DD,
   DefinedColor_violet = 0xEE82EE,
   DefinedColor_purple = 0x800080,
   DefinedColor_darkMagenta = 0x8B008B,
   DefinedColor_magenta = 0xFF00FF,
   DefinedColor_fuschia = 0xFF00FF,
   DefinedColor_orchid = 0xDA70D6,
   DefinedColor_mediumVioletRed = 0xC71585,
   DefinedColor_deepPink = 0xFF1493,
   DefinedColor_hotPink = 0xFF9BB4,
   DefinedColor_lavenderBlush = 0xFFF0F5,
   DefinedColor_paleVioletRed = 0xDB7093,
   DefinedColor_crimson = 0xDC143C,
   DefinedColor_pink = 0xFFC0CB,
   DefinedColor_lightPink = 0xFFB6C1
};

typedef uint32 FMTextAlignment;
typedef int FMVerticalAlignment;
enum
{
   FMVerticalAlignment_baseline = 0x0,
   FMVerticalAlignment_top = 0x1,
   FMVerticalAlignment_middle = 0x2,
   FMVerticalAlignment_bottom = 0x3
};

typedef struct FaceInfo FaceInfo;
typedef struct FontInfo FontInfo;
typedef struct RenderStateFloat RenderStateFloat;
typedef int Resolution;
enum
{
   Resolution_resText80x25 = 0x0,
   Resolution_res320x200 = 0x1,
   Resolution_res320x240 = 0x2,
   Resolution_res320x400 = 0x3,
   Resolution_res360x480 = 0x4,
   Resolution_res400x256 = 0x5,
   Resolution_res400x300 = 0x6,
   Resolution_res512x256 = 0x7,
   Resolution_res512x384 = 0x8,
   Resolution_res640x200 = 0x9,
   Resolution_res640x350 = 0xA,
   Resolution_res640x400 = 0xB,
   Resolution_res640x480 = 0xC,
   Resolution_res720x348 = 0xD,
   Resolution_res800x600 = 0xE,
   Resolution_res856x480 = 0xF,
   Resolution_res960x720 = 0x10,
   Resolution_res1024x768 = 0x11,
   Resolution_res1152x864 = 0x12,
   Resolution_res1280x1024 = 0x13,
   Resolution_res1600x1200 = 0x14,
   Resolution_res768x480 = 0x15
};

typedef Color SystemColor;
enum
{
   SystemColor_formColor = 0xE5EAF5,
   SystemColor_activeBorder = 0xE5EAF5,
   SystemColor_control = 0xD4D0C8,
   SystemColor_controlLight = 0xD4D0C8,
   SystemColor_inactiveBorder = 0xD4D0C8,
   SystemColor_inactiveCaptionText = 0xD4D0C8,
   SystemColor_menu = 0xD4D0C8,
   SystemColor_scrollBar = 0xD4D0C8
};

extern bool (* Bitmap_allocate)(Bitmap __this, const char * driverName, int width, int height, int stride, PixelFormat format, bool allocatePalette);

extern bool (* Bitmap_allocateDD)(Bitmap __this, DisplaySystem displaySystem, int width, int height);

extern bool (* Bitmap_convert)(Bitmap __this, DisplaySystem displaySystem, PixelFormat format, ColorAlpha * palette);

extern bool (* Bitmap_copy)(Bitmap __this, Bitmap source);

extern void (* Bitmap_free)(Bitmap __this);

extern Surface (* Bitmap_getSurface)(Bitmap __this, int x, int y, Box * clip);

extern void (* Bitmap_grab)(Bitmap __this, Bitmap src, int x, int y);

extern bool (* Bitmap_load)(Bitmap __this, const char * fileName, const char * type, DisplaySystem displaySystem);

extern bool (* Bitmap_loadFromFile)(Bitmap __this, File file, const char * type, DisplaySystem displaySystem);

extern bool (* Bitmap_loadGrayed)(Bitmap __this, const char * fileName, const char * type, DisplaySystem displaySystem);

extern bool (* Bitmap_loadMipMaps)(Bitmap __this, const char * fileName, const char * type, DisplaySystem displaySystem);

extern bool (* Bitmap_loadMonochrome)(Bitmap __this, const char * fileName, const char * type, DisplaySystem displaySystem);

extern bool (* Bitmap_loadT)(Bitmap __this, const char * fileName, const char * type, DisplaySystem displaySystem);

extern bool (* Bitmap_loadTMipMaps)(Bitmap __this, const char * fileName, const char * type, DisplaySystem displaySystem);

extern bool (* Bitmap_makeDD)(Bitmap __this, DisplaySystem displaySystem);

extern bool (* Bitmap_makeMipMaps)(Bitmap __this, DisplaySystem displaySystem);

extern ColorAlpha * (* Bitmap_quantize)(Bitmap __this, uint start, uint end);

extern bool (* Bitmap_save)(Bitmap __this, const char * fileName, const char * type, void * options);

extern void (* Bitmap_smoothEdges)(Bitmap __this, int size);

extern Property * property_BitmapResource_fileName;
extern void (* BitmapResource_set_fileName)(BitmapResource b, const char * value);
extern const char * (* BitmapResource_get_fileName)(BitmapResource b);

extern Property * property_BitmapResource_grayed;
extern void (* BitmapResource_set_grayed)(BitmapResource b, bool value);
extern bool (* BitmapResource_get_grayed)(BitmapResource b);

extern Property * property_BitmapResource_monochrome;
extern void (* BitmapResource_set_monochrome)(BitmapResource b, bool value);
extern bool (* BitmapResource_get_monochrome)(BitmapResource b);

extern Property * property_BitmapResource_transparent;
extern void (* BitmapResource_set_transparent)(BitmapResource b, bool value);
extern bool (* BitmapResource_get_transparent)(BitmapResource b);
extern bool (* BitmapResource_isSet_transparent)(BitmapResource b);

extern Property * property_BitmapResource_alphaBlend;
extern void (* BitmapResource_set_alphaBlend)(BitmapResource b, bool value);
extern bool (* BitmapResource_get_alphaBlend)(BitmapResource b);
extern bool (* BitmapResource_isSet_alphaBlend)(BitmapResource b);

extern Property * property_BitmapResource_mipMaps;
extern void (* BitmapResource_set_mipMaps)(BitmapResource b, bool value);
extern bool (* BitmapResource_get_mipMaps)(BitmapResource b);
extern bool (* BitmapResource_isSet_mipMaps)(BitmapResource b);

extern Property * property_BitmapResource_keepData;
extern void (* BitmapResource_set_keepData)(BitmapResource b, bool value);
extern bool (* BitmapResource_get_keepData)(BitmapResource b);

extern Property * property_BitmapResource_bitmap;
extern void (* BitmapResource_set_bitmap)(BitmapResource b, Bitmap value);
extern Bitmap (* BitmapResource_get_bitmap)(BitmapResource b);

extern Property * property_BitmapResource_window;
extern void (* BitmapResource_set_window)(BitmapResource b, Window value);

#define COLOR_r_SHIFT                                    16
#define COLOR_r_MASK                                     0xFF0000
#define COLOR_g_SHIFT                                    8
#define COLOR_g_MASK                                     0xFF00
#define COLOR_b_SHIFT                                    0
#define COLOR_b_MASK                                     0xFF


extern Property * property_Color_ColorRGB;
extern Color (* Color_from_ColorRGB)(ColorRGB colorRGB);
extern void (* Color_to_ColorRGB)(Color color, ColorRGB * value);

#define COLOR444_r_SHIFT                                 8
#define COLOR444_r_MASK                                  0xF00
#define COLOR444_g_SHIFT                                 4
#define COLOR444_g_MASK                                  0xF0
#define COLOR444_b_SHIFT                                 0
#define COLOR444_b_MASK                                  0xF


extern Property * property_Color444_Color;
extern Color444 (* Color444_from_Color)(Color color);
extern Color (* Color444_to_Color)(Color444 color444);

#define COLOR555_r_SHIFT                                 10
#define COLOR555_r_MASK                                  0x7C00
#define COLOR555_g_SHIFT                                 5
#define COLOR555_g_MASK                                  0x3E0
#define COLOR555_b_SHIFT                                 0
#define COLOR555_b_MASK                                  0x1F


extern Property * property_Color555_Color;
extern Color555 (* Color555_from_Color)(Color color);
extern Color (* Color555_to_Color)(Color555 color555);

#define COLOR565_r_SHIFT                                 11
#define COLOR565_r_MASK                                  0xF800
#define COLOR565_g_SHIFT                                 5
#define COLOR565_g_MASK                                  0x7E0
#define COLOR565_b_SHIFT                                 0
#define COLOR565_b_MASK                                  0x1F


extern Property * property_Color565_Color;
extern Color565 (* Color565_from_Color)(Color color);
extern Color (* Color565_to_Color)(Color565 color565);

#define COLORALPHA_a_SHIFT                               24
#define COLORALPHA_a_MASK                                0xFF000000
#define COLORALPHA_color_SHIFT                           0
#define COLORALPHA_color_MASK                            0xFFFFFF


extern Property * property_ColorAlpha_Color;
extern ColorAlpha (* ColorAlpha_from_Color)(Color color);
extern Color (* ColorAlpha_to_Color)(ColorAlpha colorAlpha);

struct ColorCMYK
{
   float c;
   float m;
   float y;
   float k;
};
extern Property * property_ColorCMYK_ColorRGB;
extern void (* ColorCMYK_from_ColorRGB)(ColorCMYK * c, const ColorRGB * value);
extern void (* ColorCMYK_to_ColorRGB)(ColorCMYK * c, ColorRGB * value);

struct ColorHSV
{
   Angle h;
   float s;
   float v;
};
extern Property * property_ColorHSV_ColorRGB;
extern void (* ColorHSV_from_ColorRGB)(ColorHSV * c, const ColorRGB * value);
extern void (* ColorHSV_to_ColorRGB)(ColorHSV * c, ColorRGB * value);

struct ColorKey
{
   ColorAlpha color;
   float percent;
};
struct ColorLab
{
   float l;
   float a;
   float b;
};
extern Property * property_ColorLab_ColorRGB;
extern void (* ColorLab_from_ColorRGB)(ColorLab * c, const ColorRGB * value);
extern void (* ColorLab_to_ColorRGB)(ColorLab * c, ColorRGB * value);

#define COLORRGBA_r_SHIFT                                0
#define COLORRGBA_r_MASK                                 0xFF
#define COLORRGBA_g_SHIFT                                8
#define COLORRGBA_g_MASK                                 0xFF00
#define COLORRGBA_b_SHIFT                                16
#define COLORRGBA_b_MASK                                 0xFF0000
#define COLORRGBA_a_SHIFT                                24
#define COLORRGBA_a_MASK                                 0xFF000000


extern Property * property_ColorRGBA_ColorAlpha;
extern ColorRGBA (* ColorRGBA_from_ColorAlpha)(ColorAlpha colorAlpha);
extern ColorAlpha (* ColorRGBA_to_ColorAlpha)(ColorRGBA colorRGBA);

extern Property * property_ColorRGBA_Color;
extern ColorRGBA (* ColorRGBA_from_Color)(Color color);
extern Color (* ColorRGBA_to_Color)(ColorRGBA colorRGBA);

struct ColorRGBAf
{
   float r;
   float g;
   float b;
   float a;
};
extern Property * property_ColorRGBAf_ColorAlpha;
extern void (* ColorRGBAf_from_ColorAlpha)(ColorRGBAf * c, ColorAlpha value);
extern ColorAlpha (* ColorRGBAf_to_ColorAlpha)(ColorRGBAf * c);

extern Property * property_ColorRGBAf_Color;
extern void (* ColorRGBAf_from_Color)(ColorRGBAf * c, Color value);
extern Color (* ColorRGBAf_to_Color)(ColorRGBAf * c);

extern bool (* CubeMap_load)(CubeMap __this, DisplaySystem displaySystem, constString * names, constString extension, bool oldStyle);

extern void (* Display_applyMaterial)(Display __this, Material * material, Mesh * mesh);

extern void (* Display_collectHits)(Display __this);

extern bool (* Display_create)(Display __this, DisplaySystem displaySystem, void * window);

extern bool (* Display_drawMesh)(Display __this, Object * object);

extern bool (* Display_drawObject)(Display __this, Object * object);

extern void (* Display_drawPrimitives)(Display __this, PrimitiveSingle * primitive, Mesh * mesh);

extern void (* Display_drawTranslucency)(Display __this);

extern void (* Display_endUpdate)(Display __this);

extern void (* Display_fontExtent)(Display __this, Font * font, const char * text, int len, int * width, int * height);

extern void (* Display_fontExtent2)(Display __this, Font * font, const char * text, int len, int * width, int * height, int prevGlyph, int * rPrevGlyph, int * overHang);

extern int (* Display_getHits)(Display __this, OldList * list);

extern bool (* Display_getIntersect)(Display __this, Vector3D * intersect);

extern Surface (* Display_getSurface)(Display __this, int x, int y, Box * clip);

extern bool (* Display_grab)(Display __this, Bitmap bitmap, int x, int y, int w, int h);

extern void (* Display_intersectPolygons)(Display __this);

extern bool (* Display_isObjectVisible)(Display __this, Object * object);

extern bool (* Display_lock)(Display __this, bool render);

extern void (* Display_nextPage)(Display __this);

extern void (* Display_popMatrix)(Display __this);

extern void (* Display_position)(Display __this, int x, int y);

extern void (* Display_pushMatrix)(Display __this);

extern bool (* Display_resize)(Display __this, int width, int height);

extern void (* Display_restorePalette)(Display __this);

extern void (* Display_scroll)(Display __this, Box * scroll, int x, int y, Extent * dirty);

extern void (* Display_selectMesh)(Display __this, Mesh * mesh);

extern void (* Display_setCamera)(Display __this, Surface surface, Camera camera);

extern void (* Display_setLight)(Display __this, int id, Light * light);

extern void (* Display_setLights)(Display __this, Object * object);

extern void (* Display_setPalette)(Display __this, ColorAlpha * palette, bool colorMatch);

extern void (* Display_setTransform)(Display __this, Matrix * matrix, bool viewSpace);

extern void (* Display_startSelection)(Display __this, int pickX, int pickY, int pickW, int pickH);

extern void (* Display_startUpdate)(Display __this);

extern void (* Display_stopSelection)(Display __this);

extern void (* Display_unlock)(Display __this);

extern void (* Display_update)(Display __this, Box * updateBox);

extern Property * property_Display_fillMode;
extern void (* Display_set_fillMode)(Display d, FillModeValue value);

extern Property * property_Display_depthTest;
extern void (* Display_set_depthTest)(Display d, bool value);

extern Property * property_Display_depthWrite;
extern void (* Display_set_depthWrite)(Display d, bool value);

extern Property * property_Display_fogDensity;
extern void (* Display_set_fogDensity)(Display d, float value);

extern Property * property_Display_fogColor;
extern void (* Display_set_fogColor)(Display d, Color value);

extern Property * property_Display_blend;
extern void (* Display_set_blend)(Display d, bool value);

extern Property * property_Display_ambient;
extern void (* Display_set_ambient)(Display d, Color value);

extern Property * property_Display_alphaWrite;
extern void (* Display_set_alphaWrite)(Display d, bool value);

extern Property * property_Display_antiAlias;
extern void (* Display_set_antiAlias)(Display d, bool value);

extern Property * property_Display_vSync;
extern void (* Display_set_vSync)(Display d, bool value);

extern Property * property_Display_pickingPlanes;
extern void (* Display_set_pickingPlanes)(Display d, bool value);

extern Property * property_Display_flags;
extern DisplayFlags (* Display_get_flags)(Display d);

extern Property * property_Display_pixelFormat;
extern PixelFormat (* Display_get_pixelFormat)(Display d);

extern Property * property_Display_alphaBlend;
extern void (* Display_set_alphaBlend)(Display d, bool value);
extern bool (* Display_get_alphaBlend)(Display d);

extern Property * property_Display_useSharedMemory;
extern void (* Display_set_useSharedMemory)(Display d, bool value);
extern bool (* Display_get_useSharedMemory)(Display d);

extern Property * property_Display_systemWindow;
extern void * (* Display_get_systemWindow)(Display d);

extern Property * property_Display_displaySystem;
extern DisplaySystem (* Display_get_displaySystem)(Display d);

extern Property * property_Display_glCapabilities;
extern void (* Display_set_glCapabilities)(Display d, GLCapabilities value);
extern GLCapabilities (* Display_get_glCapabilities)(Display d);

extern int DisplayDriver_allocateBitmap_vTblID;
bool DisplayDriver_allocateBitmap(DisplayDriver __i, DisplaySystem ap1, Bitmap ap2, int ap3, int ap4, int ap5, PixelFormat ap6, bool ap7);
extern Method * method_DisplayDriver_allocateBitmap;

extern int DisplayDriver_allocateIndices_vTblID;
void * DisplayDriver_allocateIndices(DisplayDriver __i, DisplaySystem ap1, int nIndices, bool indices32bit);
extern Method * method_DisplayDriver_allocateIndices;

extern int DisplayDriver_allocateMesh_vTblID;
bool DisplayDriver_allocateMesh(DisplayDriver __i, DisplaySystem ap1, Mesh * ap2, MeshFeatures ap3, int nVertices);
extern Method * method_DisplayDriver_allocateMesh;

extern int DisplayDriver_applyMaterial_vTblID;
void DisplayDriver_applyMaterial(DisplayDriver __i, Display ap1, Material * ap2, Mesh * ap3);
extern Method * method_DisplayDriver_applyMaterial;

extern int DisplayDriver_area_vTblID;
void DisplayDriver_area(DisplayDriver __i, Display ap1, Surface ap2, int x1, int y1, int x2, int y2);
extern Method * method_DisplayDriver_area;

extern int DisplayDriver_blit_vTblID;
void DisplayDriver_blit(DisplayDriver __i, Display ap1, Surface ap2, Bitmap ap3, int dx, int dy, int sx, int sy, int w, int h);
extern Method * method_DisplayDriver_blit;

extern int DisplayDriver_blitDI_vTblID;
void DisplayDriver_blitDI(DisplayDriver __i, Display ap1, Surface ap2, Bitmap ap3, int dx, int dy, int sx, int sy, int w, int h);
extern Method * method_DisplayDriver_blitDI;

extern int DisplayDriver_clear_vTblID;
void DisplayDriver_clear(DisplayDriver __i, Display ap1, Surface ap2, ClearType ap3);
extern Method * method_DisplayDriver_clear;

extern int DisplayDriver_clip_vTblID;
void DisplayDriver_clip(DisplayDriver __i, Display ap1, Surface ap2, Box * ap3);
extern Method * method_DisplayDriver_clip;

extern int DisplayDriver_convertBitmap_vTblID;
bool DisplayDriver_convertBitmap(DisplayDriver __i, DisplaySystem ap1, Bitmap ap2, PixelFormat ap3, ColorAlpha * ap4);
extern Method * method_DisplayDriver_convertBitmap;

extern int DisplayDriver_createDisplay_vTblID;
bool DisplayDriver_createDisplay(DisplayDriver __i, Display ap1);
extern Method * method_DisplayDriver_createDisplay;

extern int DisplayDriver_createDisplaySystem_vTblID;
bool DisplayDriver_createDisplaySystem(DisplayDriver __i, DisplaySystem ap1);
extern Method * method_DisplayDriver_createDisplaySystem;

extern int DisplayDriver_destroyDisplay_vTblID;
void DisplayDriver_destroyDisplay(DisplayDriver __i, Display ap1);
extern Method * method_DisplayDriver_destroyDisplay;

extern int DisplayDriver_destroyDisplaySystem_vTblID;
void DisplayDriver_destroyDisplaySystem(DisplayDriver __i, DisplaySystem ap1);
extern Method * method_DisplayDriver_destroyDisplaySystem;

extern int DisplayDriver_displayPosition_vTblID;
void DisplayDriver_displayPosition(DisplayDriver __i, Display ap1, int ap2, int ap3);
extern Method * method_DisplayDriver_displayPosition;

extern int DisplayDriver_displaySize_vTblID;
bool DisplayDriver_displaySize(DisplayDriver __i, Display ap1, int ap2, int ap3);
extern Method * method_DisplayDriver_displaySize;

extern int DisplayDriver_drawLine_vTblID;
void DisplayDriver_drawLine(DisplayDriver __i, Display ap1, Surface ap2, int x1, int y1, int x2, int y2);
extern Method * method_DisplayDriver_drawLine;

extern int DisplayDriver_drawPrimitives_vTblID;
void DisplayDriver_drawPrimitives(DisplayDriver __i, Display ap1, PrimitiveSingle * ap2, Mesh * mesh);
extern Method * method_DisplayDriver_drawPrimitives;

extern int DisplayDriver_drawingChar_vTblID;
void DisplayDriver_drawingChar(DisplayDriver __i, Display ap1, Surface ap2, char ch);
extern Method * method_DisplayDriver_drawingChar;

extern int DisplayDriver_endUpdate_vTblID;
void DisplayDriver_endUpdate(DisplayDriver __i, Display ap1);
extern Method * method_DisplayDriver_endUpdate;

extern int DisplayDriver_filter_vTblID;
void DisplayDriver_filter(DisplayDriver __i, Display ap1, Surface ap2, Bitmap ap3, int dx, int dy, int sx, int sy, int w, int h, int sw, int sh);
extern Method * method_DisplayDriver_filter;

extern int DisplayDriver_filterDI_vTblID;
void DisplayDriver_filterDI(DisplayDriver __i, Display ap1, Surface ap2, Bitmap ap3, int dx, int dy, int sx, int sy, int w, int h, int sw, int sh);
extern Method * method_DisplayDriver_filterDI;

extern int DisplayDriver_fontExtent_vTblID;
void DisplayDriver_fontExtent(DisplayDriver __i, DisplaySystem ap1, Font * ap2, constString text, int len, int * tw, int * th, int prevGlyph, int * rPrevGlyph, int * overHang);
extern Method * method_DisplayDriver_fontExtent;

extern int DisplayDriver_freeBitmap_vTblID;
void DisplayDriver_freeBitmap(DisplayDriver __i, DisplaySystem ap1, Bitmap ap2);
extern Method * method_DisplayDriver_freeBitmap;

extern int DisplayDriver_freeIndices_vTblID;
void DisplayDriver_freeIndices(DisplayDriver __i, DisplaySystem ap1, void * indices);
extern Method * method_DisplayDriver_freeIndices;

extern int DisplayDriver_freeMesh_vTblID;
void DisplayDriver_freeMesh(DisplayDriver __i, DisplaySystem ap1, Mesh * ap2);
extern Method * method_DisplayDriver_freeMesh;

extern int DisplayDriver_getBitmapSurface_vTblID;
bool DisplayDriver_getBitmapSurface(DisplayDriver __i, DisplaySystem displaySystem, Surface surface, Bitmap bitmap, int ap1, int ap2, Box * ap3);
extern Method * method_DisplayDriver_getBitmapSurface;

extern int DisplayDriver_getPixel_vTblID;
ColorAlpha DisplayDriver_getPixel(DisplayDriver __i, Display ap1, Surface ap2, int x, int y);
extern Method * method_DisplayDriver_getPixel;

extern int DisplayDriver_getSurface_vTblID;
bool DisplayDriver_getSurface(DisplayDriver __i, Display ap1, Surface surface, int ap2, int ap3, Box * ap4);
extern Method * method_DisplayDriver_getSurface;

extern int DisplayDriver_grabScreen_vTblID;
bool DisplayDriver_grabScreen(DisplayDriver __i, Display ap1, Bitmap ap2, int ap3, int ap4, uint ap5, uint ap6);
extern Method * method_DisplayDriver_grabScreen;

extern int DisplayDriver_lineStipple_vTblID;
void DisplayDriver_lineStipple(DisplayDriver __i, Display ap1, Surface ap2, uint pattern);
extern Method * method_DisplayDriver_lineStipple;

extern int DisplayDriver_loadFont_vTblID;
Font * DisplayDriver_loadFont(DisplayDriver __i, DisplaySystem displaySystem, const char * faceName, float size, FontFlags flags, float outlineSize, float outlineFade);
extern Method * method_DisplayDriver_loadFont;

extern int DisplayDriver_lock_vTblID;
bool DisplayDriver_lock(DisplayDriver __i, Display ap1);
extern Method * method_DisplayDriver_lock;

extern int DisplayDriver_lockIndices_vTblID;
uint16 * DisplayDriver_lockIndices(DisplayDriver __i, DisplaySystem ap1, void * indices);
extern Method * method_DisplayDriver_lockIndices;

extern int DisplayDriver_lockMesh_vTblID;
bool DisplayDriver_lockMesh(DisplayDriver __i, DisplaySystem ap1, Mesh * ap2, MeshFeatures flags);
extern Method * method_DisplayDriver_lockMesh;

extern int DisplayDriver_lockSystem_vTblID;
bool DisplayDriver_lockSystem(DisplayDriver __i, DisplaySystem displaySystem);
extern Method * method_DisplayDriver_lockSystem;

extern int DisplayDriver_makeDDBitmap_vTblID;
bool DisplayDriver_makeDDBitmap(DisplayDriver __i, DisplaySystem ap1, Bitmap ap2, bool mipMaps, int cubeMapFace);
extern Method * method_DisplayDriver_makeDDBitmap;

extern int DisplayDriver_nextPage_vTblID;
void DisplayDriver_nextPage(DisplayDriver __i, Display ap1);
extern Method * method_DisplayDriver_nextPage;

extern int DisplayDriver_popMatrix_vTblID;
void DisplayDriver_popMatrix(DisplayDriver __i, Display ap1, bool ap2);
extern Method * method_DisplayDriver_popMatrix;

extern int DisplayDriver_pushMatrix_vTblID;
void DisplayDriver_pushMatrix(DisplayDriver __i, Display ap1);
extern Method * method_DisplayDriver_pushMatrix;

extern int DisplayDriver_putPixel_vTblID;
void DisplayDriver_putPixel(DisplayDriver __i, Display ap1, Surface ap2, int x, int y);
extern Method * method_DisplayDriver_putPixel;

extern int DisplayDriver_rectangle_vTblID;
void DisplayDriver_rectangle(DisplayDriver __i, Display ap1, Surface ap2, int x1, int y1, int x2, int y2);
extern Method * method_DisplayDriver_rectangle;

extern int DisplayDriver_releaseSurface_vTblID;
void DisplayDriver_releaseSurface(DisplayDriver __i, Display this, Surface ap1);
extern Method * method_DisplayDriver_releaseSurface;

extern int DisplayDriver_restorePalette_vTblID;
void DisplayDriver_restorePalette(DisplayDriver __i, Display ap1);
extern Method * method_DisplayDriver_restorePalette;

extern int DisplayDriver_scroll_vTblID;
void DisplayDriver_scroll(DisplayDriver __i, Display ap1, Box * ap2, int ap3, int ap4, Extent * ap5);
extern Method * method_DisplayDriver_scroll;

extern int DisplayDriver_selectMesh_vTblID;
void DisplayDriver_selectMesh(DisplayDriver __i, Display ap1, Mesh * ap2);
extern Method * method_DisplayDriver_selectMesh;

extern int DisplayDriver_setBackground_vTblID;
void DisplayDriver_setBackground(DisplayDriver __i, Display ap1, Surface ap2, ColorAlpha ap3);
extern Method * method_DisplayDriver_setBackground;

extern int DisplayDriver_setBlitTint_vTblID;
void DisplayDriver_setBlitTint(DisplayDriver __i, Display ap1, Surface ap2, ColorAlpha ap3);
extern Method * method_DisplayDriver_setBlitTint;

extern int DisplayDriver_setCamera_vTblID;
void DisplayDriver_setCamera(DisplayDriver __i, Display ap1, Surface ap2, Camera ap3);
extern Method * method_DisplayDriver_setCamera;

extern int DisplayDriver_setForeground_vTblID;
void DisplayDriver_setForeground(DisplayDriver __i, Display ap1, Surface ap2, ColorAlpha ap3);
extern Method * method_DisplayDriver_setForeground;

extern int DisplayDriver_setLight_vTblID;
void DisplayDriver_setLight(DisplayDriver __i, Display ap1, int ap2, Light * ap3);
extern Method * method_DisplayDriver_setLight;

extern int DisplayDriver_setPalette_vTblID;
void DisplayDriver_setPalette(DisplayDriver __i, Display ap1, ColorAlpha * ap2, bool ap3);
extern Method * method_DisplayDriver_setPalette;

extern int DisplayDriver_setRenderState_vTblID;
void DisplayDriver_setRenderState(DisplayDriver __i, Display ap1, RenderState ap2, uint ap3);
extern Method * method_DisplayDriver_setRenderState;

extern int DisplayDriver_setTransform_vTblID;
void DisplayDriver_setTransform(DisplayDriver __i, Display ap1, Matrix * ap2, bool ap3, bool ap4);
extern Method * method_DisplayDriver_setTransform;

extern int DisplayDriver_startUpdate_vTblID;
void DisplayDriver_startUpdate(DisplayDriver __i, Display ap1);
extern Method * method_DisplayDriver_startUpdate;

extern int DisplayDriver_stretch_vTblID;
void DisplayDriver_stretch(DisplayDriver __i, Display ap1, Surface ap2, Bitmap ap3, int dx, int dy, int sx, int sy, int w, int h, int sw, int sh);
extern Method * method_DisplayDriver_stretch;

extern int DisplayDriver_stretchDI_vTblID;
void DisplayDriver_stretchDI(DisplayDriver __i, Display ap1, Surface ap2, Bitmap ap3, int dx, int dy, int sx, int sy, int w, int h, int sw, int sh);
extern Method * method_DisplayDriver_stretchDI;

extern int DisplayDriver_textExtent_vTblID;
void DisplayDriver_textExtent(DisplayDriver __i, Display ap1, Surface ap2, constString text, int len, int * tw, int * th, int prevGlyph, int * rPrevGlyph, int * overHang);
extern Method * method_DisplayDriver_textExtent;

extern int DisplayDriver_textFont_vTblID;
void DisplayDriver_textFont(DisplayDriver __i, Display ap1, Surface ap2, Font * ap3);
extern Method * method_DisplayDriver_textFont;

extern int DisplayDriver_textOpacity_vTblID;
void DisplayDriver_textOpacity(DisplayDriver __i, Display ap1, Surface ap2, bool ap3);
extern Method * method_DisplayDriver_textOpacity;

extern int DisplayDriver_unloadFont_vTblID;
void DisplayDriver_unloadFont(DisplayDriver __i, DisplaySystem ap1, Font * ap2);
extern Method * method_DisplayDriver_unloadFont;

extern int DisplayDriver_unlock_vTblID;
void DisplayDriver_unlock(DisplayDriver __i, Display ap1);
extern Method * method_DisplayDriver_unlock;

extern int DisplayDriver_unlockIndices_vTblID;
void DisplayDriver_unlockIndices(DisplayDriver __i, DisplaySystem ap1, void * indices, bool indices32bit, int nIndices);
extern Method * method_DisplayDriver_unlockIndices;

extern int DisplayDriver_unlockMesh_vTblID;
void DisplayDriver_unlockMesh(DisplayDriver __i, DisplaySystem ap1, Mesh * ap2, MeshFeatures flags);
extern Method * method_DisplayDriver_unlockMesh;

extern int DisplayDriver_unlockSystem_vTblID;
void DisplayDriver_unlockSystem(DisplayDriver __i, DisplaySystem displaySystem);
extern Method * method_DisplayDriver_unlockSystem;

extern int DisplayDriver_update_vTblID;
void DisplayDriver_update(DisplayDriver __i, Display ap1, Box * ap2);
extern Method * method_DisplayDriver_update;

extern int DisplayDriver_writeText_vTblID;
void DisplayDriver_writeText(DisplayDriver __i, Display ap1, Surface ap2, int x, int y, constString text, int len, int prevGlyph, int * rPrevGlyph);
extern Method * method_DisplayDriver_writeText;

#define DISPLAYFLAGS_fullScreen_SHIFT                    0
#define DISPLAYFLAGS_fullScreen_MASK                     0x1
#define DISPLAYFLAGS_flipping_SHIFT                      1
#define DISPLAYFLAGS_flipping_MASK                       0x2
#define DISPLAYFLAGS_alpha_SHIFT                         2
#define DISPLAYFLAGS_alpha_MASK                          0x4
#define DISPLAYFLAGS_memBackBuffer_SHIFT                 3
#define DISPLAYFLAGS_memBackBuffer_MASK                  0x8
#define DISPLAYFLAGS_text_SHIFT                          4
#define DISPLAYFLAGS_text_MASK                           0x10
#define DISPLAYFLAGS_scrolling_SHIFT                     5
#define DISPLAYFLAGS_scrolling_MASK                      0x20
#define DISPLAYFLAGS_printer_SHIFT                       6
#define DISPLAYFLAGS_printer_MASK                        0x40


extern bool (* DisplaySystem_addMaterial)(DisplaySystem __this, Material * material);

extern OldLink * (* DisplaySystem_addMesh)(DisplaySystem __this, Mesh * mesh);

extern Material * (* DisplaySystem_addNamedMaterial)(DisplaySystem __this, const char * name);

extern NamedLink * (* DisplaySystem_addTexture)(DisplaySystem __this, const char * name, Bitmap bitmap);

extern void (* DisplaySystem_clearMaterials)(DisplaySystem __this);

extern void (* DisplaySystem_clearMeshes)(DisplaySystem __this);

extern void (* DisplaySystem_clearTextures)(DisplaySystem __this);

extern bool (* DisplaySystem_create)(DisplaySystem __this, const char * driverName, void * window, bool fullScreen);

extern void (* DisplaySystem_fontExtent)(DisplaySystem __this, Font * font, const char * text, int len, int * width, int * height);

extern void (* DisplaySystem_fontExtent2)(DisplaySystem __this, Font * font, const char * text, int len, int * width, int * height, int prevGlyph, int * rPrevGlyph, int * overHang);

extern Material * (* DisplaySystem_getMaterial)(DisplaySystem __this, const char * name);

extern Bitmap (* DisplaySystem_getTexture)(DisplaySystem __this, const char * name);

extern Font * (* DisplaySystem_loadFont)(DisplaySystem __this, const char * faceName, float size, FontFlags flags);

extern Font * (* DisplaySystem_loadOutlineFont)(DisplaySystem __this, const char * faceName, float size, FontFlags flags, float outlineSize, float outlineFade);

extern void * (* DisplaySystem_loadResource)(DisplaySystem __this, Resource resource);

extern void * (* DisplaySystem_loadResourceFM)(DisplaySystem __this, Resource resource, FontManager fm);

extern bool (* DisplaySystem_lock)(DisplaySystem __this);

extern bool (* DisplaySystem_removeMaterial)(DisplaySystem __this, Material * material);

extern bool (* DisplaySystem_removeMesh)(DisplaySystem __this, Mesh * mesh);

extern bool (* DisplaySystem_removeTexture)(DisplaySystem __this, const char * name);

extern void (* DisplaySystem_unloadFont)(DisplaySystem __this, Font * font);

extern void (* DisplaySystem_unloadResource)(DisplaySystem __this, Resource resource, DisplaySystemResPtr * res);

extern void (* DisplaySystem_unlock)(DisplaySystem __this);

extern void * (* DisplaySystem__LoadResource)(DisplaySystem __this, Resource resource, void * fm);

extern void (* DrawManager_clear)(DrawManager __this);

extern void (* DrawManager_drawBarrier)(DrawManager __this);

extern void (* DrawManager_drawImage)(DrawManager __this, int index, float offsetx, float offsety, float angsin, float angcos, ColorAlpha color);

extern void (* DrawManager_end)(DrawManager __this);

extern void (* DrawManager_finish)(DrawManager __this);

extern int DrawManager_flush_vTblID;
void DrawManager_flush(DrawManager __i);
extern Method * method_DrawManager_flush;

extern bool (* DrawManager_init)(DrawManager __this);

extern void (* DrawManager_ready)(DrawManager __this, int viewportWidth, int viewportHeight);

extern Property * property_DrawManager_renderingFlipped;
extern void (* DrawManager_set_renderingFlipped)(DrawManager d, bool value);

extern void (* FMFont_setOutline)(FMFont * __this, float size, float fade);

struct FMPathDraw
{
   int prevGlyphIndex;
   float middleAlign;
};
#define FMTEXTALIGNMENT_horzAlignment_SHIFT              0
#define FMTEXTALIGNMENT_horzAlignment_MASK               0x3
#define FMTEXTALIGNMENT_vertAlignment_SHIFT              2
#define FMTEXTALIGNMENT_vertAlignment_MASK               0xC


extern Property * property_Font_ascent;
extern int (* Font_get_ascent)(Font * f);

extern Property * property_Font_descent;
extern int (* Font_get_descent)(Font * f);

#define FONTFLAGS_bold_SHIFT                             0
#define FONTFLAGS_bold_MASK                              0x1
#define FONTFLAGS_italic_SHIFT                           1
#define FONTFLAGS_italic_MASK                            0x2
#define FONTFLAGS_underline_SHIFT                        2
#define FONTFLAGS_underline_MASK                         0x4


struct FontInfo
{
   bool fixedPitch;
   bool defaultOrAnsiCharSet;
};
extern FMFont * (* FontManager_addFont)(FontManager __this, constString path, int glyphPaddingWidth);

extern FMFont * (* FontManager_addFontData)(FontManager __this, byte * data, int dataSize, int glyphPaddingWidth);

extern void (* FontManager_clearState)(FontManager __this);

extern bool (* FontManager_create)(FontManager __this, int width, int height, int channelCount, int channelIndex, FontManagerRenderer renderer);

extern int (* FontManager_drawText)(FontManager __this, int x, int y, const char * string, int stringlength);

extern int (* FontManager_drawTextTruncate)(FontManager __this, int x, int y, int truncatewidth, const char * string, int stringlength, char * extstring, int extwidth);

extern int (* FontManager_drawTextWithCursor)(FontManager __this, int x, int y, const char * string, int stringlength, int cursoroffset);

extern bool (* FontManager_expandAtlas)(FontManager __this, int width, int height);

extern void (* FontManager_flush)(FontManager __this, bool rendererFlush);

extern void (* FontManager_flushUpdate)(FontManager __this);

extern void (* FontManager_freeFont)(FontManager __this, FMFont * font);

extern void (* FontManager_getAtlasSize)(FontManager __this, int * retwidth, int * retheight);

extern FMFont * (* FontManager_getFont)(FontManager __this, FontResource fontResource);

extern void (* FontManager_getFontExtent)(FontManager __this, int * retascent, int * retdescent);

extern void (* FontManager_getFontLimits)(FontManager __this, int * retlimitminy, int * retlimitmaxy);

extern int (* FontManager_getFontLineHeight)(FontManager __this);

extern int (* FontManager_getTextBounds)(FontManager __this, int x, int y, const char * string, int stringlength, int * bounds);

extern int (* FontManager_getTextNearestOffset)(FontManager __this, int targetwidth, const char * string, int stringlength);

extern int (* FontManager_getTextTruncateOffset)(FontManager __this, int truncatewidth, const char * string, int stringlength, int extwidth, int * retextflag, int * retfullwidth);

extern int (* FontManager_getTextWidth)(FontManager __this, const char * string, int stringlength);

extern int (* FontManager_getTextWidthTruncate)(FontManager __this, const char * string, int stringlength, int truncatewidth);

extern const byte * (* FontManager_getTextureData)(FontManager __this, int * width, int * height);

extern bool (* FontManager_initPathDraw)(FontManager __this, FMPathDraw * pathdraw);

extern int FontManager_onAtlasFull_vTblID;
void FontManager_onAtlasFull(FontManager __i);
extern Method * method_FontManager_onAtlasFull;

extern float (* FontManager_pathDrawCharacter)(FontManager __this, FMPathDraw * pathdraw, float x, float y, float vectorx, float vectory, int unicode);

extern float (* FontManager_pathDrawPredictAdvance)(FontManager __this, FMPathDraw * pathdraw, unichar unicode);

extern void (* FontManager_popState)(FontManager __this);

extern void (* FontManager_pushState)(FontManager __this);

extern void (* FontManager_removeFont)(FontManager __this, FMFont * font);

extern bool (* FontManager_resetAtlas)(FontManager __this, int width, int height);

extern void (* FontManager_setAlign)(FontManager __this, int align);

extern void (* FontManager_setFont)(FontManager __this, FMFont * font);

extern void (* FontManager_setFontImageProcessing)(FontManager __this, FMFont * font, void (* processImage)(byte * image, int width, int height, int bytesperpixel, int bytesperline, int paddingwidth, void * opaquecontext), void * opaquecontext);

extern void (* FontManager_setSize)(FontManager __this, int size);

extern void (* FontManager_setState)(FontManager __this, FMFont * font, int size, int align);

extern bool (* FontManager_validateTexture)(FontManager __this, int * retdirtyrect);

extern Property * property_FontManager_renderer;
extern void (* FontManager_set_renderer)(FontManager f, FontManagerRenderer value);
extern FontManagerRenderer (* FontManager_get_renderer)(FontManager f);

extern int FontManagerRenderer_createTexture_vTblID;
int FontManagerRenderer_createTexture(FontManagerRenderer __i, int width, int height);
extern Method * method_FontManagerRenderer_createTexture;

extern int FontManagerRenderer_drawImage_vTblID;
void FontManagerRenderer_drawImage(FontManagerRenderer __i, int targetx, int targety, int imageIndex, bool useExtColor);
extern Method * method_FontManagerRenderer_drawImage;

extern int FontManagerRenderer_drawImageAlt_vTblID;
void FontManagerRenderer_drawImageAlt(FontManagerRenderer __i, byte * texdata, int targetx, int targety, int offsetx, int offsety, int width, int height);
extern Method * method_FontManagerRenderer_drawImageAlt;

extern int FontManagerRenderer_drawImageCursor_vTblID;
void FontManagerRenderer_drawImageCursor(FontManagerRenderer __i, int targetx, int targety, int imageIndex);
extern Method * method_FontManagerRenderer_drawImageCursor;

extern int FontManagerRenderer_drawImageFloat_vTblID;
void FontManagerRenderer_drawImageFloat(FontManagerRenderer __i, float targetx, float targety, float angsin, float angcos, int imageIndex, bool useExtColor);
extern Method * method_FontManagerRenderer_drawImageFloat;

extern int FontManagerRenderer_flush_vTblID;
void FontManagerRenderer_flush(FontManagerRenderer __i);
extern Method * method_FontManagerRenderer_flush;

extern int FontManagerRenderer_init_vTblID;
bool FontManagerRenderer_init(FontManagerRenderer __i, int channelCount);
extern Method * method_FontManagerRenderer_init;

extern int FontManagerRenderer_registerImage_vTblID;
int FontManagerRenderer_registerImage(FontManagerRenderer __i, int offsetx, int offsety, int width, int height);
extern Method * method_FontManagerRenderer_registerImage;

extern int FontManagerRenderer_resetImages_vTblID;
void FontManagerRenderer_resetImages(FontManagerRenderer __i);
extern Method * method_FontManagerRenderer_resetImages;

extern int FontManagerRenderer_resizeTexture_vTblID;
int FontManagerRenderer_resizeTexture(FontManagerRenderer __i, int width, int height);
extern Method * method_FontManagerRenderer_resizeTexture;

extern int FontManagerRenderer_setLayer_vTblID;
void FontManagerRenderer_setLayer(FontManagerRenderer __i, uint32 layerIndex);
extern Method * method_FontManagerRenderer_setLayer;

extern int FontManagerRenderer_updateTexture_vTblID;
void FontManagerRenderer_updateTexture(FontManagerRenderer __i, int * rect, const byte * data);
extern Method * method_FontManagerRenderer_updateTexture;

extern void (* FontRenderer_setColor)(FontRenderer __this, ColorAlpha color);

extern void (* FontRenderer_setCursorColor)(FontRenderer __this, ColorAlpha color);

extern void (* FontRenderer_setExtColor)(FontRenderer __this, ColorAlpha color);

extern Property * property_FontRenderer_drawManager;
extern void (* FontRenderer_set_drawManager)(FontRenderer f, DrawManager value);

extern Property * property_FontResource_faceName;
extern void (* FontResource_set_faceName)(FontResource f, const char * value);
extern const char * (* FontResource_get_faceName)(FontResource f);

extern Property * property_FontResource_size;
extern void (* FontResource_set_size)(FontResource f, float value);
extern float (* FontResource_get_size)(FontResource f);

extern Property * property_FontResource_bold;
extern void (* FontResource_set_bold)(FontResource f, bool value);
extern bool (* FontResource_get_bold)(FontResource f);

extern Property * property_FontResource_italic;
extern void (* FontResource_set_italic)(FontResource f, bool value);
extern bool (* FontResource_get_italic)(FontResource f);

extern Property * property_FontResource_underline;
extern void (* FontResource_set_underline)(FontResource f, bool value);
extern bool (* FontResource_get_underline)(FontResource f);

extern Property * property_FontResource_font;
extern Font * (* FontResource_get_font)(FontResource f);

extern Property * property_FontResource_window;
extern void (* FontResource_set_window)(FontResource f, Window value);

extern Property * property_FontResource_outlineSize;
extern void (* FontResource_set_outlineSize)(FontResource f, float value);
extern float (* FontResource_get_outlineSize)(FontResource f);

extern Property * property_FontResource_outlineFade;
extern void (* FontResource_set_outlineFade)(FontResource f, float value);
extern float (* FontResource_get_outlineFade)(FontResource f);

extern Property * property_FontResource_fmFont;
extern FMFont * (* FontResource_get_fmFont)(FontResource f);

#define GLCAPABILITIES_compatible_SHIFT                  0
#define GLCAPABILITIES_compatible_MASK                   0x1
#define GLCAPABILITIES_vertexBuffer_SHIFT                1
#define GLCAPABILITIES_vertexBuffer_MASK                 0x2
#define GLCAPABILITIES_quads_SHIFT                       2
#define GLCAPABILITIES_quads_MASK                        0x4
#define GLCAPABILITIES_intAndDouble_SHIFT                3
#define GLCAPABILITIES_intAndDouble_MASK                 0x8
#define GLCAPABILITIES_legacyFormats_SHIFT               4
#define GLCAPABILITIES_legacyFormats_MASK                0x10
#define GLCAPABILITIES_nonPow2Textures_SHIFT             5
#define GLCAPABILITIES_nonPow2Textures_MASK              0x20
#define GLCAPABILITIES_vertexPointer_SHIFT               6
#define GLCAPABILITIES_vertexPointer_MASK                0x40
#define GLCAPABILITIES_legacy_SHIFT                      7
#define GLCAPABILITIES_legacy_MASK                       0x80
#define GLCAPABILITIES_shaders_SHIFT                     8
#define GLCAPABILITIES_shaders_MASK                      0x100
#define GLCAPABILITIES_fixedFunction_SHIFT               9
#define GLCAPABILITIES_fixedFunction_MASK                0x200
#define GLCAPABILITIES_immediate_SHIFT                   10
#define GLCAPABILITIES_immediate_MASK                    0x400
#define GLCAPABILITIES_frameBuffer_SHIFT                 11
#define GLCAPABILITIES_frameBuffer_MASK                  0x800
#define GLCAPABILITIES_pointSize_SHIFT                   12
#define GLCAPABILITIES_pointSize_MASK                    0x1000
#define GLCAPABILITIES_vao_SHIFT                         13
#define GLCAPABILITIES_vao_MASK                          0x2000
#define GLCAPABILITIES_select_SHIFT                      14
#define GLCAPABILITIES_select_MASK                       0x4000
#define GLCAPABILITIES_debug_SHIFT                       15
#define GLCAPABILITIES_debug_MASK                        0x8000


extern int (* HitRecord_compare)(HitRecord * __this, HitRecord * recordB, void * unused);

#define LIGHTFLAGS_off_SHIFT                             0
#define LIGHTFLAGS_off_MASK                              0x1
#define LIGHTFLAGS_spot_SHIFT                            1
#define LIGHTFLAGS_spot_MASK                             0x2
#define LIGHTFLAGS_omni_SHIFT                            2
#define LIGHTFLAGS_omni_MASK                             0x4
#define LIGHTFLAGS_attenuation_SHIFT                     3
#define LIGHTFLAGS_attenuation_MASK                      0x8


struct RenderStateFloat
{
   union
   {
      float f;
      uint ui;
   };
};
struct class_members_Surface
{
   int width;
   int height;
   Point offset;
   Box box;
   Box unclippedBox;
   void * driverData;
};
extern void (* Surface_area)(Surface __this, int x1, int y1, int x2, int y2);

extern void (* Surface_bevel)(Surface __this, bool inner, int x, int y, int w, int h);

extern void (* Surface_blit)(Surface __this, Bitmap src, int dx, int dy, int sx, int sy, int w, int h);

extern void (* Surface_centerTextf)(Surface __this, int x, int y, const char * format, ...);

extern void (* Surface_clear)(Surface __this, ClearType type);

extern void (* Surface_clip)(Surface __this, Box * box);

extern void (* Surface_drawLine)(Surface __this, int x1, int y1, int x2, int y2);

extern void (* Surface_drawingChar)(Surface __this, char value);

extern void (* Surface_filter)(Surface __this, Bitmap src, int dx, int dy, int sx, int sy, int w, int h, int sw, int sh);

extern void (* Surface_filterHTile)(Surface __this, Bitmap src, int dx, int dy, int w, int h);

extern void (* Surface_filterVTile)(Surface __this, Bitmap src, int dx, int dy, int w, int h);

extern Color (* Surface_getBackground)(Surface __this);

extern void (* Surface_getBox)(Surface __this, Box * value);

extern Display (* Surface_getDisplay)(Surface __this);

extern Font * (* Surface_getFont)(Surface __this);

extern Color (* Surface_getForeground)(Surface __this);

extern ColorAlpha (* Surface_getPixel)(Surface __this, int x, int y);

extern void (* Surface_getSize)(Surface __this, int * w, int * h);

extern bool (* Surface_getTextOpacity)(Surface __this);

extern void (* Surface_gradient)(Surface __this, ColorKey * keys, int numKeys, float smoothness, GradientDirection direction, int x1, int y1, int x2, int y2);

extern void (* Surface_hLine)(Surface __this, int x1, int x2, int y);

extern void (* Surface_hTile)(Surface __this, Bitmap src, int dx, int dy, int w, int h);

extern void (* Surface_lineStipple)(Surface __this, uint value);

extern void (* Surface_putPixel)(Surface __this, int x, int y);

extern void (* Surface_rectangle)(Surface __this, int x1, int y1, int x2, int y2);

extern void (* Surface_setBackground)(Surface __this, ColorAlpha value);

extern void (* Surface_setForeground)(Surface __this, ColorAlpha value);

extern void (* Surface_stretch)(Surface __this, Bitmap src, int dx, int dy, int sx, int sy, int w, int h, int sw, int sh);

extern void (* Surface_textExtent)(Surface __this, const char * text, int len, int * width, int * height);

extern void (* Surface_textExtent2)(Surface __this, const char * text, int len, int * width, int * height, int prevGlyph, int * rPrevGlyph, int * overHang);

extern void (* Surface_textFont)(Surface __this, Font * value);

extern void (* Surface_textOpacity)(Surface __this, bool value);

extern void (* Surface_thinBevel)(Surface __this, bool inner, int x, int y, int w, int h);

extern void (* Surface_tile)(Surface __this, Bitmap src, int dx, int dy, int w, int h);

extern void (* Surface_vLine)(Surface __this, int y1, int y2, int x);

extern void (* Surface_vTile)(Surface __this, Bitmap src, int dx, int dy, int w, int h);

extern void (* Surface_writeText)(Surface __this, int x, int y, const char * text, int len);

extern void (* Surface_writeText2)(Surface __this, int x, int y, const char * text, int len, int prevGlyph, int * rPrevGlyph);

extern void (* Surface_writeTextDots)(Surface __this, Alignment alignment, int x, int y, int width, const char * text, int len);

extern void (* Surface_writeTextDotsf)(Surface __this, Alignment alignment, int x, int y, int width, const char * format, ...);

extern void (* Surface_writeTextf)(Surface __this, int x, int y, const char * format, ...);

extern Property * property_Surface_alphaWrite;
extern void (* Surface_set_alphaWrite)(Surface s, AlphaWriteMode value);
extern AlphaWriteMode (* Surface_get_alphaWrite)(Surface s);

extern Property * property_Surface_blend;
extern void (* Surface_set_blend)(Surface s, bool value);
extern bool (* Surface_get_blend)(Surface s);

extern Property * property_Surface_bitmap;
extern Bitmap (* Surface_get_bitmap)(Surface s);

extern Property * property_Surface_outlineColor;
extern void (* Surface_set_outlineColor)(Surface s, ColorAlpha value);
extern ColorAlpha (* Surface_get_outlineColor)(Surface s);

extern Property * property_Surface_foreground;
extern void (* Surface_set_foreground)(Surface s, ColorAlpha value);
extern ColorAlpha (* Surface_get_foreground)(Surface s);

extern Property * property_Surface_background;
extern void (* Surface_set_background)(Surface s, ColorAlpha value);
extern ColorAlpha (* Surface_get_background)(Surface s);

extern Property * property_Surface_blitTint;
extern void (* Surface_set_blitTint)(Surface s, ColorAlpha value);
extern ColorAlpha (* Surface_get_blitTint)(Surface s);

extern Property * property_Surface_lineStipple;
extern void (* Surface_set_lineStipple)(Surface s, uint value);

extern Property * property_Surface_size;
extern void (* Surface_get_size)(Surface s, Size * value);

extern Property * property_Surface_display;
extern Display (* Surface_get_display)(Surface s);

extern Property * property_Surface_font;
extern void (* Surface_set_font)(Surface s, Font * value);
extern Font * (* Surface_get_font)(Surface s);

extern Property * property_Surface_textOpacity;
extern void (* Surface_set_textOpacity)(Surface s, bool value);
extern bool (* Surface_get_textOpacity)(Surface s);

extern Property * property_Surface_drawingChar;
extern void (* Surface_set_drawingChar)(Surface s, byte value);

extern Property * property_Surface_clipping;
extern void (* Surface_set_clipping)(Surface s, const Box * value);

extern int (* bestColorMatch)(ColorAlpha * palette, int start, int end, Color rgb);
extern byte (* getColorDepthShifts)(PixelFormat format);
extern Material * (* getDefaultMaterial)(void);
extern ColorAlpha * (* getDefaultPalette)(void);
extern int (* getDepthBits)(PixelFormat colorDepth);
extern int (* getResolutionHeight)(Resolution resolution);
extern int (* getResolutionWidth)(Resolution resolution);
extern Map (* listAvailableFonts)(void);
extern ColorAlpha * (* loadPalette)(const char * fileName, const char * type);
extern void (* paletteGradient)(ColorAlpha * palette, int numColors, ColorKey * keys, int numKeys, float smoothness);
extern FaceInfo * (* resolveCharFont)(constString faceName, float size, FontFlags flags, constString lang, unichar testChar);
extern Array (* resolveFont)(constString faceName, float size, FontFlags flags);
extern void (* setPrintingDocumentName)(constString name);
typedef int SwizzleMode;
enum
{
   SwizzleMode_off = 0x0,
   SwizzleMode_alpha = 0x1,
   SwizzleMode_red = 0x2
};

typedef int MatrixMode;
enum
{
   MatrixMode_modelView = 0x1700,
   MatrixMode_projection = 0x1701,
   MatrixMode_texture = 0x1702
};

typedef struct GLEAB GLEAB;
typedef int GLBufferUsage;
enum
{
   GLBufferUsage_staticDraw = 0x0,
   GLBufferUsage_dynamicDraw = 0x1,
   GLBufferUsage_streamDraw = 0x2
};

typedef int GLBufferContents;
enum
{
   GLBufferContents_vertex = 0x0,
   GLBufferContents_normal = 0x1,
   GLBufferContents_texCoord = 0x2,
   GLBufferContents_color = 0x3,
   GLBufferContents_tangent1 = 0x4,
   GLBufferContents_tangent2 = 0x5,
   GLBufferContents_lightVector = 0x6
};

typedef struct GLAB GLAB;
typedef uint32 DefaultShaderBits;
typedef Shader DefaultShader;
typedef struct CompiledShader CompiledShader;
typedef struct CompiledDefaultShader CompiledDefaultShader;
#define LIGHTSHIFT 5

#define LIGHTSTEPS 32

typedef int GLIMTKMode;
enum
{
   GLIMTKMode_unset = -1,
   GLIMTKMode_points = 0x0,
   GLIMTKMode_lines = 0x1,
   GLIMTKMode_lineLoop = 0x2,
   GLIMTKMode_lineStrip = 0x3,
   GLIMTKMode_triangles = 0x4,
   GLIMTKMode_triangleStrip = 0x5,
   GLIMTKMode_triangleFan = 0x6,
   GLIMTKMode_quads = 0x7,
   GLIMTKMode_quadStrip = 0x8,
   GLIMTKMode_polygon = 0x9
};

typedef int GLMSWhatToGet;
enum
{
   GLMSWhatToGet_modelViewMatrix = 0xBA6,
   GLMSWhatToGet_projectionMatrix = 0xBA7,
   GLMSWhatToGet_textureMatrix = 0xBA8
};

typedef struct LFBDisplay LFBDisplay;
typedef DisplayDriver LFBDisplayDriver;
typedef struct LFBSurface LFBSurface;
typedef struct LFBSystem LFBSystem;
typedef int LightMode;
enum
{
   LightMode_off = 0x0,
   LightMode_dir = 0x1,
   LightMode_pos = 0x2,
   LightMode_posAtt = 0x3,
   LightMode_posSpot = 0x4,
   LightMode_posSpotAtt = 0x5
};

struct CompiledDefaultShader
{
   int program;
   int vertex;
   int fragment;
   int uPrjMatrix;
   int uMVMatrix;
   int uTextureMatrix;
   int uNormalsMatrix;
   int uFogDensity;
   int uFogColor;
   int uGlobalAmbient;
   int uNearPlane;
   int uLightsPos[8];
   int uLightsDiffuse[8];
   int uLightsAmbient[8];
   int uLightsSpecular[8];
   int uLightsAtt[8];
   int uLightsSpotDir[8];
   int uLightsSpotCutOffCos[8];
   int uLightsSpotExp[8];
   int uMatDiffuse;
   int uMatAmbient;
   int uMatSpecular;
   int uMatEmissive;
   int uMatPower;
   int uMatOpacity;
   int uDiffuseTex;
   int uBumpTex;
   int uSpecularTex;
   int uEnvTex;
   int uReflectTex;
   int uRefractionETA;
   int uMatReflectivity;
   int uCubeMapMatrix;
};
extern void (* CompiledDefaultShader_registerUniforms)(CompiledDefaultShader * __this, int program, DefaultShaderBits state);

struct CompiledShader
{
   int program;
   int vertex;
   int fragment;
};
extern void (* CompiledShader_free)(CompiledShader * __this);

struct class_members_DefaultShader
{
   float modelView[16];
   float projection[16];
   float matTexture[16];
   float cubemap_matrix[9];
   float normalsMatrix[9];
   float nearPlane;
   float globalAmbient[3];
   float lDiffuse[8][4];
   float lAmbient[8][3];
   float lSpecular[8][3];
   float lPosition[8][3];
   float lAtt[8][3];
   float lCutOffCos[8];
   float lSpotDir[8][3];
   float lSpotExp[8];
   float diffuse[4];
   float ambient[3];
   float specular[3];
   float emissive[3];
   float power;
   float refractionETA;
   float reflectivity;
   bool fogOn;
   uint lightBits;
   float fogDensity;
   float fogColor[3];
   float color[4];
   DefaultShaderBits backLightState;
};
extern void (* DefaultShader_debugging)(DefaultShader __this, bool on);

extern void (* DefaultShader_fog)(DefaultShader __this, bool on);

extern void (* DefaultShader_lighting)(DefaultShader __this, bool on);

extern void (* DefaultShader_setCamera)(DefaultShader __this, Camera camera);

extern void (* DefaultShader_setColor)(DefaultShader __this, float r, float g, float b, float a);

extern void (* DefaultShader_setFogColor)(DefaultShader __this, float r, float g, float b);

extern void (* DefaultShader_setFogDensity)(DefaultShader __this, float density);

extern void (* DefaultShader_setGlobalAmbient)(DefaultShader __this, float r, float g, float b, float a);

extern void (* DefaultShader_setLight)(DefaultShader __this, Display display, uint id, Light * light);

extern void (* DefaultShader_setPerVertexColor)(DefaultShader __this, bool perVertexColor);

extern void (* DefaultShader_setSimpleMaterial)(DefaultShader __this, ColorAlpha color, bool twoSided);

extern DefaultShader (* DefaultShader_shader)();

extern void (* DefaultShader_swizzle)(DefaultShader __this, SwizzleMode swizzle);

extern void (* DefaultShader_texturing)(DefaultShader __this, bool on);

#define DEFAULTSHADERBITS_lighting_SHIFT                 0
#define DEFAULTSHADERBITS_lighting_MASK                  0x1
#define DEFAULTSHADERBITS_nonLocalViewer_SHIFT           1
#define DEFAULTSHADERBITS_nonLocalViewer_MASK            0x2
#define DEFAULTSHADERBITS_twoSided_SHIFT                 2
#define DEFAULTSHADERBITS_twoSided_MASK                  0x4
#define DEFAULTSHADERBITS_specular_SHIFT                 3
#define DEFAULTSHADERBITS_specular_MASK                  0x8
#define DEFAULTSHADERBITS_separateSpecular_SHIFT         4
#define DEFAULTSHADERBITS_separateSpecular_MASK          0x10
#define DEFAULTSHADERBITS_blinnSpecular_SHIFT            5
#define DEFAULTSHADERBITS_blinnSpecular_MASK             0x20
#define DEFAULTSHADERBITS_lightBits_SHIFT                6
#define DEFAULTSHADERBITS_lightBits_MASK                 0x3FFFFFC0
#define DEFAULTSHADERBITS_perVertexColor_SHIFT           30
#define DEFAULTSHADERBITS_perVertexColor_MASK            0x40000000
#define DEFAULTSHADERBITS_swizzle_SHIFT                  31
#define DEFAULTSHADERBITS_swizzle_MASK                   0x180000000LL
#define DEFAULTSHADERBITS_textureMatrix_SHIFT            33
#define DEFAULTSHADERBITS_textureMatrix_MASK             0x200000000LL
#define DEFAULTSHADERBITS_texturing_SHIFT                34
#define DEFAULTSHADERBITS_texturing_MASK                 0x400000000LL
#define DEFAULTSHADERBITS_cubeMap_SHIFT                  35
#define DEFAULTSHADERBITS_cubeMap_MASK                   0x800000000LL
#define DEFAULTSHADERBITS_modelView_SHIFT                36
#define DEFAULTSHADERBITS_modelView_MASK                 0x1000000000LL
#define DEFAULTSHADERBITS_fog_SHIFT                      37
#define DEFAULTSHADERBITS_fog_MASK                       0x2000000000LL
#define DEFAULTSHADERBITS_normalsMapping_SHIFT           38
#define DEFAULTSHADERBITS_normalsMapping_MASK            0x4000000000LL
#define DEFAULTSHADERBITS_specularMapping_SHIFT          39
#define DEFAULTSHADERBITS_specularMapping_MASK           0x8000000000LL
#define DEFAULTSHADERBITS_environmentMapping_SHIFT       40
#define DEFAULTSHADERBITS_environmentMapping_MASK        0x10000000000LL
#define DEFAULTSHADERBITS_reflection_SHIFT               41
#define DEFAULTSHADERBITS_reflection_MASK                0x20000000000LL
#define DEFAULTSHADERBITS_reflectionMap_SHIFT            42
#define DEFAULTSHADERBITS_reflectionMap_MASK             0x40000000000LL
#define DEFAULTSHADERBITS_refraction_SHIFT               43
#define DEFAULTSHADERBITS_refraction_MASK                0x80000000000LL
#define DEFAULTSHADERBITS_debugging_SHIFT                44
#define DEFAULTSHADERBITS_debugging_MASK                 0x100000000000LL


struct GLAB
{
   uint buffer;
};
extern void (* GLAB_allocate)(GLAB * __this, uint size, void * data, GLBufferUsage usage);

extern void (* GLAB_deleteBuffers)(int count, GLAB * buffers);

extern void (* GLAB_free)(GLAB * __this);

extern void (* GLAB_upload)(GLAB * __this, uint offset, uint size, void * data);

extern void (* GLAB_use)(GLAB * __this, GLBufferContents contents, int n, int type, uint stride, void * pointer);

extern void (* GLAB_useVertTrans)(GLAB * __this, uint count, int n, int type, uint stride, void * pointer);

struct GLEAB
{
   uint buffer;
};
extern void (* GLEAB_allocate)(GLEAB * __this, uint size, void * data, GLBufferUsage usage);

extern void (* GLEAB_draw)(GLEAB * __this, int primType, int count, int type, void * indices);

extern void (* GLEAB_free)(GLEAB * __this);

extern void (* GLEAB_upload)(GLEAB * __this, uint offset, uint size, void * data);

struct LFBDisplay
{
   Bitmap bitmap;
   byte rgbLookup[32768];
   byte lightTable[256][LIGHTSTEPS];
   OldList updateBoxes;
   int x;
   int y;
   bool selfManaged;
   void (* displayCallback)(Display display, Box updateBox);
};
struct LFBSurface
{
   Font * font;
   bool opaqueText;
   int xOffset;
   bool writingText;
   bool writingOutline;
   Bitmap bitmap;
   uint foreground;
   uint background;
   ColorAlpha foregroundRgb;
   uint16 stipple;
   byte drawingChar;
   byte * paletteShades;
   bool clearing;
};
struct LFBSystem
{
   int format;
   ColorAlpha * palette;
   byte rgbLookup[32768];
};
extern bool (* Shader_activate)(Shader __this);

extern int Shader_bindAttribs_vTblID;
void Shader_bindAttribs(Shader __i, int program);
extern Method * method_Shader_bindAttribs;

extern void (* Shader_free)(Shader __this);

extern int Shader_getDefinitions_vTblID;
ZString Shader_getDefinitions(Shader __i, uint64 state);
extern Method * method_Shader_getDefinitions;

extern CompiledShader * (* Shader_load)(Shader __this, uint64 state);

extern int Shader_registerShader_vTblID;
CompiledShader * Shader_registerShader(Shader __i, int program, uint64 state);
extern Method * method_Shader_registerShader;

extern void (* Shader_select)(Shader __this);

extern int Shader_setMaterial_vTblID;
void Shader_setMaterial(Shader __i, Material * material, MeshFeatures flags);
extern Method * method_Shader_setMaterial;

extern int Shader_updateMatrix_vTblID;
void Shader_updateMatrix(Shader __i, MatrixMode mode, Matrix * matrix, bool isIdentity);
extern Method * method_Shader_updateMatrix;

extern int Shader_uploadUniforms_vTblID;
void Shader_uploadUniforms(Shader __i, CompiledShader * shader);
extern Method * method_Shader_uploadUniforms;

extern Property * property_Shader_vertexShaderFile;
extern void (* Shader_set_vertexShaderFile)(Shader s, constString value);

extern Property * property_Shader_fragmentShaderFile;
extern void (* Shader_set_fragmentShaderFile)(Shader s, constString value);

extern Property * property_Shader_vertexShader;
extern void (* Shader_set_vertexShader)(Shader s, constString value);

extern Property * property_Shader_fragmentShader;
extern void (* Shader_set_fragmentShader)(Shader s, constString value);

extern void (* gLABBindBuffer)(int target, uint buffer);
extern void (* gLSetupFog)(bool enable);
extern void (* gLSetupLighting)(bool enable);
extern void (* gLSetupTexturing)(bool enable);
extern void (* useSingleGLContext)(bool useSingle);
extern void (* glimtkBegin)(GLIMTKMode mode);
extern void (* glimtkColor3f)(float r, float g, float b);
extern void (* glimtkColor4f)(float r, float g, float b, float a);
extern void (* glimtkColor4fv)(float * a);
extern void (* glimtkColor4ub)(byte r, byte g, byte b, byte a);
extern void (* glimtkEnd)(void);
extern void (* glimtkNormal3d)(double x, double y, double z);
extern void (* glimtkNormal3f)(float x, float y, float z);
extern void (* glimtkNormal3fd)(double * coords);
extern void (* glimtkNormal3fv)(float * coords);
extern void (* glimtkRecti)(int a, int b, int c, int d);
extern void (* glimtkTexCoord2d)(double x, double y);
extern void (* glimtkTexCoord2f)(float x, float y);
extern void (* glimtkTexCoord2fv)(float * a);
extern void (* glimtkTexCoord2i)(int x, int y);
extern void (* glimtkVertex2d)(double x, double y);
extern void (* glimtkVertex2f)(float x, float y);
extern void (* glimtkVertex2i)(int x, int y);
extern void (* glimtkVertex3d)(double x, double y, double z);
extern void (* glimtkVertex3dv)(double * coords);
extern void (* glimtkVertex3f)(float x, float y, float z);
extern void (* glimtkVertex3fv)(float * coords);
extern void (* glmsFlushMatrices)(void);
extern void (* glmsFrustum)(double l, double r, double b, double t, double n, double f);
extern void (* glmsGetDoublev)(GLMSWhatToGet what, double * i);
extern double (* glmsGetNearPlane)(void);
extern void (* glmsLoadIdentity)(void);
extern void (* glmsLoadMatrix)(Matrix * matrix);
extern void (* glmsLoadMatrixd)(double * i);
extern void (* glmsLoadMatrixf)(float * i);
extern void (* glmsMatrixMode)(MatrixMode mode);
extern void (* glmsMultMatrixd)(double * i);
extern void (* glmsOrtho)(double l, double r, double b, double t, double n, double f);
extern void (* glmsPopMatrix)(void);
extern void (* glmsPushMatrix)(void);
extern void (* glmsRotated)(double angle, double x, double y, double z);
extern void (* glmsScaled)(double a, double b, double c);
extern void (* glmsSetNearPlane)(double value);
extern void (* glmsTranslated)(double a, double b, double c);
extern void (* glsupLightModeli)(uint pname, int param);
extern void (* glsupLineStipple)(int i, uint16 j);
typedef struct Object Sphere;
typedef struct Object SkyBox;
typedef struct Object Cube;
extern bool (* Cube_create)(Cube * __this, DisplaySystem displaySystem);

extern Property * property_Cube_size;
extern void (* Cube_set_size)(Cube * c, const Vector3Df * value);

extern bool (* SkyBox_create)(SkyBox * __this, DisplaySystem displaySystem);

extern void (* SkyBox_render)(SkyBox * __this, Camera camera, Display display);

extern Property * property_SkyBox_size;
extern void (* SkyBox_set_size)(SkyBox * s, const Vector3Df * value);

extern Property * property_SkyBox_folder;
extern void (* SkyBox_set_folder)(SkyBox * s, const char * value);

extern Property * property_SkyBox_extension;
extern void (* SkyBox_set_extension)(SkyBox * s, const char * value);

extern Property * property_SkyBox_newStyle;
extern void (* SkyBox_set_newStyle)(SkyBox * s, bool value);

extern Property * property_SkyBox_cubeMap;
extern void (* SkyBox_set_cubeMap)(SkyBox * s, CubeMap value);

extern bool (* Sphere_create)(Sphere * __this, DisplaySystem displaySystem);

extern Property * property_Sphere_numLat;
extern void (* Sphere_set_numLat)(Sphere * s, int value);

extern Property * property_Sphere_numLon;
extern void (* Sphere_set_numLon)(Sphere * s, int value);

extern Property * property_Sphere_flattenedBody;
extern void (* Sphere_set_flattenedBody)(Sphere * s, float value);

typedef int MessageBoxType;
enum
{
   MessageBoxType_ok = 0x0,
   MessageBoxType_yesNo = 0x1,
   MessageBoxType_okCancel = 0x2,
   MessageBoxType_yesNoCancel = 0x3
};

typedef struct FileType FileType;
typedef int FileNameType;
enum
{
   FileNameType_folder = 0x0,
   FileNameType_folderOpen = 0x1,
   FileNameType_computer = 0x2,
   FileNameType_drive = 0x3,
   FileNameType_netDrive = 0x4,
   FileNameType_cdrom = 0x5,
   FileNameType_removable = 0x6,
   FileNameType_floppy = 0x7,
   FileNameType_network = 0x8,
   FileNameType_server = 0x9,
   FileNameType_share = 0xA,
   FileNameType_normalFile = 0xB,
   FileNameType_ewsFile = 0xC,
   FileNameType_epjFile = 0xD,
   FileNameType_ecFile = 0xE,
   FileNameType_ehFile = 0xF,
   FileNameType_cFile = 0x10,
   FileNameType_hFile = 0x11,
   FileNameType_cppFile = 0x12,
   FileNameType_hppFile = 0x13,
   FileNameType_textFile = 0x14,
   FileNameType_webFile = 0x15,
   FileNameType_pictureFile = 0x16,
   FileNameType_soundFile = 0x17,
   FileNameType_archiveFile = 0x18,
   FileNameType_packageFile = 0x19,
   FileNameType_opticalMediaImageFile = 0x1A
};

typedef int FileForceExtension;
enum
{
   FileForceExtension_never = 0x0,
   FileForceExtension_always = 0x1,
   FileForceExtension_whenNoneGiven = 0x2
};

typedef struct FileFilter FileFilter;
typedef int FileDialogType;
enum
{
   FileDialogType_open = 0x0,
   FileDialogType_save = 0x1,
   FileDialogType_selectDir = 0x2,
   FileDialogType_multiOpen = 0x3
};

typedef Window ColorPicker;
typedef Window CreateDirectoryDialog;
typedef Window FileDialog;
typedef struct FileName FileName;
typedef Window FindDialog;
typedef Window GoToDialog;
typedef Window MessageBox;
typedef Window ReplaceDialog;
typedef Window WindowList;
extern Property * property_ColorPicker_color;
extern void (* ColorPicker_set_color)(ColorPicker c, Color value);
extern Color (* ColorPicker_get_color)(ColorPicker c);

extern Property * property_ColorPicker_hasAlpha;
extern void (* ColorPicker_set_hasAlpha)(ColorPicker c, bool value);
extern bool (* ColorPicker_get_hasAlpha)(ColorPicker c);

extern Property * property_CreateDirectoryDialog_currentDirectory;
extern void (* CreateDirectoryDialog_set_currentDirectory)(CreateDirectoryDialog c, const char * value);
extern const char * (* CreateDirectoryDialog_get_currentDirectory)(CreateDirectoryDialog c);

extern Property * property_FileDialog_type;
extern void (* FileDialog_set_type)(FileDialog f, FileDialogType value);
extern FileDialogType (* FileDialog_get_type)(FileDialog f);

extern Property * property_FileDialog_filePath;
extern void (* FileDialog_set_filePath)(FileDialog f, const char * value);
extern const char * (* FileDialog_get_filePath)(FileDialog f);

extern Property * property_FileDialog_currentDirectory;
extern void (* FileDialog_set_currentDirectory)(FileDialog f, const char * value);
extern const char * (* FileDialog_get_currentDirectory)(FileDialog f);

extern Property * property_FileDialog_filters;
extern void (* FileDialog_set_filters)(FileDialog f, FileFilter * value);
extern FileFilter * (* FileDialog_get_filters)(FileDialog f);

extern Property * property_FileDialog_types;
extern void (* FileDialog_set_types)(FileDialog f, FileType * value);
extern FileType * (* FileDialog_get_types)(FileDialog f);

extern Property * property_FileDialog_sizeFilters;
extern void (* FileDialog_set_sizeFilters)(FileDialog f, int value);
extern int (* FileDialog_get_sizeFilters)(FileDialog f);

extern Property * property_FileDialog_sizeTypes;
extern void (* FileDialog_set_sizeTypes)(FileDialog f, int value);
extern int (* FileDialog_get_sizeTypes)(FileDialog f);

extern Property * property_FileDialog_filter;
extern void (* FileDialog_set_filter)(FileDialog f, int value);
extern int (* FileDialog_get_filter)(FileDialog f);

extern Property * property_FileDialog_fileType;
extern void (* FileDialog_set_fileType)(FileDialog f, int value);
extern int (* FileDialog_get_fileType)(FileDialog f);

extern Property * property_FileDialog_mayNotExist;
extern void (* FileDialog_set_mayNotExist)(FileDialog f, bool value);
extern bool (* FileDialog_get_mayNotExist)(FileDialog f);

extern Property * property_FileDialog_numSelections;
extern int (* FileDialog_get_numSelections)(FileDialog f);

extern Property * property_FileDialog_multiFilePaths;
extern const char ** (* FileDialog_get_multiFilePaths)(FileDialog f);

struct FileFilter
{
   const char * name;
   const char * extensions;
};
extern bool (* FileFilter_validateFileName)(FileFilter * __this, const char * name);

struct FileName
{
   const char * name;
   FileNameType type;
   int indent;
};
extern FileNameType (* FileNameType_selectByExtension)(const char * extension);

extern Property * property_FileNameType_isFolderType;
extern bool (* FileNameType_get_isFolderType)(FileNameType f);

extern Property * property_FileNameType_isFileType;
extern bool (* FileNameType_get_isFileType)(FileNameType f);

struct FileType
{
   const char * name;
   const char * typeExtension;
   FileForceExtension forceExtension;
};
extern Property * property_FindDialog_editBox;
extern void (* FindDialog_set_editBox)(FindDialog f, EditBox value);

extern Property * property_FindDialog_searchString;
extern void (* FindDialog_set_searchString)(FindDialog f, const char * value);
extern const char * (* FindDialog_get_searchString)(FindDialog f);

extern Property * property_FindDialog_wholeWord;
extern void (* FindDialog_set_wholeWord)(FindDialog f, bool value);
extern bool (* FindDialog_get_wholeWord)(FindDialog f);

extern Property * property_FindDialog_matchCase;
extern void (* FindDialog_set_matchCase)(FindDialog f, bool value);
extern bool (* FindDialog_get_matchCase)(FindDialog f);

extern Property * property_FindDialog_searchUp;
extern void (* FindDialog_set_searchUp)(FindDialog f, bool value);
extern bool (* FindDialog_get_searchUp)(FindDialog f);

extern Property * property_GoToDialog_line;
extern void (* GoToDialog_set_line)(GoToDialog g, int value);
extern int (* GoToDialog_get_line)(GoToDialog g);

extern Property * property_GoToDialog_editBox;
extern void (* GoToDialog_set_editBox)(GoToDialog g, EditBox value);
extern EditBox (* GoToDialog_get_editBox)(GoToDialog g);

extern Property * property_MessageBox_type;
extern void (* MessageBox_set_type)(MessageBox m, MessageBoxType value);

extern Property * property_MessageBox_contents;
extern void (* MessageBox_set_contents)(MessageBox m, const char * value);

extern Property * property_ReplaceDialog_editBox;
extern void (* ReplaceDialog_set_editBox)(ReplaceDialog r, EditBox value);

extern Property * property_ReplaceDialog_searchString;
extern void (* ReplaceDialog_set_searchString)(ReplaceDialog r, const char * value);
extern const char * (* ReplaceDialog_get_searchString)(ReplaceDialog r);

extern Property * property_ReplaceDialog_replaceString;
extern void (* ReplaceDialog_set_replaceString)(ReplaceDialog r, const char * value);
extern const char * (* ReplaceDialog_get_replaceString)(ReplaceDialog r);

extern Property * property_ReplaceDialog_wholeWord;
extern void (* ReplaceDialog_set_wholeWord)(ReplaceDialog r, bool value);
extern bool (* ReplaceDialog_get_wholeWord)(ReplaceDialog r);

extern Property * property_ReplaceDialog_matchCase;
extern void (* ReplaceDialog_set_matchCase)(ReplaceDialog r, bool value);
extern bool (* ReplaceDialog_get_matchCase)(ReplaceDialog r);

typedef Instance UndoBuffer;
typedef struct UndoAction UndoAction;
typedef int TabsPlacement;
enum
{
   TabsPlacement_top = 0x0,
   TabsPlacement_bottom = 0x1,
   TabsPlacement_left = 0x2,
   TabsPlacement_right = 0x3
};

typedef Window TabControl;
typedef Window Tab;
struct class_members_SyntaxColorScheme
{
   Color commentColor;
   Color charLiteralColor;
   Color stringLiteralColor;
   Color preprocessorColor;
   Color numberColor;
};
typedef Instance SyntaxColorScheme;
typedef Instance StatusField;
typedef Window StatusBar;
typedef Window Stacker;
struct class_members_SelectorButton
{
   Window focusHolder;
};
typedef Button SelectorButton;
typedef Stacker SelectorBar;
typedef int ScrollDirection;
enum
{
   ScrollDirection_horizontal = 0x0,
   ScrollDirection_vertical = 0x1
};

typedef int ScrollBarAction;
enum
{
   ScrollBarAction_none = 0x0,
   ScrollBarAction_up = 0x1,
   ScrollBarAction_down = 0x2,
   ScrollBarAction_pageDown = 0x3,
   ScrollBarAction_pageUp = 0x4,
   ScrollBarAction_setPosition = 0x5,
   ScrollBarAction_home = 0x6,
   ScrollBarAction_end = 0x7,
   ScrollBarAction_setRange = 0x8,
   ScrollBarAction_wheelUp = 0x9,
   ScrollBarAction_wheelDown = 0xA
};

typedef CommonControl ScrollBar;
typedef int PathTypeExpected;
enum
{
   PathTypeExpected_none = 0x0,
   PathTypeExpected_any = 0x1,
   PathTypeExpected_directory = 0x2,
   PathTypeExpected_file = 0x3
};

typedef CommonControl PathBox;
typedef Window PaneSplitter;
typedef Instance MenuItem;
typedef Instance Menu;
struct class_members_ListBox
{
   byte __ecerePrivateData0[128];
   double typingTimeOut;
};
typedef CommonControl ListBox;
typedef String FilePath;
typedef SelectorButton EditableSelectorButton;
typedef struct EditLine EditLine;
typedef File EditBoxStream;
typedef int EditBoxFindResult;
enum
{
   EditBoxFindResult_notFound = 0x0,
   EditBoxFindResult_found = 0x1,
   EditBoxFindResult_wrapped = 0x2
};

typedef CommonControl DropBox;
typedef CommonControl DirectoriesBox;
typedef Instance DataRow;
typedef Instance DataField;
typedef CommonControl CalendarControl;
typedef int ButtonState;
enum
{
   ButtonState_up = 0x0,
   ButtonState_down = 0x1,
   ButtonState_over = 0x2,
   ButtonState_disabled = 0x3,
   ButtonState_upChecked = 0x4,
   ButtonState_downChecked = 0x5,
   ButtonState_overChecked = 0x6,
   ButtonState_disabledChecked = 0x7
};

typedef struct BufferLocation BufferLocation;
typedef int BoxAlignment;
enum
{
   BoxAlignment_center = 0x0,
   BoxAlignment_left = 0x1,
   BoxAlignment_right = 0x2,
   BoxAlignment_top = 0x3,
   BoxAlignment_bottom = 0x4
};

typedef float Percentage;
typedef uint32 Modifiers;
typedef uint32 Key;
typedef uint32 DataDisplayFlags;
typedef FilePath DirPath;
typedef CommonControl Label;
typedef MenuItem MenuDivider;
typedef MenuItem MenuPlacement;
typedef Instance OldArray;
typedef CommonControl Picture;
typedef Window PopupMenu;
typedef CommonControl ProgressBar;
typedef DataBox SavingDataBox;
typedef Stacker ToolBar;
typedef Button ToolButton;
typedef Window ToolSeparator;
typedef Window ToolTip;
struct BufferLocation
{
   EditLine * line;
   int y;
   int x;
};
extern void (* BufferLocation_adjustAdd)(BufferLocation * __this, BufferLocation * start, BufferLocation * end);

extern void (* BufferLocation_adjustDelete)(BufferLocation * __this, BufferLocation * start, BufferLocation * end);

extern int Button_notifyClicked_vTblID;
bool Button_notifyClicked(Button __i, Window __t, Button button, int x, int y, Modifiers mods);
extern Method * method_Button_notifyClicked;

extern int Button_notifyDoubleClick_vTblID;
bool Button_notifyDoubleClick(Button __i, Window __t, Button button, int x, int y, Modifiers mods);
extern Method * method_Button_notifyDoubleClick;

extern int Button_notifyMouseLeave_vTblID;
bool Button_notifyMouseLeave(Button __i, Window __t, Button button, Modifiers mods);
extern Method * method_Button_notifyMouseLeave;

extern int Button_notifyMouseMove_vTblID;
bool Button_notifyMouseMove(Button __i, Window __t, Button button, int x, int y, Modifiers mods);
extern Method * method_Button_notifyMouseMove;

extern int Button_notifyMouseOver_vTblID;
bool Button_notifyMouseOver(Button __i, Window __t, Button button, int x, int y, Modifiers mods);
extern Method * method_Button_notifyMouseOver;

extern int Button_notifyPushed_vTblID;
bool Button_notifyPushed(Button __i, Window __t, Button button, int x, int y, Modifiers mods);
extern Method * method_Button_notifyPushed;

extern int Button_notifyReleased_vTblID;
bool Button_notifyReleased(Button __i, Window __t, Button button, int x, int y, Modifiers mods);
extern Method * method_Button_notifyReleased;

extern void (* Button_removeRadio)(Button __this);

extern void (* Button_setColor)(Button __this, ButtonState state, Color value);

extern void (* Button_setTextColor)(Button __this, ButtonState state, Color value);

extern Property * property_Button_opacity;
extern void (* Button_set_opacity)(Button b, Percentage value);
extern Percentage (* Button_get_opacity)(Button b);
extern bool (* Button_isSet_opacity)(Button b);

extern Property * property_Button_drawBehind;
extern void (* Button_set_drawBehind)(Button b, bool value);
extern bool (* Button_get_drawBehind)(Button b);
extern bool (* Button_isSet_drawBehind)(Button b);

extern Property * property_Button_isRadio;
extern void (* Button_set_isRadio)(Button b, bool value);
extern bool (* Button_get_isRadio)(Button b);

extern Property * property_Button_isCheckbox;
extern void (* Button_set_isCheckbox)(Button b, bool value);
extern bool (* Button_get_isCheckbox)(Button b);

extern Property * property_Button_bevel;
extern void (* Button_set_bevel)(Button b, bool value);
extern bool (* Button_get_bevel)(Button b);

extern Property * property_Button_bevelOver;
extern void (* Button_set_bevelOver)(Button b, bool value);
extern bool (* Button_get_bevelOver)(Button b);

extern Property * property_Button_toggle;
extern void (* Button_set_toggle)(Button b, bool value);
extern bool (* Button_get_toggle)(Button b);

extern Property * property_Button_checked;
extern void (* Button_set_checked)(Button b, bool value);
extern bool (* Button_get_checked)(Button b);

extern Property * property_Button_alignment;
extern void (* Button_set_alignment)(Button b, Alignment value);
extern Alignment (* Button_get_alignment)(Button b);

extern Property * property_Button_bitmap;
extern void (* Button_set_bitmap)(Button b, BitmapResource value);
extern BitmapResource (* Button_get_bitmap)(Button b);

extern Property * property_Button_stayUp;
extern void (* Button_set_stayUp)(Button b, bool value);
extern bool (* Button_get_stayUp)(Button b);

extern Property * property_Button_scaleBitmap;
extern void (* Button_set_scaleBitmap)(Button b, bool value);
extern bool (* Button_get_scaleBitmap)(Button b);

extern Property * property_Button_keyRepeat;
extern void (* Button_set_keyRepeat)(Button b, bool value);
extern bool (* Button_get_keyRepeat)(Button b);

extern Property * property_Button_symbol;
extern void (* Button_set_symbol)(Button b, unichar value);
extern unichar (* Button_get_symbol)(Button b);

extern Property * property_Button_ellipsis;
extern void (* Button_set_ellipsis)(Button b, bool value);
extern bool (* Button_get_ellipsis)(Button b);

extern Property * property_Button_stayDown;
extern void (* Button_set_stayDown)(Button b, bool value);
extern bool (* Button_get_stayDown)(Button b);

extern Property * property_Button_offset;
extern void (* Button_set_offset)(Button b, bool value);
extern bool (* Button_get_offset)(Button b);

extern Property * property_Button_buttonState;
extern void (* Button_set_buttonState)(Button b, ButtonState value);
extern ButtonState (* Button_get_buttonState)(Button b);

extern Property * property_Button_bitmapAlignment;
extern void (* Button_set_bitmapAlignment)(Button b, BoxAlignment value);
extern BoxAlignment (* Button_get_bitmapAlignment)(Button b);

struct class_members_CalendarControl
{
   Date dateValue;
   Month shownMonth;
   int shownYear;
};
extern int CalendarControl_notifyChanged_vTblID;
void CalendarControl_notifyChanged(CalendarControl __i, Window __t, CalendarControl calendarControl, bool close);
extern Method * method_CalendarControl_notifyChanged;

struct class_members_DataBox
{
   Class * type;
   void * data;
   void * fieldData;
   Window editor;
   bool readOnly;
   bool keepEditor;
   bool autoSize;
   bool needUpdate;
   String stringValue;
};
extern void (* DataBox_modified)(DataBox __this);

extern int DataBox_notifyChanged_vTblID;
bool DataBox_notifyChanged(DataBox __i, Window __t, DataBox dataBox, bool closingDropDown);
extern Method * method_DataBox_notifyChanged;

extern int DataBox_notifyModified_vTblID;
bool DataBox_notifyModified(DataBox __i, Window __t);
extern Method * method_DataBox_notifyModified;

extern int DataBox_onConfigure_vTblID;
void DataBox_onConfigure(DataBox __i, Window editor);
extern Method * method_DataBox_onConfigure;

extern void (* DataBox_refresh)(DataBox __this);

extern bool (* DataBox_saveData)(DataBox __this);

extern int DataBox_setData_vTblID;
void DataBox_setData(DataBox __i, any_object newData, bool closingDropDown);
extern Method * method_DataBox_setData;

#define DATADISPLAYFLAGS_selected_SHIFT                  0
#define DATADISPLAYFLAGS_selected_MASK                   0x1
#define DATADISPLAYFLAGS_fullRow_SHIFT                   1
#define DATADISPLAYFLAGS_fullRow_MASK                    0x2
#define DATADISPLAYFLAGS_current_SHIFT                   2
#define DATADISPLAYFLAGS_current_MASK                    0x4
#define DATADISPLAYFLAGS_active_SHIFT                    3
#define DATADISPLAYFLAGS_active_MASK                     0x8
#define DATADISPLAYFLAGS_dropBox_SHIFT                   4
#define DATADISPLAYFLAGS_dropBox_MASK                    0x10
#define DATADISPLAYFLAGS_header_SHIFT                    5
#define DATADISPLAYFLAGS_header_MASK                     0x20
#define DATADISPLAYFLAGS_firstField_SHIFT                6
#define DATADISPLAYFLAGS_firstField_MASK                 0x40


extern void (* DataField_autoSize)(DataField __this);

extern void (* DataField_move)(DataField __this, DataField after);

extern Property * property_DataField_dataType;
extern void (* DataField_set_dataType)(DataField d, Class * value);
extern Class * (* DataField_get_dataType)(DataField d);

extern Property * property_DataField_editable;
extern void (* DataField_set_editable)(DataField d, bool value);

extern Property * property_DataField_fixed;
extern void (* DataField_set_fixed)(DataField d, bool value);
extern bool (* DataField_get_fixed)(DataField d);

extern Property * property_DataField_alignment;
extern void (* DataField_set_alignment)(DataField d, Alignment value);
extern Alignment (* DataField_get_alignment)(DataField d);

extern Property * property_DataField_width;
extern void (* DataField_set_width)(DataField d, int value);
extern int (* DataField_get_width)(DataField d);

extern Property * property_DataField_index;
extern int (* DataField_get_index)(DataField d);

extern Property * property_DataField_position;
extern void (* DataField_set_position)(DataField d, int value);
extern int (* DataField_get_position)(DataField d);

extern Property * property_DataField_sortOrder;
extern int (* DataField_get_sortOrder)(DataField d);

extern Property * property_DataField_header;
extern void (* DataField_set_header)(DataField d, const char * value);

extern Property * property_DataField_userData;
extern void (* DataField_set_userData)(DataField d, void * value);
extern void * (* DataField_get_userData)(DataField d);

extern Property * property_DataField_freeData;
extern void (* DataField_set_freeData)(DataField d, bool value);
extern bool (* DataField_get_freeData)(DataField d);

extern Property * property_DataField_prev;
extern DataField (* DataField_get_prev)(DataField d);

extern Property * property_DataField_next;
extern DataField (* DataField_get_next)(DataField d);

extern DataRow (* DataRow_addRow)(DataRow __this);

extern DataRow (* DataRow_addRowAfter)(DataRow __this, DataRow after);

extern DataRow (* DataRow_addString)(DataRow __this, const char * string);

extern DataRow (* DataRow_addStringf)(DataRow __this, const char * format, ...);

extern void (* DataRow_edit)(DataRow __this, DataField field);

extern DataRow (* DataRow_findRow)(DataRow __this, int64 tag);

extern DataRow (* DataRow_findSubRow)(DataRow __this, int64 tag);

extern any_object (* DataRow_getData)(DataRow __this, DataField field);

extern DataRow (* DataRow_getNextRow)(DataRow __this);

extern DataRow (* DataRow_getPrevRow)(DataRow __this);

extern void (* DataRow_move)(DataRow __this, DataRow after);

extern void * (* DataRow_setData)(DataRow __this, DataField field, any_object newData);

extern void (* DataRow_sortSubRows)(DataRow __this, bool scrollToCurrent);

extern void (* DataRow_unsetData)(DataRow __this, DataField field);

extern Property * property_DataRow_tag;
extern void (* DataRow_set_tag)(DataRow d, int64 value);
extern int64 (* DataRow_get_tag)(DataRow d);

extern Property * property_DataRow_previous;
extern DataRow (* DataRow_get_previous)(DataRow d);

extern Property * property_DataRow_next;
extern DataRow (* DataRow_get_next)(DataRow d);

extern Property * property_DataRow_index;
extern int (* DataRow_get_index)(DataRow d);

extern Property * property_DataRow_string;
extern void (* DataRow_set_string)(DataRow d, const char * value);
extern const char * (* DataRow_get_string)(DataRow d);

extern Property * property_DataRow_isHeader;
extern void (* DataRow_set_isHeader)(DataRow d, bool value);
extern bool (* DataRow_get_isHeader)(DataRow d);

extern Property * property_DataRow_icon;
extern void (* DataRow_set_icon)(DataRow d, BitmapResource value);
extern BitmapResource (* DataRow_get_icon)(DataRow d);

extern Property * property_DataRow_collapsed;
extern void (* DataRow_set_collapsed)(DataRow d, bool value);
extern bool (* DataRow_get_collapsed)(DataRow d);

extern Property * property_DataRow_selected;
extern void (* DataRow_set_selected)(DataRow d, bool value);
extern bool (* DataRow_get_selected)(DataRow d);

extern Property * property_DataRow_parent;
extern void (* DataRow_set_parent)(DataRow d, DataRow value);
extern DataRow (* DataRow_get_parent)(DataRow d);

extern Property * property_DataRow_lastRow;
extern DataRow (* DataRow_get_lastRow)(DataRow d);

extern Property * property_DataRow_firstRow;
extern DataRow (* DataRow_get_firstRow)(DataRow d);

struct class_members_DirectoriesBox
{
   byte __ecerePrivateData0[16];
   bool browsing;
   Button add;
   Button remove;
   RepButton up;
   RepButton down;
   ListBox list;
   DataField dirField;
};
extern int DirectoriesBox_notifyModified_vTblID;
bool DirectoriesBox_notifyModified(DirectoriesBox __i, Window __t, DirectoriesBox dirsBox);
extern Method * method_DirectoriesBox_notifyModified;

extern int DirectoriesBox_notifyPathBoxModified_vTblID;
bool DirectoriesBox_notifyPathBoxModified(DirectoriesBox __i, Window __t, DirectoriesBox dirsBox, PathBox pathBox);
extern Method * method_DirectoriesBox_notifyPathBoxModified;

extern int DirectoriesBox_onBrowsedDir_vTblID;
bool DirectoriesBox_onBrowsedDir(DirectoriesBox __i, char ** directory);
extern Method * method_DirectoriesBox_onBrowsedDir;

extern int DirectoriesBox_onChangedDir_vTblID;
bool DirectoriesBox_onChangedDir(DirectoriesBox __i, char ** directory);
extern Method * method_DirectoriesBox_onChangedDir;

extern int DirectoriesBox_onPrepareBrowseDir_vTblID;
bool DirectoriesBox_onPrepareBrowseDir(DirectoriesBox __i, char ** directory);
extern Method * method_DirectoriesBox_onPrepareBrowseDir;

extern Property * property_DirectoriesBox_strings;
extern void (* DirectoriesBox_set_strings)(DirectoriesBox d, Array value);
extern Array (* DirectoriesBox_get_strings)(DirectoriesBox d);

extern Property * property_DirectoriesBox_browseDialog;
extern void (* DirectoriesBox_set_browseDialog)(DirectoriesBox d, FileDialog value);
extern FileDialog (* DirectoriesBox_get_browseDialog)(DirectoriesBox d);

extern Property * property_DirectoriesBox_baseBrowsePath;
extern void (* DirectoriesBox_set_baseBrowsePath)(DirectoriesBox d, String value);
extern String (* DirectoriesBox_get_baseBrowsePath)(DirectoriesBox d);

struct class_members_DropBox
{
   Button button;
};
extern void (* DropBox_addField)(DropBox __this, DataField field);

extern DataRow (* DropBox_addRow)(DropBox __this);

extern DataRow (* DropBox_addRowAfter)(DropBox __this, DataRow after);

extern DataRow (* DropBox_addString)(DropBox __this, const char * string);

extern DataRow (* DropBox_addStringf)(DropBox __this, const char * format, ...);

extern void (* DropBox_clear)(DropBox __this);

extern void (* DropBox_deleteRow)(DropBox __this, DataRow row);

extern DataRow (* DropBox_findRow)(DropBox __this, int64 tag);

extern DataRow (* DropBox_findSubRow)(DropBox __this, int64 tag);

extern any_object (* DropBox_getData)(DropBox __this, DataField field);

extern int (* DropBox_getRowCount)(DropBox __this);

extern int64 (* DropBox_getTag)(DropBox __this);

extern int DropBox_notifyClose_vTblID;
bool DropBox_notifyClose(DropBox __i, Window __t, DropBox dropBox);
extern Method * method_DropBox_notifyClose;

extern int DropBox_notifyHighlight_vTblID;
bool DropBox_notifyHighlight(DropBox __i, Window __t, DropBox dropBox, DataRow row, Modifiers mods);
extern Method * method_DropBox_notifyHighlight;

extern int DropBox_notifySelect_vTblID;
bool DropBox_notifySelect(DropBox __i, Window __t, DropBox dropBox, DataRow row, Modifiers mods);
extern Method * method_DropBox_notifySelect;

extern int DropBox_notifyTextEntry_vTblID;
bool DropBox_notifyTextEntry(DropBox __i, Window __t, DropBox dropBox, const char * string, bool confirmed);
extern Method * method_DropBox_notifyTextEntry;

extern int DropBox_onCloseDropDown_vTblID;
void DropBox_onCloseDropDown(DropBox __i, Window pullDown);
extern Method * method_DropBox_onCloseDropDown;

extern int DropBox_onDropDown_vTblID;
Window DropBox_onDropDown(DropBox __i);
extern Method * method_DropBox_onDropDown;

extern bool (* DropBox_save)(DropBox __this);

extern void (* DropBox_selectRow)(DropBox __this, DataRow row);

extern void * (* DropBox_setData)(DropBox __this, DataField field, any_object data);

extern void (* DropBox_sort)(DropBox __this, DataField field, int order);

extern Property * property_DropBox_activeStipple;
extern void (* DropBox_set_activeStipple)(DropBox d, bool value);
extern bool (* DropBox_get_activeStipple)(DropBox d);

extern Property * property_DropBox_showButton;
extern void (* DropBox_set_showButton)(DropBox d, bool value);
extern bool (* DropBox_get_showButton)(DropBox d);

extern Property * property_DropBox_alignment;
extern void (* DropBox_set_alignment)(DropBox d, Alignment value);
extern Alignment (* DropBox_get_alignment)(DropBox d);

extern Property * property_DropBox_noHighlight;
extern void (* DropBox_set_noHighlight)(DropBox d, bool value);
extern bool (* DropBox_get_noHighlight)(DropBox d);

extern Property * property_DropBox_activeColor;
extern void (* DropBox_set_activeColor)(DropBox d, bool value);
extern bool (* DropBox_get_activeColor)(DropBox d);

extern Property * property_DropBox_currentRow;
extern void (* DropBox_set_currentRow)(DropBox d, DataRow value);
extern DataRow (* DropBox_get_currentRow)(DropBox d);

extern Property * property_DropBox_firstRow;
extern DataRow (* DropBox_get_firstRow)(DropBox d);

extern Property * property_DropBox_lastRow;
extern DataRow (* DropBox_get_lastRow)(DropBox d);

extern Property * property_DropBox_contents;
extern void (* DropBox_set_contents)(DropBox d, const char * value);
extern const char * (* DropBox_get_contents)(DropBox d);

extern Property * property_DropBox_editText;
extern void (* DropBox_set_editText)(DropBox d, bool value);
extern bool (* DropBox_get_editText)(DropBox d);

extern Property * property_DropBox_editBox;
extern EditBox (* DropBox_get_editBox)(DropBox d);

extern Property * property_DropBox_typingTimeout;
extern void (* DropBox_set_typingTimeout)(DropBox d, Time value);
extern Time (* DropBox_get_typingTimeout)(DropBox d);

extern Property * property_DropBox_rowHeight;
extern void (* DropBox_set_rowHeight)(DropBox d, int value);
extern int (* DropBox_get_rowHeight)(DropBox d);

extern Property * property_DropBox_maxShown;
extern void (* DropBox_set_maxShown)(DropBox d, int value);
extern int (* DropBox_get_maxShown)(DropBox d);

extern Property * property_DropBox_pullDown;
extern Window (* DropBox_get_pullDown)(DropBox d);

extern Property * property_DropBox_showNone;
extern void (* DropBox_set_showNone)(DropBox d, bool value);
extern bool (* DropBox_get_showNone)(DropBox d);

extern Property * property_DropBox_selectionColor;
extern void (* DropBox_set_selectionColor)(DropBox d, Color value);
extern Color (* DropBox_get_selectionColor)(DropBox d);
extern bool (* DropBox_isSet_selectionColor)(DropBox d);

extern Property * property_DropBox_selectionText;
extern void (* DropBox_set_selectionText)(DropBox d, Color value);
extern Color (* DropBox_get_selectionText)(DropBox d);
extern bool (* DropBox_isSet_selectionText)(DropBox d);

extern Property * property_DropBox_changeContents;
extern void (* DropBox_set_changeContents)(DropBox d, bool value);
extern bool (* DropBox_get_changeContents)(DropBox d);

extern Property * property_DropBox_listBox;
extern ListBox (* DropBox_get_listBox)(DropBox d);

extern Property * property_DropBox_rowCount;
extern int (* DropBox_get_rowCount)(DropBox d);

extern bool (* EditBox_addCh)(EditBox __this, unichar ch);

extern bool (* EditBox_addS)(EditBox __this, const char * string);

extern void (* EditBox_backSpace)(EditBox __this);

extern void (* EditBox_centerOnCursor)(EditBox __this);

extern void (* EditBox_clear)(EditBox __this);

extern void (* EditBox_clearLine)(EditBox __this);

extern void (* EditBox_copy)(EditBox __this);

extern void (* EditBox_cut)(EditBox __this);

extern void (* EditBox_delete)(EditBox __this, EditLine * line1, int y1, int x1, EditLine * line2, int y2, int x2);

extern void (* EditBox_deleteSelection)(EditBox __this);

extern void (* EditBox_deselect)(EditBox __this);

extern void (* EditBox_end)(EditBox __this);

extern EditBoxFindResult (* EditBox_find)(EditBox __this, const char * text, bool matchWord, bool matchCase, bool isSearchDown);

extern EditBoxFindResult (* EditBox_findInSelection)(EditBox __this, const char * text, bool matchWord, bool matchCase, EditLine * l2, int y2, int x2);

extern void (* EditBox_getSel)(EditBox __this, char * text, bool addCr);

extern void (* EditBox_getSelPos)(EditBox __this, EditLine * l1, int * y1, int * x1, EditLine * l2, int * y2, int * x2, bool reorder);

extern int (* EditBox_getText)(EditBox __this, char * text, EditLine * _l1, int _y1, int _x1, EditLine * _l2, int _y2, int _x2, bool addCr, bool addSpaces);

extern bool (* EditBox_goToLineNum)(EditBox __this, int lineNum);

extern bool (* EditBox_goToPosition)(EditBox __this, EditLine * line, int y, int x);

extern void (* EditBox_home)(EditBox __this);

extern void (* EditBox_lineDown)(EditBox __this);

extern void (* EditBox_lineUp)(EditBox __this);

extern void (* EditBox_load)(EditBox __this, File f);

extern void (* EditBox_modified)(EditBox __this);

extern int EditBox_notifyCaretMove_vTblID;
void EditBox_notifyCaretMove(EditBox __i, Window __t, EditBox editBox, int line, int charPos);
extern Method * method_EditBox_notifyCaretMove;

extern int EditBox_notifyCharsAdded_vTblID;
bool EditBox_notifyCharsAdded(EditBox __i, Window __t, EditBox editBox, BufferLocation * before, BufferLocation * after, bool pasteOperation);
extern Method * method_EditBox_notifyCharsAdded;

extern int EditBox_notifyCharsDeleted_vTblID;
bool EditBox_notifyCharsDeleted(EditBox __i, Window __t, EditBox editBox, BufferLocation * beforeLoc, BufferLocation * after, bool pasteOperation);
extern Method * method_EditBox_notifyCharsDeleted;

extern int EditBox_notifyDoubleClick_vTblID;
bool EditBox_notifyDoubleClick(EditBox __i, Window __t, EditBox editBox, EditLine * line, Modifiers mods);
extern Method * method_EditBox_notifyDoubleClick;

extern int EditBox_notifyDropped_vTblID;
bool EditBox_notifyDropped(EditBox __i, Window __t, EditBox editBox, int x, int y);
extern Method * method_EditBox_notifyDropped;

extern int EditBox_notifyKeyDown_vTblID;
bool EditBox_notifyKeyDown(EditBox __i, Window __t, EditBox editBox, Key key, unichar ch);
extern Method * method_EditBox_notifyKeyDown;

extern int EditBox_notifyModified_vTblID;
bool EditBox_notifyModified(EditBox __i, Window __t, EditBox editBox);
extern Method * method_EditBox_notifyModified;

extern int EditBox_notifyOvrToggle_vTblID;
void EditBox_notifyOvrToggle(EditBox __i, Window __t, EditBox editBox, bool overwrite);
extern Method * method_EditBox_notifyOvrToggle;

extern int EditBox_notifyUnsetModified_vTblID;
bool EditBox_notifyUnsetModified(EditBox __i, Window __t, EditBox editBox);
extern Method * method_EditBox_notifyUnsetModified;

extern int EditBox_notifyUpdate_vTblID;
void EditBox_notifyUpdate(EditBox __i, Window __t, EditBox editBox);
extern Method * method_EditBox_notifyUpdate;

extern void (* EditBox_pageDown)(EditBox __this);

extern void (* EditBox_pageUp)(EditBox __this);

extern void (* EditBox_paste)(EditBox __this);

extern void (* EditBox_printf)(EditBox __this, const char * format, ...);

extern void (* EditBox_putCh)(EditBox __this, unichar ch);

extern void (* EditBox_putS)(EditBox __this, const char * string);

extern void (* EditBox_record)(EditBox __this, UndoAction * action);

extern void (* EditBox_redo)(EditBox __this);

extern void (* EditBox_save)(EditBox __this, File f, bool cr);

extern uint (* EditBox_selSize)(EditBox __this);

extern void (* EditBox_select)(EditBox __this, EditLine * line1, int y1, int x1, EditLine * line2, int y2, int x2);

extern void (* EditBox_selectAll)(EditBox __this);

extern void (* EditBox_setContents)(EditBox __this, const char * format, ...);

extern void (* EditBox_setCursorToView)(EditBox __this);

extern void (* EditBox_setModified)(EditBox __this, bool flag);

extern void (* EditBox_setSelPos)(EditBox __this, EditLine * l1, int y1, int x1, EditLine * l2, int y2, int x2);

extern void (* EditBox_setViewToCursor)(EditBox __this, bool setCaret);

extern void (* EditBox_undo)(EditBox __this);

extern Property * property_EditBox_textHorzScroll;
extern void (* EditBox_set_textHorzScroll)(EditBox e, bool value);
extern bool (* EditBox_get_textHorzScroll)(EditBox e);

extern Property * property_EditBox_textVertScroll;
extern void (* EditBox_set_textVertScroll)(EditBox e, bool value);
extern bool (* EditBox_get_textVertScroll)(EditBox e);

extern Property * property_EditBox_readOnly;
extern void (* EditBox_set_readOnly)(EditBox e, bool value);
extern bool (* EditBox_get_readOnly)(EditBox e);

extern Property * property_EditBox_multiLine;
extern void (* EditBox_set_multiLine)(EditBox e, bool value);
extern bool (* EditBox_get_multiLine)(EditBox e);

extern Property * property_EditBox_freeCaret;
extern void (* EditBox_set_freeCaret)(EditBox e, bool value);
extern bool (* EditBox_get_freeCaret)(EditBox e);

extern Property * property_EditBox_tabKey;
extern void (* EditBox_set_tabKey)(EditBox e, bool value);
extern bool (* EditBox_get_tabKey)(EditBox e);

extern Property * property_EditBox_tabSize;
extern void (* EditBox_set_tabSize)(EditBox e, int value);
extern int (* EditBox_get_tabSize)(EditBox e);

extern Property * property_EditBox_tabSelection;
extern void (* EditBox_set_tabSelection)(EditBox e, bool value);
extern bool (* EditBox_get_tabSelection)(EditBox e);

extern Property * property_EditBox_smartHome;
extern void (* EditBox_set_smartHome)(EditBox e, bool value);
extern bool (* EditBox_get_smartHome)(EditBox e);

extern Property * property_EditBox_autoEmpty;
extern void (* EditBox_set_autoEmpty)(EditBox e, bool value);
extern bool (* EditBox_get_autoEmpty)(EditBox e);

extern Property * property_EditBox_noCaret;
extern void (* EditBox_set_noCaret)(EditBox e, bool value);
extern bool (* EditBox_get_noCaret)(EditBox e);

extern Property * property_EditBox_maxLineSize;
extern void (* EditBox_set_maxLineSize)(EditBox e, int value);
extern int (* EditBox_get_maxLineSize)(EditBox e);

extern Property * property_EditBox_maxNumLines;
extern void (* EditBox_set_maxNumLines)(EditBox e, int value);
extern int (* EditBox_get_maxNumLines)(EditBox e);

extern Property * property_EditBox_useTab;
extern void (* EditBox_set_useTab)(EditBox e, bool value);
extern bool (* EditBox_get_useTab)(EditBox e);

extern Property * property_EditBox_syntaxHighlighting;
extern void (* EditBox_set_syntaxHighlighting)(EditBox e, bool value);
extern bool (* EditBox_get_syntaxHighlighting)(EditBox e);

extern Property * property_EditBox_noSelect;
extern void (* EditBox_set_noSelect)(EditBox e, bool value);
extern bool (* EditBox_get_noSelect)(EditBox e);

extern Property * property_EditBox_allCaps;
extern void (* EditBox_set_allCaps)(EditBox e, bool value);
extern bool (* EditBox_get_allCaps)(EditBox e);

extern Property * property_EditBox_autoSize;
extern void (* EditBox_set_autoSize)(EditBox e, bool value);
extern bool (* EditBox_get_autoSize)(EditBox e);

extern Property * property_EditBox_wrap;
extern void (* EditBox_set_wrap)(EditBox e, bool value);
extern bool (* EditBox_get_wrap)(EditBox e);

extern Property * property_EditBox_numLines;
extern int (* EditBox_get_numLines)(EditBox e);

extern Property * property_EditBox_lineNumber;
extern int (* EditBox_get_lineNumber)(EditBox e);

extern Property * property_EditBox_column;
extern int (* EditBox_get_column)(EditBox e);

extern Property * property_EditBox_charPos;
extern int (* EditBox_get_charPos)(EditBox e);

extern Property * property_EditBox_firstLine;
extern EditLine * (* EditBox_get_firstLine)(EditBox e);

extern Property * property_EditBox_lastLine;
extern EditLine * (* EditBox_get_lastLine)(EditBox e);

extern Property * property_EditBox_line;
extern EditLine * (* EditBox_get_line)(EditBox e);

extern Property * property_EditBox_contents;
extern void (* EditBox_set_contents)(EditBox e, const char * value);
extern const char * (* EditBox_get_contents)(EditBox e);

extern Property * property_EditBox_overwrite;
extern bool (* EditBox_get_overwrite)(EditBox e);

extern Property * property_EditBox_caretFollowsScrolling;
extern void (* EditBox_set_caretFollowsScrolling)(EditBox e, bool value);
extern bool (* EditBox_get_caretFollowsScrolling)(EditBox e);

extern Property * property_EditBox_multiLineContents;
extern char * (* EditBox_get_multiLineContents)(EditBox e);

extern Property * property_EditBox_selectionColor;
extern void (* EditBox_set_selectionColor)(EditBox e, Color value);
extern Color (* EditBox_get_selectionColor)(EditBox e);
extern bool (* EditBox_isSet_selectionColor)(EditBox e);

extern Property * property_EditBox_selectionText;
extern void (* EditBox_set_selectionText)(EditBox e, Color value);
extern Color (* EditBox_get_selectionText)(EditBox e);
extern bool (* EditBox_isSet_selectionText)(EditBox e);

extern Property * property_EditBox_syntaxColorScheme;
extern void (* EditBox_set_syntaxColorScheme)(EditBox e, SyntaxColorScheme value);

extern Property * property_EditBox_recordUndoEvent;
extern void (* EditBox_set_recordUndoEvent)(EditBox e, bool value);
extern bool (* EditBox_get_recordUndoEvent)(EditBox e);

extern void (* EditBoxStream_deleteBytes)(EditBoxStream __this, uint count);

extern Property * property_EditBoxStream_editBox;
extern void (* EditBoxStream_set_editBox)(EditBoxStream e, EditBox value);
extern EditBox (* EditBoxStream_get_editBox)(EditBoxStream e);

extern Property * property_EditLine_text;
extern void (* EditLine_set_text)(EditLine * e, const char * value);
extern const char * (* EditLine_get_text)(EditLine * e);

extern Property * property_EditLine_prev;
extern EditLine * (* EditLine_get_prev)(EditLine * e);

extern Property * property_EditLine_next;
extern EditLine * (* EditLine_get_next)(EditLine * e);

extern Property * property_EditLine_count;
extern int (* EditLine_get_count)(EditLine * e);

extern int EditableSelectorButton_onRename_vTblID;
bool EditableSelectorButton_onRename(EditableSelectorButton __i, Window __t, EditableSelectorButton button, char ** oldName, char ** newName);
extern Method * method_EditableSelectorButton_onRename;

extern Property * property_EditableSelectorButton_renameable;
extern void (* EditableSelectorButton_set_renameable)(EditableSelectorButton e, bool value);
extern bool (* EditableSelectorButton_get_renameable)(EditableSelectorButton e);

extern Property * property_EditableSelectorButton_editBox;
extern EditBox (* EditableSelectorButton_get_editBox)(EditableSelectorButton e);

extern Property * property_Label_labeledWindow;
extern void (* Label_set_labeledWindow)(Label l, Window value);
extern Window (* Label_get_labeledWindow)(Label l);

extern Property * property_Label_isGroupBox;
extern void (* Label_set_isGroupBox)(Label l, bool value);
extern bool (* Label_get_isGroupBox)(Label l);

extern void (* ListBox_addField)(ListBox __this, DataField addedField);

extern DataRow (* ListBox_addRow)(ListBox __this);

extern DataRow (* ListBox_addRowAfter)(ListBox __this, DataRow after);

extern DataRow (* ListBox_addRowNone)(ListBox __this);

extern DataRow (* ListBox_addString)(ListBox __this, const char * string);

extern DataRow (* ListBox_addStringf)(ListBox __this, const char * format, ...);

extern void (* ListBox_clear)(ListBox __this);

extern void (* ListBox_clearFields)(ListBox __this);

extern void (* ListBox_deleteRow)(ListBox __this, DataRow row);

extern DataRow (* ListBox_findRow)(ListBox __this, int64 tag);

extern DataRow (* ListBox_findString)(ListBox __this, const char * searchedString);

extern DataRow (* ListBox_findSubRow)(ListBox __this, int64 tag);

extern DataRow (* ListBox_findSubString)(ListBox __this, const char * subString);

extern DataRow (* ListBox_findSubStringAfter)(ListBox __this, DataRow after, const char * subString);

extern DataRow (* ListBox_findSubStringi)(ListBox __this, const char * subString);

extern any_object (* ListBox_getData)(ListBox __this, DataField field);

extern void (* ListBox_getMultiSelection)(ListBox __this, OldList * list);

extern int64 (* ListBox_getTag)(ListBox __this);

extern int ListBox_notifyChanged_vTblID;
bool ListBox_notifyChanged(ListBox __i, Window __t, ListBox listBox, DataRow row);
extern Method * method_ListBox_notifyChanged;

extern int ListBox_notifyCollapse_vTblID;
bool ListBox_notifyCollapse(ListBox __i, Window __t, ListBox listBox, DataRow row, bool collapsed);
extern Method * method_ListBox_notifyCollapse;

extern int ListBox_notifyDoubleClick_vTblID;
bool ListBox_notifyDoubleClick(ListBox __i, Window __t, ListBox listBox, int x, int y, Modifiers mods);
extern Method * method_ListBox_notifyDoubleClick;

extern int ListBox_notifyEditDone_vTblID;
bool ListBox_notifyEditDone(ListBox __i, Window __t, ListBox listBox, DataRow row);
extern Method * method_ListBox_notifyEditDone;

extern int ListBox_notifyEdited_vTblID;
bool ListBox_notifyEdited(ListBox __i, Window __t, ListBox listBox, DataRow row);
extern Method * method_ListBox_notifyEdited;

extern int ListBox_notifyEditing_vTblID;
bool ListBox_notifyEditing(ListBox __i, Window __t, ListBox listBox, DataRow row);
extern Method * method_ListBox_notifyEditing;

extern int ListBox_notifyHighlight_vTblID;
bool ListBox_notifyHighlight(ListBox __i, Window __t, ListBox listBox, DataRow row, Modifiers mods);
extern Method * method_ListBox_notifyHighlight;

extern int ListBox_notifyKeyDown_vTblID;
bool ListBox_notifyKeyDown(ListBox __i, Window __t, ListBox listBox, DataRow row, Key key, unichar ch);
extern Method * method_ListBox_notifyKeyDown;

extern int ListBox_notifyKeyHit_vTblID;
bool ListBox_notifyKeyHit(ListBox __i, Window __t, ListBox listBox, DataRow row, Key key, unichar ch);
extern Method * method_ListBox_notifyKeyHit;

extern int ListBox_notifyModified_vTblID;
bool ListBox_notifyModified(ListBox __i, Window __t, ListBox listBox, DataRow row);
extern Method * method_ListBox_notifyModified;

extern int ListBox_notifyMove_vTblID;
bool ListBox_notifyMove(ListBox __i, Window __t, ListBox listBox, DataRow row, Modifiers mods);
extern Method * method_ListBox_notifyMove;

extern int ListBox_notifyMoved_vTblID;
void ListBox_notifyMoved(ListBox __i, Window __t, ListBox listBox, DataRow row, Modifiers mods);
extern Method * method_ListBox_notifyMoved;

extern int ListBox_notifyMovedField_vTblID;
bool ListBox_notifyMovedField(ListBox __i, Window __t, ListBox listBox, DataField field, Modifiers mods);
extern Method * method_ListBox_notifyMovedField;

extern int ListBox_notifyReclick_vTblID;
bool ListBox_notifyReclick(ListBox __i, Window __t, ListBox listBox, DataRow row, Modifiers mods);
extern Method * method_ListBox_notifyReclick;

extern int ListBox_notifyResized_vTblID;
bool ListBox_notifyResized(ListBox __i, Window __t, ListBox listBox, DataField field, Modifiers mods);
extern Method * method_ListBox_notifyResized;

extern int ListBox_notifyRightClick_vTblID;
bool ListBox_notifyRightClick(ListBox __i, Window __t, ListBox listBox, int x, int y, Modifiers mods);
extern Method * method_ListBox_notifyRightClick;

extern int ListBox_notifySelect_vTblID;
bool ListBox_notifySelect(ListBox __i, Window __t, ListBox listBox, DataRow row, Modifiers mods);
extern Method * method_ListBox_notifySelect;

extern int ListBox_notifySort_vTblID;
bool ListBox_notifySort(ListBox __i, Window __t, ListBox listBox, DataField field, Modifiers mods);
extern Method * method_ListBox_notifySort;

extern void (* ListBox_removeField)(ListBox __this, DataField field);

extern void (* ListBox_selectRow)(ListBox __this, DataRow row);

extern void * (* ListBox_setData)(ListBox __this, DataField field, any_object data);

extern void (* ListBox_sort)(ListBox __this, DataField field, int order);

extern void (* ListBox_stopEditing)(ListBox __this, bool save);

extern Property * property_ListBox_freeSelect;
extern void (* ListBox_set_freeSelect)(ListBox l, bool value);
extern bool (* ListBox_get_freeSelect)(ListBox l);

extern Property * property_ListBox_currentRow;
extern void (* ListBox_set_currentRow)(ListBox l, DataRow value);
extern DataRow (* ListBox_get_currentRow)(ListBox l);

extern Property * property_ListBox_currentField;
extern void (* ListBox_set_currentField)(ListBox l, DataField value);
extern DataField (* ListBox_get_currentField)(ListBox l);

extern Property * property_ListBox_rowHeight;
extern void (* ListBox_set_rowHeight)(ListBox l, int value);
extern int (* ListBox_get_rowHeight)(ListBox l);
extern bool (* ListBox_isSet_rowHeight)(ListBox l);

extern Property * property_ListBox_typingTimeout;
extern void (* ListBox_set_typingTimeout)(ListBox l, Time value);
extern Time (* ListBox_get_typingTimeout)(ListBox l);

extern Property * property_ListBox_moveRows;
extern void (* ListBox_set_moveRows)(ListBox l, bool value);
extern bool (* ListBox_get_moveRows)(ListBox l);

extern Property * property_ListBox_moveFields;
extern void (* ListBox_set_moveFields)(ListBox l, bool value);
extern bool (* ListBox_get_moveFields)(ListBox l);

extern Property * property_ListBox_resizable;
extern void (* ListBox_set_resizable)(ListBox l, bool value);
extern bool (* ListBox_get_resizable)(ListBox l);

extern Property * property_ListBox_autoScroll;
extern void (* ListBox_set_autoScroll)(ListBox l, bool value);
extern bool (* ListBox_get_autoScroll)(ListBox l);

extern Property * property_ListBox_alwaysHighLight;
extern void (* ListBox_set_alwaysHighLight)(ListBox l, bool value);
extern bool (* ListBox_get_alwaysHighLight)(ListBox l);

extern Property * property_ListBox_hasClearHeader;
extern void (* ListBox_set_hasClearHeader)(ListBox l, bool value);
extern bool (* ListBox_get_hasClearHeader)(ListBox l);

extern Property * property_ListBox_hasHeader;
extern void (* ListBox_set_hasHeader)(ListBox l, bool value);
extern bool (* ListBox_get_hasHeader)(ListBox l);

extern Property * property_ListBox_multiSelect;
extern void (* ListBox_set_multiSelect)(ListBox l, bool value);
extern bool (* ListBox_get_multiSelect)(ListBox l);

extern Property * property_ListBox_alwaysEdit;
extern void (* ListBox_set_alwaysEdit)(ListBox l, bool value);
extern bool (* ListBox_get_alwaysEdit)(ListBox l);

extern Property * property_ListBox_fullRowSelect;
extern void (* ListBox_set_fullRowSelect)(ListBox l, bool value);
extern bool (* ListBox_get_fullRowSelect)(ListBox l);

extern Property * property_ListBox_collapseControl;
extern void (* ListBox_set_collapseControl)(ListBox l, bool value);
extern bool (* ListBox_get_collapseControl)(ListBox l);

extern Property * property_ListBox_treeBranches;
extern void (* ListBox_set_treeBranches)(ListBox l, bool value);
extern bool (* ListBox_get_treeBranches)(ListBox l);

extern Property * property_ListBox_rootCollapseButton;
extern void (* ListBox_set_rootCollapseButton)(ListBox l, bool value);
extern bool (* ListBox_get_rootCollapseButton)(ListBox l);

extern Property * property_ListBox_sortable;
extern void (* ListBox_set_sortable)(ListBox l, bool value);
extern bool (* ListBox_get_sortable)(ListBox l);

extern Property * property_ListBox_noDragging;
extern void (* ListBox_set_noDragging)(ListBox l, bool value);
extern bool (* ListBox_get_noDragging)(ListBox l);

extern Property * property_ListBox_fillLastField;
extern void (* ListBox_set_fillLastField)(ListBox l, bool value);
extern bool (* ListBox_get_fillLastField)(ListBox l);

extern Property * property_ListBox_numSelections;
extern int (* ListBox_get_numSelections)(ListBox l);

extern Property * property_ListBox_currentIndex;
extern int (* ListBox_get_currentIndex)(ListBox l);

extern Property * property_ListBox_lastRow;
extern DataRow (* ListBox_get_lastRow)(ListBox l);

extern Property * property_ListBox_firstRow;
extern DataRow (* ListBox_get_firstRow)(ListBox l);

extern Property * property_ListBox_rowCount;
extern int (* ListBox_get_rowCount)(ListBox l);

extern Property * property_ListBox_firstField;
extern DataField (* ListBox_get_firstField)(ListBox l);

extern Property * property_ListBox_selectionColor;
extern void (* ListBox_set_selectionColor)(ListBox l, Color value);
extern Color (* ListBox_get_selectionColor)(ListBox l);
extern bool (* ListBox_isSet_selectionColor)(ListBox l);

extern Property * property_ListBox_selectionText;
extern void (* ListBox_set_selectionText)(ListBox l, Color value);
extern Color (* ListBox_get_selectionText)(ListBox l);
extern bool (* ListBox_isSet_selectionText)(ListBox l);

extern Property * property_ListBox_stippleColor;
extern void (* ListBox_set_stippleColor)(ListBox l, Color value);
extern Color (* ListBox_get_stippleColor)(ListBox l);

extern Property * property_ListBox_expandOnAdd;
extern void (* ListBox_set_expandOnAdd)(ListBox l, bool value);
extern bool (* ListBox_get_expandOnAdd)(ListBox l);

extern void (* Menu_addDynamic)(Menu __this, MenuItem addedItem, Window master, bool persistent);

extern void (* Menu_addItem)(Menu __this, MenuItem item);

extern void (* Menu_addSubMenu)(Menu __this, Menu subMenu);

extern void (* Menu_clean)(Menu __this, Window window);

extern void (* Menu_clear)(Menu __this);

extern MenuItem (* Menu_findItem)(Menu __this, bool (* notifySelect)(MenuItem selection, Modifiers mods), uint64 id);

extern Menu (* Menu_findMenu)(Menu __this, const char * name);

extern void (* Menu_merge)(Menu __this, Menu menuBeingMerged, bool menuBar, Window window);

extern void (* Menu_removeItem)(Menu __this, MenuItem item);

extern Property * property_Menu_parent;
extern void (* Menu_set_parent)(Menu m, Menu value);

extern Property * property_Menu_text;
extern void (* Menu_set_text)(Menu m, const char * value);

extern Property * property_Menu_hotKey;
extern void (* Menu_set_hotKey)(Menu m, Key value);

extern Property * property_Menu_hasMargin;
extern void (* Menu_set_hasMargin)(Menu m, bool value);

extern Property * property_Menu_copyText;
extern void (* Menu_set_copyText)(Menu m, bool value);

extern int MenuItem_notifySelect_vTblID;
bool MenuItem_notifySelect(MenuItem __i, Window __t, MenuItem selection, Modifiers mods);
extern Method * method_MenuItem_notifySelect;

extern Property * property_MenuItem_parent;
extern void (* MenuItem_set_parent)(MenuItem m, Menu value);

extern Property * property_MenuItem_text;
extern void (* MenuItem_set_text)(MenuItem m, const char * value);

extern Property * property_MenuItem_hotKey;
extern void (* MenuItem_set_hotKey)(MenuItem m, Key value);

extern Property * property_MenuItem_accelerator;
extern void (* MenuItem_set_accelerator)(MenuItem m, Key value);

extern Property * property_MenuItem_checked;
extern void (* MenuItem_set_checked)(MenuItem m, bool value);
extern bool (* MenuItem_get_checked)(MenuItem m);

extern Property * property_MenuItem_disabled;
extern void (* MenuItem_set_disabled)(MenuItem m, bool value);

extern Property * property_MenuItem_checkable;
extern void (* MenuItem_set_checkable)(MenuItem m, bool value);

extern Property * property_MenuItem_isRadio;
extern void (* MenuItem_set_isRadio)(MenuItem m, bool value);

extern Property * property_MenuItem_id;
extern void (* MenuItem_set_id)(MenuItem m, uint64 value);
extern uint64 (* MenuItem_get_id)(MenuItem m);

extern Property * property_MenuItem_bitmap;
extern void (* MenuItem_set_bitmap)(MenuItem m, BitmapResource value);
extern BitmapResource (* MenuItem_get_bitmap)(MenuItem m);

extern Property * property_MenuItem_copyText;
extern void (* MenuItem_set_copyText)(MenuItem m, bool value);

extern Property * property_MenuItem_bold;
extern void (* MenuItem_set_bold)(MenuItem m, bool value);
extern bool (* MenuItem_get_bold)(MenuItem m);

struct class_members_OldArray
{
   Class * type;
};
extern Property * property_OldArray_size;
extern void (* OldArray_set_size)(OldArray o, uint value);
extern uint (* OldArray_get_size)(OldArray o);

extern Property * property_OldArray_data;
extern void (* OldArray_set_data)(OldArray o, void * value);

extern int PaneSplitter_notifyResized_vTblID;
bool PaneSplitter_notifyResized(PaneSplitter __i, Window __t, PaneSplitter splitter);
extern Method * method_PaneSplitter_notifyResized;

extern Property * property_PaneSplitter_toolSize;
extern void (* PaneSplitter_set_toolSize)(PaneSplitter p, int value);
extern int (* PaneSplitter_get_toolSize)(PaneSplitter p);

extern Property * property_PaneSplitter_toolGap;
extern void (* PaneSplitter_set_toolGap)(PaneSplitter p, int value);
extern int (* PaneSplitter_get_toolGap)(PaneSplitter p);

extern Property * property_PaneSplitter_leftPane;
extern void (* PaneSplitter_set_leftPane)(PaneSplitter p, Window value);
extern Window (* PaneSplitter_get_leftPane)(PaneSplitter p);

extern Property * property_PaneSplitter_rightPane;
extern void (* PaneSplitter_set_rightPane)(PaneSplitter p, Window value);
extern Window (* PaneSplitter_get_rightPane)(PaneSplitter p);

extern Property * property_PaneSplitter_topPane;
extern void (* PaneSplitter_set_topPane)(PaneSplitter p, Window value);
extern Window (* PaneSplitter_get_topPane)(PaneSplitter p);

extern Property * property_PaneSplitter_bottomPane;
extern void (* PaneSplitter_set_bottomPane)(PaneSplitter p, Window value);
extern Window (* PaneSplitter_get_bottomPane)(PaneSplitter p);

extern Property * property_PaneSplitter_scaleSplit;
extern void (* PaneSplitter_set_scaleSplit)(PaneSplitter p, double value);
extern double (* PaneSplitter_get_scaleSplit)(PaneSplitter p);

extern Property * property_PaneSplitter_orientation;
extern void (* PaneSplitter_set_orientation)(PaneSplitter p, ScrollDirection value);
extern ScrollDirection (* PaneSplitter_get_orientation)(PaneSplitter p);

extern Property * property_PaneSplitter_split;
extern void (* PaneSplitter_set_split)(PaneSplitter p, int value);
extern int (* PaneSplitter_get_split)(PaneSplitter p);

extern void (* PathBox_deselect)(PathBox __this);

extern void (* PathBox_end)(PathBox __this);

extern void (* PathBox_home)(PathBox __this);

extern int PathBox_notifyModified_vTblID;
bool PathBox_notifyModified(PathBox __i, Window __t, PathBox pathBox);
extern Method * method_PathBox_notifyModified;

extern void (* PathBox_selectAll)(PathBox __this);

extern Property * property_PathBox_editBox;
extern EditBox (* PathBox_get_editBox)(PathBox p);

extern Property * property_PathBox_typeExpected;
extern void (* PathBox_set_typeExpected)(PathBox p, PathTypeExpected value);

extern Property * property_PathBox_browseDialog;
extern void (* PathBox_set_browseDialog)(PathBox p, FileDialog value);
extern FileDialog (* PathBox_get_browseDialog)(PathBox p);

extern Property * property_PathBox_path;
extern void (* PathBox_set_path)(PathBox p, constString value);
extern constString (* PathBox_get_path)(PathBox p);

extern Property * property_PathBox_slashPath;
extern String (* PathBox_get_slashPath)(PathBox p);

extern Property * property_PathBox_systemPath;
extern String (* PathBox_get_systemPath)(PathBox p);

extern Property * property_PathBox_selectionColor;
extern void (* PathBox_set_selectionColor)(PathBox p, Color value);
extern Color (* PathBox_get_selectionColor)(PathBox p);

extern Property * property_PathBox_selectionText;
extern void (* PathBox_set_selectionText)(PathBox p, Color value);
extern Color (* PathBox_get_selectionText)(PathBox p);

extern Property * property_Picture_tint;
extern void (* Picture_set_tint)(Picture p, Color value);

extern Property * property_Picture_image;
extern void (* Picture_set_image)(Picture p, BitmapResource value);
extern BitmapResource (* Picture_get_image)(Picture p);

extern Property * property_Picture_filter;
extern void (* Picture_set_filter)(Picture p, bool value);
extern bool (* Picture_get_filter)(Picture p);

extern Property * property_Picture_bitmapImage;
extern void (* Picture_set_bitmapImage)(Picture p, Bitmap value);

extern Property * property_PopupMenu_menu;
extern void (* PopupMenu_set_menu)(PopupMenu p, Menu value);
extern Menu (* PopupMenu_get_menu)(PopupMenu p);

extern Property * property_PopupMenu_isMenuBar;
extern void (* PopupMenu_set_isMenuBar)(PopupMenu p, bool value);

extern Property * property_PopupMenu_focus;
extern bool (* PopupMenu_get_focus)(PopupMenu p);

extern Property * property_ProgressBar_progress;
extern void (* ProgressBar_set_progress)(ProgressBar p, uint value);
extern uint (* ProgressBar_get_progress)(ProgressBar p);

extern Property * property_ProgressBar_range;
extern void (* ProgressBar_set_range)(ProgressBar p, uint value);
extern uint (* ProgressBar_get_range)(ProgressBar p);

struct class_members_ScrollBar
{
   byte __ecerePrivateData0[24];
   Button downBtn;
   Button upBtn;
   Button thumb;
   byte __ecerePrivateData1[12];
   int thumbSize;
};
extern bool (* ScrollBar_action)(ScrollBar __this, ScrollBarAction action, int newPosition, Key key);

extern int ScrollBar_notifyScrolling_vTblID;
void ScrollBar_notifyScrolling(ScrollBar __i, Window __t, ScrollBar scrollBar, ScrollBarAction action, int position, Key key);
extern Method * method_ScrollBar_notifyScrolling;

extern Property * property_ScrollBar_direction;
extern void (* ScrollBar_set_direction)(ScrollBar s, ScrollDirection value);
extern ScrollDirection (* ScrollBar_get_direction)(ScrollBar s);

extern Property * property_ScrollBar_windowOwned;
extern void (* ScrollBar_set_windowOwned)(ScrollBar s, bool value);

extern Property * property_ScrollBar_snap;
extern void (* ScrollBar_set_snap)(ScrollBar s, bool value);
extern bool (* ScrollBar_get_snap)(ScrollBar s);

extern Property * property_ScrollBar_range;
extern void (* ScrollBar_set_range)(ScrollBar s, int value);
extern int (* ScrollBar_get_range)(ScrollBar s);

extern Property * property_ScrollBar_seen;
extern void (* ScrollBar_set_seen)(ScrollBar s, int value);
extern int (* ScrollBar_get_seen)(ScrollBar s);

extern Property * property_ScrollBar_total;
extern void (* ScrollBar_set_total)(ScrollBar s, int value);
extern int (* ScrollBar_get_total)(ScrollBar s);

extern Property * property_ScrollBar_lineStep;
extern void (* ScrollBar_set_lineStep)(ScrollBar s, int value);
extern int (* ScrollBar_get_lineStep)(ScrollBar s);

extern Property * property_ScrollBar_pageStep;
extern void (* ScrollBar_set_pageStep)(ScrollBar s, int value);
extern int (* ScrollBar_get_pageStep)(ScrollBar s);

extern Property * property_ScrollBar_thumbPosition;
extern void (* ScrollBar_set_thumbPosition)(ScrollBar s, int value);
extern int (* ScrollBar_get_thumbPosition)(ScrollBar s);

extern void (* SelectorBar_addButton)(SelectorBar __this, SelectorButton button);

extern void (* SelectorBar_clear)(SelectorBar __this);

extern SelectorButton (* SelectorBar_findButtonByID)(SelectorBar __this, int64 id);

extern void (* SelectorBar_removeButton)(SelectorBar __this, SelectorButton button);

extern void (* SelectorBar_select)(SelectorBar __this, SelectorButton button);

extern Property * property_SelectorBar_selectedButton;
extern SelectorButton (* SelectorBar_get_selectedButton)(SelectorBar s);

extern void (* Stacker_destroyChildren)(Stacker __this);

extern Window (* Stacker_getNextStackedItem)(Stacker __this, Window current, bool previous, Class * filter);

extern void (* Stacker_makeControlVisible)(Stacker __this, Window control);

extern Property * property_Stacker_direction;
extern void (* Stacker_set_direction)(Stacker s, ScrollDirection value);
extern ScrollDirection (* Stacker_get_direction)(Stacker s);

extern Property * property_Stacker_gap;
extern void (* Stacker_set_gap)(Stacker s, int value);
extern int (* Stacker_get_gap)(Stacker s);

extern Property * property_Stacker_reverse;
extern void (* Stacker_set_reverse)(Stacker s, bool value);
extern bool (* Stacker_get_reverse)(Stacker s);

extern Property * property_Stacker_scrollable;
extern void (* Stacker_set_scrollable)(Stacker s, bool value);
extern bool (* Stacker_get_scrollable)(Stacker s);

extern Property * property_Stacker_controls;
extern Array (* Stacker_get_controls)(Stacker s);

extern Property * property_Stacker_flipper;
extern void (* Stacker_set_flipper)(Stacker s, Window value);
extern Window (* Stacker_get_flipper)(Stacker s);

extern Property * property_Stacker_flipSpring;
extern void (* Stacker_set_flipSpring)(Stacker s, bool value);
extern bool (* Stacker_get_flipSpring)(Stacker s);

extern Property * property_Stacker_autoSize;
extern void (* Stacker_set_autoSize)(Stacker s, bool value);
extern bool (* Stacker_get_autoSize)(Stacker s);

extern Property * property_Stacker_margin;
extern void (* Stacker_set_margin)(Stacker s, int value);
extern int (* Stacker_get_margin)(Stacker s);

extern Property * property_Stacker_endButtons;
extern void (* Stacker_set_endButtons)(Stacker s, bool value);
extern bool (* Stacker_get_endButtons)(Stacker s);

extern Property * property_Stacker_hoverScroll;
extern void (* Stacker_set_hoverScroll)(Stacker s, bool value);
extern bool (* Stacker_get_hoverScroll)(Stacker s);

extern void (* StatusBar_addField)(StatusBar __this, StatusField field);

extern void (* StatusBar_clear)(StatusBar __this);

extern void (* StatusBar_removeField)(StatusBar __this, StatusField field);

extern Property * property_StatusBar_minInfoWidth;
extern void (* StatusBar_set_minInfoWidth)(StatusBar s, int value);
extern int (* StatusBar_get_minInfoWidth)(StatusBar s);

extern void (* StatusField_setTextf)(StatusField __this, const char * format, ...);

extern Property * property_StatusField_statusBar;
extern void (* StatusField_set_statusBar)(StatusField s, StatusBar value);

extern Property * property_StatusField_color;
extern void (* StatusField_set_color)(StatusField s, Color value);

extern Property * property_StatusField_backColor;
extern void (* StatusField_set_backColor)(StatusField s, ColorAlpha value);

extern Property * property_StatusField_bold;
extern void (* StatusField_set_bold)(StatusField s, bool value);

extern Property * property_StatusField_text;
extern void (* StatusField_set_text)(StatusField s, const char * value);

extern Property * property_StatusField_width;
extern void (* StatusField_set_width)(StatusField s, int value);

extern Property * property_SyntaxColorScheme_keywordColors;
extern void (* SyntaxColorScheme_set_keywordColors)(SyntaxColorScheme s, Container value);
extern Container (* SyntaxColorScheme_get_keywordColors)(SyntaxColorScheme s);

extern void (* Tab_selectTab)(Tab __this);

extern Property * property_Tab_tabControl;
extern void (* Tab_set_tabControl)(Tab t, TabControl value);
extern TabControl (* Tab_get_tabControl)(Tab t);

extern Property * property_Tab_isAdded;
extern bool (* Tab_get_isAdded)(Tab t);

extern void (* TabControl_addTab)(TabControl __this, Tab tab);

extern void (* TabControl_removeTab)(TabControl __this, Tab tab);

extern Property * property_TabControl_placement;
extern void (* TabControl_set_placement)(TabControl t, TabsPlacement value);
extern TabsPlacement (* TabControl_get_placement)(TabControl t);

extern Property * property_TabControl_buttonsOffset;
extern void (* TabControl_set_buttonsOffset)(TabControl t, int value);
extern int (* TabControl_get_buttonsOffset)(TabControl t);

extern Property * property_TabControl_curTab;
extern void (* TabControl_set_curTab)(TabControl t, Tab value);
extern Tab (* TabControl_get_curTab)(TabControl t);

extern Property * property_ToolButton_menuItemPtr;
extern void (* ToolButton_set_menuItemPtr)(ToolButton t, MenuItem * value);

extern Property * property_ToolButton_menuItem;
extern MenuItem (* ToolButton_get_menuItem)(ToolButton t);

extern Property * property_ToolTip_tip;
extern void (* ToolTip_set_tip)(ToolTip t, constString value);
extern constString (* ToolTip_get_tip)(ToolTip t);

struct UndoAction
{
   Class * type;
   bool continued;
};
extern int UndoAction_print_vTblID;
void UndoAction_print(UndoAction * __i, void * data);
extern Method * method_UndoAction_print;

extern int UndoAction_redo_vTblID;
void UndoAction_redo(UndoAction * __i, void * data);
extern Method * method_UndoAction_redo;

extern int UndoAction_undo_vTblID;
void UndoAction_undo(UndoAction * __i, void * data);
extern Method * method_UndoAction_undo;

struct class_members_UndoBuffer
{
   byte __ecerePrivateData0[8];
   int count;
   int curAction;
   void * data;
   int dontRecord;
   bool insideRedo;
   bool recordAsOne;
   bool firstEvent;
};
extern void (* UndoBuffer_clear)(UndoBuffer __this);

extern void (* UndoBuffer_record)(UndoBuffer __this, UndoAction * action);

extern void (* UndoBuffer_redo)(UndoBuffer __this);

extern void (* UndoBuffer_undo)(UndoBuffer __this);

typedef int WindowState;
enum
{
   WindowState_normal = 0x0,
   WindowState_minimized = 0x1,
   WindowState_maximized = 0x2
};

struct class_members_WindowController
{
   int (** windowVTbl)();
};
typedef Instance WindowController;
typedef int TouchPointerEvent;
enum
{
   TouchPointerEvent_move = 0x0,
   TouchPointerEvent_up = 0x1,
   TouchPointerEvent_down = 0x2,
   TouchPointerEvent_pointerUp = 0x3,
   TouchPointerEvent_pointerDown = 0x4
};

typedef int SkinBitmap;
enum
{
   SkinBitmap_minimize = 0x0,
   SkinBitmap_maximize = 0x1,
   SkinBitmap_restore = 0x2,
   SkinBitmap_close = 0x3
};

typedef int SystemCursor;
enum
{
   SystemCursor_arrow = 0x0,
   SystemCursor_iBeam = 0x1,
   SystemCursor_cross = 0x2,
   SystemCursor_moving = 0x3,
   SystemCursor_sizeNESW = 0x4,
   SystemCursor_sizeNS = 0x5,
   SystemCursor_sizeNWSE = 0x6,
   SystemCursor_sizeWE = 0x7,
   SystemCursor_hand = 0x8
};

typedef Instance Skin;
struct SizeAnchor
{
   Size size;
   bool isClientW;
   bool isClientH;
};
typedef struct SizeAnchor SizeAnchor;
typedef uint32 MouseButtons;
typedef int AnchorValueType;
enum
{
   AnchorValueType_none = 0x0,
   AnchorValueType_offset = 0x1,
   AnchorValueType_relative = 0x2,
   AnchorValueType_middleRelative = 0x3,
   AnchorValueType_cascade = 0x4,
   AnchorValueType_vTiled = 0x5,
   AnchorValueType_hTiled = 0x6
};

struct MiddleAnchorValue
{
   AnchorValueType type;
   union
   {
      int distance;
      float percent;
   };
};
typedef struct MiddleAnchorValue MiddleAnchorValue;
typedef struct Joystick Joystick;
typedef Instance Interface;
typedef Application GuiApplication;
typedef int64 DialogResult;
enum
{
   DialogResult_cancel = 0x0,
   DialogResult_yes = 0x1,
   DialogResult_no = 0x2,
   DialogResult_ok = 0x3
};

typedef Instance Cursor;
typedef int CreationActivationOption;
enum
{
   CreationActivationOption_activate = 0x0,
   CreationActivationOption_flash = 0x1,
   CreationActivationOption_doNothing = 0x2
};

typedef struct ClipBoard ClipBoard;
typedef uint32 BorderBits;
typedef BorderBits BorderStyle;
enum
{
   BorderStyle_none = 0x0,
   BorderStyle_contour = 0x1,
   BorderStyle_fixed = 0x3,
   BorderStyle_sizable = 0x7,
   BorderStyle_thin = 0x23,
   BorderStyle_sizableThin = 0x27,
   BorderStyle_deep = 0x8,
   BorderStyle_bevel = 0x10,
   BorderStyle_sizableDeep = 0xF,
   BorderStyle_sizableBevel = 0x17,
   BorderStyle_fixedDeep = 0xB,
   BorderStyle_fixedBevel = 0x13,
   BorderStyle_deepContour = 0x9
};

struct AnchorValue
{
   AnchorValueType type;
   union
   {
      int distance;
      float percent;
   };
};
typedef struct AnchorValue AnchorValue;
struct Anchor
{
   union
   {
      AnchorValue left;
      MiddleAnchorValue horz;
   };
   union
   {
      AnchorValue top;
      MiddleAnchorValue vert;
   };
   AnchorValue right;
   AnchorValue bottom;
};
typedef struct Anchor Anchor;
typedef Window ControllableWindow;
typedef Key KeyCode;
enum
{
   KeyCode_escape = 0x1,
   KeyCode_k1 = 0x2,
   KeyCode_bang = 0x2,
   KeyCode_k2 = 0x3,
   KeyCode_commercial = 0x3,
   KeyCode_k3 = 0x4,
   KeyCode_pound = 0x4,
   KeyCode_k4 = 0x5,
   KeyCode_dollar = 0x5,
   KeyCode_k5 = 0x6,
   KeyCode_percent = 0x6,
   KeyCode_k6 = 0x7,
   KeyCode_circumflex = 0x7,
   KeyCode_k7 = 0x8,
   KeyCode_ampersand = 0x8,
   KeyCode_k8 = 0x9,
   KeyCode_star = 0x9,
   KeyCode_k9 = 0xA,
   KeyCode_leftParanthesis = 0xA,
   KeyCode_k0 = 0xB,
   KeyCode_rightParanthesis = 0xA,
   KeyCode_minus = 0xC,
   KeyCode_underscore = 0xC,
   KeyCode_equal = 0xD,
   KeyCode_plus = 0xD,
   KeyCode_backSpace = 0xE,
   KeyCode_tab = 0xF,
   KeyCode_q = 0x10,
   KeyCode_w = 0x11,
   KeyCode_e = 0x12,
   KeyCode_r = 0x13,
   KeyCode_t = 0x14,
   KeyCode_y = 0x15,
   KeyCode_u = 0x16,
   KeyCode_i = 0x17,
   KeyCode_o = 0x18,
   KeyCode_p = 0x19,
   KeyCode_leftBracket = 0x1A,
   KeyCode_rightBracket = 0x1B,
   KeyCode_enter = 0x1C,
   KeyCode_leftControl = 0x1D,
   KeyCode_a = 0x1E,
   KeyCode_s = 0x1F,
   KeyCode_d = 0x20,
   KeyCode_f = 0x21,
   KeyCode_g = 0x22,
   KeyCode_h = 0x23,
   KeyCode_j = 0x24,
   KeyCode_k = 0x25,
   KeyCode_l = 0x26,
   KeyCode_semicolon = 0x27,
   KeyCode_colon = 0x27,
   KeyCode_quote = 0x28,
   KeyCode_doubleQuote = 0x28,
   KeyCode_tilde = 0x29,
   KeyCode_backQuote = 0x29,
   KeyCode_leftShift = 0x2A,
   KeyCode_backSlash = 0x2B,
   KeyCode_pipe = 0x2B,
   KeyCode_z = 0x2C,
   KeyCode_x = 0x2D,
   KeyCode_c = 0x2E,
   KeyCode_v = 0x2F,
   KeyCode_b = 0x30,
   KeyCode_n = 0x31,
   KeyCode_m = 0x32,
   KeyCode_comma = 0x33,
   KeyCode_smallerThan = 0x33,
   KeyCode_period = 0x34,
   KeyCode_greaterThan = 0x34,
   KeyCode_slash = 0x35,
   KeyCode_questionMark = 0x35,
   KeyCode_rightShift = 0x36,
   KeyCode_keyPadStar = 0x37,
   KeyCode_leftAlt = 0x38,
   KeyCode_space = 0x39,
   KeyCode_capsLock = 0x3A,
   KeyCode_f1 = 0x3B,
   KeyCode_f2 = 0x3C,
   KeyCode_f3 = 0x3D,
   KeyCode_f4 = 0x3E,
   KeyCode_f5 = 0x3F,
   KeyCode_f6 = 0x40,
   KeyCode_f7 = 0x41,
   KeyCode_f8 = 0x42,
   KeyCode_f9 = 0x43,
   KeyCode_f10 = 0x44,
   KeyCode_numLock = 0x45,
   KeyCode_scrollLock = 0x46,
   KeyCode_keyPadHome = 0x47,
   KeyCode_keyPad7 = 0x47,
   KeyCode_keyPadUp = 0x48,
   KeyCode_keyPad8 = 0x48,
   KeyCode_keyPadPageUp = 0x49,
   KeyCode_keyPad9 = 0x49,
   KeyCode_keyPadMinus = 0x4A,
   KeyCode_keyPadLeft = 0x4B,
   KeyCode_keyPad4 = 0x4B,
   KeyCode_keyPad5 = 0x4C,
   KeyCode_keyPadRight = 0x4D,
   KeyCode_keyPad6 = 0x4D,
   KeyCode_keyPadPlus = 0x4E,
   KeyCode_keyPadEnd = 0x4F,
   KeyCode_keyPad1 = 0x4F,
   KeyCode_keyPadDown = 0x50,
   KeyCode_keyPad2 = 0x50,
   KeyCode_keyPadPageDown = 0x51,
   KeyCode_keyPad3 = 0x51,
   KeyCode_keyPadInsert = 0x52,
   KeyCode_keyPad0 = 0x52,
   KeyCode_keyPadDelete = 0x53,
   KeyCode_f11 = 0x57,
   KeyCode_f12 = 0x58,
   KeyCode_keyPadEnter = 0x60,
   KeyCode_rightControl = 0x61,
   KeyCode_keyPadSlash = 0x62,
   KeyCode_printScreen = 0x63,
   KeyCode_rightAlt = 0x64,
   KeyCode_pauseBreak = 0x65,
   KeyCode_home = 0x66,
   KeyCode_up = 0x67,
   KeyCode_pageUp = 0x68,
   KeyCode_left = 0x69,
   KeyCode_right = 0x6A,
   KeyCode_end = 0x6B,
   KeyCode_down = 0x6C,
   KeyCode_pageDown = 0x6D,
   KeyCode_insert = 0x6E,
   KeyCode_del = 0x6F,
   KeyCode_shift = 0x100,
   KeyCode_alt = 0x101,
   KeyCode_control = 0x102,
   KeyCode_wheelUp = 0x103,
   KeyCode_wheelDown = 0x104,
   KeyCode_hotKey = 0x105,
   KeyCode_defaultKey = 0x106,
   KeyCode_capsState = 0x107,
   KeyCode_numState = 0x108,
   KeyCode_scrollState = 0x109,
   KeyCode_play = 0x201,
   KeyCode_record = 0x202,
   KeyCode_pause = 0x203,
   KeyCode_rewind = 0x204,
   KeyCode_fastForward = 0x205,
   KeyCode_previousTrack = 0x206,
   KeyCode_nextTrack = 0x207,
   KeyCode_stop = 0x208,
   KeyCode_eject = 0x209,
   KeyCode_volumeUp = 0x20A,
   KeyCode_volumeDown = 0x20B,
   KeyCode_mute = 0x20C,
   KeyCode_remoteHome = 0x213,
   KeyCode_back = 0x3B,
   KeyCode_menu1 = 0x3C,
   KeyCode_menu2 = 0x3D,
   KeyCode_menu3 = 0x3E,
   KeyCode_menu4 = 0x3F,
   KeyCode_select = 0x1C
};

typedef String MultiLineString;
typedef Key PredefinedKey;
enum
{
   PredefinedKey_alt0 = 0x4000B,
   PredefinedKey_alt1 = 0x40002,
   PredefinedKey_alt2 = 0x40003,
   PredefinedKey_alt3 = 0x40004,
   PredefinedKey_alt4 = 0x40005,
   PredefinedKey_alt5 = 0x40006,
   PredefinedKey_alt6 = 0x40007,
   PredefinedKey_alt7 = 0x40008,
   PredefinedKey_alt8 = 0x40009,
   PredefinedKey_alt9 = 0x4000A,
   PredefinedKey_altA = 0x4001E,
   PredefinedKey_altB = 0x40030,
   PredefinedKey_altC = 0x4002E,
   PredefinedKey_altD = 0x40020,
   PredefinedKey_altE = 0x40012,
   PredefinedKey_altF = 0x40021,
   PredefinedKey_altG = 0x40022,
   PredefinedKey_altH = 0x40023,
   PredefinedKey_altI = 0x40017,
   PredefinedKey_altJ = 0x40024,
   PredefinedKey_altK = 0x40025,
   PredefinedKey_altL = 0x40026,
   PredefinedKey_altM = 0x40032,
   PredefinedKey_altN = 0x40031,
   PredefinedKey_altO = 0x40018,
   PredefinedKey_altP = 0x40019,
   PredefinedKey_altQ = 0x40010,
   PredefinedKey_altR = 0x40013,
   PredefinedKey_altS = 0x4001F,
   PredefinedKey_altT = 0x40014,
   PredefinedKey_altU = 0x40016,
   PredefinedKey_altV = 0x4002F,
   PredefinedKey_altW = 0x40011,
   PredefinedKey_altX = 0x4002D,
   PredefinedKey_altY = 0x40015,
   PredefinedKey_altZ = 0x4002C,
   PredefinedKey_altF1 = 0x4003B,
   PredefinedKey_altF2 = 0x4003C,
   PredefinedKey_altF3 = 0x4003D,
   PredefinedKey_altF4 = 0x4003E,
   PredefinedKey_altF5 = 0x4003F,
   PredefinedKey_altF6 = 0x40040,
   PredefinedKey_altF7 = 0x40041,
   PredefinedKey_altF8 = 0x40042,
   PredefinedKey_altF9 = 0x40043,
   PredefinedKey_altF10 = 0x40044,
   PredefinedKey_altF11 = 0x40057,
   PredefinedKey_altF12 = 0x40058,
   PredefinedKey_altLeft = 0x40069,
   PredefinedKey_altRight = 0x4006A,
   PredefinedKey_altUp = 0x40067,
   PredefinedKey_altDown = 0x4006C,
   PredefinedKey_altEnter = 0x4001C,
   PredefinedKey_altKeyPadEnter = 0x40060,
   PredefinedKey_altHome = 0x40066,
   PredefinedKey_altEnd = 0x4006B,
   PredefinedKey_altMinus = 0x4000C,
   PredefinedKey_altSpace = 0x40039,
   PredefinedKey_ctrl0 = 0x2000B,
   PredefinedKey_ctrl1 = 0x20002,
   PredefinedKey_ctrl2 = 0x20003,
   PredefinedKey_ctrl3 = 0x20004,
   PredefinedKey_ctrl4 = 0x20005,
   PredefinedKey_ctrl5 = 0x20006,
   PredefinedKey_ctrl6 = 0x20007,
   PredefinedKey_ctrl7 = 0x20008,
   PredefinedKey_ctrl8 = 0x20009,
   PredefinedKey_ctrl9 = 0x2000A,
   PredefinedKey_ctrlA = 0x2001E,
   PredefinedKey_ctrlB = 0x20030,
   PredefinedKey_ctrlC = 0x2002E,
   PredefinedKey_ctrlD = 0x20020,
   PredefinedKey_ctrlE = 0x20012,
   PredefinedKey_ctrlF = 0x20021,
   PredefinedKey_ctrlG = 0x20022,
   PredefinedKey_ctrlH = 0x20023,
   PredefinedKey_ctrlI = 0x20017,
   PredefinedKey_ctrlJ = 0x20024,
   PredefinedKey_ctrlK = 0x20025,
   PredefinedKey_ctrlL = 0x20026,
   PredefinedKey_ctrlM = 0x20032,
   PredefinedKey_ctrlN = 0x20031,
   PredefinedKey_ctrlO = 0x20018,
   PredefinedKey_ctrlP = 0x20019,
   PredefinedKey_ctrlQ = 0x20010,
   PredefinedKey_ctrlR = 0x20013,
   PredefinedKey_ctrlS = 0x2001F,
   PredefinedKey_ctrlT = 0x20014,
   PredefinedKey_ctrlU = 0x20016,
   PredefinedKey_ctrlV = 0x2002F,
   PredefinedKey_ctrlW = 0x20011,
   PredefinedKey_ctrlX = 0x2002D,
   PredefinedKey_ctrlY = 0x20015,
   PredefinedKey_ctrlZ = 0x2002C,
   PredefinedKey_ctrlF1 = 0x2003B,
   PredefinedKey_ctrlF2 = 0x2003C,
   PredefinedKey_ctrlF3 = 0x2003D,
   PredefinedKey_ctrlF4 = 0x2003E,
   PredefinedKey_ctrlF5 = 0x2003F,
   PredefinedKey_ctrlF6 = 0x20040,
   PredefinedKey_ctrlF7 = 0x20041,
   PredefinedKey_ctrlF8 = 0x20042,
   PredefinedKey_ctrlF9 = 0x20043,
   PredefinedKey_ctrlF10 = 0x20044,
   PredefinedKey_ctrlF11 = 0x20057,
   PredefinedKey_ctrlF12 = 0x20058,
   PredefinedKey_ctrlLeft = 0x20069,
   PredefinedKey_ctrlRight = 0x2006A,
   PredefinedKey_ctrlUp = 0x20067,
   PredefinedKey_ctrlDown = 0x2006C,
   PredefinedKey_ctrlEnter = 0x2001C,
   PredefinedKey_ctrlHome = 0x20066,
   PredefinedKey_ctrlEnd = 0x2006B,
   PredefinedKey_ctrlPageUp = 0x20068,
   PredefinedKey_ctrlPageDown = 0x2006D,
   PredefinedKey_ctrlInsert = 0x2006E,
   PredefinedKey_ctrlSpace = 0x20039,
   PredefinedKey_shiftTab = 0x1000F,
   PredefinedKey_shiftF1 = 0x1003B,
   PredefinedKey_shiftF2 = 0x1003C,
   PredefinedKey_shiftF3 = 0x1003D,
   PredefinedKey_shiftF4 = 0x1003E,
   PredefinedKey_shiftF5 = 0x1003F,
   PredefinedKey_shiftF6 = 0x10040,
   PredefinedKey_shiftF7 = 0x10041,
   PredefinedKey_shiftF8 = 0x10042,
   PredefinedKey_shiftF9 = 0x10043,
   PredefinedKey_shiftF10 = 0x10044,
   PredefinedKey_shiftF11 = 0x10057,
   PredefinedKey_shiftF12 = 0x10058,
   PredefinedKey_shiftInsert = 0x1006E,
   PredefinedKey_shiftDel = 0x1006F
};

typedef uint32 SmartKey;
typedef struct TouchPointerInfo TouchPointerInfo;
typedef uint64_t tparam_WindowController_V;
extern Property * property_AnchorValue_MinMaxValue;
extern void (* AnchorValue_from_MinMaxValue)(AnchorValue * a, MinMaxValue value);
extern MinMaxValue (* AnchorValue_to_MinMaxValue)(AnchorValue * a);

extern Property * property_AnchorValue_int;
extern void (* AnchorValue_from_int)(AnchorValue * a, int value);
extern int (* AnchorValue_to_int)(AnchorValue * a);

extern Property * property_AnchorValue_double;
extern void (* AnchorValue_from_double)(AnchorValue * a, double value);
extern double (* AnchorValue_to_double)(AnchorValue * a);

#define BORDERBITS_contour_SHIFT                         0
#define BORDERBITS_contour_MASK                          0x1
#define BORDERBITS_fixed_SHIFT                           1
#define BORDERBITS_fixed_MASK                            0x2
#define BORDERBITS_sizable_SHIFT                         2
#define BORDERBITS_sizable_MASK                          0x4
#define BORDERBITS_deep_SHIFT                            3
#define BORDERBITS_deep_MASK                             0x8
#define BORDERBITS_bevel_SHIFT                           4
#define BORDERBITS_bevel_MASK                            0x10
#define BORDERBITS_thin_SHIFT                            5
#define BORDERBITS_thin_MASK                             0x20


struct ClipBoard
{
   char * text;
   void * handle;
};
extern bool (* ClipBoard_allocate)(ClipBoard * __this, uint size);

extern void (* ClipBoard_clear)(ClipBoard * __this);

extern bool (* ClipBoard_load)(ClipBoard * __this);

extern bool (* ClipBoard_save)(ClipBoard * __this);

extern void (* ClipBoard_unload)(ClipBoard * __this);

extern Property * property_ClipBoard_memory;
extern char * (* ClipBoard_get_memory)(ClipBoard * c);

extern Property * property_CommonControl_toolTip;
extern void (* CommonControl_set_toolTip)(CommonControl c, constString value);
extern constString (* CommonControl_get_toolTip)(CommonControl c);

extern bool (* Cursor_load)(Cursor __this, const char * name, int hotSpotX, int hotSpotY, byte * paletteShades);

extern Property * property_Cursor_systemCursor;
extern void (* Cursor_set_systemCursor)(Cursor c, SystemCursor value);

extern void (* Extent_addBox)(Extent * __this, Box * box);

extern void (* Extent_copy)(Extent * __this, Extent * source);

extern void (* Extent_empty)(Extent * __this);

extern void (* Extent_excludeBox)(Extent * __this, Box * box, Extent * temp);

extern void (* Extent_exclusion)(Extent * __this, Extent * b, Extent * temp);

extern void (* Extent_intersectBox)(Extent * __this, Box * box);

extern void (* Extent_intersection)(Extent * __this, Extent * b, Extent * temp, Extent * temp2, Extent * temp3);

extern void (* Extent_offset)(Extent * __this, int x, int y);

extern void (* Extent_union)(Extent * __this, Extent * b, Extent * temp);

extern void (* Extent_unionBox)(Extent * __this, Box * box, Extent * temp);

extern int GuiApplication_cycle_vTblID;
bool GuiApplication_cycle(GuiApplication __i, bool idle);
extern Method * method_GuiApplication_cycle;

extern Cursor (* GuiApplication_getCursor)(GuiApplication __this, SystemCursor cursor);

extern bool (* GuiApplication_getKeyState)(GuiApplication __this, Key key);

extern bool (* GuiApplication_getMouseState)(GuiApplication __this, MouseButtons * buttons, int * x, int * y);

extern int GuiApplication_init_vTblID;
bool GuiApplication_init(GuiApplication __i);
extern Method * method_GuiApplication_init;

extern void (* GuiApplication_lock)(GuiApplication __this);

extern void (* GuiApplication_lockEx)(GuiApplication __this, int count);

extern void (* GuiApplication_pauseNetworkEvents)(GuiApplication __this);

extern bool (* GuiApplication_processFileNotifications)(GuiApplication __this);

extern bool (* GuiApplication_processInput)(GuiApplication __this, bool useProcessAll);

extern bool (* GuiApplication_processNetworkEvents)(GuiApplication __this);

extern void (* GuiApplication_resumeNetworkEvents)(GuiApplication __this);

extern bool (* GuiApplication_setDesktopPosition)(GuiApplication __this, int x, int y, int w, int h, bool moveChildren);

extern void (* GuiApplication_signalEvent)(GuiApplication __this);

extern bool (* GuiApplication_switchMode)(GuiApplication __this, bool fullScreen, const char * driverName, Resolution resolution, PixelFormat colorDepth, int refreshRate, const char * skinName, bool fallBack);

extern int GuiApplication_terminate_vTblID;
void GuiApplication_terminate(GuiApplication __i);
extern Method * method_GuiApplication_terminate;

extern void (* GuiApplication_unlock)(GuiApplication __this);

extern int (* GuiApplication_unlockEx)(GuiApplication __this);

extern void (* GuiApplication_updateDisplay)(GuiApplication __this);

extern void (* GuiApplication_wait)(GuiApplication __this);

extern void (* GuiApplication_waitEvent)(GuiApplication __this);

extern void (* GuiApplication_waitNetworkEvent)(GuiApplication __this);

extern Property * property_GuiApplication_appName;
extern void (* GuiApplication_set_appName)(GuiApplication g, const char * value);
extern const char * (* GuiApplication_get_appName)(GuiApplication g);

extern Property * property_GuiApplication_semaphore;
extern Semaphore * (* GuiApplication_get_semaphore)(GuiApplication g);

extern Property * property_GuiApplication_alwaysEmptyInput;
extern void (* GuiApplication_set_alwaysEmptyInput)(GuiApplication g, bool value);
extern bool (* GuiApplication_get_alwaysEmptyInput)(GuiApplication g);

extern Property * property_GuiApplication_fullScreen;
extern void (* GuiApplication_set_fullScreen)(GuiApplication g, bool value);
extern bool (* GuiApplication_get_fullScreen)(GuiApplication g);

extern Property * property_GuiApplication_driver;
extern void (* GuiApplication_set_driver)(GuiApplication g, const char * value);
extern const char * (* GuiApplication_get_driver)(GuiApplication g);

extern Property * property_GuiApplication_resolution;
extern void (* GuiApplication_set_resolution)(GuiApplication g, Resolution value);
extern Resolution (* GuiApplication_get_resolution)(GuiApplication g);

extern Property * property_GuiApplication_pixelFormat;
extern void (* GuiApplication_set_pixelFormat)(GuiApplication g, PixelFormat value);
extern PixelFormat (* GuiApplication_get_pixelFormat)(GuiApplication g);

extern Property * property_GuiApplication_refreshRate;
extern void (* GuiApplication_set_refreshRate)(GuiApplication g, int value);
extern int (* GuiApplication_get_refreshRate)(GuiApplication g);

extern Property * property_GuiApplication_skin;
extern void (* GuiApplication_set_skin)(GuiApplication g, const char * value);
extern const char * (* GuiApplication_get_skin)(GuiApplication g);

extern Property * property_GuiApplication_textMode;
extern void (* GuiApplication_set_textMode)(GuiApplication g, bool value);
extern bool (* GuiApplication_get_textMode)(GuiApplication g);

extern Property * property_GuiApplication_desktop;
extern Window (* GuiApplication_get_desktop)(GuiApplication g);

extern Property * property_GuiApplication_drivers;
extern const char ** (* GuiApplication_get_drivers)(GuiApplication g);

extern Property * property_GuiApplication_skins;
extern const char ** (* GuiApplication_get_skins)(GuiApplication g);

extern Property * property_GuiApplication_currentSkin;
extern Class * (* GuiApplication_get_currentSkin)(GuiApplication g);

extern Property * property_GuiApplication_numDrivers;
extern int (* GuiApplication_get_numDrivers)(GuiApplication g);

extern Property * property_GuiApplication_numSkins;
extern int (* GuiApplication_get_numSkins)(GuiApplication g);

extern Property * property_GuiApplication_timerResolution;
extern void (* GuiApplication_set_timerResolution)(GuiApplication g, uint value);

extern Property * property_GuiApplication_acquiredWindow;
extern Window (* GuiApplication_get_acquiredWindow)(GuiApplication g);

extern int Interface_acquireInput_vTblID;
bool Interface_acquireInput(Interface __i, Window window, bool state);
extern Method * method_Interface_acquireInput;

extern int Interface_activateRootWindow_vTblID;
void Interface_activateRootWindow(Interface __i, Window window);
extern Method * method_Interface_activateRootWindow;

extern int Interface_allocateClipboard_vTblID;
bool Interface_allocateClipboard(Interface __i, ClipBoard * clipBoard, uint size);
extern Method * method_Interface_allocateClipboard;

extern int Interface_clearClipboard_vTblID;
void Interface_clearClipboard(Interface __i);
extern Method * method_Interface_clearClipboard;

extern int Interface_createRootWindow_vTblID;
void * Interface_createRootWindow(Interface __i, Window window);
extern Method * method_Interface_createRootWindow;

extern int Interface_destroyRootWindow_vTblID;
void Interface_destroyRootWindow(Interface __i, Window window);
extern Method * method_Interface_destroyRootWindow;

extern int Interface_ensureFullScreen_vTblID;
void Interface_ensureFullScreen(Interface __i, bool * fullScreen);
extern Method * method_Interface_ensureFullScreen;

extern int Interface_flashRootWindow_vTblID;
void Interface_flashRootWindow(Interface __i, Window window);
extern Method * method_Interface_flashRootWindow;

extern int Interface_getCurrentMode_vTblID;
void Interface_getCurrentMode(Interface __i, bool * fullScreen, Resolution * resolution, PixelFormat * colorDepth, int * refreshRate);
extern Method * method_Interface_getCurrentMode;

extern Key (* Interface_getExtendedKey)(Key key);

extern int Interface_getJoystickState_vTblID;
bool Interface_getJoystickState(Interface __i, int device, Joystick * joystick);
extern Method * method_Interface_getJoystickState;

extern int Interface_getKeyState_vTblID;
bool Interface_getKeyState(Interface __i, Key key);
extern Method * method_Interface_getKeyState;

extern int Interface_getMousePosition_vTblID;
void Interface_getMousePosition(Interface __i, int * x, int * y);
extern Method * method_Interface_getMousePosition;

extern int Interface_getMouseState_vTblID;
bool Interface_getMouseState(Interface __i, MouseButtons * buttons, int * x, int * y);
extern Method * method_Interface_getMouseState;

extern int Interface_getScreenArea_vTblID;
void Interface_getScreenArea(Interface __i, Window window, Box * box);
extern Method * method_Interface_getScreenArea;

extern int Interface_graphicsDrivers_vTblID;
const char ** Interface_graphicsDrivers(Interface __i, int * numDrivers);
extern Method * method_Interface_graphicsDrivers;

extern int Interface_initialize_vTblID;
bool Interface_initialize(Interface __i);
extern Method * method_Interface_initialize;

extern int Interface_loadClipboard_vTblID;
bool Interface_loadClipboard(Interface __i, ClipBoard * clipBoard);
extern Method * method_Interface_loadClipboard;

extern int Interface_lock_vTblID;
void Interface_lock(Interface __i, Window window);
extern Method * method_Interface_lock;

extern int Interface_offsetWindow_vTblID;
void Interface_offsetWindow(Interface __i, Window window, int * x, int * y);
extern Method * method_Interface_offsetWindow;

extern int Interface_orderRootWindow_vTblID;
void Interface_orderRootWindow(Interface __i, Window window, bool topMost);
extern Method * method_Interface_orderRootWindow;

extern int Interface_positionRootWindow_vTblID;
void Interface_positionRootWindow(Interface __i, Window window, int x, int y, int w, int h, bool move, bool resize);
extern Method * method_Interface_positionRootWindow;

extern int Interface_processInput_vTblID;
bool Interface_processInput(Interface __i, bool processAll);
extern Method * method_Interface_processInput;

extern int Interface_saveClipboard_vTblID;
bool Interface_saveClipboard(Interface __i, ClipBoard * clipBoard);
extern Method * method_Interface_saveClipboard;

extern int Interface_screenMode_vTblID;
bool Interface_screenMode(Interface __i, bool fullScreen, Resolution resolution, PixelFormat colorDepth, int refreshRate, bool * textMode);
extern Method * method_Interface_screenMode;

extern int Interface_setCaret_vTblID;
void Interface_setCaret(Interface __i, int caretX, int caretY, int size);
extern Method * method_Interface_setCaret;

extern int Interface_setIcon_vTblID;
bool Interface_setIcon(Interface __i, Window window, BitmapResource icon);
extern Method * method_Interface_setIcon;

extern int Interface_setMouseCapture_vTblID;
void Interface_setMouseCapture(Interface __i, Window window);
extern Method * method_Interface_setMouseCapture;

extern int Interface_setMouseCursor_vTblID;
void Interface_setMouseCursor(Interface __i, Window window, SystemCursor cursor);
extern Method * method_Interface_setMouseCursor;

extern int Interface_setMousePosition_vTblID;
void Interface_setMousePosition(Interface __i, int x, int y);
extern Method * method_Interface_setMousePosition;

extern int Interface_setMouseRange_vTblID;
void Interface_setMouseRange(Interface __i, Window window, Box * box);
extern Method * method_Interface_setMouseRange;

extern int Interface_setRootWindowCaption_vTblID;
void Interface_setRootWindowCaption(Interface __i, Window window, const char * name);
extern Method * method_Interface_setRootWindowCaption;

extern int Interface_setRootWindowColor_vTblID;
void Interface_setRootWindowColor(Interface __i, Window window);
extern Method * method_Interface_setRootWindowColor;

extern int Interface_setRootWindowState_vTblID;
void Interface_setRootWindowState(Interface __i, Window window, WindowState state, bool visible);
extern Method * method_Interface_setRootWindowState;

extern int Interface_setTimerResolution_vTblID;
void Interface_setTimerResolution(Interface __i, uint hertz);
extern Method * method_Interface_setTimerResolution;

extern int Interface_startMoving_vTblID;
void Interface_startMoving(Interface __i, Window window, int x, int y, bool fromKeyBoard);
extern Method * method_Interface_startMoving;

extern int Interface_stopMoving_vTblID;
void Interface_stopMoving(Interface __i, Window window);
extern Method * method_Interface_stopMoving;

extern int Interface_terminate_vTblID;
void Interface_terminate(Interface __i);
extern Method * method_Interface_terminate;

extern char (* Interface_translateKey)(Key key, bool shift);

extern int Interface_unloadClipboard_vTblID;
void Interface_unloadClipboard(Interface __i, ClipBoard * clipBoard);
extern Method * method_Interface_unloadClipboard;

extern int Interface_unlock_vTblID;
void Interface_unlock(Interface __i, Window window);
extern Method * method_Interface_unlock;

extern int Interface_updateRootWindow_vTblID;
void Interface_updateRootWindow(Interface __i, Window window);
extern Method * method_Interface_updateRootWindow;

extern int Interface_wait_vTblID;
void Interface_wait(Interface __i);
extern Method * method_Interface_wait;

extern void (* Interface_writeKeyedText)(Surface surface, int x, int y, const char * text, Key hotKey);

extern void (* Interface_writeKeyedTextDisabled)(Surface surface, int x, int y, const char * text, Key hotKey, bool disabled);

struct Joystick
{
   int x;
   int y;
   int z;
   int rx;
   int ry;
   int rz;
   uint buttons;
};
#define KEY_code_SHIFT                                   0
#define KEY_code_MASK                                    0xFFFF
#define KEY_shift_SHIFT                                  16
#define KEY_shift_MASK                                   0x10000
#define KEY_ctrl_SHIFT                                   17
#define KEY_ctrl_MASK                                    0x20000
#define KEY_alt_SHIFT                                    18
#define KEY_alt_MASK                                     0x40000
#define KEY_cmd_SHIFT                                    19
#define KEY_cmd_MASK                                     0x80000
#define KEY_modifiers_SHIFT                              16
#define KEY_modifiers_MASK                               0xFFFF0000


extern Property * property_Key_SmartKey;
extern SmartKey (* Key_to_SmartKey)(Key key);

extern Property * property_MiddleAnchorValue_MinMaxValue;
extern void (* MiddleAnchorValue_from_MinMaxValue)(MiddleAnchorValue * m, MinMaxValue value);
extern MinMaxValue (* MiddleAnchorValue_to_MinMaxValue)(MiddleAnchorValue * m);

extern Property * property_MiddleAnchorValue_int;
extern void (* MiddleAnchorValue_from_int)(MiddleAnchorValue * m, int value);
extern int (* MiddleAnchorValue_to_int)(MiddleAnchorValue * m);

extern Property * property_MiddleAnchorValue_double;
extern void (* MiddleAnchorValue_from_double)(MiddleAnchorValue * m, double value);
extern double (* MiddleAnchorValue_to_double)(MiddleAnchorValue * m);

#define MODIFIERS_shift_SHIFT                            0
#define MODIFIERS_shift_MASK                             0x1
#define MODIFIERS_ctrl_SHIFT                             1
#define MODIFIERS_ctrl_MASK                              0x2
#define MODIFIERS_alt_SHIFT                              2
#define MODIFIERS_alt_MASK                               0x4
#define MODIFIERS_cmd_SHIFT                              3
#define MODIFIERS_cmd_MASK                               0x8
#define MODIFIERS_left_SHIFT                             4
#define MODIFIERS_left_MASK                              0x10
#define MODIFIERS_middle_SHIFT                           5
#define MODIFIERS_middle_MASK                            0x20
#define MODIFIERS_right_SHIFT                            6
#define MODIFIERS_right_MASK                             0x40
#define MODIFIERS_isActivate_SHIFT                       7
#define MODIFIERS_isActivate_MASK                        0x80
#define MODIFIERS_isSideEffect_SHIFT                     8
#define MODIFIERS_isSideEffect_MASK                      0x100
#define MODIFIERS_closingDropDown_SHIFT                  9
#define MODIFIERS_closingDropDown_MASK                   0x200


#define MOUSEBUTTONS_left_SHIFT                          0
#define MOUSEBUTTONS_left_MASK                           0x1
#define MOUSEBUTTONS_right_SHIFT                         1
#define MOUSEBUTTONS_right_MASK                          0x2
#define MOUSEBUTTONS_middle_SHIFT                        2
#define MOUSEBUTTONS_middle_MASK                         0x4


extern int Skin_captionFont_vTblID;
FontResource Skin_captionFont(Skin __i);
extern Method * method_Skin_captionFont;

extern int Skin_cursorsBitmaps_vTblID;
const char * Skin_cursorsBitmaps(Skin __i, uint id, int * hotSpotX, int * hotSpotY, byte ** paletteShades);
extern Method * method_Skin_cursorsBitmaps;

extern int Skin_getBitmap_vTblID;
BitmapResource Skin_getBitmap(Skin __i, SkinBitmap ap1);
extern Method * method_Skin_getBitmap;

extern int Skin_getDecorationsSize_vTblID;
void Skin_getDecorationsSize(Skin __i, Window ap1, MinMaxValue * ap2, MinMaxValue * ap3);
extern Method * method_Skin_getDecorationsSize;

extern int Skin_horizontalSBH_vTblID;
int Skin_horizontalSBH(Skin __i);
extern Method * method_Skin_horizontalSBH;

extern int Skin_isMouseMoving_vTblID;
bool Skin_isMouseMoving(Skin __i, Window ap1, int ap2, int ap3, int ap4, int ap5);
extern Method * method_Skin_isMouseMoving;

extern int Skin_isMouseResizing_vTblID;
bool Skin_isMouseResizing(Skin __i, Window ap1, int ap2, int ap3, int ap4, int ap5, bool * ap6, bool * ap7, bool * ap8, bool * ap9);
extern Method * method_Skin_isMouseResizing;

extern int Skin_setWindowArea_vTblID;
void Skin_setWindowArea(Skin __i, Window ap1, int * ap2, int * ap3, MinMaxValue * ap4, MinMaxValue * ap5, MinMaxValue * ap6, MinMaxValue * ap7);
extern Method * method_Skin_setWindowArea;

extern int Skin_setWindowMinimum_vTblID;
void Skin_setWindowMinimum(Skin __i, Window ap1, MinMaxValue * ap2, MinMaxValue * ap3);
extern Method * method_Skin_setWindowMinimum;

extern int Skin_showDecorations_vTblID;
void Skin_showDecorations(Skin __i, void * ap1, Surface ap2, Window ap3, const char * ap4, bool ap5, bool ap6);
extern Method * method_Skin_showDecorations;

extern int Skin_systemFont_vTblID;
FontResource Skin_systemFont(Skin __i);
extern Method * method_Skin_systemFont;

extern int Skin_updateNonClient_vTblID;
void Skin_updateNonClient(Skin __i, void * ap1);
extern Method * method_Skin_updateNonClient;

extern int Skin_verticalSBW_vTblID;
int Skin_verticalSBW(Skin __i);
extern Method * method_Skin_verticalSBW;

#define SMARTKEY_code_SHIFT                              0
#define SMARTKEY_code_MASK                               0xFFFF
#define SMARTKEY_shift_SHIFT                             16
#define SMARTKEY_shift_MASK                              0x10000
#define SMARTKEY_ctrl_SHIFT                              17
#define SMARTKEY_ctrl_MASK                               0x20000
#define SMARTKEY_alt_SHIFT                               18
#define SMARTKEY_alt_MASK                                0x40000
#define SMARTKEY_modifiers_SHIFT                         16
#define SMARTKEY_modifiers_MASK                          0xFFFF0000


extern int Timer_delayExpired_vTblID;
bool Timer_delayExpired(Timer __i, any_object * __t);
extern Method * method_Timer_delayExpired;

extern void (* Timer_start)(Timer __this);

extern void (* Timer_stop)(Timer __this);

extern Property * property_Timer_userData;
extern void (* Timer_set_userData)(Timer t, void * value);
extern void * (* Timer_get_userData)(Timer t);

extern Property * property_Timer_delay;
extern void (* Timer_set_delay)(Timer t, Time value);
extern Time (* Timer_get_delay)(Timer t);

extern Property * property_Timer_started;
extern void (* Timer_set_started)(Timer t, bool value);
extern bool (* Timer_get_started)(Timer t);

struct TouchPointerInfo
{
   int id;
   Point point;
   float size;
   float pressure;
};
extern bool (* Window_acquireInput)(Window __this, bool acquired);

extern void (* Window_activate)(Window __this);

extern void (* Window_addResource)(Window __this, Resource resource);

extern bool (* Window_buttonCloseDialog)(Window __this, Button button, int x, int y, Modifiers mods);

extern bool (* Window_capture)(Window __this);

extern bool (* Window_closeConfirmation)(Window __this, bool parentClosing);

extern bool (* Window_create)(Window __this);

extern bool (* Window_cycleChildren)(Window __this, bool backward, bool clientOnly, bool tabCycleOnly, bool cycleParents);

extern void (* Window_deactivate)(Window __this);

extern bool (* Window_destroy)(Window __this, int64 code);

extern DialogResult (* Window_doModal)(Window __this);

extern DialogResult (* Window_doModalEnd)(Window __this);

extern bool (* Window_doModalLoop)(Window __this);

extern void (* Window_doModalStart)(Window __this);

extern void (* Window_externalPosition)(Window __this, int x, int y, int w, int h);

extern void (* Window_flash)(Window __this);

extern void (* Window_freeMouseRange)();

extern void (* Window_getCaretPosition)(Window __this, Point * caretPos);

extern int (* Window_getCaretSize)(Window __this);

extern int Window_getDecorationsSize_vTblID;
void Window_getDecorationsSize(Window __i, MinMaxValue * w, MinMaxValue * h);
extern Method * method_Window_getDecorationsSize;

extern BitmapResource (* Window_getIcon)(Window __this, SkinBitmap iconID);

extern void (* Window_getMousePosition)(Window __this, int * x, int * y);

extern void (* Window_getNCMousePosition)(Window __this, int * x, int * y);

extern bool (* Window_grab)(Window __this, Bitmap bitmap, Box * box, bool decorations);

extern int Window_isInside_vTblID;
bool Window_isInside(Window __i, int x, int y);
extern Method * method_Window_isInside;

extern int Window_isMouseMoving_vTblID;
bool Window_isMouseMoving(Window __i, int x, int y, int w, int h);
extern Method * method_Window_isMouseMoving;

extern int Window_isMouseResizing_vTblID;
bool Window_isMouseResizing(Window __i, int x, int y, int w, int h, bool * resizeX, bool * resizeY, bool * resizeEndX, bool * resizeEndY);
extern Method * method_Window_isMouseResizing;

extern int Window_isOpaque_vTblID;
bool Window_isOpaque(Window __i);
extern Method * method_Window_isOpaque;

extern void (* Window_makeActive)(Window __this);

extern bool (* Window_menuFileClose)(Window __this, MenuItem selection, Modifiers mods);

extern bool (* Window_menuFileExit)(Window __this, MenuItem selection, Modifiers mods);

extern bool (* Window_menuFileSave)(Window __this, MenuItem selection, Modifiers mods);

extern bool (* Window_menuFileSaveAll)(Window __this, MenuItem selection, Modifiers mods);

extern bool (* Window_menuFileSaveAs)(Window __this, MenuItem selection, Modifiers mods);

extern bool (* Window_menuWindowArrangeIcons)(Window __this, MenuItem selection, Modifiers mods);

extern bool (* Window_menuWindowCascade)(Window __this, MenuItem selection, Modifiers mods);

extern bool (* Window_menuWindowClose)(Window __this, MenuItem selection, Modifiers mods);

extern bool (* Window_menuWindowCloseAll)(Window __this, MenuItem selection, Modifiers mods);

extern bool (* Window_menuWindowMaximize)(Window __this, MenuItem selection, Modifiers mods);

extern bool (* Window_menuWindowMinimize)(Window __this, MenuItem selection, Modifiers mods);

extern bool (* Window_menuWindowMove)(Window __this, MenuItem selection, Modifiers mods);

extern bool (* Window_menuWindowNext)(Window __this, MenuItem selection, Modifiers mods);

extern bool (* Window_menuWindowPrevious)(Window __this, MenuItem selection, Modifiers mods);

extern bool (* Window_menuWindowRestore)(Window __this, MenuItem selection, Modifiers mods);

extern bool (* Window_menuWindowSelectWindow)(Window __this, MenuItem selection, Modifiers mods);

extern bool (* Window_menuWindowSize)(Window __this, MenuItem selection, Modifiers mods);

extern bool (* Window_menuWindowStayOnTop)(Window __this, MenuItem selection, Modifiers mods);

extern bool (* Window_menuWindowTileHorz)(Window __this, MenuItem selection, Modifiers mods);

extern bool (* Window_menuWindowTileVert)(Window __this, MenuItem selection, Modifiers mods);

extern bool (* Window_menuWindowWindows)(Window __this, MenuItem selection, Modifiers mods);

extern DialogResult (* Window_modal)(Window __this);

extern bool (* Window_mouseMessage)(Window __this, uint method, int x, int y, Modifiers * mods, bool consequential, bool activate);

extern void (* Window_move)(Window __this, int x, int y, int w, int h);

extern bool (* Window_multiTouchMessage)(Window __this, TouchPointerEvent event, Array infos, Modifiers * mods, bool consequential, bool activate);

extern int Window_notifyActivate_vTblID;
bool Window_notifyActivate(Window __i, Window __t, Window window, bool active, Window previous);
extern Method * method_Window_notifyActivate;

extern int Window_notifyDestroyed_vTblID;
void Window_notifyDestroyed(Window __i, Window __t, Window window, DialogResult result);
extern Method * method_Window_notifyDestroyed;

extern int Window_notifySaved_vTblID;
void Window_notifySaved(Window __i, Window __t, Window window, const char * filePath);
extern Method * method_Window_notifySaved;

extern int Window_onActivate_vTblID;
bool Window_onActivate(Window __i, bool active, Window previous, bool * goOnWithActivation, bool direct);
extern Method * method_Window_onActivate;

extern int Window_onActivateClient_vTblID;
void Window_onActivateClient(Window __i, Window client, Window previous);
extern Method * method_Window_onActivateClient;

extern int Window_onApplyGraphics_vTblID;
void Window_onApplyGraphics(Window __i);
extern Method * method_Window_onApplyGraphics;

extern int Window_onChildAddedOrRemoved_vTblID;
void Window_onChildAddedOrRemoved(Window __i, Window child, bool removed);
extern Method * method_Window_onChildAddedOrRemoved;

extern int Window_onChildResized_vTblID;
void Window_onChildResized(Window __i, Window child, int x, int y, int w, int h);
extern Method * method_Window_onChildResized;

extern int Window_onChildVisibilityToggled_vTblID;
void Window_onChildVisibilityToggled(Window __i, Window child, bool visible);
extern Method * method_Window_onChildVisibilityToggled;

extern int Window_onClose_vTblID;
bool Window_onClose(Window __i, bool parentClosing);
extern Method * method_Window_onClose;

extern int Window_onCreate_vTblID;
bool Window_onCreate(Window __i);
extern Method * method_Window_onCreate;

extern int Window_onDestroy_vTblID;
void Window_onDestroy(Window __i);
extern Method * method_Window_onDestroy;

extern int Window_onDestroyed_vTblID;
void Window_onDestroyed(Window __i);
extern Method * method_Window_onDestroyed;

extern int Window_onDrawOverChildren_vTblID;
void Window_onDrawOverChildren(Window __i, Surface surface);
extern Method * method_Window_onDrawOverChildren;

extern int Window_onFileModified_vTblID;
bool Window_onFileModified(Window __i, FileChange fileChange, const char * param);
extern Method * method_Window_onFileModified;

extern int Window_onHScroll_vTblID;
void Window_onHScroll(Window __i, ScrollBarAction action, int position, Key key);
extern Method * method_Window_onHScroll;

extern int Window_onKeyDown_vTblID;
bool Window_onKeyDown(Window __i, Key key, unichar ch);
extern Method * method_Window_onKeyDown;

extern int Window_onKeyHit_vTblID;
bool Window_onKeyHit(Window __i, Key key, unichar ch);
extern Method * method_Window_onKeyHit;

extern int Window_onKeyUp_vTblID;
bool Window_onKeyUp(Window __i, Key key, unichar ch);
extern Method * method_Window_onKeyUp;

extern int Window_onLeftButtonDown_vTblID;
bool Window_onLeftButtonDown(Window __i, int x, int y, Modifiers mods);
extern Method * method_Window_onLeftButtonDown;

extern int Window_onLeftButtonUp_vTblID;
bool Window_onLeftButtonUp(Window __i, int x, int y, Modifiers mods);
extern Method * method_Window_onLeftButtonUp;

extern int Window_onLeftDoubleClick_vTblID;
bool Window_onLeftDoubleClick(Window __i, int x, int y, Modifiers mods);
extern Method * method_Window_onLeftDoubleClick;

extern int Window_onLoadGraphics_vTblID;
bool Window_onLoadGraphics(Window __i);
extern Method * method_Window_onLoadGraphics;

extern int Window_onMiddleButtonDown_vTblID;
bool Window_onMiddleButtonDown(Window __i, int x, int y, Modifiers mods);
extern Method * method_Window_onMiddleButtonDown;

extern int Window_onMiddleButtonUp_vTblID;
bool Window_onMiddleButtonUp(Window __i, int x, int y, Modifiers mods);
extern Method * method_Window_onMiddleButtonUp;

extern int Window_onMiddleDoubleClick_vTblID;
bool Window_onMiddleDoubleClick(Window __i, int x, int y, Modifiers mods);
extern Method * method_Window_onMiddleDoubleClick;

extern int Window_onMouseCaptureLost_vTblID;
void Window_onMouseCaptureLost(Window __i);
extern Method * method_Window_onMouseCaptureLost;

extern int Window_onMouseLeave_vTblID;
bool Window_onMouseLeave(Window __i, Modifiers mods);
extern Method * method_Window_onMouseLeave;

extern int Window_onMouseMove_vTblID;
bool Window_onMouseMove(Window __i, int x, int y, Modifiers mods);
extern Method * method_Window_onMouseMove;

extern int Window_onMouseOver_vTblID;
bool Window_onMouseOver(Window __i, int x, int y, Modifiers mods);
extern Method * method_Window_onMouseOver;

extern int Window_onMoving_vTblID;
bool Window_onMoving(Window __i, int * x, int * y, int w, int h);
extern Method * method_Window_onMoving;

extern int Window_onMultiTouch_vTblID;
bool Window_onMultiTouch(Window __i, TouchPointerEvent event, Array infos, Modifiers mods);
extern Method * method_Window_onMultiTouch;

extern int Window_onPosition_vTblID;
void Window_onPosition(Window __i, int x, int y, int width, int height);
extern Method * method_Window_onPosition;

extern int Window_onPostCreate_vTblID;
bool Window_onPostCreate(Window __i);
extern Method * method_Window_onPostCreate;

extern int Window_onRedraw_vTblID;
void Window_onRedraw(Window __i, Surface surface);
extern Method * method_Window_onRedraw;

extern int Window_onResize_vTblID;
void Window_onResize(Window __i, int width, int height);
extern Method * method_Window_onResize;

extern int Window_onResizing_vTblID;
bool Window_onResizing(Window __i, int * width, int * height);
extern Method * method_Window_onResizing;

extern int Window_onRightButtonDown_vTblID;
bool Window_onRightButtonDown(Window __i, int x, int y, Modifiers mods);
extern Method * method_Window_onRightButtonDown;

extern int Window_onRightButtonUp_vTblID;
bool Window_onRightButtonUp(Window __i, int x, int y, Modifiers mods);
extern Method * method_Window_onRightButtonUp;

extern int Window_onRightDoubleClick_vTblID;
bool Window_onRightDoubleClick(Window __i, int x, int y, Modifiers mods);
extern Method * method_Window_onRightDoubleClick;

extern int Window_onSaveFile_vTblID;
bool Window_onSaveFile(Window __i, const char * fileName);
extern Method * method_Window_onSaveFile;

extern int Window_onStateChange_vTblID;
bool Window_onStateChange(Window __i, WindowState state, Modifiers mods);
extern Method * method_Window_onStateChange;

extern int Window_onSysKeyDown_vTblID;
bool Window_onSysKeyDown(Window __i, Key key, unichar ch);
extern Method * method_Window_onSysKeyDown;

extern int Window_onSysKeyHit_vTblID;
bool Window_onSysKeyHit(Window __i, Key key, unichar ch);
extern Method * method_Window_onSysKeyHit;

extern int Window_onSysKeyUp_vTblID;
bool Window_onSysKeyUp(Window __i, Key key, unichar ch);
extern Method * method_Window_onSysKeyUp;

extern int Window_onUnloadGraphics_vTblID;
void Window_onUnloadGraphics(Window __i);
extern Method * method_Window_onUnloadGraphics;

extern int Window_onVScroll_vTblID;
void Window_onVScroll(Window __i, ScrollBarAction action, int position, Key key);
extern Method * method_Window_onVScroll;

extern int Window_preShowDecorations_vTblID;
void Window_preShowDecorations(Window __i, Font * captionFont, Surface surface, const char * name, bool active, bool moving);
extern Method * method_Window_preShowDecorations;

extern void (* Window_releaseCapture)(Window __this);

extern void (* Window_removeResource)(Window __this, Resource resource);

extern void (* Window_restoreCaret)();

extern void (* Window_scroll)(Window __this, int x, int y);

extern int Window_setBox_vTblID;
void Window_setBox(Window __i, Box * box);
extern Method * method_Window_setBox;

extern void (* Window_setCaption)(Window __this, const char * format, ...);

extern void (* Window_setCaret)(Window __this, int x, int y, int size);

extern void (* Window_setMouseRange)(Window __this, Box * range);

extern void (* Window_setMouseRangeToClient)(Window __this);

extern void (* Window_setMouseRangeToWindow)(Window __this);

extern void (* Window_setScrollArea)(Window __this, int width, int height, bool snapToStep);

extern void (* Window_setScrollLineStep)(Window __this, int stepX, int stepY);

extern void (* Window_setScrollPosition)(Window __this, int x, int y);

extern void (* Window_setState)(Window __this, WindowState newState, bool activate, Modifiers mods);

extern void (* Window_setText)(Window __this, const char * format, ...);

extern int Window_setWindowArea_vTblID;
void Window_setWindowArea(Window __i, int * x, int * y, MinMaxValue * w, MinMaxValue * h, MinMaxValue * cw, MinMaxValue * ch);
extern Method * method_Window_setWindowArea;

extern int Window_setWindowMinimum_vTblID;
void Window_setWindowMinimum(Window __i, MinMaxValue * mw, MinMaxValue * mh);
extern Method * method_Window_setWindowMinimum;

extern int Window_showDecorations_vTblID;
void Window_showDecorations(Window __i, Font * captionFont, Surface surface, const char * name, bool active, bool moving);
extern Method * method_Window_showDecorations;

extern void (* Window_showSysMenu)(Window __this, int x, int y);

extern void (* Window_softActivate)(Window __this);

extern void (* Window_update)(Window __this, Box * region);

extern void (* Window_updateDisplay)(Window __this);

extern int Window_updateNonClient_vTblID;
void Window_updateNonClient(Window __i);
extern Method * method_Window_updateNonClient;

extern void (* Window_writeCaption)(Window __this, Surface surface, int x, int y);

extern Property * property_Window_parent;
extern void (* Window_set_parent)(Window w, Window value);
extern Window (* Window_get_parent)(Window w);

extern Property * property_Window_master;
extern void (* Window_set_master)(Window w, Window value);
extern Window (* Window_get_master)(Window w);

extern Property * property_Window_caption;
extern void (* Window_set_caption)(Window w, const char * value);
extern const char * (* Window_get_caption)(Window w);

extern Property * property_Window_hotKey;
extern void (* Window_set_hotKey)(Window w, Key value);
extern Key (* Window_get_hotKey)(Window w);

extern Property * property_Window_background;
extern void (* Window_set_background)(Window w, Color value);
extern Color (* Window_get_background)(Window w);

extern Property * property_Window_opacity;
extern void (* Window_set_opacity)(Window w, Percentage value);
extern Percentage (* Window_get_opacity)(Window w);

extern Property * property_Window_foreground;
extern void (* Window_set_foreground)(Window w, Color value);
extern Color (* Window_get_foreground)(Window w);

extern Property * property_Window_borderStyle;
extern void (* Window_set_borderStyle)(Window w, BorderStyle value);
extern BorderStyle (* Window_get_borderStyle)(Window w);

extern Property * property_Window_minClientSize;
extern void (* Window_set_minClientSize)(Window w, const Size * value);
extern void (* Window_get_minClientSize)(Window w, Size * value);

extern Property * property_Window_maxClientSize;
extern void (* Window_set_maxClientSize)(Window w, const Size * value);
extern void (* Window_get_maxClientSize)(Window w, Size * value);

extern Property * property_Window_hasMaximize;
extern void (* Window_set_hasMaximize)(Window w, bool value);
extern bool (* Window_get_hasMaximize)(Window w);

extern Property * property_Window_hasMinimize;
extern void (* Window_set_hasMinimize)(Window w, bool value);
extern bool (* Window_get_hasMinimize)(Window w);

extern Property * property_Window_hasClose;
extern void (* Window_set_hasClose)(Window w, bool value);
extern bool (* Window_get_hasClose)(Window w);

extern Property * property_Window_nonClient;
extern void (* Window_set_nonClient)(Window w, bool value);
extern bool (* Window_get_nonClient)(Window w);

extern Property * property_Window_inactive;
extern void (* Window_set_inactive)(Window w, bool value);
extern bool (* Window_get_inactive)(Window w);

extern Property * property_Window_clickThrough;
extern void (* Window_set_clickThrough)(Window w, bool value);
extern bool (* Window_get_clickThrough)(Window w);

extern Property * property_Window_isRemote;
extern void (* Window_set_isRemote)(Window w, bool value);
extern bool (* Window_get_isRemote)(Window w);

extern Property * property_Window_noCycle;
extern void (* Window_set_noCycle)(Window w, bool value);
extern bool (* Window_get_noCycle)(Window w);

extern Property * property_Window_isModal;
extern void (* Window_set_isModal)(Window w, bool value);
extern bool (* Window_get_isModal)(Window w);

extern Property * property_Window_interim;
extern void (* Window_set_interim)(Window w, bool value);
extern bool (* Window_get_interim)(Window w);

extern Property * property_Window_tabCycle;
extern void (* Window_set_tabCycle)(Window w, bool value);
extern bool (* Window_get_tabCycle)(Window w);

extern Property * property_Window_isDefault;
extern void (* Window_set_isDefault)(Window w, bool value);
extern bool (* Window_get_isDefault)(Window w);

extern Property * property_Window_drawBehind;
extern void (* Window_set_drawBehind)(Window w, bool value);
extern bool (* Window_get_drawBehind)(Window w);

extern Property * property_Window_hasMenuBar;
extern void (* Window_set_hasMenuBar)(Window w, bool value);
extern bool (* Window_get_hasMenuBar)(Window w);

extern Property * property_Window_hasStatusBar;
extern void (* Window_set_hasStatusBar)(Window w, bool value);
extern bool (* Window_get_hasStatusBar)(Window w);

extern Property * property_Window_stayOnTop;
extern void (* Window_set_stayOnTop)(Window w, bool value);
extern bool (* Window_get_stayOnTop)(Window w);

extern Property * property_Window_menu;
extern void (* Window_set_menu)(Window w, Menu value);
extern Menu (* Window_get_menu)(Window w);

extern Property * property_Window_font;
extern void (* Window_set_font)(Window w, FontResource value);
extern FontResource (* Window_get_font)(Window w);
extern bool (* Window_isSet_font)(Window w);

extern Property * property_Window_sizeAnchor;
extern void (* Window_set_sizeAnchor)(Window w, const SizeAnchor * value);
extern void (* Window_get_sizeAnchor)(Window w, SizeAnchor * value);
extern bool (* Window_isSet_sizeAnchor)(Window w);

extern Property * property_Window_size;
extern void (* Window_set_size)(Window w, const Size * value);
extern void (* Window_get_size)(Window w, Size * value);
extern bool (* Window_isSet_size)(Window w);

extern Property * property_Window_clientSize;
extern void (* Window_set_clientSize)(Window w, const Size * value);
extern void (* Window_get_clientSize)(Window w, Size * value);
extern bool (* Window_isSet_clientSize)(Window w);

extern Property * property_Window_initSize;
extern void (* Window_get_initSize)(Window w, Size * value);

extern Property * property_Window_anchor;
extern void (* Window_set_anchor)(Window w, const Anchor * value);
extern void (* Window_get_anchor)(Window w, Anchor * value);
extern bool (* Window_isSet_anchor)(Window w);

extern Property * property_Window_position;
extern void (* Window_set_position)(Window w, const Point * value);
extern void (* Window_get_position)(Window w, Point * value);

extern Property * property_Window_disabled;
extern void (* Window_set_disabled)(Window w, bool value);
extern bool (* Window_get_disabled)(Window w);

extern Property * property_Window_isEnabled;
extern bool (* Window_get_isEnabled)(Window w);

extern Property * property_Window_state;
extern void (* Window_set_state)(Window w, WindowState value);
extern WindowState (* Window_get_state)(Window w);

extern Property * property_Window_visible;
extern void (* Window_set_visible)(Window w, bool value);
extern bool (* Window_get_visible)(Window w);

extern Property * property_Window_isDocument;
extern void (* Window_set_isDocument)(Window w, bool value);
extern bool (* Window_get_isDocument)(Window w);

extern Property * property_Window_mergeMenus;
extern void (* Window_set_mergeMenus)(Window w, bool value);
extern bool (* Window_get_mergeMenus)(Window w);

extern Property * property_Window_hasHorzScroll;
extern void (* Window_set_hasHorzScroll)(Window w, bool value);
extern bool (* Window_get_hasHorzScroll)(Window w);

extern Property * property_Window_hasVertScroll;
extern void (* Window_set_hasVertScroll)(Window w, bool value);
extern bool (* Window_get_hasVertScroll)(Window w);

extern Property * property_Window_dontHideScroll;
extern void (* Window_set_dontHideScroll)(Window w, bool value);
extern bool (* Window_get_dontHideScroll)(Window w);

extern Property * property_Window_dontScrollVert;
extern void (* Window_set_dontScrollVert)(Window w, bool value);
extern bool (* Window_get_dontScrollVert)(Window w);

extern Property * property_Window_dontScrollHorz;
extern void (* Window_set_dontScrollHorz)(Window w, bool value);
extern bool (* Window_get_dontScrollHorz)(Window w);

extern Property * property_Window_snapVertScroll;
extern void (* Window_set_snapVertScroll)(Window w, bool value);
extern bool (* Window_get_snapVertScroll)(Window w);

extern Property * property_Window_snapHorzScroll;
extern void (* Window_set_snapHorzScroll)(Window w, bool value);
extern bool (* Window_get_snapHorzScroll)(Window w);

extern Property * property_Window_scroll;
extern void (* Window_set_scroll)(Window w, const Point * value);
extern void (* Window_get_scroll)(Window w, Point * value);

extern Property * property_Window_modifyVirtualArea;
extern void (* Window_set_modifyVirtualArea)(Window w, bool value);
extern bool (* Window_get_modifyVirtualArea)(Window w);

extern Property * property_Window_dontAutoScrollArea;
extern void (* Window_set_dontAutoScrollArea)(Window w, bool value);
extern bool (* Window_get_dontAutoScrollArea)(Window w);

extern Property * property_Window_fileName;
extern void (* Window_set_fileName)(Window w, const char * value);
extern const char * (* Window_get_fileName)(Window w);

extern Property * property_Window_id;
extern void (* Window_set_id)(Window w, int64 value);
extern int64 (* Window_get_id)(Window w);

extern Property * property_Window_modifiedDocument;
extern void (* Window_set_modifiedDocument)(Window w, bool value);
extern bool (* Window_get_modifiedDocument)(Window w);

extern Property * property_Window_showInTaskBar;
extern void (* Window_set_showInTaskBar)(Window w, bool value);
extern bool (* Window_get_showInTaskBar)(Window w);

extern Property * property_Window_saveDialog;
extern void (* Window_set_saveDialog)(Window w, FileDialog value);

extern Property * property_Window_isActiveClient;
extern void (* Window_set_isActiveClient)(Window w, bool value);
extern bool (* Window_get_isActiveClient)(Window w);

extern Property * property_Window_cursor;
extern void (* Window_set_cursor)(Window w, Cursor value);
extern Cursor (* Window_get_cursor)(Window w);

extern Property * property_Window_name;
extern void (* Window_set_name)(Window w, const char * value);
extern const char * (* Window_get_name)(Window w);

extern Property * property_Window_displayDriver;
extern void (* Window_set_displayDriver)(Window w, const char * value);
extern const char * (* Window_get_displayDriver)(Window w);

extern Property * property_Window_autoCreate;
extern void (* Window_set_autoCreate)(Window w, bool value);
extern bool (* Window_get_autoCreate)(Window w);

extern Property * property_Window_scrollArea;
extern void (* Window_set_scrollArea)(Window w, const Size * value);
extern void (* Window_get_scrollArea)(Window w, Size * value);
extern bool (* Window_isSet_scrollArea)(Window w);

extern Property * property_Window_is3D;
extern void (* Window_set_is3D)(Window w, bool value);
extern bool (* Window_get_is3D)(Window w);

extern Property * property_Window_fontObject;
extern Font * (* Window_get_fontObject)(Window w);

extern Property * property_Window_clientStart;
extern void (* Window_get_clientStart)(Window w, Point * value);

extern Property * property_Window_absPosition;
extern void (* Window_get_absPosition)(Window w, Point * value);

extern Property * property_Window_normalAnchor;
extern void (* Window_get_normalAnchor)(Window w, Anchor * value);

extern Property * property_Window_normalSizeAnchor;
extern void (* Window_get_normalSizeAnchor)(Window w, SizeAnchor * value);

extern Property * property_Window_active;
extern bool (* Window_get_active)(Window w);

extern Property * property_Window_created;
extern bool (* Window_get_created)(Window w);

extern Property * property_Window_destroyed;
extern bool (* Window_get_destroyed)(Window w);

extern Property * property_Window_firstSlave;
extern Window (* Window_get_firstSlave)(Window w);

extern Property * property_Window_firstChild;
extern Window (* Window_get_firstChild)(Window w);

extern Property * property_Window_lastChild;
extern Window (* Window_get_lastChild)(Window w);

extern Property * property_Window_activeClient;
extern Window (* Window_get_activeClient)(Window w);

extern Property * property_Window_activeChild;
extern Window (* Window_get_activeChild)(Window w);

extern Property * property_Window_display;
extern Display (* Window_get_display)(Window w);

extern Property * property_Window_displaySystem;
extern DisplaySystem (* Window_get_displaySystem)(Window w);

extern Property * property_Window_horzScroll;
extern ScrollBar (* Window_get_horzScroll)(Window w);

extern Property * property_Window_vertScroll;
extern ScrollBar (* Window_get_vertScroll)(Window w);

extern Property * property_Window_statusBar;
extern StatusBar (* Window_get_statusBar)(Window w);

extern Property * property_Window_rootWindow;
extern Window (* Window_get_rootWindow)(Window w);

extern Property * property_Window_closing;
extern void (* Window_set_closing)(Window w, bool value);
extern bool (* Window_get_closing)(Window w);

extern Property * property_Window_documentID;
extern int (* Window_get_documentID)(Window w);

extern Property * property_Window_previous;
extern Window (* Window_get_previous)(Window w);

extern Property * property_Window_next;
extern Window (* Window_get_next)(Window w);

extern Property * property_Window_nextSlave;
extern Window (* Window_get_nextSlave)(Window w);

extern Property * property_Window_menuBar;
extern PopupMenu (* Window_get_menuBar)(Window w);

extern Property * property_Window_sbv;
extern ScrollBar (* Window_get_sbv)(Window w);

extern Property * property_Window_sbh;
extern ScrollBar (* Window_get_sbh)(Window w);

extern Property * property_Window_fullRender;
extern void (* Window_set_fullRender)(Window w, bool value);
extern bool (* Window_get_fullRender)(Window w);

extern Property * property_Window_systemHandle;
extern void * (* Window_get_systemHandle)(Window w);

extern Property * property_Window_minimizeButton;
extern Button (* Window_get_minimizeButton)(Window w);

extern Property * property_Window_maximizeButton;
extern Button (* Window_get_maximizeButton)(Window w);

extern Property * property_Window_closeButton;
extern Button (* Window_get_closeButton)(Window w);

extern Property * property_Window_icon;
extern void (* Window_set_icon)(Window w, BitmapResource value);
extern BitmapResource (* Window_get_icon)(Window w);

extern Property * property_Window_moveable;
extern void (* Window_set_moveable)(Window w, bool value);
extern bool (* Window_get_moveable)(Window w);

extern Property * property_Window_alphaBlend;
extern void (* Window_set_alphaBlend)(Window w, bool value);
extern bool (* Window_get_alphaBlend)(Window w);

extern Property * property_Window_useSharedMemory;
extern void (* Window_set_useSharedMemory)(Window w, bool value);
extern bool (* Window_get_useSharedMemory)(Window w);

extern Property * property_Window_glCapabilities;
extern void (* Window_set_glCapabilities)(Window w, GLCapabilities value);
extern GLCapabilities (* Window_get_glCapabilities)(Window w);

extern Property * property_Window_creationActivation;
extern void (* Window_set_creationActivation)(Window w, CreationActivationOption value);
extern CreationActivationOption (* Window_get_creationActivation)(Window w);

extern Property * property_Window_nativeDecorations;
extern void (* Window_set_nativeDecorations)(Window w, bool value);
extern bool (* Window_get_nativeDecorations)(Window w);
extern bool (* Window_isSet_nativeDecorations)(Window w);

extern Property * property_Window_manageDisplay;
extern void (* Window_set_manageDisplay)(Window w, bool value);
extern bool (* Window_get_manageDisplay)(Window w);

extern Property * property_Window_text;
extern void (* Window_set_text)(Window w, const char * value);
extern const char * (* Window_get_text)(Window w);

extern Property * property_Window_controller;
extern void (* Window_set_controller)(Window w, WindowController value);
extern WindowController (* Window_get_controller)(Window w);

extern Property * property_Window_noConsequential;
extern void (* Window_set_noConsequential)(Window w, bool value);
extern bool (* Window_get_noConsequential)(Window w);

extern int WindowController_onCreate_vTblID;
bool WindowController_onCreate(WindowController __i, WindowController controller);
extern Method * method_WindowController_onCreate;

extern int WindowController_onKeyDown_vTblID;
bool WindowController_onKeyDown(WindowController __i, WindowController controller, Key key, unichar ch);
extern Method * method_WindowController_onKeyDown;

extern int WindowController_onKeyHit_vTblID;
bool WindowController_onKeyHit(WindowController __i, WindowController controller, Key key, unichar ch);
extern Method * method_WindowController_onKeyHit;

extern int WindowController_onKeyUp_vTblID;
bool WindowController_onKeyUp(WindowController __i, WindowController controller, Key key, unichar ch);
extern Method * method_WindowController_onKeyUp;

extern int WindowController_onLeftButtonDown_vTblID;
bool WindowController_onLeftButtonDown(WindowController __i, WindowController controller, int x, int y, Modifiers mods);
extern Method * method_WindowController_onLeftButtonDown;

extern int WindowController_onLeftButtonUp_vTblID;
bool WindowController_onLeftButtonUp(WindowController __i, WindowController controller, int x, int y, Modifiers mods);
extern Method * method_WindowController_onLeftButtonUp;

extern int WindowController_onLeftDoubleClick_vTblID;
bool WindowController_onLeftDoubleClick(WindowController __i, WindowController controller, int x, int y, Modifiers mods);
extern Method * method_WindowController_onLeftDoubleClick;

extern int WindowController_onLoadGraphics_vTblID;
bool WindowController_onLoadGraphics(WindowController __i, WindowController controller);
extern Method * method_WindowController_onLoadGraphics;

extern int WindowController_onMiddleButtonDown_vTblID;
bool WindowController_onMiddleButtonDown(WindowController __i, WindowController controller, int x, int y, Modifiers mods);
extern Method * method_WindowController_onMiddleButtonDown;

extern int WindowController_onMiddleButtonUp_vTblID;
bool WindowController_onMiddleButtonUp(WindowController __i, WindowController controller, int x, int y, Modifiers mods);
extern Method * method_WindowController_onMiddleButtonUp;

extern int WindowController_onMiddleDoubleClick_vTblID;
bool WindowController_onMiddleDoubleClick(WindowController __i, WindowController controller, int x, int y, Modifiers mods);
extern Method * method_WindowController_onMiddleDoubleClick;

extern int WindowController_onMouseMove_vTblID;
bool WindowController_onMouseMove(WindowController __i, WindowController controller, int x, int y, Modifiers mods);
extern Method * method_WindowController_onMouseMove;

extern int WindowController_onMultiTouch_vTblID;
bool WindowController_onMultiTouch(WindowController __i, WindowController controller, TouchPointerEvent event, Array infos, Modifiers mods);
extern Method * method_WindowController_onMultiTouch;

extern int WindowController_onRedraw_vTblID;
void WindowController_onRedraw(WindowController __i, WindowController controller, Surface surface);
extern Method * method_WindowController_onRedraw;

extern int WindowController_onResize_vTblID;
void WindowController_onResize(WindowController __i, WindowController controller, int width, int height);
extern Method * method_WindowController_onResize;

extern int WindowController_onRightButtonDown_vTblID;
bool WindowController_onRightButtonDown(WindowController __i, WindowController controller, int x, int y, Modifiers mods);
extern Method * method_WindowController_onRightButtonDown;

extern int WindowController_onRightButtonUp_vTblID;
bool WindowController_onRightButtonUp(WindowController __i, WindowController controller, int x, int y, Modifiers mods);
extern Method * method_WindowController_onRightButtonUp;

extern int WindowController_onRightDoubleClick_vTblID;
bool WindowController_onRightDoubleClick(WindowController __i, WindowController controller, int x, int y, Modifiers mods);
extern Method * method_WindowController_onRightDoubleClick;

extern int WindowController_onUnloadGraphics_vTblID;
void WindowController_onUnloadGraphics(WindowController __i, WindowController controller);
extern Method * method_WindowController_onUnloadGraphics;

extern Property * property_WindowController_window;
extern Window (* WindowController_get_window)(WindowController w);

extern Property * property_WindowController_controlled;
extern void (* WindowController_set_controlled)(WindowController w, tparam_WindowController_V value);
extern tparam_WindowController_V (* WindowController_get_controlled)(WindowController w);

extern void (* applySkin)(Class * c, const char * name, void ** vTbl);
extern bool (* desktop3DFullScreen)(Window window);
extern void (* desktop3DGetClipBox)(Box * box);
extern Window (* desktop3DGetClippedWindow)(void);
extern void * (* desktop3DGetWindowHandle)(Window window);
extern void (* desktop3DInitialize)(Window window, void (* setup)(Window window, int w, int h), void (* update)(Window window, Box * box));
extern bool (* desktop3DMouseMessage)(Window window, uint method, int x, int y, Modifiers * mods, bool consequential, bool activate);
extern void (* desktop3DSetDesktopDirty)(void);
extern bool (* desktop3DTitleBarClicked)(Window clickedWindow, int x, int y);
extern bool (* desktop3DUpdateDisplay)(void);
extern void (* unapplySkin)(Class * c);
typedef Window TVisionSkin_Window;
typedef Button WindowsSkin_Button;
typedef Window WindowsSkin_Window;
typedef Instance Socket;
typedef Instance Service;
typedef Socket SSLSocket;
typedef struct Packet Packet;
typedef File NetworkClientFile;
typedef File HTTPFile;
typedef Socket FileServerConnection;
typedef int DisconnectCode;
enum
{
   DisconnectCode_remoteLost = 0x1,
   DisconnectCode_remoteClosed = 0x2,
   DisconnectCode_resolveFailed = 0x3,
   DisconnectCode_connectFailed = 0x4
};

typedef Service DCOMService;
typedef Socket DCOMServerSocket;
typedef Instance DCOMServerObject;
typedef Instance DCOMSendControl;
typedef Socket DCOMClientObject;
typedef int SocketType;
enum
{
   SocketType_tcp = 0x0,
   SocketType_udp = 0x1
};

struct class_members_DCOMClientObject
{
   uint objectID;
   bool answered;
   SerialBuffer __ecereBuffer;
   List acks;
   int nextCallID;
};
extern bool (* DCOMClientObject_callMethod)(DCOMClientObject __this, uint methodID);

extern int DCOMClientObject_callVirtualMethod_vTblID;
void DCOMClientObject_callVirtualMethod(DCOMClientObject __i, uint __ecereMethodID, SerialBuffer __ecereBuffer);
extern Method * method_DCOMClientObject_callVirtualMethod;

extern bool (* DCOMClientObject_connect)(DCOMClientObject __this, const char * server, int port);

extern void (* DCOMSendControl_resume)(DCOMSendControl __this);

extern void (* DCOMSendControl_stop)(DCOMSendControl __this);

struct class_members_DCOMServerObject
{
   Instance instance;
   DCOMServerSocket serverSocket;
   uint id;
   SerialBuffer argsBuffer;
   SerialBuffer returnBuffer;
   List acks;
   Mutex * mutex;
   int nextCallID;
};
extern int DCOMServerObject_callMethod_vTblID;
void DCOMServerObject_callMethod(DCOMServerObject __i, uint __ecereMethodID, SerialBuffer __ecereBuffer);
extern Method * method_DCOMServerObject_callMethod;

extern bool (* DCOMServerObject_callVirtualMethod)(DCOMServerObject __this, uint methodID, bool hasReturnValue);

extern bool (* DCOMService_start)(DCOMService __this);

extern bool (* DCOMService_stop)(DCOMService __this);

extern NetworkClientFile (* FileServerConnection_open)(FileServerConnection __this, const char * fileName, FileOpenMode mode);

extern bool (* HTTPFile_openURL)(HTTPFile __this, const char * name, const char * referer, char * relocation);

extern Property * property_HTTPFile_reuseConnection;
extern void (* HTTPFile_set_reuseConnection)(HTTPFile h, bool value);
extern bool (* HTTPFile_get_reuseConnection)(HTTPFile h);

extern Property * property_HTTPFile_contentType;
extern String (* HTTPFile_get_contentType)(HTTPFile h);

extern Property * property_HTTPFile_contentDisposition;
extern String (* HTTPFile_get_contentDisposition)(HTTPFile h);

struct Packet
{
   uint size;
};
extern bool (* SSLSocket_establishConnection)(SSLSocket __this);

extern Property * property_SSLSocket_autoEstablish;
extern void (* SSLSocket_set_autoEstablish)(SSLSocket s, bool value);
extern bool (* SSLSocket_get_autoEstablish)(SSLSocket s);

extern int Service_onAccept_vTblID;
void Service_onAccept(Service __i);
extern Method * method_Service_onAccept;

extern bool (* Service_process)(Service __this);

extern bool (* Service_processTimeOut)(Service __this, Time timeOut);

extern bool (* Service_start)(Service __this);

extern bool (* Service_stop)(Service __this);

extern Property * property_Service_port;
extern void (* Service_set_port)(Service s, int value);
extern int (* Service_get_port)(Service s);

extern Property * property_Service_firstClient;
extern Socket (* Service_get_firstClient)(Service s);

extern Property * property_Service_processAlone;
extern void (* Service_set_processAlone)(Service s, bool value);
extern bool (* Service_get_processAlone)(Service s);

extern bool (* Socket_connect)(Socket __this, const char * address, int port);

extern bool (* Socket_datagramConnect)(Socket __this, const char * sendAddress, int port);

extern bool (* Socket_datagramHost)(Socket __this, int port);

extern void (* Socket_disconnect)(Socket __this, DisconnectCode code);

extern int Socket_onConnect_vTblID;
void Socket_onConnect(Socket __i);
extern Method * method_Socket_onConnect;

extern int Socket_onDisconnect_vTblID;
void Socket_onDisconnect(Socket __i, int code);
extern Method * method_Socket_onDisconnect;

extern int Socket_onEstablishConnection_vTblID;
bool Socket_onEstablishConnection(Socket __i, int s);
extern Method * method_Socket_onEstablishConnection;

extern int Socket_onReceive_vTblID;
uint Socket_onReceive(Socket __i, const byte * buffer, uint count);
extern Method * method_Socket_onReceive;

extern int Socket_onReceivePacket_vTblID;
void Socket_onReceivePacket(Socket __i, Packet * packet);
extern Method * method_Socket_onReceivePacket;

extern bool (* Socket_process)(Socket __this);

extern bool (* Socket_processTimeOut)(Socket __this, Time timeOut);

extern int Socket_receiveData_vTblID;
int Socket_receiveData(Socket __i, byte * buffer, int count, uint flags);
extern Method * method_Socket_receiveData;

extern bool (* Socket_send)(Socket __this, const void * buffer, int size);

extern int Socket_sendData_vTblID;
int Socket_sendData(Socket __i, const byte * buffer, int count, uint flags);
extern Method * method_Socket_sendData;

extern bool (* Socket_sendPacket)(Socket __this, Packet * packet);

extern bool (* Socket_sendString)(Socket __this, const char * string);

extern bool (* Socket_sendf)(Socket __this, const char * format, ...);

extern void (* Socket_safeDecRef)(Socket __this);

extern void (* Socket_safeIncRef)(Socket __this);

extern Property * property_Socket_service;
extern void (* Socket_set_service)(Socket s, Service value);
extern Service (* Socket_get_service)(Socket s);

extern Property * property_Socket_inetAddress;
extern const char * (* Socket_get_inetAddress)(Socket s);

extern Property * property_Socket_inetPort;
extern int (* Socket_get_inetPort)(Socket s);

extern Property * property_Socket_next;
extern Socket (* Socket_get_next)(Socket s);

extern Property * property_Socket_connected;
extern bool (* Socket_get_connected)(Socket s);

extern Property * property_Socket_processAlone;
extern void (* Socket_set_processAlone)(Socket s, bool value);
extern bool (* Socket_get_processAlone)(Socket s);

extern FileServerConnection (* connectToFileServer)(const char * hostName, int port);
extern HTTPFile (* fileOpenURL)(const char * name);
extern bool (* getAddressFromName)(const char * hostName, char * inetAddress);
extern bool (* getHostName)(char * hostName, int size);
extern bool (* getNameFromAddress)(const char * inetAddress, char * hostName);
extern Class * class_Archive;
extern Class * class_ArchiveAddMode;
extern Class * class_ArchiveDir;
extern Class * class_ArchiveOpenFlags;
extern Class * class_Box;
extern Class * class_BufferedFile;
extern Class * class_Centimeters;
extern Class * class_CharCategories;
extern Class * class_CharCategory;
extern Class * class_Condition;
extern Class * class_ConsoleFile;
extern Class * class_Date;
extern Class * class_DateTime;
extern Class * class_DayOfTheWeek;
extern Class * class_Degrees;
extern Class * class_Distance;
extern Class * class_DualPipe;
extern Class * class_ECONGlobalSettings;
extern Class * class_ECONParser;
extern Class * class_ErrorCode;
extern Class * class_ErrorLevel;
extern Class * class_Feet;
extern Class * class_File;
extern Class * class_FileAttribs;
extern Class * class_FileChange;
extern Class * class_FileListing;
extern Class * class_FileLock;
extern Class * class_FileMonitor;
extern Class * class_FileOpenMode;
extern Class * class_FileSeekMode;
extern Class * class_FileSize;
extern Class * class_FileSize64;
extern Class * class_FileStats;
extern Class * class_GlobalAppSettings;
extern Class * class_GlobalSettingType;
extern Class * class_GlobalSettings;
extern Class * class_GlobalSettingsData;
extern Class * class_GlobalSettingsDriver;
extern Class * class_GuiErrorCode;
extern Class * class_JSONGlobalSettings;
extern Class * class_JSONParser;
extern Class * class_JSONResult;
extern Class * class_LoggingMode;
extern Class * class_Meters;
extern Class * class_Month;
extern Class * class_MoveFileOptions;
extern Class * class_PipeOpenMode;
extern Class * class_Point;
extern Class * class_Pointf;
extern Class * class_PredefinedCharCategories;
extern Class * class_Radians;
extern Class * class_RepButton;
extern Class * class_SecSince1970;
extern Class * class_Seconds;
extern Class * class_Semaphore;
extern Class * class_SetBool;
extern Class * class_SettingsIOResult;
extern Class * class_SysErrorCode;
extern Class * class_TempFile;
extern Class * class_Thread;
extern Class * class_ThreadPriority;
extern Class * class_Time;
extern Class * class_TimeStamp;
extern Class * class_TimeStamp32;
extern Class * class_Camera;
extern Class * class_CameraType;
extern Class * class_ClippingPlane;
extern Class * class_Euler;
extern Class * class_FovDirection;
extern Class * class_FrameKey;
extern Class * class_FrameTrack;
extern Class * class_FrameTrackBits;
extern Class * class_FrameTrackType;
extern Class * class_FrustumPlacement;
extern Class * class_Line;
extern Class * class_Material;
extern Class * class_MaterialFlags;
extern Class * class_Matrix;
extern Class * class_Mesh;
extern Class * class_MeshFeatures;
extern Class * class_Object;
extern Class * class_ObjectFlags;
extern Class * class_ObjectFormat;
extern Class * class_Plane;
extern Class * class_PrimitiveGroup;
extern Class * class_PrimitiveGroupType;
extern Class * class_PrimitiveSingle;
extern Class * class_Quaternion;
extern Class * class_RenderPrimitiveType;
extern Class * class_Transform;
extern Class * class_Vector3D;
extern Class * class_Vector3Df;
extern Class * class_AlphaWriteMode;
extern Class * class_Bitmap;
extern Class * class_BitmapFormat;
extern Class * class_BitmapResource;
extern Class * class_ClearType;
extern Class * class_Color;
extern Class * class_Color444;
extern Class * class_Color555;
extern Class * class_Color565;
extern Class * class_ColorAlpha;
extern Class * class_ColorCMYK;
extern Class * class_ColorHSV;
extern Class * class_ColorKey;
extern Class * class_ColorLab;
extern Class * class_ColorRGB;
extern Class * class_ColorRGBA;
extern Class * class_ColorRGBAf;
extern Class * class_CubeMap;
extern Class * class_DefinedColor;
extern Class * class_Display;
extern Class * class_DisplayDriver;
extern Class * class_DisplayFlags;
extern Class * class_DisplaySystem;
extern Class * class_DisplaySystemResPtr;
extern Class * class_DrawManager;
extern Class * class_FMFont;
extern Class * class_FMPathDraw;
extern Class * class_FMTextAlignment;
extern Class * class_FMVerticalAlignment;
extern Class * class_FaceInfo;
extern Class * class_FillModeValue;
extern Class * class_Font;
extern Class * class_FontFlags;
extern Class * class_FontInfo;
extern Class * class_FontManager;
extern Class * class_FontManagerRenderer;
extern Class * class_FontRenderer;
extern Class * class_FontResource;
extern Class * class_GLCapabilities;
extern Class * class_GradientDirection;
extern Class * class_HitRecord;
extern Class * class_Light;
extern Class * class_LightFlags;
extern Class * class_PixelFormat;
extern Class * class_RenderState;
extern Class * class_RenderStateFloat;
extern Class * class_Resolution;
extern Class * class_Resource;
extern Class * class_Surface;
extern Class * class_SystemColor;
extern Class * class_CompiledDefaultShader;
extern Class * class_CompiledShader;
extern Class * class_DefaultShader;
extern Class * class_DefaultShaderBits;
extern Class * class_GLAB;
extern Class * class_GLBufferContents;
extern Class * class_GLBufferUsage;
extern Class * class_GLEAB;
extern Class * class_GLIMTKMode;
extern Class * class_GLMSWhatToGet;
extern Class * class_LFBDisplay;
extern Class * class_LFBDisplayDriver;
extern Class * class_LFBSurface;
extern Class * class_LFBSystem;
extern Class * class_LightMode;
extern Class * class_MatrixMode;
extern Class * class_Shader;
extern Class * class_SwizzleMode;
extern Class * class_Cube;
extern Class * class_SkyBox;
extern Class * class_Sphere;
extern Class * class_ColorPicker;
extern Class * class_CreateDirectoryDialog;
extern Class * class_FileDialog;
extern Class * class_FileDialogType;
extern Class * class_FileFilter;
extern Class * class_FileForceExtension;
extern Class * class_FileName;
extern Class * class_FileNameType;
extern Class * class_FileType;
extern Class * class_FindDialog;
extern Class * class_GoToDialog;
extern Class * class_MessageBox;
extern Class * class_MessageBoxType;
extern Class * class_ReplaceDialog;
extern Class * class_WindowList;
extern Class * class_BoxAlignment;
extern Class * class_BufferLocation;
extern Class * class_Button;
extern Class * class_ButtonState;
extern Class * class_CalendarControl;
extern Class * class_DataBox;
extern Class * class_DataDisplayFlags;
extern Class * class_DataField;
extern Class * class_DataRow;
extern Class * class_DirPath;
extern Class * class_DirectoriesBox;
extern Class * class_DropBox;
extern Class * class_EditBox;
extern Class * class_EditBoxFindResult;
extern Class * class_EditBoxStream;
extern Class * class_EditLine;
extern Class * class_EditableSelectorButton;
extern Class * class_FilePath;
extern Class * class_Label;
extern Class * class_ListBox;
extern Class * class_Menu;
extern Class * class_MenuDivider;
extern Class * class_MenuItem;
extern Class * class_MenuPlacement;
extern Class * class_OldArray;
extern Class * class_PaneSplitter;
extern Class * class_PathBox;
extern Class * class_PathTypeExpected;
extern Class * class_Picture;
extern Class * class_PopupMenu;
extern Class * class_ProgressBar;
extern Class * class_SavingDataBox;
extern Class * class_ScrollBar;
extern Class * class_ScrollBarAction;
extern Class * class_ScrollDirection;
extern Class * class_SelectorBar;
extern Class * class_SelectorButton;
extern Class * class_Stacker;
extern Class * class_StatusBar;
extern Class * class_StatusField;
extern Class * class_SyntaxColorScheme;
extern Class * class_Tab;
extern Class * class_TabControl;
extern Class * class_TabsPlacement;
extern Class * class_ToolBar;
extern Class * class_ToolButton;
extern Class * class_ToolSeparator;
extern Class * class_ToolTip;
extern Class * class_UndoAction;
extern Class * class_UndoBuffer;
extern Class * class_Anchor;
extern Class * class_AnchorValue;
extern Class * class_AnchorValueType;
extern Class * class_BorderBits;
extern Class * class_BorderStyle;
extern Class * class_ClipBoard;
extern Class * class_CommonControl;
extern Class * class_ControllableWindow;
extern Class * class_CreationActivationOption;
extern Class * class_Cursor;
extern Class * class_DialogResult;
extern Class * class_Extent;
extern Class * class_GuiApplication;
extern Class * class_Interface;
extern Class * class_Joystick;
extern Class * class_Key;
extern Class * class_KeyCode;
extern Class * class_MiddleAnchorValue;
extern Class * class_Modifiers;
extern Class * class_MouseButtons;
extern Class * class_MultiLineString;
extern Class * class_Percentage;
extern Class * class_PredefinedKey;
extern Class * class_SizeAnchor;
extern Class * class_Skin;
extern Class * class_SkinBitmap;
extern Class * class_SmartKey;
extern Class * class_SystemCursor;
extern Class * class_Timer;
extern Class * class_TouchPointerEvent;
extern Class * class_TouchPointerInfo;
// extern Class * class_Window;
extern Class * class_WindowController;
extern Class * class_WindowState;
extern Class * class_TVisionSkin_Window;
extern Class * class_WindowsSkin_Button;
extern Class * class_WindowsSkin_Window;
extern Class * class_DCOMClientObject;
extern Class * class_DCOMSendControl;
extern Class * class_DCOMServerObject;
extern Class * class_DCOMServerSocket;
extern Class * class_DCOMService;
extern Class * class_DisconnectCode;
extern Class * class_FileServerConnection;
extern Class * class_HTTPFile;
extern Class * class_NetworkClientFile;
extern Class * class_Packet;
extern Class * class_SSLSocket;
extern Class * class_Service;
extern Class * class_Socket;
extern Class * class_SocketType;

extern Module ecere_init(Module fromModule);

