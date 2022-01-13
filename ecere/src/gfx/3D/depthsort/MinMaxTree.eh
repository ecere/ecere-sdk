// Min-Max Tree

// These macros can be used to create templates
#ifndef MINMAXTREE
#define MINMAXTREE MinMaxTree
#endif

#ifndef MINMAXITERATOR
#define MINMAXITERATOR MinMaxIterator
#endif

#undef MINMAXBUCKET
#define MINMAXBUCKET MINMAXTREE ## Bucket

#ifndef MINMAX_MAX_ENTRIES
#define MINMAX_MAX_ENTRIES  64
#endif

#ifndef MINMAX_MIN_DIV
#define MINMAX_MIN_DIV      0.0001f
#endif

#ifndef MINMAX_MIN_OFFSET
#define MINMAX_MIN_OFFSET      0.0001f
#endif

#ifndef MINMAX_MIN_OFFSET
#error MINMAX_MIN_OFFSET   0
#endif

#ifndef MINMAX_MAX_OFFSET
#define MINMAX_MAX_OFFSET  (2*sizeof(float))
#endif

#ifndef MINMAX_MAX_STRIDE
#define MINMAX_MAX_STRIDE  (4*sizeof(float))
#endif

#ifndef MINMAX_EPSILON
#define MINMAX_EPSILON  0.00001f
#endif

struct MINMAXBUCKET
{
private:
   uint * spanEntries, spanCount, spanAlloced;
   uint * entries, count, alloced;
   MINMAXBUCKET * buckets;
   Pointf min, max, mid;

   static inline void addEntry(uint entry, float minX, float minY, float maxX, float maxY, uintptr offset)
   {
      bool x = minX > mid.x, y = minY > mid.y;
      bool spanX = !x && maxX > mid.x, spanY = !y && maxY > mid.y;
      MINMAXBUCKET * b = &buckets[spanX ? 4 + y : spanY ? 6 + x : ((y << 1) | x)];
      b->add(entry, minX, minY, maxX, maxY, offset);
   }

   static void subdivide(uintptr offset)
   {
      if(mid.x - min.x > MINMAX_MIN_DIV && mid.y - min.y > MINMAX_MIN_DIV)
      {
         int i;

         buckets = new0 MINMAXBUCKET[8];
         buckets[0].min = min;
         buckets[0].max = mid;
         buckets[1].min = { mid.x, min.y };
         buckets[1].max = { max.x, mid.y };
         buckets[2].min = { min.x, mid.y };
         buckets[2].max = { mid.x, max.y };
         buckets[3].min = mid;
         buckets[3].max = max;
         buckets[4].min = min;
         buckets[4].max = { max.x, mid.y };
         buckets[5].min = { min.x, mid.y };
         buckets[5].max = max;
         buckets[6].min = min;
         buckets[6].max = { mid.x, max.y };
         buckets[7].min = { mid.x, min.y };
         buckets[7].max = max;

         for(i = 0; i < 8; i++)
         {
            MINMAXBUCKET * b = &buckets[i];
            b->mid = { (b->min.x + b->max.x) / 2, (b->min.y + b->max.y) / 2 };
         }

         for(i = 0; i < count; i++)
         {
            uint entry = entries[i];
            uintptr base = offset + MINMAX_STRIDE * entry;
            float minX = *(float *)(base + MINMAX_MIN_OFFSET);
            float minY = *(float *)(base + MINMAX_MIN_OFFSET + sizeof(float));
            float maxX = *(float *)(base + MINMAX_MAX_OFFSET);
            float maxY = *(float *)(base + MINMAX_MAX_OFFSET + sizeof(float));

            addEntry(entries[i], minX, minY, maxX, maxY, offset);
         }
         delete entries;
      }
   }

   static void add(uint entry, float minX, float minY, float maxX, float maxY, uintptr offset)
   {
      bool spanningX = (minX <= mid.x && maxX > mid.x);
      bool spanningY = (minY <= mid.y && maxY > mid.y);

      if(spanningX && spanningY)
      {
         if(!spanEntries)
         {
            spanAlloced = MINMAX_MAX_ENTRIES;
            spanEntries = new uint[MINMAX_MAX_ENTRIES];
         }
         else if(spanCount + 1 > spanAlloced)
         {
            spanAlloced += MINMAX_MAX_ENTRIES;
            spanEntries = renew spanEntries uint[spanAlloced];
         }
         spanEntries[spanCount++] = entry;
      }
      else
      {
         if(!buckets && count + 1 >= MINMAX_MAX_ENTRIES)
            subdivide(offset);

         if(buckets)
            addEntry(entry, minX, minY, maxX, maxY, offset);
         else
         {
            if(!entries)
            {
               alloced = MINMAX_MAX_ENTRIES;
               entries = new uint[MINMAX_MAX_ENTRIES];
            }
            else if(count + 1 > alloced)
            {
               alloced += MINMAX_MAX_ENTRIES;
               entries = renew entries uint[alloced];
            }
            entries[count] = entry;
         }
         count++;
      }
   }

   void OnFree()
   {
      if(buckets)
      {
         int i;
         for(i = 0; i < 8; i++)
            buckets[i].OnFree();
         delete buckets;
      }
      delete entries;
      delete spanEntries;
      spanCount = 0;
      count = 0;
      spanAlloced = 0;
      alloced = 0;
   }

