#define SELF(c, n)  __attribute__((unused)) c * self = ((c *)(((char *)this) + 0x10 - (char *)&((c *)0x10)->n))

#define propertyProto(n, sg) struct n ## Prop { n ## Prop() { }; int _[0]; sg } n;

#define propertyImpl(sg) sg

#define _setProto(t, n, c, d) \
   t operator= (t v); \

#define _setImpl(t, n, c, d) \
   t c::n ## Prop::operator= (t v) \
   { \
      SELF(c, n); \
      d; \
      return v; \
   } \

#define setProto(t, n, c, d) \
   _setProto(t, n, c, d) \
   n ## Prop & operator= (n ## Prop & prop);

#define setImpl(t, n, c, d) \
   _setImpl(t, n, c, d) \
   c::n ## Prop & c::n ## Prop::operator= (c::n ## Prop & prop) \
   { \
      SELF(c, n); \
      t v = prop; \
      d; \
      return prop; \
   }

#define getProto(t, n, c, d) operator t () const;

#define getImpl(t, n, c, d) c::n ## Prop::operator t () const { SELF(c, n); d; }

class test
{
   int mSize;
   propertyProto(size, setProto(int, size, test, self->mSize = v;) getProto(int, size, test, return self->mSize;));
  /* struct sizeProp
   {
      sizeProp() { };
      int _[0];

      int operator= (int v);
      sizeProp & operator= (sizeProp & prop);
      operator int () const;
   } size; */
};

propertyImpl(setImpl(int, size, test, self->mSize = v;) getImpl(int, size, test, return self->mSize;));
/*

int test::sizeProp::operator= (int v)
{
   __attribute__((unused)) test * self = ((test *)(((char *)this) + 0x10 - (char *)&((test *)0x10)->size));
   self->mSize = v;
   return v;
}

test::sizeProp & test::sizeProp::operator= (test::sizeProp & prop)
{
   __attribute__((unused)) test * self = ((test *)(((char *)this) + 0x10 - (char *)&((test *)0x10)->size));
   int v = prop;
   self->mSize = v;
   return prop;
}

test::sizeProp::operator int () const
{
   __attribute__((unused)) test * self = ((test *)(((char *)this) + 0x10 - (char *)&((test *)0x10)->size));
   return self->mSize;
} */

int main(void)
{
   return 0;
}
