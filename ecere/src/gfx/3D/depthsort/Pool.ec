import "instance"

class InstancePool<class T>
{
   void ** objects;
   uint arrayAlloced, available;

   T allocate()
   {
      T o;
      if(available)
         o = (T)objects[--available];
      else
         o = (T)eInstance_New(class(T));
      return o;
   }

   void free(T o)
   {
      if(available >= arrayAlloced)
      {
         arrayAlloced = Max(32, arrayAlloced + (arrayAlloced >> 1));
         objects = renew objects void *[arrayAlloced];
      }
      objects[available++] = (void *)o;
   }

   void freeAvailable()
   {
      uint i;
      for(i = 0; i < available; i++)
         delete objects[i];
      available = 0;
      delete objects;
      arrayAlloced = 0;
   }

   ~InstancePool()
   {
      freeAvailable();
   }
}
