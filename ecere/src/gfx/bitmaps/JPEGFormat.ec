namespace gfx::bitmaps;

import "Display"

#include <setjmp.h>

#include "jpeglib.h"
#include "jerror.h"

// ERROR HANDLER
typedef struct
{
   struct jpeg_error_mgr jpeg;
   jmp_buf setjmpBuffer;
} ErrorHandler;

static void JPEG_ExitHandler(j_common_ptr cinfo)
{
   longjmp(((ErrorHandler *) cinfo->err)->setjmpBuffer, 1);
}

// DATA SOURCE
typedef struct
{
   struct jpeg_source_mgr pub;
   
   File infile;
   byte * buffer;
   boolean startOfFile;
} SourceManager;

#define INPUT_BUF_SIZE  4096

static void JPEG_InitSource (j_decompress_ptr cinfo)
{
   SourceManager * src = (SourceManager *) cinfo->src;
   src->startOfFile = TRUE;
}

static boolean JPEG_FillInputBuffer (j_decompress_ptr cinfo)
{
   SourceManager * src = (SourceManager *) cinfo->src;
   uint nbytes = src->infile.Read(src->buffer, sizeof(byte), INPUT_BUF_SIZE);
   if(nbytes <= 0)
   {
      if(src->startOfFile)
         ERREXIT(cinfo, JERR_INPUT_EMPTY);
      WARNMS(cinfo, JWRN_JPEG_EOF);
      
      src->buffer[0] = (byte) 0xFF;
      src->buffer[1] = (byte) JPEG_EOI;
      nbytes = 2;
   }
   
   src->pub.next_input_byte = src->buffer;
   src->pub.bytes_in_buffer = nbytes;
   src->startOfFile = FALSE;
   
   return TRUE;
}

static void JPEG_SkipInputData (j_decompress_ptr cinfo, long num_bytes)
{
   SourceManager * src = (SourceManager *) cinfo->src;
   
   if (num_bytes > 0) 
   {
      while (num_bytes > (long) src->pub.bytes_in_buffer)
      {
         num_bytes -= (long) src->pub.bytes_in_buffer;
         JPEG_FillInputBuffer(cinfo);
      }
      src->pub.next_input_byte += (uint) num_bytes;
      src->pub.bytes_in_buffer -= (uint) num_bytes;
   }
}

static void JPEG_TermSource(j_decompress_ptr cinfo)
{
   
}

static void JPEG_SetSource(j_decompress_ptr cinfo, File infile)
{
   SourceManager * src;
   
   if (!cinfo->src)
   {
      cinfo->src = (struct jpeg_source_mgr *)
         (*cinfo->mem->alloc_small) ((j_common_ptr) cinfo, JPOOL_PERMANENT,
         sizeof(SourceManager));
      src = (SourceManager *) cinfo->src;
      src->buffer = (byte *)
         (*cinfo->mem->alloc_small) ((j_common_ptr) cinfo, JPOOL_PERMANENT,
         INPUT_BUF_SIZE * sizeof(byte));
   }
   
   src = (SourceManager *) cinfo->src;
   src->pub.init_source = JPEG_InitSource;
   src->pub.fill_input_buffer = JPEG_FillInputBuffer;
   src->pub.skip_input_data = JPEG_SkipInputData;
   src->pub.term_source = JPEG_TermSource;
   src->pub.resync_to_restart = jpeg_resync_to_restart;
   src->infile = infile;
   src->pub.bytes_in_buffer = 0;
   src->pub.next_input_byte = null;
}

// DATA DESTINATION
typedef struct
{
   struct jpeg_destination_mgr pub;
   
   File outfile;
   byte * buffer;
} DestinationManager;

#define OUTPUT_BUF_SIZE  4096

static void JPEG_InitDestination(j_compress_ptr cinfo)
{
   DestinationManager * dest = (DestinationManager * ) cinfo->dest;
   
   dest->buffer = (byte *)
      (*cinfo->mem->alloc_small) ((j_common_ptr) cinfo, JPOOL_IMAGE,
				  OUTPUT_BUF_SIZE * sizeof(byte));
   
   dest->pub.next_output_byte = dest->buffer;
   dest->pub.free_in_buffer = OUTPUT_BUF_SIZE;
}

static boolean JPEG_EmptyOutputBuffer(j_compress_ptr cinfo)
{
   DestinationManager * dest = (DestinationManager *) cinfo->dest;
   
   if (dest->outfile.Write(dest->buffer, sizeof(byte), OUTPUT_BUF_SIZE) !=
      (uint) OUTPUT_BUF_SIZE)
      ERREXIT(cinfo, JERR_FILE_WRITE);
   
   dest->pub.next_output_byte = dest->buffer;
   dest->pub.free_in_buffer = OUTPUT_BUF_SIZE;
   
   return TRUE;
}

