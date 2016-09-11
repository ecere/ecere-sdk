struct TestStruct
{
   String a;
   int b;
   double d;
};
/*
struct TestUnion
{
   union
   {
      String a;
      int b;
   };
};
*/

/*
struct Fruit
{
   String name;
   int size;
}


union DataValue
{
   char c;
   unsigned char uc;
   short s;
   unsigned short us;
   int i;
   unsigned int ui;
   void * p;
   float f;
   double d;
   int64 i64;
   uint64 ui64;
};

struct Class
{
   Class   *prev,  *next;
   const char *   name;
   int offset,     structSize;
}

struct ClassTemplateArgument
{
   union
   {
      // For type
      struct
      {

         const    char *    dataTypeString;


         Class     dataTypeClass;
         // Type dataType;
      };
      // For expression

      DataValue expression;

      // For identifier
      struct
      {
         const   char    *      memberString;



         union
         {
            InventoryItem     member;
            Fruit     prop;
         };
      };
   };
};*/

//bool (*Constructor)(void *);// -> bool (*Constructor)(va_list *);
//typedef struct uint16_t uint16;
//void (*helloFuncPointer)(void);
//typedef struct Instance Instance;
//struct Instance { void ** _vTbl; struct Class * _class; int _refCount; };
