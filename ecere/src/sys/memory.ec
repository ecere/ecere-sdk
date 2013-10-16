namespace sys;

import "System"

public void MoveBytes(void * dest, const void * source, uint count)
{
   memmove(dest, source, count);
}

public void CopyBytes(void * dest, const void * source, uint count)
{
#if !defined(ECERE_BOOTSTRAP) && (defined(__WATCOMC__) || defined(__MSC__) || defined(__BORLANDC__))
   _asm
   {
      push esi
      push edi
      push ecx

      mov esi,source
      mov edi,dest
      mov ecx,count
      rep movsb

      pop ecx
      pop edi
      pop esi
   };
#elif !defined(ECERE_BOOTSTRAP) && (defined(__GNUC__) && defined(i386))
   asm volatile(
   //Set source & destination
       "movl %0, %%esi\n\t"
       "movl %1, %%edi\n\t"
       "movl %2, %%ecx\n\t"

       "rep\n\t"
       "movsb\n\t"
   ::"g"(source),"g"(dest),"g"(count)
   :"ecx","esi","edi","memory");
#else
   memcpy(dest,source,count);
#endif
}

public void CopyBytesBy2(void * dest, const void * source, uint count)
{
#if !defined(ECERE_BOOTSTRAP) && (defined(__WATCOMC__) || defined(__MSC__) || defined(__BORLANDC__))
   _asm
   {
      push esi
      push edi
      push ecx

      mov esi,source
      mov edi,dest
      mov ecx,count
      rep movsw

      pop ecx
      pop edi
      pop esi
   };
#elif !defined(ECERE_BOOTSTRAP) && (defined(__GNUC__) && defined(i386))
   asm volatile(
   //Set source & destination
       "movl %0, %%esi\n\t"
       "movl %1, %%edi\n\t"
       "movl %2, %%ecx\n\t"

       "rep\n\t"
       "movsw\n\t"
   ::"g"(source),"g"(dest),"g"(count)
   :"cx","si","di","memory");
#else
   memcpy(dest,source,count<<1);
#endif
}

public void CopyBytesBy4(void * dest, const void * source, uint count)
{
#if !defined(ECERE_BOOTSTRAP) && (defined(__WATCOMC__) || defined(__MSC__) || defined(__BORLANDC__))
   _asm
   {
      push esi
      push edi
      push ecx

      mov esi,source
      mov edi,dest
      mov ecx,count
      rep movsd

      pop ecx
      pop edi
      pop esi
   };
#elif !defined(ECERE_BOOTSTRAP) && (defined(__GNUC__) && defined(i386))
   asm volatile(
   //Set source & destination
       "movl %0, %%esi\n\t"
       "movl %1, %%edi\n\t"
       "movl %2, %%ecx\n\t"

       "rep\n\t"
       "movsl\n\t"
   ::"g"(source),"g"(dest),"g"(count)
   :"cx","si","di","memory");
#else
   memcpy(dest,source,count<<2);
#endif
}

public void FillBytes(void * area, byte value, uint count)
{
#if !defined(ECERE_BOOTSTRAP) && (defined(__WATCOMC__) || defined(__MSC__) || defined(__BORLANDC__))
   __asm
   {
      push edi
      push ecx
      push eax
      mov edi,area
      mov ecx,count
      mov al,value
      rep stosb
      pop eax
      pop ecx
      pop edi
   };
#elif !defined(ECERE_BOOTSTRAP) && (defined(__GNUC__) && defined(i386))
   asm volatile(
   //Set source & destination
       "movl %0, %%edi\n\t"
       "movl %1, %%ecx\n\t"
       "movb %2, %%al\n\t"

       "rep\n\t"
       "stosb\n\t"
   ::"g"(area),"g"(count),"g"(value)
   :"ax","cx","di","memory");
#else
   memset(area,value,count);
#endif
}

public void FillBytesBy2(void * area, uint16 value, uint count)
{
#if !defined(ECERE_BOOTSTRAP) && (defined(__WATCOMC__) || defined(__MSC__) || defined(__BORLANDC__))
   _asm
   {
      push edi
      push ecx
      push eax

      mov edi,area
      mov ecx,count
      mov ax,value
      rep stosw

      pop eax
      pop ecx
      pop edi
   };
#elif !defined(ECERE_BOOTSTRAP) && (defined(__GNUC__) && defined(i386))
   asm volatile(
   //Set source & destination
       "movl %0, %%edi\n\t"
       "movl %1, %%ecx\n\t"
       "movw %2, %%ax\n\t"

       "rep\n\t"
       "stosw\n\t"
   ::"g"(area),"g"(count),"g"(value)
   :"ax","cx","di","memory");
#else
   uint16 * dest = area;
   int c;
   for(c=0; c<count; c++) dest[c] = value;
#endif
}

public void FillBytesBy4(void * area, uint32 value, uint count)
{
#if !defined(ECERE_BOOTSTRAP) && (defined(__WATCOMC__) || defined(__MSC__) || defined(__BORLANDC__))
   _asm
   {
      push edi
      push ecx
      push eax

      mov edi,area
      mov ecx,count
      mov eax,value
      rep stosd

      pop eax
      pop ecx
      pop edi
   };
#elif !defined(ECERE_BOOTSTRAP) && (defined(__GNUC__) && defined(i386))
   asm volatile(
   //Set source & destination
       "movl %0, %%edi\n\t"
       "movl %1, %%ecx\n\t"
       "movl %2, %%eax\n\t"

       "rep\n\t"
       "stosl\n\t"
   ::"g"(area),"g"(count),"g"(value)
   :"ax","cx","di","memory");
#else
   uint * dest = area;
   int c;
   for(c=0; c<count; c++) dest[c] = value;
#endif
}
