namespace gfx;

import "Display"

public class Resource
{
   virtual void Reference(Resource resource);
   virtual void Load(Resource copy, DisplaySystem displaySystem);
   virtual void Dereference(void);
};
