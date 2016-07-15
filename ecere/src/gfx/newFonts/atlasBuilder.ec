/* *****************************************************************************
 * Original Version Copyright (c) 2007-2014 Alexis Naveros.
 *
 * Ecere Corporation has unlimited/unrestricted rights.
 * *****************************************************************************/
import "instance"

namespace gfx;

struct AtlasNode { short x, y, width; };

class AtlasBuilder
{
  int width, height;
  AtlasNode *nodes;
  int nodecount;
  int nodealloc;

   // Create atlas of given width and height, internal node count will grow as necessary
   bool create( int w, int h, int nodealloc )
   {
      bool result = false;

      width = w;
      height = h;

      // Allocate space for skyline nodes
      if( nodealloc < 32 )
         nodealloc = 32;
      if( ( nodes = new0 AtlasNode[nodealloc] ) )
      {
         nodecount = 0;
         this.nodealloc = nodealloc;

         // Init root node.
         nodes[0].width = (short)w;
         nodecount++;

         result = true;
     }
     return result;
   }

   ~AtlasBuilder( )
   {
      delete nodes;
   }

   static bool insertNode( int nodeindex, int x, int y, int width )
   {
      bool result = false;

      // Insert node
      if( nodecount >= nodealloc )
      {
         nodealloc <<= 1;
         nodes = renew nodes AtlasNode[nodealloc];
      }
      if(nodes)
      {
         int i;
         for( i = nodecount; i > nodeindex ; i-- )
            nodes[i] = nodes[i-1];
         nodes[nodeindex].x = (short)x;
         nodes[nodeindex].y = (short)y;
         nodes[nodeindex].width = (short)width;
         nodecount++;

         result = true;
      }
      return result;
   }

   static void removeNode( int nodeindex )
   {
      if( nodecount)
      {
        int i;
        for( i = nodeindex ; i < nodecount-1 ; i++ )
            nodes[i] = nodes[i+1];
         nodecount--;
      }
   }

   static bool addSkylineLevel( int nodeindex, int x, int y, int width, int height )
   {
      int i, shrink;

      // Insert new node
      if( insertNode( nodeindex, x, y+height, width ) == 0 )
         return false;

      // Delete skyline segments that fall under the shadow of the new segment.
      for( i = nodeindex+1 ; i < nodecount ; i++ )
      {
         if( nodes[i].x < ( nodes[i-1].x + nodes[i-1].width ) )
         {
            shrink = nodes[i-1].x + nodes[i-1].width - nodes[i].x;
            nodes[i].x += (short)shrink;
            nodes[i].width -= (short)shrink;
            if( nodes[i].width <= 0 )
            {
               removeNode( i );
               i--;
            }
            else
               break;
         }
         else
            break;
      }

      // Merge same height skyline segments that are next to each other.
      for( i = 0 ; i < nodecount - 1 ; )
      {
         if( nodes[i].y != nodes[i+1].y )
            i++;
         else
         {
            nodes[i].width += nodes[i+1].width;
            removeNode( i+1 );
         }
      }
      return 1;
   }

   static int rectFits( int nodeindex, int width, int height )
   {
     int x, y, rem;
     /* Checks if there is enough space at the location of skyline span 'i', */
     /* and return the max height of all skyline spans under that at that location, */
     /* (think tetris block being dropped at that position). Or -1 if no space found. */
     x = nodes[nodeindex].x;
     y = nodes[nodeindex].y;
     if( ( x + width ) > this.width )
       return -1;
     for( rem = width ; rem > 0 ; nodeindex++ )
     {
       if( nodeindex == nodecount )
         return -1;
       if( y < this.nodes[nodeindex].y )
         y = nodes[nodeindex].y;
       if( ( y + height ) > this.height )
         return -1;
       rem -= nodes[nodeindex].width;
     }
     return y;
   }

   // Place a rectangle of specified dimensions, return 1 on success, retx&rety store offsets
   bool addRect( int width, int height, int *retx, int *rety )
   {
     int besth, bestw, besti, bestx, besty, y, nodeindex;

     besth = this.height;
     bestw = this.width;
     besti = -1;
     bestx = -1;
     besty = -1;

     // Bottom left fit heuristic.
     for( nodeindex = 0 ; nodeindex < this.nodecount ; nodeindex++ )
     {
       y = rectFits( nodeindex, width, height );
       if( y != -1 )
       {
         if( ( ( y + height ) < besth ) || ( ( ( y + height ) == besth ) && ( this.nodes[nodeindex].width < bestw ) ) )
         {
           besti = nodeindex;
           bestw = this.nodes[nodeindex].width;
           besth = y + height;
           bestx = this.nodes[nodeindex].x;
           besty = y;
         }
       }
     }

     if( besti == -1 )
       return 0;

     // Perform the actual packing.
     if( addSkylineLevel( besti, bestx, besty, width, height ) == 0 )
       return 0;

     *retx = bestx;
     *rety = besty;

     return 1;
   }

   // Expand atlas to given dimensions
   void expand( int width, int height )
   {
     // Insert node for empty space
     if( width > this.width )
       insertNode( nodecount, this.width, 0, width - this.width );
     this.width = width;
     this.height = height;
   }

   // Clean up the atlas
   void reset( int width, int height )
   {
     this.width = width;
     this.height = height;
     nodecount = 0;

     // Init root node.
     nodes[0].x = 0;
     nodes[0].y = 0;
     nodes[0].width = (short)width;
     nodecount++;
   }

   // Return the maximum y value of all allocated rectangles
   int getAtlasMaxHeight()
   {
      int i, maxy = 0;

      for( i = 0 ; i < nodecount ; i++ )
      {
         if( maxy < nodes[i].y )
            maxy = nodes[i].y;
      }
      return maxy;
   }
}
