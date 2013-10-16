/********************************************************
   This sample demonstrates how to use the XMLParser
   class to parse an XML communication protocol and
   update model objects accordingly.
********************************************************/

import "XMLParser"

enum ObjectType
{
   plane, truck, human
};

class Track
{
   String id;
   ObjectType type;
   String description;
   Vector3Df position;
   Degrees direction;
   float speed;

   ~Track()
   {
      delete id;
      delete description;
   }
}

List<Track> tracks { };

TrackXMLParser parser { };

class TrackingSocket : Socket
{
   unsigned int OnReceive(unsigned char * buffer, unsigned int count)
   {
      parser.Parse(buffer, count);

      // Update Things Here
      return count;
   }
}

class TrackXMLParser : XMLParser
{
   Track object;

   void ProcessKeyword(char * word)
   {
      if(!strcmpi(keyWord, "object"))
      {
         char * id = null;
         ObjectType type = 0;
         char * desc = null;
         while(GetWord())
         {
            if(!strcmpi(word, "id"))        { GetWord(); id = CopyString(word); }
            else if(!strcmpi(word, "type")) { GetWord(); type = (ObjectType)atoi(word); }
            else if(!strcmpi(word, "desc")) { GetWord(); desc = CopyString(word); }
         }
         for(object : tracks)
         {
            if(!strcmp(object.id, id)) break;
         }
         if(object)
         {
            object.type = type;
            object.description = desc;
         }
         else
         {
            tracks.Add({ id = id, type = type, description = desc });
         }
         delete desc;
      }
      else if(!strcmpi(keyWord, "/object"))
      {
         object = null;
      }
      else if(!strcmpi(keyWord, "pos"))
      {
         Vector3Df position { };
         while(GetWord())
         {
            if(!strcmpi(word, "x"))          { GetWord(); position.x = atof(word); }
            else if(!strcmpi(word, "y"))     { GetWord(); position.y = atof(word); }
            else if(!strcmpi(word, "z"))     { GetWord(); position.z = atof(word); }
            else if(!strcmpi(word, "speed")) { GetWord(); object.speed = atof(word); }
            else if(!strcmpi(word, "dir"))   { GetWord(); object.direction = atof(word); }
         }
         object.position = position;
      }
   }
};
