namespace com;

#if !defined(_DEBUG) || defined(MEMINFO)
import "instance"  // TOFIX: This is required to build Debug on Ubuntu 10.04, GCC 4.4.3
#endif
import "CustomAVLTree"

default:
extern int __ecereVMethodID_class_OnCopy;
extern int __ecereVMethodID_class_OnFree;
extern int __ecereVMethodID_class_OnSerialize;
extern int __ecereVMethodID_class_OnUnserialize;
private:

// NOTE: Although public, MapNode is generally for internal usage only
public class MapNode<class KT, class V> : private AVLNode<KT>
{
class_fixed

public:
   // public(key)
   // The 'key' property cannot work if key is a struct; use MapIterator::key instead
   property const KT key
   {
      get { return AVLNode::key; }
      set { AVLNode::key = value; }
   };
   // The 'value' property cannot work if either key or value is a struct; use MapIterator::value instead
   property V value
   {
      get { return this ? this.value : (V)0; }
      set { this.value = value; }
   };
   V value;

   // BECAUSE WE'RE PRIVATELY INHERITING, UNTIL public() works
   property thisclass prev { get { return (MapNode<KT,V>)AVLNode::prev; } }
   property thisclass next { get { return (MapNode<KT,V>)AVLNode::next; } }
   property thisclass minimum { get { return (MapNode<KT,V>)AVLNode::minimum; } }
   property thisclass maximum { get { return (MapNode<KT,V>)AVLNode::maximum; } }
}

public struct MapIterator<class KT, class V> : Iterator<V, IT = KT>
{
   property Map map
   {
      set { container = (Container<V, IT>)value; }
      get { return (Map<KT, V>)container; }
   }
   property const KT key
   {
      get { return ((Map<KT, V>)container).GetKey((MapNode<KT, V>)pointer); }
   }
   property V value
   {
      get { return container.GetData(pointer); }
      set { container.SetData(pointer, value); }
   }
};

public class Map<class MT, class V> : CustomAVLTree<MapNode<MT, V>, I = MT, D = V, KT = MT>
{
   class_fixed

   MT GetKey(MapNode<KT, V> node)
   {
      if(class(MT).type == structClass)
         return (MT)(((byte *)&(uint64)node.key) + __ENDIAN_PAD(sizeof(void *)));
      return node.key;
   }

   V GetData(MapNode<MT, V> node)
   {
      if(node)
      {
         // Adjust node pointer for non-standard AVLNode
         if(class(MT).type == structClass)
            node = (MapNode<MT, V>)(((byte *) node) + class(MT).structSize - sizeof(node.AVLNode::key));
         return (class(V).type == structClass) ? (MT)&node.value : node.value;
      }
      return (MT)0;
   }

   bool SetData(MapNode<MT, V> node, V value)
   {
      // Adjust node pointer for non-standard AVLNode
      if(class(MT).type == structClass)
         node = (MapNode<MT, V>)(((byte *) node) + class(MT).structSize - sizeof(node.AVLNode::key));

      if(class(V).type == structClass)
         memcpy((void *)&node.value, (void *)value, class(V).structSize);
      else
         node.value = value;
      return true;
   }

   MapNode<MT, V> Add(BT _newNode)
   {
      MapNode<MT, V> newNode = (MapNode<MT, V>) _newNode;
      if(class(MT).type == structClass || class(V).type == structClass)
      {
         MapNode<MT, V> realNode = (MapNode<MT, V>)GetAtPosition(newNode.key, true, null);
         if(class(V).type == structClass)
            SetData(realNode, (V)&newNode.value);
         else
            SetData(realNode, newNode.value);
         return newNode;
      }
      else
      {
         MapNode<MT, V> node = root ? root.Find(class(MT), (T)newNode.key) : null;
         if(!node)
         {
            Class Tclass = class(MT);
            void (* onCopy)(void *, void *, void *) = Tclass._vTbl[__ecereVMethodID_class_OnCopy];
            // Copy key here
            if((Tclass.type == systemClass && !Tclass.byValueSystemClass) || Tclass.type == bitClass || Tclass.type == enumClass || Tclass.type == unitClass)
               onCopy(Tclass, (byte *)&newNode.key + __ENDIAN_PAD(Tclass.typeSize), (byte *)&newNode.key + __ENDIAN_PAD(Tclass.typeSize));
            else
               onCopy(Tclass, (byte *)&newNode.key + __ENDIAN_PAD(sizeof(void *)), (void *)newNode.key);

            CustomAVLTree::Add((T)newNode);
            return newNode;
         }
         else
         {
            delete newNode;
            return null;
         }
      }
   }