static void JPEG_TermDestination(j_compress_ptr cinfo)
{
   DestinationManager * dest = (DestinationManager *) cinfo->dest;
   uint datacount = (uint)(OUTPUT_BUF_SIZE - dest->pub.free_in_buffer);
   
   if (datacount > 0)
   {
      if (dest->outfile.Write(dest->buffer, sizeof(byte), datacount) != datacount)
         ERREXIT(cinfo, JERR_FILE_WRITE);
   }
/*
   fflush(dest->outfile);
   if (ferror(dest->outfile)) ERREXIT(cinfo, JERR_FILE_WRITE);
*/
}

static void JPEG_SetDestination(j_compress_ptr cinfo, File outfile)
{
   DestinationManager * dest;
   
   if(!cinfo->dest) 
   {
      cinfo->dest = (struct jpeg_destination_mgr *)
         (*cinfo->mem->alloc_small) ((j_common_ptr) cinfo, JPOOL_PERMANENT,
         sizeof(DestinationManager));
   }
   
   dest = (DestinationManager *) cinfo->dest;
   dest->pub.init_destination = JPEG_InitDestination;
   dest->pub.empty_output_buffer = JPEG_EmptyOutputBuffer;
   dest->pub.term_destination = JPEG_TermDestination;
   dest->outfile = outfile;
}

// BITMAP DRIVER
static char * extensions[] = { "jpg", "jpeg", null };

class JPGFormat : BitmapFormat
{
   class_property(extensions) = extensions;

   bool Load(Bitmap bitmap, File f)
   {
      bool result = false;
      struct jpeg_decompress_struct cinfo;

      ErrorHandler handler;
      cinfo.err = jpeg_std_error(&handler.jpeg);
      handler.jpeg.error_exit = JPEG_ExitHandler;
      if(!setjmp(handler.setjmpBuffer))
      {
         jpeg_create_decompress(&cinfo);

         JPEG_SetSource(&cinfo, f);

         jpeg_read_header(&cinfo, TRUE);

         if(bitmap.Allocate(null, cinfo.image_width, cinfo.image_height, 0, pixelFormat888, false))
         {
            JSAMPARRAY buffer;
            ColorAlpha * picture;

            jpeg_start_decompress(&cinfo);
            buffer = (*cinfo.mem->alloc_sarray) ((j_common_ptr) &cinfo, JPOOL_IMAGE, cinfo.output_width * cinfo.output_components, 1);

            for(picture = (ColorAlpha *)bitmap.picture; cinfo.output_scanline < cinfo.output_height; picture += bitmap.stride) 
            {
               int c;
               jpeg_read_scanlines(&cinfo, buffer, 1);
               for(c = 0; c<cinfo.image_width; c++)
               {
                  if(cinfo.output_components == 1)
                     picture[c] = ColorAlpha { 255, { buffer[0][c], buffer[0][c], buffer[0][c] } };
                  else
                     picture[c] = ColorAlpha { 255, { buffer[0][c*3], buffer[0][c*3+1], buffer[0][c*3+2] } };
               }
            }
            result = true;
         }
         jpeg_finish_decompress(&cinfo);
      }

      jpeg_destroy_decompress(&cinfo);

      if(!result)
         bitmap.Free();
      return result;
   }

   bool Save(Bitmap bitmap, char *filename, void * options)
   {
      bool result = false;
      if(bitmap.pixelFormat == pixelFormat888)
      {
         File f = FileOpen(filename, write);
         if(f) 
         {
            struct jpeg_compress_struct cinfo;
            struct jpeg_error_mgr jerr;
            JSAMPROW row;
            ColorAlpha * picture = (ColorAlpha *)bitmap.picture;
            byte * buffer;

            cinfo.err = jpeg_std_error(&jerr);

            jpeg_create_compress(&cinfo);
            JPEG_SetDestination(&cinfo, f);

            cinfo.image_width = bitmap.width;
            cinfo.image_height = bitmap.height;
            cinfo.input_components = 3;
            cinfo.in_color_space = JCS_RGB;

            jpeg_set_defaults(&cinfo);
     
            jpeg_set_quality(&cinfo, 100, TRUE);

            jpeg_start_compress(&cinfo, TRUE);

            buffer = new byte[bitmap.width * 3];

            for(;cinfo.next_scanline < cinfo.image_height;)
            {
               int c;
               for(c = 0; c<bitmap.width; c++)
               {
                  if(cinfo.input_components == 1)
                     buffer[c] = (picture[c].color.r + picture[c].color.g + picture[c].color.b) / 3;
                  else
                  {
                     buffer[c*3]   = picture[c].color.r;
                     buffer[c*3+1] = picture[c].color.g;
                     buffer[c*3+2] = picture[c].color.b;
                  }
               }
               row = buffer;
               jpeg_write_scanlines(&cinfo, &row, 1);

               picture += bitmap.stride;
            }

            delete buffer;

            jpeg_finish_compress(&cinfo);
            jpeg_destroy_compress(&cinfo);

            delete f;
            result = true;
         }      
      }
      return result;   
   }

   ColorAlpha * LoadPalette(char * fileName, char * type)
   {
      ColorAlpha * result = null;
      return result;
   }
}