   void gatherMatches(uint ** matches, uint * alloced, uint * nMatches, uint entry, uintptr offset, bool greaterOnly)
   {
      uintptr base = offset + MINMAX_STRIDE * entry;
      float minX = *(float *)(base + MINMAX_MIN_OFFSET);
      float minY = *(float *)(base + MINMAX_MIN_OFFSET + sizeof(float));
      float maxX = *(float *)(base + MINMAX_MAX_OFFSET);
      float maxY = *(float *)(base + MINMAX_MAX_OFFSET + sizeof(float));

      if(spanCount)
      {
         int i;
         uint potential = *nMatches + spanCount;
         int start = 0;

         if(*alloced < potential)
         {
            uint size = Max(potential, *alloced + (*alloced >> 1));
            *matches = renew *matches uint[size];
            *alloced = size;
         }

         if(greaterOnly)
         {
            int lo = 0, hi = spanCount;
            start = (lo + hi) >> 1;
            while(lo < hi)
            {
               uint e = spanEntries[start];
               if(e < entry)
                  lo = start + 1;
               else if(e > entry)
                  hi = start;
               else
               {
                  start++;
                  break;
               }
               start = (lo + hi) >> 1;
            }
         }

         for(i = start; i < spanCount; i++)
         {
            uint e = spanEntries[i];
            if(e != entry)
            {
               uintptr eBase = offset + MINMAX_STRIDE * e;
               float eMinX = *(float *)(eBase + MINMAX_MIN_OFFSET);
               float eMinY = *(float *)(eBase + MINMAX_MIN_OFFSET + sizeof(float));
               float eMaxX = *(float *)(eBase + MINMAX_MAX_OFFSET);
               float eMaxY = *(float *)(eBase + MINMAX_MAX_OFFSET + sizeof(float));

               if((minX < eMaxX - MINMAX_EPSILON && eMinX < maxX - MINMAX_EPSILON) &&
                  (minY < eMaxY - MINMAX_EPSILON && eMinY < maxY - MINMAX_EPSILON))
                  (*matches)[(*nMatches)++] = e;
            }
         }
      }

      if(buckets)
      {
         int sx = minX > mid.x;
         int sy = minY > mid.y;
         int ex = maxX > mid.x;
         int ey = maxY > mid.y;
         uint potential = *nMatches + 4 * MINMAX_MAX_ENTRIES;

         if(*alloced < potential)
         {
            uint size = Max(potential, *alloced + (*alloced >> 1));
            *matches = renew *matches uint[size];
            *alloced = size;
         }

         if(!sy)
         {
            if(!sx) buckets[0].gatherMatches(matches, alloced, nMatches, entry, offset, greaterOnly);
            if(ex)  buckets[1].gatherMatches(matches, alloced, nMatches, entry, offset, greaterOnly);
                    buckets[4].gatherMatches(matches, alloced, nMatches, entry, offset, greaterOnly);
         }
         if(ey)
         {
            if(!sx) buckets[2].gatherMatches(matches, alloced, nMatches, entry, offset, greaterOnly);
            if(ex)  buckets[3].gatherMatches(matches, alloced, nMatches, entry, offset, greaterOnly);
                    buckets[5].gatherMatches(matches, alloced, nMatches, entry, offset, greaterOnly);
         }
         if(!sx) buckets[6].gatherMatches(matches, alloced, nMatches, entry, offset, greaterOnly);
         if(ex)  buckets[7].gatherMatches(matches, alloced, nMatches, entry, offset, greaterOnly);
      }
      else if(count)
      {
         int i;
         uint potential = *nMatches + count;

         if(*alloced < potential)
         {
            uint size = Max(potential, *alloced + (*alloced >> 1));
            *matches = renew *matches uint[size];
            *alloced = size;
         }

         for(i = 0; i < count; i++)
         {
            uint e = entries[i];
            if(greaterOnly ? (e > entry) : (e != entry))
            {
               uintptr eBase = offset + MINMAX_STRIDE * e;
               float eMinX = *(float *)(eBase + MINMAX_MIN_OFFSET);
               float eMinY = *(float *)(eBase + MINMAX_MIN_OFFSET + sizeof(float));
               float eMaxX = *(float *)(eBase + MINMAX_MAX_OFFSET);
               float eMaxY = *(float *)(eBase + MINMAX_MAX_OFFSET + sizeof(float));

               if((minX < eMaxX - MINMAX_EPSILON && eMinX < maxX - MINMAX_EPSILON) &&
                  (minY < eMaxY - MINMAX_EPSILON && eMinY < maxY - MINMAX_EPSILON))
                  (*matches)[(*nMatches)++] = e;
            }
         }
      }
   }
};

class MINMAXTREE : struct
{
   MINMAXBUCKET root { min = { -1, -1 }, max = { 1, 1 }, mid = { 0, 0 } };
   uintptr offset;

   void clear()
   {
      if(this)
         root.OnFree();
   }

   void add(uint index)
   {
      uintptr base = offset + MINMAX_STRIDE * index;
      float minX = *(float *)(base + MINMAX_MIN_OFFSET);
      float minY = *(float *)(base + MINMAX_MIN_OFFSET + sizeof(float));
      float maxX = *(float *)(base + MINMAX_MAX_OFFSET);
      float maxY = *(float *)(base + MINMAX_MAX_OFFSET + sizeof(float));

      root.add(index, minX, minY, maxX, maxY, offset);
   }

   ~MINMAXTREE()
   {
      clear();
   }
}

struct MINMAXITERATOR
{
   MINMAXTREE container;
   bool greaterOnly;
   property int ref
   {
      set
      {
         nMatches = 0;
         if(container)
            container.root.gatherMatches(&matches, &alloced, &nMatches, value, container.offset, greaterOnly);
         curMatch = 0;
      }
   }
   int data;

private:

   uint * matches, alloced, nMatches, curMatch;

   void OnFree()
   {
      delete matches;
      nMatches = 0;
      alloced = 0;
      curMatch = 0;
   }

public:

   bool Next()
   {
      if(curMatch < nMatches)
      {
         data = matches[curMatch++];
         return true;
      }
      else
         return false;
   }
};
