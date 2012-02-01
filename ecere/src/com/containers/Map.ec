namespace com;

import "instance"  // TOFIX: This is required to build Debug on Ubuntu 10.04, GCC 4.4.3
import "CustomAVLTree"

default:
extern int __ecereVMethodID_class_OnCopy;
private:

public class MapNode<class KT, class V> : private AVLNode<KT>
{
class_fixed

public:
   // public(key)
   // THIS IS MISSING CODE FOR struct KEYS
   property KT key
   {
      get { return AVLNode::key; }
      set { AVLNode::key = value; }
   };
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
   property KT key
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

   bool SetData(MapNode<MT, V> node, MT value)
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
         MapNode<MT, V> realNode = (MapNode<MT, V>)GetAtPosition(newNode.key, true);
         SetData(realNode, newNode.value);
         return newNode;
      }
      else
      {
         MapNode<MT, V> node = root ? root.Find(class(MT), (T)newNode.key) : null;
         if(!node)
         {
            Class Tclass = class(MT);
            // Copy key here
            if(Tclass.type == systemClass || Tclass.type == bitClass || Tclass.type == enumClass || Tclass.type == unitClass)
            {
               Tclass._vTbl[__ecereVMethodID_class_OnCopy](Tclass, (((byte *)&(uint64)newNode.key) + __ENDIAN_PAD(Tclass.typeSize)),
                  (((byte *)&(uint64)newNode.key) + __ENDIAN_PAD(Tclass.typeSize)));
            }
            else
               Tclass._vTbl[__ecereVMethodID_class_OnCopy](Tclass, (((byte *)&(uint64)newNode.key) + __ENDIAN_PAD(sizeof(void *))), (void *)newNode.key);

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

   void Remove(MapNode<MT, V> node)
   {
      CustomAVLTree::Remove(node);
      delete node.key;
      delete node;
   }

   void Free()
   {
      MapNode<MT, V> node;
      while(node = root)
      {
         delete node.value;
         Remove(node);
      }
   }

   void Delete(MapNode<MT, V> node)
   {
      delete node.value;
      Remove(node);
   }

   MapNode<MT, V> Find(V value)
   {
      return (MapNode<MT, V>)Container::Find(value);
   }

   MapNode<MT, V> GetAtPosition(MT pos, bool create)
   {
      MapNode<MT, V> node = root ? root.Find(class(MT), pos) : null;
      if(!node && create)
      {
         Class Tclass = class(MT);
         if(class(MT).type == structClass || class(V).type == structClass)
         {
            uint size = sizeof(class MapNode<MT, V>);
            
            if(class(MT).type == structClass) size += class(MT).typeSize - sizeof(node.AVLNode::key);
            if(class(V).type == structClass) size += class(V).typeSize - sizeof(*&node.value);
            node = (MapNode<MT, V>)new0 byte[size];
         }
         else
         {
            node = MapNode<MT, V> { key = pos };
         }
         if(Tclass.type == systemClass || Tclass.type == bitClass || Tclass.type == enumClass || Tclass.type == unitClass)
         {
            Tclass._vTbl[__ecereVMethodID_class_OnCopy](Tclass, (((byte *)&(uint64)node.key) + __ENDIAN_PAD(Tclass.typeSize)),
              (((byte *)&(uint64)pos) + __ENDIAN_PAD(Tclass.typeSize)));
         }
         else
            Tclass._vTbl[__ecereVMethodID_class_OnCopy](Tclass, (((byte *)&(uint64)node.key) + __ENDIAN_PAD(sizeof(void *))), (void *)pos);
         CustomAVLTree::Add((T)node);
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
            MapNode<MT, V> destNode = (MapNode<MT, V>)GetAtPosition(srcNode.key, true);
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
         if(eClass_IsDerived(value._class, class(Map)))
         {
            for(i = value.GetFirst(); i; i = value.GetNext(i))
            {
               MapNode<MT, V> srcNode = (MapNode<MT, V>)i;
               MapNode<MT, V> destNode = (MapNode<MT, V>)GetAtPosition(srcNode.key, true);
               SetData(destNode, GetData(srcNode));
            }
         }
      }
   }
}
