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

   void ProcessKeyword(char * keyWord)
   {
      if(!strcmpi(keyWord, "object"))
      {
         char * id = null;
         ObjectType type = 0;
         char * desc = null;
         while(GetWord())
         {
            if(!strcmpi(keyWord, "id"))        { GetWord(); id = CopyString(keyWord); }
            else if(!strcmpi(keyWord, "type")) { GetWord(); type = (ObjectType)atoi(keyWord); }
            else if(!strcmpi(keyWord, "desc")) { GetWord(); desc = CopyString(keyWord); }
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
            if(!strcmpi(keyWord, "x"))          { GetWord(); position.x = (float)atof(keyWord); }
            else if(!strcmpi(keyWord, "y"))     { GetWord(); position.y = (float)atof(keyWord); }
            else if(!strcmpi(keyWord, "z"))     { GetWord(); position.z = (float)atof(keyWord); }
            else if(!strcmpi(keyWord, "speed")) { GetWord(); object.speed = (float)atof(keyWord); }
            else if(!strcmpi(keyWord, "dir"))   { GetWord(); object.direction = (float)atof(keyWord); }
         }
         object.position = position;
      }
   }
};

enum MyTag
{
   none,
   myTag1,
   myTag2,
   myTag3
};

class MyParser : XMLParser
{
   MyTag tag;

   void ProcessCharacterData(char * data)
   {
      switch(tag)
      {
         case myTag1: PrintLn("myTag1: ", data); break;
         case myTag2: PrintLn("myTag2: ", data); break;
         case myTag3: PrintLn("myTag3: ", data); break;
      }
   }

   void ProcessKeyword(char * keyWord)
   {
      NamedLink64 nl;
      EnumClassData tagData = class(MyTag).data;
      for(nl = tagData.values.first; nl; nl = nl.next)
      {
         if(!strcmpi(keyWord, nl.name))
         {
            MyTag curTag = (MyTag)nl.data;
            if(openingTag)
               tag = curTag;
            else
               tag = none;
            break;
         }
      }
   }
}