   void FreeKey(MapNode<MT, V> node)
   {
      if(class(MT).type == structClass)
      {
         // TODO: Make this easier...
         Class Tclass = class(MT);
         ((void (*)(void *, void *))(void *)Tclass._vTbl[__ecereVMethodID_class_OnFree])(Tclass, (((byte *)&node.key) + __ENDIAN_PAD(sizeof(void *))));
      }
      else
         delete node.key;
   }

   void RemoveAll()
   {
      MapNode<MT, V> node = root;
      while(node)
      {
         if(node.left)
         {
            MapNode<MT, V> left = node.left;
            node.left = null;
            node = left;
         }
         else if(node.right)
         {
            MapNode<MT, V> right = node.right;
            node.right = null;
            node = right;
         }
         else
         {
            MapNode<MT, V> parent = node.parent;
            FreeKey(node);
            delete node;

            node = parent;
         }
      }
      root = null;
      count = 0;
   }

   void Remove(MapNode<MT, V> node)
   {
      CustomAVLTree::Remove(node);
      FreeKey(node);
      delete node;
   }

   void Free()
   {
      MapNode<MT, V> node = root;
      memMutex.Wait();
      while(node)
      {
         if(node.left)
         {
            MapNode<MT, V> left = node.left;
            node.left = null;
            node = left;
         }
         else if(node.right)
         {
            MapNode<MT, V> right = node.right;
            node.right = null;
            node = right;
         }
         else
         {
            MapNode<MT, V> parent = node.parent;
            V value = GetData(node);
            delete value;
            FreeKey(node);
            delete node;

            node = parent;
         }
      }
      memMutex.Release();
      root = null;
      count = 0;
   }

   void Delete(MapNode<MT, V> node)
   {
      V value = GetData(node);
      delete value;
      FreeKey(node);
      Remove(node);
   }

   MapNode<MT, V> Find(V value)
   {
      return (MapNode<MT, V>)Container::Find(value);
   }

   MapNode<MT, V> GetAtPosition(const MT pos, bool create, bool * justAdded)
   {
      AVLNode addNode = null;
      AddSide addSide = compare;
      MapNode<MT, V> node = root ? root.FindEx(class(MT), pos, &addNode, &addSide) : null;
      if(!node && create)
      {
         Class Tclass = class(MT);
         void (* onCopy)(void *, void *, void *) = Tclass._vTbl[__ecereVMethodID_class_OnCopy];
         if(class(MT).type == structClass || class(V).type == structClass)
         {
            uint size = sizeof(class MapNode<MT, V>);

            if(class(MT).type == structClass) size += class(MT).typeSize - sizeof(node.AVLNode::key);
            if(class(V).type == structClass)
               size += class(V).typeSize - sizeof(uint64); //sizeof(*&node.value);  // TODO: Simplify code generation for this sizeof
            node = (MapNode<MT, V>)new0 byte[size];
         }
         else
         {
            node = MapNode<MT, V> { key = pos };
         }
         if((Tclass.type == systemClass && !Tclass.byValueSystemClass) || Tclass.type == bitClass || Tclass.type == enumClass || Tclass.type == unitClass)
            // onCopy(Tclass, (byte *)&node.key + __ENDIAN_PAD(Tclass.typeSize), (byte *)&pos + __ENDIAN_PAD(Tclass.typeSize));
            memcpy((byte *)&node.key + __ENDIAN_PAD(Tclass.typeSize), (byte *)&pos + __ENDIAN_PAD(Tclass.typeSize), Tclass.typeSize);
         else
            onCopy(Tclass, (byte *)&node.key + __ENDIAN_PAD(sizeof(void *)), (void *)pos);
         CustomAVLTree::AddEx((T)(uintptr)node, (T)(uintptr)addNode, addSide);
         if(justAdded) *justAdded = true;
      }
      return node;
   }

