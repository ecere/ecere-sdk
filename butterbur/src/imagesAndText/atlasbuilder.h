/* -----------------------------------------------------------------------------
 *
 * Copyright (c) 2009-2017 Alexis Naveros.
 * Ecere Corporation has unlimited/unrestricted rights.
 * -----------------------------------------------------------------------------
 */

typedef struct _abAtlas abAtlas;

/* Create atlas of given width and height, internal node count will grow as necessary */
abAtlas *abCreateAtlas( int width, int height, int nodealloc );
void abDestroyAtlas( abAtlas *atlas );

/* Place a rectangle of specified dimensions, return 1 on success, retx and rety return the offsets */
int abAtlasAddRect( abAtlas *atlas, int width, int height, int *retx, int *rety );

/* Expand atlas to given dimensions */
void abAtlasExpand( abAtlas *atlas, int width, int height );

/* Clean up the atlas */
void abResetAtlas( abAtlas *atlas, int width, int height );

/* Return the maximum y value of all allocated rectangles */
int abGetAtlasMaxHeight( abAtlas *atlas );

