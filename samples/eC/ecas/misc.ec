import "ecere"
public:

//TODO:  Make this use a tree instead of a linear lookup
class Dictionary {
   uint lookup(const char *str, bool create) {
      uint ret = 0;
      for (i:array) {
         if (!strcmp(i, str))
            return ret;
         ret++;
      }
      if (!create)
         return (uint)-1;
      array.Add(StrDup(str));
      return ret;
   }
   const char *name(uint index) {
      if (index >= array.size)
         return null;
      return array[index];
   }
   ~Dictionary() {
      for (i:array)
         delete i;
   }
private:
   Array<char*> array {};
};

//CharFlags is a collection of characters that are to be returned (or not returned) by the find* functions
class CharFlags {
   property char *charsSet {
      set {
         const byte *n = (const byte*)value;
         byte val = 0;
         while (*n)
            flags[(uint)*n++] = ++val;
      }
   }
   /*property char * {
      set { charsSet = value; }
   }*/

   byte flags[256]; //flags[c] indicates whether character c is selected
   void Clear(void) {
      memset(flags, 0, sizeof(flags));
   }
   void Set(const char *needles, int val) {
      const byte *n = (const byte*)needles;
      byte v = (byte)val;
      while (*n)
         flags[(uint)*n++] = v;
   }
};

char *findfirst(const char *haystack, uint haystacklen, CharFlags cf) {
   const byte *h = (const byte*)haystack;
   while (haystacklen--) {
      if (cf.flags[(uint)*h++])
         return h-1;
   }
   return null;
}
char *findfirstnon(const char *haystack, uint haystacklen, CharFlags cf) {
   const byte *h = (const byte*)haystack;
   while (haystacklen--) {
      if (!cf.flags[(uint)*h++])
         return h-1;
   }
   return null;
}
char *findlast(const char *haystack, uint haystacklen, CharFlags cf) {
   const byte *h = (const byte*)haystack + haystacklen;
   while (haystacklen--) {
      if (cf.flags[(uint)*--h])
         return h;
   }
   return null;
}
char *findlastnon(const char *haystack, uint haystacklen, CharFlags cf) {
   const byte *h = (const byte*)haystack + haystacklen;
   while (haystacklen--) {
      if (!cf.flags[(uint)*--h])
         return h;
   }
   return null;
}

char *StrDup(const char *src) {
   char *ret;
   uint len;
   if (!src)
      src = "";
   len = strlen(src)+1;
   ret = new char[len];
   memcpy(ret, src, len);
   return ret;
}

define NB_ALLOWHIGHERDIGITS = 256;
define NB_ALLOWCAPLETTERS = 512;
define NB_ALLOWLCASELETTERS = 1024;
define NB_ALLOWLETTERS = (NB_ALLOWCAPLETTERS | NB_ALLOWLCASELETTERS);

define NB_Dec      = ((uint16)(10));
define NB_Hex      = ((uint16)(16 | NB_ALLOWLETTERS));
define NB_Bin      = ((uint16)(2));
define NB_Oct      = ((uint16)(8));
define NB_OctLoose = ((uint16)(8 | NB_ALLOWHIGHERDIGITS));

enum ReadULLError {noerror=0,empty=1,overflow=2};

//input must only contain valid digits for the given base
unsigned long long ReadULL_Valid(const char *ptr,const char *eptr, uint16 base, ReadULLError *errorout)
{
	unsigned long long ret=0;
	unsigned long long multiplier=1;
	unsigned long long temp;
	ReadULLError rerror = noerror;
	if (ptr>=eptr)
	{
		rerror = empty;
		goto rn_end;
	}
	//the range ptr-->eptr is all valid digits, and eptr is iterating backwards through the range.
	while (eptr-->ptr)
	{
		char c=*eptr;
		//this series of if statements takes advantage of the fact that 'a'>'A'>'0'
		if (c>='a')
			c-='a'-10;
		else if (c>='A')
			c-='A'-10;
		else
			c-='0';
		temp=c;
		temp*=multiplier;
		if ((c&&!temp) || ret > ~temp) //if overflow occurred
			rerror = overflow;
		ret+=temp;
		multiplier *= (unsigned long long)base & 0xFF;
	}
rn_end:
	if (errorout)
      *errorout = rerror;
	return ret;
}