   void Copy(Container<T> source)
   {
      IteratorPointer i;
      RemoveAll();
      if(!eClass_IsDerived(source._class, class(Map)))
      {
         for(i = source.GetFirst(); i; i = source.GetNext(i))
         {
            MapNode<MT, V> srcNode = (MapNode<MT, V>)source.GetData(i);
            MapNode<MT, V> destNode = (MapNode<MT, V>)GetAtPosition(srcNode.key, true, null);
            SetData(destNode, srcNode.value);
         }
         // ADDED THIS HERE TO FREE BUILTIN CONTAINERS ASSIGNED TO A MAP
         if(source._class == class(BuiltInContainer))
            source.Free();
      }
   }

   public property Map mapSrc
   {
      set
      {
         IteratorPointer i;
         RemoveAll();
         if(value && eClass_IsDerived(value._class, class(Map)))
         {
            for(i = value.GetFirst(); i; i = value.GetNext(i))
            {
               MapNode<MT, V> srcNode = (MapNode<MT, V>)i;
               MapNode<MT, V> destNode = (MapNode<MT, V>)GetAtPosition(srcNode.key, true, null);
               SetData(destNode, GetData(srcNode));
            }
         }
      }
   }

   void OnSerialize(IOChannel channel)
   {
      uint count = GetCount();
      IteratorPointer i;
      Class Kclass = class(MT);
      Class Dclass = class(V);
      bool kIsNormalClass = (Kclass.type == normalClass) && Kclass.structSize;
      bool dIsNormalClass = (Dclass.type == normalClass) && Dclass.structSize;

      channel.Put(count);
      for(i = GetFirst(); i; i = GetNext(i))
      {
         MapNode<MT, V> srcNode = (MapNode<MT, V>)i;
         MT key = GetKey((MapNode<KT, V>)srcNode);
         D data = GetData(srcNode);
         Class kEclass = kIsNormalClass ? ((Instance)key)._class : Kclass;
         Class dEclass = dIsNormalClass ? ((Instance)data)._class : Dclass;

         ((void (*)(void *, void *, void *))(void *)kEclass._vTbl[__ecereVMethodID_class_OnSerialize])(kEclass,
            ((Kclass.type == systemClass && !Kclass.byValueSystemClass) || Kclass.type == bitClass || Kclass.type == enumClass || Kclass.type == unitClass) ? &key : (void *)key, channel);
         ((void (*)(void *, void *, void *))(void *)dEclass._vTbl[__ecereVMethodID_class_OnSerialize])(dEclass,
            ((Dclass.type == systemClass && !Dclass.byValueSystemClass) || Dclass.type == bitClass || Dclass.type == enumClass || Dclass.type == unitClass) ? &data : (void *)data, channel);
      }
   }

   void OnUnserialize(IOChannel channel)
   {
      uint c, count;
      thisclass container = eInstance_New(_class.fullName);
      Class Kclass = class(MT);
      Class Dclass = class(V);
      incref container;

      channel.Get(count);
      for(c = 0; c < count; c++)
      {
         MapNode<MT, V> destNode;
         uint64 key  = (Kclass.type == structClass) ? (uint64)(uintptr)new byte[Kclass.structSize] : 0;
         uint64 data = (Dclass.type == structClass) ? (uint64)(uintptr)new byte[Dclass.structSize] : 0;
         ((void (*)(void *, void *, void *))(void *)Kclass._vTbl[__ecereVMethodID_class_OnUnserialize])(Kclass, &key, channel);
         ((void (*)(void *, void *, void *))(void *)Dclass._vTbl[__ecereVMethodID_class_OnUnserialize])(Dclass, (Dclass.type == structClass) ? (void *)(uintptr)data : &data, channel);
         destNode = (MapNode<MT, V>)container.GetAtPosition((MT)key, true, null);
         container.SetData(destNode, (V)data);
         if(Kclass.type == structClass)
            delete (void *)(uintptr)key;
         if(Dclass.type == structClass)
            delete (void *)(uintptr)data;
      }
      this = container;
   }
}
