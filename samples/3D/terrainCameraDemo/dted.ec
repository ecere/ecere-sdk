/****************************************************************************
   Ecere Terrain Engine Demonstration

   Copyright (c) 2001-2010 Jerome Jacovella-St-Louis
   All Rights Reserved.

   dted.ec - DTED data loader
****************************************************************************/
import "terrain"
import "ecere"

#include <math.h>

// --- DTED Data Loading ---
static Elevation heightMap[1025 * 1025];

#define ALTITUDE_FACTOR 1
#define ALTITUDE_OFFSET 0 // -5000

#define EARTH_RADIUS 6367000

#define CELL_LAT_POINTS  1201
#define CELL_LON_POINTS  1201

#define LATITUDE  Degrees { 44.5 }

#define RESOLUTION_LAT  (EARTH_RADIUS * ((Pi / 180) / (CELL_LAT_POINTS - 1)))
#define RESOLUTION_LON  (EARTH_RADIUS * ((float)sin(LATITUDE) * ((Pi / 180) / (CELL_LON_POINTS - 1))))

typedef struct
{
   byte label[80];
   byte ident[648];
   byte accuracy[2700];
} DTEDHeader;

bool LoadDTEDTerrain(Terrain terrain, char * fileName)
{
   bool result = false;
   File f = FileOpen(fileName, read);
   if(f)
   {
      DTEDHeader header;
      if(f.Read(&header, 1, sizeof(header)))
      {
         int y;
         short buffer[1207];

         for(y = 0; y<1025; y++)
         {
            int x;

            if(f.Read(buffer, sizeof(uint16), 1207) < 1207)
               break;

            for(x = 0; x<1025; x++)
            {
               uint16 value = buffer[x+4];
               value = ((value & 0xFF00) >> 8) | ((value & 0xFF) << 8);
               heightMap[y*1025+x] = (short)value * ALTITUDE_FACTOR + ALTITUDE_OFFSET;
            }
         }
         if(terrain.Create(heightMap, 16, 1025, 2, RESOLUTION_LON, RESOLUTION_LAT, 512,512))
            result = true;
      }
      delete f;
   }
   return result;
}
