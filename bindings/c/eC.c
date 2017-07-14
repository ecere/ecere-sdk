#include "eC.h"



// Global Functions Pointers

LIB_EXPORT C(GlobalFunction) * FUNCTION(checkConsistency);
LIB_EXPORT C(GlobalFunction) * FUNCTION(checkMemory);
LIB_EXPORT C(GlobalFunction) * FUNCTION(getActiveDesigner);
LIB_EXPORT C(GlobalFunction) * FUNCTION(getRuntimePlatform);
LIB_EXPORT C(GlobalFunction) * FUNCTION(locateModule);
LIB_EXPORT C(GlobalFunction) * FUNCTION(print);
LIB_EXPORT C(GlobalFunction) * FUNCTION(printBuf);
LIB_EXPORT C(GlobalFunction) * FUNCTION(printLn);
LIB_EXPORT C(GlobalFunction) * FUNCTION(printLnBuf);
LIB_EXPORT C(GlobalFunction) * FUNCTION(printLnString);
LIB_EXPORT C(GlobalFunction) * FUNCTION(printStdArgsToBuffer);
LIB_EXPORT C(GlobalFunction) * FUNCTION(printString);
LIB_EXPORT C(GlobalFunction) * FUNCTION(setActiveDesigner);
LIB_EXPORT C(GlobalFunction) * FUNCTION(log2i);
LIB_EXPORT C(GlobalFunction) * FUNCTION(memswap);
LIB_EXPORT C(GlobalFunction) * FUNCTION(pow2i);
LIB_EXPORT C(GlobalFunction) * FUNCTION(qsortr);
LIB_EXPORT C(GlobalFunction) * FUNCTION(qsortrx);
LIB_EXPORT C(GlobalFunction) * FUNCTION(queryMemInfo);
LIB_EXPORT C(GlobalFunction) * FUNCTION(changeCh);
LIB_EXPORT C(GlobalFunction) * FUNCTION(changeChars);
LIB_EXPORT C(GlobalFunction) * FUNCTION(changeExtension);
LIB_EXPORT C(GlobalFunction) * FUNCTION(copyString);
LIB_EXPORT C(GlobalFunction) * FUNCTION(floatFromString);
LIB_EXPORT C(GlobalFunction) * FUNCTION(getCurrentThreadID);
LIB_EXPORT C(GlobalFunction) * FUNCTION(getExtension);
LIB_EXPORT C(GlobalFunction) * FUNCTION(getHexValue);
LIB_EXPORT C(GlobalFunction) * FUNCTION(getLastDirectory);
LIB_EXPORT C(GlobalFunction) * FUNCTION(getString);
LIB_EXPORT C(GlobalFunction) * FUNCTION(getValue);
LIB_EXPORT C(GlobalFunction) * FUNCTION(iSO8859_1toUTF8);
LIB_EXPORT C(GlobalFunction) * FUNCTION(isPathInsideOf);
LIB_EXPORT C(GlobalFunction) * FUNCTION(makePathRelative);
LIB_EXPORT C(GlobalFunction) * FUNCTION(pathCat);
LIB_EXPORT C(GlobalFunction) * FUNCTION(pathCatSlash);
LIB_EXPORT C(GlobalFunction) * FUNCTION(printBigSize);
LIB_EXPORT C(GlobalFunction) * FUNCTION(printSize);
LIB_EXPORT C(GlobalFunction) * FUNCTION(rSearchString);
LIB_EXPORT C(GlobalFunction) * FUNCTION(repeatCh);
LIB_EXPORT C(GlobalFunction) * FUNCTION(searchString);
LIB_EXPORT C(GlobalFunction) * FUNCTION(splitArchivePath);
LIB_EXPORT C(GlobalFunction) * FUNCTION(splitDirectory);
LIB_EXPORT C(GlobalFunction) * FUNCTION(stripExtension);
LIB_EXPORT C(GlobalFunction) * FUNCTION(stripLastDirectory);
LIB_EXPORT C(GlobalFunction) * FUNCTION(stripQuotes);
LIB_EXPORT C(GlobalFunction) * FUNCTION(tokenize);
LIB_EXPORT C(GlobalFunction) * FUNCTION(tokenizeWith);
LIB_EXPORT C(GlobalFunction) * FUNCTION(trimLSpaces);
LIB_EXPORT C(GlobalFunction) * FUNCTION(trimRSpaces);
LIB_EXPORT C(GlobalFunction) * FUNCTION(uTF16toUTF8);
LIB_EXPORT C(GlobalFunction) * FUNCTION(uTF16toUTF8Buffer);
LIB_EXPORT C(GlobalFunction) * FUNCTION(uTF32toUTF8Len);
LIB_EXPORT C(GlobalFunction) * FUNCTION(uTF8GetChar);
LIB_EXPORT C(GlobalFunction) * FUNCTION(uTF8Validate);
LIB_EXPORT C(GlobalFunction) * FUNCTION(uTF8toUTF16);
LIB_EXPORT C(GlobalFunction) * FUNCTION(uTF8toUTF16Buffer);



// Virtual Methods

LIB_EXPORT C(Method) * METHOD(class, onCompare);
LIB_EXPORT C(Method) * METHOD(class, onCopy);
LIB_EXPORT C(Method) * METHOD(class, onDisplay);
LIB_EXPORT C(Method) * METHOD(class, onEdit);
LIB_EXPORT C(Method) * METHOD(class, onFree);
LIB_EXPORT C(Method) * METHOD(class, onGetDataFromString);
LIB_EXPORT C(Method) * METHOD(class, onGetString);
LIB_EXPORT C(Method) * METHOD(class, onSaveEdit);
LIB_EXPORT C(Method) * METHOD(class, onSerialize);
LIB_EXPORT C(Method) * METHOD(class, onUnserialize);

LIB_EXPORT C(Method) * METHOD(double, inf);
LIB_EXPORT C(Method) * METHOD(double, nan);

LIB_EXPORT C(Method) * METHOD(float, inf);
LIB_EXPORT C(Method) * METHOD(float, nan);

LIB_EXPORT C(Method) * METHOD(AVLNode, find);

LIB_EXPORT C(Method) * METHOD(Application, main);

LIB_EXPORT C(Method) * METHOD(BuiltInContainer, add);
LIB_EXPORT C(Method) * METHOD(BuiltInContainer, copy);
LIB_EXPORT C(Method) * METHOD(BuiltInContainer, delete);
LIB_EXPORT C(Method) * METHOD(BuiltInContainer, find);
LIB_EXPORT C(Method) * METHOD(BuiltInContainer, free);
LIB_EXPORT C(Method) * METHOD(BuiltInContainer, freeIterator);
LIB_EXPORT C(Method) * METHOD(BuiltInContainer, getAtPosition);
LIB_EXPORT C(Method) * METHOD(BuiltInContainer, getCount);
LIB_EXPORT C(Method) * METHOD(BuiltInContainer, getData);
LIB_EXPORT C(Method) * METHOD(BuiltInContainer, getFirst);
LIB_EXPORT C(Method) * METHOD(BuiltInContainer, getLast);
LIB_EXPORT C(Method) * METHOD(BuiltInContainer, getNext);
LIB_EXPORT C(Method) * METHOD(BuiltInContainer, getPrev);
LIB_EXPORT C(Method) * METHOD(BuiltInContainer, insert);
LIB_EXPORT C(Method) * METHOD(BuiltInContainer, move);
LIB_EXPORT C(Method) * METHOD(BuiltInContainer, remove);
LIB_EXPORT C(Method) * METHOD(BuiltInContainer, removeAll);
LIB_EXPORT C(Method) * METHOD(BuiltInContainer, setData);
LIB_EXPORT C(Method) * METHOD(BuiltInContainer, sort);

LIB_EXPORT C(Method) * METHOD(ClassDesignerBase, addObject);
LIB_EXPORT C(Method) * METHOD(ClassDesignerBase, createNew);
LIB_EXPORT C(Method) * METHOD(ClassDesignerBase, createObject);
LIB_EXPORT C(Method) * METHOD(ClassDesignerBase, destroyObject);
LIB_EXPORT C(Method) * METHOD(ClassDesignerBase, droppedObject);
LIB_EXPORT C(Method) * METHOD(ClassDesignerBase, fixProperty);
LIB_EXPORT C(Method) * METHOD(ClassDesignerBase, listToolBoxClasses);
LIB_EXPORT C(Method) * METHOD(ClassDesignerBase, postCreateObject);
LIB_EXPORT C(Method) * METHOD(ClassDesignerBase, prepareTestObject);
LIB_EXPORT C(Method) * METHOD(ClassDesignerBase, reset);
LIB_EXPORT C(Method) * METHOD(ClassDesignerBase, selectObject);

LIB_EXPORT C(Method) * METHOD(Container, add);
LIB_EXPORT C(Method) * METHOD(Container, copy);
LIB_EXPORT C(Method) * METHOD(Container, delete);
LIB_EXPORT C(Method) * METHOD(Container, find);
LIB_EXPORT C(Method) * METHOD(Container, free);
LIB_EXPORT C(Method) * METHOD(Container, freeIterator);
LIB_EXPORT C(Method) * METHOD(Container, getAtPosition);
LIB_EXPORT C(Method) * METHOD(Container, getCount);
LIB_EXPORT C(Method) * METHOD(Container, getData);
LIB_EXPORT C(Method) * METHOD(Container, getFirst);
LIB_EXPORT C(Method) * METHOD(Container, getLast);
LIB_EXPORT C(Method) * METHOD(Container, getNext);
LIB_EXPORT C(Method) * METHOD(Container, getPrev);
LIB_EXPORT C(Method) * METHOD(Container, insert);
LIB_EXPORT C(Method) * METHOD(Container, move);
LIB_EXPORT C(Method) * METHOD(Container, remove);
LIB_EXPORT C(Method) * METHOD(Container, removeAll);
LIB_EXPORT C(Method) * METHOD(Container, setData);
LIB_EXPORT C(Method) * METHOD(Container, sort);
LIB_EXPORT C(Method) * METHOD(Container, takeOut);

LIB_EXPORT C(Method) * METHOD(CustomAVLTree, freeKey);

LIB_EXPORT C(Method) * METHOD(DesignerBase, addDefaultMethod);
LIB_EXPORT C(Method) * METHOD(DesignerBase, addToolBoxClass);
LIB_EXPORT C(Method) * METHOD(DesignerBase, codeAddObject);
LIB_EXPORT C(Method) * METHOD(DesignerBase, deleteObject);
LIB_EXPORT C(Method) * METHOD(DesignerBase, findObject);
LIB_EXPORT C(Method) * METHOD(DesignerBase, modifyCode);
LIB_EXPORT C(Method) * METHOD(DesignerBase, objectContainsCode);
LIB_EXPORT C(Method) * METHOD(DesignerBase, renameObject);
LIB_EXPORT C(Method) * METHOD(DesignerBase, selectObjectFromDesigner);
LIB_EXPORT C(Method) * METHOD(DesignerBase, sheetAddObject);
LIB_EXPORT C(Method) * METHOD(DesignerBase, updateProperties);

LIB_EXPORT C(Method) * METHOD(IOChannel, get);
LIB_EXPORT C(Method) * METHOD(IOChannel, put);
LIB_EXPORT C(Method) * METHOD(IOChannel, readData);
LIB_EXPORT C(Method) * METHOD(IOChannel, serialize);
LIB_EXPORT C(Method) * METHOD(IOChannel, unserialize);
LIB_EXPORT C(Method) * METHOD(IOChannel, writeData);

LIB_EXPORT C(Method) * METHOD(Iterator, find);
LIB_EXPORT C(Method) * METHOD(Iterator, free);
LIB_EXPORT C(Method) * METHOD(Iterator, getData);
LIB_EXPORT C(Method) * METHOD(Iterator, index);
LIB_EXPORT C(Method) * METHOD(Iterator, next);
LIB_EXPORT C(Method) * METHOD(Iterator, prev);
LIB_EXPORT C(Method) * METHOD(Iterator, remove);
LIB_EXPORT C(Method) * METHOD(Iterator, setData);

LIB_EXPORT C(Method) * METHOD(LinkList, _Sort);

LIB_EXPORT C(Method) * METHOD(Module, load);
LIB_EXPORT C(Method) * METHOD(Module, onLoad);
LIB_EXPORT C(Method) * METHOD(Module, onUnload);
LIB_EXPORT C(Method) * METHOD(Module, unload);

LIB_EXPORT C(Method) * METHOD(SerialBuffer, free);

LIB_EXPORT C(Method) * METHOD(BTNode, findPrefix);
LIB_EXPORT C(Method) * METHOD(BTNode, findString);

LIB_EXPORT C(Method) * METHOD(BinaryTree, add);
LIB_EXPORT C(Method) * METHOD(BinaryTree, check);
LIB_EXPORT C(Method) * METHOD(BinaryTree, compareInt);
LIB_EXPORT C(Method) * METHOD(BinaryTree, compareString);
LIB_EXPORT C(Method) * METHOD(BinaryTree, delete);
LIB_EXPORT C(Method) * METHOD(BinaryTree, find);
LIB_EXPORT C(Method) * METHOD(BinaryTree, findAll);
LIB_EXPORT C(Method) * METHOD(BinaryTree, findPrefix);
LIB_EXPORT C(Method) * METHOD(BinaryTree, findString);
LIB_EXPORT C(Method) * METHOD(BinaryTree, free);
LIB_EXPORT C(Method) * METHOD(BinaryTree, freeString);
LIB_EXPORT C(Method) * METHOD(BinaryTree, print);
LIB_EXPORT C(Method) * METHOD(BinaryTree, remove);

LIB_EXPORT C(Method) * METHOD(Item, copy);

LIB_EXPORT C(Method) * METHOD(Mutex, release);
LIB_EXPORT C(Method) * METHOD(Mutex, wait);

LIB_EXPORT C(Method) * METHOD(OldLink, free);

LIB_EXPORT C(Method) * METHOD(OldList, add);
LIB_EXPORT C(Method) * METHOD(OldList, addName);
LIB_EXPORT C(Method) * METHOD(OldList, clear);
LIB_EXPORT C(Method) * METHOD(OldList, copy);
LIB_EXPORT C(Method) * METHOD(OldList, delete);
LIB_EXPORT C(Method) * METHOD(OldList, findLink);
LIB_EXPORT C(Method) * METHOD(OldList, findName);
LIB_EXPORT C(Method) * METHOD(OldList, findNamedLink);
LIB_EXPORT C(Method) * METHOD(OldList, free);
LIB_EXPORT C(Method) * METHOD(OldList, insert);
LIB_EXPORT C(Method) * METHOD(OldList, move);
LIB_EXPORT C(Method) * METHOD(OldList, placeName);
LIB_EXPORT C(Method) * METHOD(OldList, remove);
LIB_EXPORT C(Method) * METHOD(OldList, removeAll);
LIB_EXPORT C(Method) * METHOD(OldList, sort);
LIB_EXPORT C(Method) * METHOD(OldList, swap);

LIB_EXPORT C(Method) * METHOD(ZString, concat);
LIB_EXPORT C(Method) * METHOD(ZString, concatf);
LIB_EXPORT C(Method) * METHOD(ZString, copy);
LIB_EXPORT C(Method) * METHOD(ZString, copyString);




// Methods Function Pointers


LIB_EXPORT double (* double_inf)(void);
LIB_EXPORT double (* double_nan)(void);

LIB_EXPORT float (* float_inf)(void);
LIB_EXPORT float (* float_nan)(void);

LIB_EXPORT thisclass(AVLNode *) (* AVLNode_find)(C(AVLNode) * __this, C(Class) * Tclass, TP(AVLNode, T) key);




LIB_EXPORT void (* Container_takeOut)(C(Container) __this, TP(Container, D) d);

LIB_EXPORT void (* CustomAVLTree_freeKey)(C(CustomAVLTree) __this, C(AVLNode) * item);


LIB_EXPORT void (* IOChannel_get)(C(IOChannel) __this, C(Class) * class_data, void * data);
LIB_EXPORT void (* IOChannel_put)(C(IOChannel) __this, C(Class) * class_data, void * data);
LIB_EXPORT void (* IOChannel_serialize)(C(IOChannel) __this, C(Class) * class_data, void * data);
LIB_EXPORT void (* IOChannel_unserialize)(C(IOChannel) __this, C(Class) * class_data, void * data);

LIB_EXPORT C(bool) (* Iterator_find)(C(Iterator) * __this, TP(Iterator, T) value);
LIB_EXPORT void (* Iterator_free)(C(Iterator) * __this);
LIB_EXPORT TP(Iterator, T) (* Iterator_getData)(C(Iterator) * __this);
LIB_EXPORT C(bool) (* Iterator_index)(C(Iterator) * __this, TP(Iterator, IT) index, C(bool) create);
LIB_EXPORT C(bool) (* Iterator_next)(C(Iterator) * __this);
LIB_EXPORT C(bool) (* Iterator_prev)(C(Iterator) * __this);
LIB_EXPORT void (* Iterator_remove)(C(Iterator) * __this);
LIB_EXPORT C(bool) (* Iterator_setData)(C(Iterator) * __this, TP(Iterator, T) value);

LIB_EXPORT void (* LinkList__Sort)(C(LinkList) __this, C(bool) ascending, C(LinkList) * lists);


LIB_EXPORT void (* SerialBuffer_free)(C(SerialBuffer) __this);

LIB_EXPORT C(BTNode) * (* BTNode_findPrefix)(C(BTNode) * __this, const char * key);
LIB_EXPORT C(BTNode) * (* BTNode_findString)(C(BTNode) * __this, const char * key);

LIB_EXPORT C(bool) (* BinaryTree_add)(C(BinaryTree) * __this, C(BTNode) * node);
LIB_EXPORT C(bool) (* BinaryTree_check)(C(BinaryTree) * __this);
LIB_EXPORT int (* BinaryTree_compareInt)(C(BinaryTree) * __this, uintptr a, uintptr b);
LIB_EXPORT int (* BinaryTree_compareString)(C(BinaryTree) * __this, const char * a, const char * b);
LIB_EXPORT void (* BinaryTree_delete)(C(BinaryTree) * __this, C(BTNode) * node);
LIB_EXPORT C(BTNode) * (* BinaryTree_find)(C(BinaryTree) * __this, uintptr key);
LIB_EXPORT C(BTNode) * (* BinaryTree_findAll)(C(BinaryTree) * __this, uintptr key);
LIB_EXPORT C(BTNode) * (* BinaryTree_findPrefix)(C(BinaryTree) * __this, const char * key);
LIB_EXPORT C(BTNode) * (* BinaryTree_findString)(C(BinaryTree) * __this, const char * key);
LIB_EXPORT void (* BinaryTree_free)(C(BinaryTree) * __this);
LIB_EXPORT void (* BinaryTree_freeString)(char * string);
LIB_EXPORT char * (* BinaryTree_print)(C(BinaryTree) * __this, char * output, C(TreePrintStyle) tps);
LIB_EXPORT void (* BinaryTree_remove)(C(BinaryTree) * __this, C(BTNode) * node);

LIB_EXPORT void (* Item_copy)(C(Item) * __this, C(Item) * src, int size);

LIB_EXPORT void (* Mutex_release)(C(Mutex) * __this);
LIB_EXPORT void (* Mutex_wait)(C(Mutex) * __this);

LIB_EXPORT void (* OldLink_free)(C(OldLink) * __this);

LIB_EXPORT void (* OldList_add)(C(OldList) * __this, void * item);
LIB_EXPORT C(bool) (* OldList_addName)(C(OldList) * __this, void * item);
LIB_EXPORT void (* OldList_clear)(C(OldList) * __this);
LIB_EXPORT void (* OldList_copy)(C(OldList) * __this, C(OldList) * src, int size, void (* copy)(void * dest, void * src));
LIB_EXPORT void (* OldList_delete)(C(OldList) * __this, void * item);
LIB_EXPORT C(OldLink) * (* OldList_findLink)(C(OldList) * __this, void * data);
LIB_EXPORT void * (* OldList_findName)(C(OldList) * __this, const char * name, C(bool) warn);
LIB_EXPORT void * (* OldList_findNamedLink)(C(OldList) * __this, const char * name, C(bool) warn);
LIB_EXPORT void (* OldList_free)(C(OldList) * __this, void (* freeFn)(void *));
LIB_EXPORT C(bool) (* OldList_insert)(C(OldList) * __this, void * prevItem, void * item);
LIB_EXPORT void (* OldList_move)(C(OldList) * __this, void * item, void * prevItem);
LIB_EXPORT C(bool) (* OldList_placeName)(C(OldList) * __this, const char * name, void ** place);
LIB_EXPORT void (* OldList_remove)(C(OldList) * __this, void * item);
LIB_EXPORT void (* OldList_removeAll)(C(OldList) * __this, void (* freeFn)(void *));
LIB_EXPORT void (* OldList_sort)(C(OldList) * __this, int (* compare)(void *, void *, void *), void * data);
LIB_EXPORT void (* OldList_swap)(C(OldList) * __this, void * item1, void * item2);

LIB_EXPORT void (* ZString_concat)(C(ZString) __this, C(ZString) s);
LIB_EXPORT void (* ZString_concatf)(C(ZString) __this, const char * format, ...);
LIB_EXPORT void (* ZString_copy)(C(ZString) __this, C(ZString) s);
LIB_EXPORT void (* ZString_copyString)(C(ZString) __this, char * value, int newLen);




LIB_EXPORT C(Property) * PROPERTY(double, isNan);
LIB_EXPORT C(bool) (* double_get_isNan)(double d);

LIB_EXPORT C(Property) * PROPERTY(double, isInf);
LIB_EXPORT C(bool) (* double_get_isInf)(double d);

LIB_EXPORT C(Property) * PROPERTY(double, signBit);
LIB_EXPORT int (* double_get_signBit)(double d);

LIB_EXPORT C(Property) * PROPERTY(float, isNan);
LIB_EXPORT C(bool) (* float_get_isNan)(float f);

LIB_EXPORT C(Property) * PROPERTY(float, isInf);
LIB_EXPORT C(bool) (* float_get_isInf)(float f);

LIB_EXPORT C(Property) * PROPERTY(float, signBit);
LIB_EXPORT int (* float_get_signBit)(float f);

LIB_EXPORT C(Property) * PROPERTY(AVLNode, prev);
LIB_EXPORT thisclass(AVLNode *) (* AVLNode_get_prev)(C(AVLNode) * a);

LIB_EXPORT C(Property) * PROPERTY(AVLNode, next);
LIB_EXPORT thisclass(AVLNode *) (* AVLNode_get_next)(C(AVLNode) * a);

LIB_EXPORT C(Property) * PROPERTY(AVLNode, minimum);
LIB_EXPORT thisclass(AVLNode *) (* AVLNode_get_minimum)(C(AVLNode) * a);

LIB_EXPORT C(Property) * PROPERTY(AVLNode, maximum);
LIB_EXPORT thisclass(AVLNode *) (* AVLNode_get_maximum)(C(AVLNode) * a);

LIB_EXPORT C(Property) * PROPERTY(AVLNode, count);
LIB_EXPORT int (* AVLNode_get_count)(C(AVLNode) * a);

LIB_EXPORT C(Property) * PROPERTY(AVLNode, depthProp);
LIB_EXPORT int (* AVLNode_get_depthProp)(C(AVLNode) * a);

LIB_EXPORT C(Property) * PROPERTY(Array, size);
LIB_EXPORT void (* Array_set_size)(C(Array) a, uint value);
LIB_EXPORT uint (* Array_get_size)(C(Array) a);

LIB_EXPORT C(Property) * PROPERTY(Array, minAllocSize);
LIB_EXPORT void (* Array_set_minAllocSize)(C(Array) a, uint value);
LIB_EXPORT uint (* Array_get_minAllocSize)(C(Array) a);

LIB_EXPORT C(Property) * PROPERTY(BuiltInContainer, Container);
LIB_EXPORT C(Container) (* BuiltInContainer_to_Container)(C(BuiltInContainer) * b);

LIB_EXPORT C(Property) * PROPERTY(Class, char_ptr);
LIB_EXPORT void (* Class_from_char_ptr)(C(Class) * c, const char * value);
LIB_EXPORT const char * (* Class_to_char_ptr)(C(Class) * c);

LIB_EXPORT C(Property) * PROPERTY(Container, copySrc);
LIB_EXPORT void (* Container_set_copySrc)(C(Container) c, C(Container) value);

LIB_EXPORT C(Property) * PROPERTY(Container, firstIterator);
LIB_EXPORT void (* Container_get_firstIterator)(C(Container) c, C(Iterator) * value);

LIB_EXPORT C(Property) * PROPERTY(Container, lastIterator);
LIB_EXPORT void (* Container_get_lastIterator)(C(Container) c, C(Iterator) * value);

LIB_EXPORT C(Property) * PROPERTY(DesignerBase, classDesigner);
LIB_EXPORT void (* DesignerBase_set_classDesigner)(C(DesignerBase) d, C(ClassDesignerBase) value);
LIB_EXPORT C(ClassDesignerBase) (* DesignerBase_get_classDesigner)(C(DesignerBase) d);

LIB_EXPORT C(Property) * PROPERTY(DesignerBase, objectClass);
LIB_EXPORT void (* DesignerBase_set_objectClass)(C(DesignerBase) d, const char * value);
LIB_EXPORT const char * (* DesignerBase_get_objectClass)(C(DesignerBase) d);

LIB_EXPORT C(Property) * PROPERTY(DesignerBase, isDragging);
LIB_EXPORT void (* DesignerBase_set_isDragging)(C(DesignerBase) d, C(bool) value);
LIB_EXPORT C(bool) (* DesignerBase_get_isDragging)(C(DesignerBase) d);

LIB_EXPORT C(Property) * PROPERTY(Iterator, data);
LIB_EXPORT void (* Iterator_set_data)(C(Iterator) * i, TP(Iterator, T) value);
LIB_EXPORT TP(Iterator, T) (* Iterator_get_data)(C(Iterator) * i);

LIB_EXPORT C(Property) * PROPERTY(Map, mapSrc);
LIB_EXPORT void (* Map_set_mapSrc)(C(Map) m, C(Map) value);

LIB_EXPORT C(Property) * PROPERTY(MapIterator, map);
LIB_EXPORT void (* MapIterator_set_map)(C(MapIterator) * m, C(Map) value);
LIB_EXPORT C(Map) (* MapIterator_get_map)(C(MapIterator) * m);

LIB_EXPORT C(Property) * PROPERTY(MapIterator, key);
LIB_EXPORT TP(MapIterator, KT) (* MapIterator_get_key)(C(MapIterator) * m);

LIB_EXPORT C(Property) * PROPERTY(MapIterator, value);
LIB_EXPORT void (* MapIterator_set_value)(C(MapIterator) * m, TP(MapIterator, V) value);
LIB_EXPORT TP(MapIterator, V) (* MapIterator_get_value)(C(MapIterator) * m);

LIB_EXPORT C(Property) * PROPERTY(MapNode, key);
LIB_EXPORT void (* MapNode_set_key)(C(MapNode) * m, TP(MapNode, KT) value);
LIB_EXPORT TP(MapNode, KT) (* MapNode_get_key)(C(MapNode) * m);

LIB_EXPORT C(Property) * PROPERTY(MapNode, value);
LIB_EXPORT void (* MapNode_set_value)(C(MapNode) * m, TP(MapNode, V) value);
LIB_EXPORT TP(MapNode, V) (* MapNode_get_value)(C(MapNode) * m);

LIB_EXPORT C(Property) * PROPERTY(MapNode, prev);
LIB_EXPORT thisclass(MapNode *) (* MapNode_get_prev)(C(MapNode) * m);

LIB_EXPORT C(Property) * PROPERTY(MapNode, next);
LIB_EXPORT thisclass(MapNode *) (* MapNode_get_next)(C(MapNode) * m);

LIB_EXPORT C(Property) * PROPERTY(MapNode, minimum);
LIB_EXPORT thisclass(MapNode *) (* MapNode_get_minimum)(C(MapNode) * m);

LIB_EXPORT C(Property) * PROPERTY(MapNode, maximum);
LIB_EXPORT thisclass(MapNode *) (* MapNode_get_maximum)(C(MapNode) * m);

LIB_EXPORT C(Property) * PROPERTY(Platform, char_ptr);
LIB_EXPORT C(Platform) (* Platform_from_char_ptr)(char * c);
LIB_EXPORT const char * (* Platform_to_char_ptr)(C(Platform) platform);

LIB_EXPORT C(Property) * PROPERTY(SerialBuffer, buffer);
LIB_EXPORT void (* SerialBuffer_set_buffer)(C(SerialBuffer) s, byte * value);
LIB_EXPORT byte * (* SerialBuffer_get_buffer)(C(SerialBuffer) s);

LIB_EXPORT C(Property) * PROPERTY(SerialBuffer, size);
LIB_EXPORT void (* SerialBuffer_set_size)(C(SerialBuffer) s, uint value);
LIB_EXPORT uint (* SerialBuffer_get_size)(C(SerialBuffer) s);

LIB_EXPORT C(Property) * PROPERTY(BTNode, prev);
LIB_EXPORT C(BTNode) * (* BTNode_get_prev)(C(BTNode) * b);

LIB_EXPORT C(Property) * PROPERTY(BTNode, next);
LIB_EXPORT C(BTNode) * (* BTNode_get_next)(C(BTNode) * b);

LIB_EXPORT C(Property) * PROPERTY(BTNode, minimum);
LIB_EXPORT C(BTNode) * (* BTNode_get_minimum)(C(BTNode) * b);

LIB_EXPORT C(Property) * PROPERTY(BTNode, maximum);
LIB_EXPORT C(BTNode) * (* BTNode_get_maximum)(C(BTNode) * b);

LIB_EXPORT C(Property) * PROPERTY(BTNode, count);
LIB_EXPORT int (* BTNode_get_count)(C(BTNode) * b);

LIB_EXPORT C(Property) * PROPERTY(BTNode, depthProp);
LIB_EXPORT int (* BTNode_get_depthProp)(C(BTNode) * b);

LIB_EXPORT C(Property) * PROPERTY(BinaryTree, first);
LIB_EXPORT C(BTNode) * (* BinaryTree_get_first)(C(BinaryTree) * b);

LIB_EXPORT C(Property) * PROPERTY(BinaryTree, last);
LIB_EXPORT C(BTNode) * (* BinaryTree_get_last)(C(BinaryTree) * b);

LIB_EXPORT C(Property) * PROPERTY(Mutex, lockCount);
LIB_EXPORT int (* Mutex_get_lockCount)(C(Mutex) * m);

LIB_EXPORT C(Property) * PROPERTY(Mutex, owningThread);
LIB_EXPORT int64 (* Mutex_get_owningThread)(C(Mutex) * m);

LIB_EXPORT C(Property) * PROPERTY(ZString, string);
LIB_EXPORT void (* ZString_set_string)(C(ZString) z, char * value);
LIB_EXPORT char * (* ZString_get_string)(C(ZString) z);

LIB_EXPORT C(Property) * PROPERTY(ZString, char_ptr);
LIB_EXPORT C(ZString) (* ZString_from_char_ptr)(char * c);
LIB_EXPORT const char * (* ZString_to_char_ptr)(C(ZString) z);


// Properties




// Classes

// bitClass
// enumClass
// LIB_EXPORT C(Class) * CO(bool);
LIB_EXPORT C(Class) * CO(AccessMode);
LIB_EXPORT C(Class) * CO(ClassType);
LIB_EXPORT C(Class) * CO(DataMemberType);
LIB_EXPORT C(Class) * CO(ImportType);
LIB_EXPORT C(Class) * CO(MethodType);
LIB_EXPORT C(Class) * CO(Platform);
LIB_EXPORT C(Class) * CO(TemplateMemberType);
LIB_EXPORT C(Class) * CO(TemplateParameterType);
LIB_EXPORT C(Class) * CO(BackSlashEscaping);
LIB_EXPORT C(Class) * CO(StringAllocType);
LIB_EXPORT C(Class) * CO(TreePrintStyle);
// unitClass
LIB_EXPORT C(Class) * CO(unichar);
LIB_EXPORT C(Class) * CO(Angle);
// systemClass
LIB_EXPORT C(Class) * CO(byte);
LIB_EXPORT C(Class) * CO(char);
LIB_EXPORT C(Class) * CO(class);
LIB_EXPORT C(Class) * CO(double);
LIB_EXPORT C(Class) * CO(enum);
LIB_EXPORT C(Class) * CO(float);
LIB_EXPORT C(Class) * CO(int);
LIB_EXPORT C(Class) * CO(int64);
LIB_EXPORT C(Class) * CO(intptr);
LIB_EXPORT C(Class) * CO(intsize);
LIB_EXPORT C(Class) * CO(short);
LIB_EXPORT C(Class) * CO(struct);
LIB_EXPORT C(Class) * CO(uint);
LIB_EXPORT C(Class) * CO(uint16);
LIB_EXPORT C(Class) * CO(uint32);
LIB_EXPORT C(Class) * CO(uint64);
LIB_EXPORT C(Class) * CO(uintptr);
LIB_EXPORT C(Class) * CO(uintsize);
// structClass
LIB_EXPORT C(Class) * CO(BuiltInContainer);
LIB_EXPORT C(Class) * CO(ClassTemplateArgument);
LIB_EXPORT C(Class) * CO(DataValue);
LIB_EXPORT C(Class) * CO(Iterator);
LIB_EXPORT C(Class) * CO(LinkElement);
LIB_EXPORT C(Class) * CO(MapIterator);
LIB_EXPORT C(Class) * CO(NameSpace);
LIB_EXPORT C(Class) * CO(StaticString);
LIB_EXPORT C(Class) * CO(BinaryTree);
LIB_EXPORT C(Class) * CO(OldList);
LIB_EXPORT C(Class) * CO(StringBinaryTree);
// noHeadClass
LIB_EXPORT C(Class) * CO(AVLNode);
LIB_EXPORT C(Class) * CO(BTNamedLink);
LIB_EXPORT C(Class) * CO(BitMember);
LIB_EXPORT C(Class) * CO(Class);
LIB_EXPORT C(Class) * CO(ClassProperty);
LIB_EXPORT C(Class) * CO(ClassTemplateParameter);
LIB_EXPORT C(Class) * CO(DataMember);
LIB_EXPORT C(Class) * CO(DefinedExpression);
LIB_EXPORT C(Class) * CO(EnumClassData);
LIB_EXPORT C(Class) * CO(GlobalFunction);
LIB_EXPORT C(Class) * CO(IteratorPointer);
LIB_EXPORT C(Class) * CO(Link);
LIB_EXPORT C(Class) * CO(ListItem);
LIB_EXPORT C(Class) * CO(MapNode);
LIB_EXPORT C(Class) * CO(Method);
LIB_EXPORT C(Class) * CO(ObjectInfo);
LIB_EXPORT C(Class) * CO(Property);
LIB_EXPORT C(Class) * CO(SubModule);
LIB_EXPORT C(Class) * CO(BTNode);
LIB_EXPORT C(Class) * CO(Item);
LIB_EXPORT C(Class) * CO(Mutex);
LIB_EXPORT C(Class) * CO(NamedItem);
LIB_EXPORT C(Class) * CO(NamedLink);
LIB_EXPORT C(Class) * CO(NamedLink64);
LIB_EXPORT C(Class) * CO(OldLink);
LIB_EXPORT C(Class) * CO(StringBTNode);
// normalClass
LIB_EXPORT C(Class) * CO(String);
LIB_EXPORT C(Class) * CO(AVLTree);
LIB_EXPORT C(Class) * CO(Application);
LIB_EXPORT C(Class) * CO(Array);
LIB_EXPORT C(Class) * CO(CIString);
LIB_EXPORT C(Class) * CO(ClassDesignerBase);
LIB_EXPORT C(Class) * CO(Container);
LIB_EXPORT C(Class) * CO(CustomAVLTree);
LIB_EXPORT C(Class) * CO(DesignerBase);
LIB_EXPORT C(Class) * CO(IOChannel);
LIB_EXPORT C(Class) * CO(Instance);
LIB_EXPORT C(Class) * CO(LinkList);
LIB_EXPORT C(Class) * CO(List);
LIB_EXPORT C(Class) * CO(Map);
LIB_EXPORT C(Class) * CO(Module);
LIB_EXPORT C(Class) * CO(SerialBuffer);
LIB_EXPORT C(Class) * CO(Window);
LIB_EXPORT C(Class) * CO(ZString);



// Virtual Method IDs

LIB_EXPORT int M_VTBLID(class, onCompare);
LIB_EXPORT int M_VTBLID(class, onCopy);
LIB_EXPORT int M_VTBLID(class, onDisplay);
LIB_EXPORT int M_VTBLID(class, onEdit);
LIB_EXPORT int M_VTBLID(class, onFree);
LIB_EXPORT int M_VTBLID(class, onGetDataFromString);
LIB_EXPORT int M_VTBLID(class, onGetString);
LIB_EXPORT int M_VTBLID(class, onSaveEdit);
LIB_EXPORT int M_VTBLID(class, onSerialize);
LIB_EXPORT int M_VTBLID(class, onUnserialize);

LIB_EXPORT int M_VTBLID(Application, main);

LIB_EXPORT int M_VTBLID(BuiltInContainer, add);
LIB_EXPORT int M_VTBLID(BuiltInContainer, copy);
LIB_EXPORT int M_VTBLID(BuiltInContainer, delete);
LIB_EXPORT int M_VTBLID(BuiltInContainer, find);
LIB_EXPORT int M_VTBLID(BuiltInContainer, free);
LIB_EXPORT int M_VTBLID(BuiltInContainer, freeIterator);
LIB_EXPORT int M_VTBLID(BuiltInContainer, getAtPosition);
LIB_EXPORT int M_VTBLID(BuiltInContainer, getCount);
LIB_EXPORT int M_VTBLID(BuiltInContainer, getData);
LIB_EXPORT int M_VTBLID(BuiltInContainer, getFirst);
LIB_EXPORT int M_VTBLID(BuiltInContainer, getLast);
LIB_EXPORT int M_VTBLID(BuiltInContainer, getNext);
LIB_EXPORT int M_VTBLID(BuiltInContainer, getPrev);
LIB_EXPORT int M_VTBLID(BuiltInContainer, insert);
LIB_EXPORT int M_VTBLID(BuiltInContainer, move);
LIB_EXPORT int M_VTBLID(BuiltInContainer, remove);
LIB_EXPORT int M_VTBLID(BuiltInContainer, removeAll);
LIB_EXPORT int M_VTBLID(BuiltInContainer, setData);
LIB_EXPORT int M_VTBLID(BuiltInContainer, sort);

LIB_EXPORT int M_VTBLID(ClassDesignerBase, addObject);
LIB_EXPORT int M_VTBLID(ClassDesignerBase, createNew);
LIB_EXPORT int M_VTBLID(ClassDesignerBase, createObject);
LIB_EXPORT int M_VTBLID(ClassDesignerBase, destroyObject);
LIB_EXPORT int M_VTBLID(ClassDesignerBase, droppedObject);
LIB_EXPORT int M_VTBLID(ClassDesignerBase, fixProperty);
LIB_EXPORT int M_VTBLID(ClassDesignerBase, listToolBoxClasses);
LIB_EXPORT int M_VTBLID(ClassDesignerBase, postCreateObject);
LIB_EXPORT int M_VTBLID(ClassDesignerBase, prepareTestObject);
LIB_EXPORT int M_VTBLID(ClassDesignerBase, reset);
LIB_EXPORT int M_VTBLID(ClassDesignerBase, selectObject);

LIB_EXPORT int M_VTBLID(Container, add);
LIB_EXPORT int M_VTBLID(Container, copy);
LIB_EXPORT int M_VTBLID(Container, delete);
LIB_EXPORT int M_VTBLID(Container, find);
LIB_EXPORT int M_VTBLID(Container, free);
LIB_EXPORT int M_VTBLID(Container, freeIterator);
LIB_EXPORT int M_VTBLID(Container, getAtPosition);
LIB_EXPORT int M_VTBLID(Container, getCount);
LIB_EXPORT int M_VTBLID(Container, getData);
LIB_EXPORT int M_VTBLID(Container, getFirst);
LIB_EXPORT int M_VTBLID(Container, getLast);
LIB_EXPORT int M_VTBLID(Container, getNext);
LIB_EXPORT int M_VTBLID(Container, getPrev);
LIB_EXPORT int M_VTBLID(Container, insert);
LIB_EXPORT int M_VTBLID(Container, move);
LIB_EXPORT int M_VTBLID(Container, remove);
LIB_EXPORT int M_VTBLID(Container, removeAll);
LIB_EXPORT int M_VTBLID(Container, setData);
LIB_EXPORT int M_VTBLID(Container, sort);

LIB_EXPORT int M_VTBLID(DesignerBase, addDefaultMethod);
LIB_EXPORT int M_VTBLID(DesignerBase, addToolBoxClass);
LIB_EXPORT int M_VTBLID(DesignerBase, codeAddObject);
LIB_EXPORT int M_VTBLID(DesignerBase, deleteObject);
LIB_EXPORT int M_VTBLID(DesignerBase, findObject);
LIB_EXPORT int M_VTBLID(DesignerBase, modifyCode);
LIB_EXPORT int M_VTBLID(DesignerBase, objectContainsCode);
LIB_EXPORT int M_VTBLID(DesignerBase, renameObject);
LIB_EXPORT int M_VTBLID(DesignerBase, selectObjectFromDesigner);
LIB_EXPORT int M_VTBLID(DesignerBase, sheetAddObject);
LIB_EXPORT int M_VTBLID(DesignerBase, updateProperties);

LIB_EXPORT int M_VTBLID(IOChannel, readData);
LIB_EXPORT int M_VTBLID(IOChannel, writeData);

LIB_EXPORT int M_VTBLID(Module, onLoad);
LIB_EXPORT int M_VTBLID(Module, onUnload);




// Global Functions

LIB_EXPORT void (* checkConsistency)(void);
LIB_EXPORT void (* checkMemory)(void);
LIB_EXPORT C(DesignerBase) (* getActiveDesigner)(void);
LIB_EXPORT C(Platform) (* getRuntimePlatform)(void);
LIB_EXPORT C(bool) (* locateModule)(const char * name, const char * fileName);
LIB_EXPORT void (* print)(const C(Class) * class_object, const void * object, ...);
LIB_EXPORT int (* printBuf)(char * buffer, int maxLen, const C(Class) * class_object, const void * object, ...);
LIB_EXPORT void (* printLn)(const C(Class) * class_object, const void * object, ...);
LIB_EXPORT int (* printLnBuf)(char * buffer, int maxLen, const C(Class) * class_object, const void * object, ...);
LIB_EXPORT char * (* printLnString)(const C(Class) * class_object, const void * object, ...);
LIB_EXPORT int (* printStdArgsToBuffer)(char * buffer, int maxLen, const C(Class) * class_object, const void * object, va_list args);
LIB_EXPORT char * (* printString)(const C(Class) * class_object, const void * object, ...);
LIB_EXPORT void (* setActiveDesigner)(C(DesignerBase) designer);
LIB_EXPORT uint (* log2i)(uint number);
LIB_EXPORT void (* memswap)(byte * a, byte * b, uint size);
LIB_EXPORT uint (* pow2i)(uint number);
LIB_EXPORT void (* qsortr)(void * base, uintsize nel, uintsize width, int (* compare)(void * arg, const void * a, const void * b), void * arg);
LIB_EXPORT void (* qsortrx)(void * base, uintsize nel, uintsize width, int (* compare)(void * arg, const void * a, const void * b), int (* optCompareArgLast)(const void * a, const void * b, void * arg), void * arg, C(bool) deref, C(bool) ascending);
LIB_EXPORT void (* queryMemInfo)(char * string);
LIB_EXPORT void (* changeCh)(char * string, char ch1, char ch2);
LIB_EXPORT void (* changeChars)(char * string, const char * chars, char alt);
LIB_EXPORT char * (* changeExtension)(const char * string, const char * ext, char * output);
LIB_EXPORT char * (* copyString)(const char * string);
LIB_EXPORT double (* floatFromString)(const char * string);
LIB_EXPORT int64 (* getCurrentThreadID)(void);
LIB_EXPORT char * (* getExtension)(const char * string, char * output);
LIB_EXPORT uint (* getHexValue)(char ** buffer);
LIB_EXPORT char * (* getLastDirectory)(const char * string, char * output);
LIB_EXPORT C(bool) (* getString)(char ** buffer, char * string, int max);
LIB_EXPORT int (* getValue)(char ** buffer);
LIB_EXPORT int (* iSO8859_1toUTF8)(const char * source, char * dest, int max);
LIB_EXPORT C(bool) (* isPathInsideOf)(const char * path, const char * of);
LIB_EXPORT char * (* makePathRelative)(const char * path, const char * to, char * destination);
LIB_EXPORT char * (* pathCat)(char * string, const char * addedPath);
LIB_EXPORT char * (* pathCatSlash)(char * string, const char * addedPath);
LIB_EXPORT void (* printBigSize)(char * string, double size, int prec);
LIB_EXPORT void (* printSize)(char * string, uint size, int prec);
LIB_EXPORT char * (* rSearchString)(const char * buffer, const char * subStr, int maxLen, C(bool) matchCase, C(bool) matchWord);
LIB_EXPORT void (* repeatCh)(char * string, int count, char ch);
LIB_EXPORT char * (* searchString)(const char * buffer, int start, const char * subStr, C(bool) matchCase, C(bool) matchWord);
LIB_EXPORT C(bool) (* splitArchivePath)(const char * fileName, char * archiveName, const char ** archiveFile);
LIB_EXPORT char * (* splitDirectory)(const char * string, char * part, char * rest);
LIB_EXPORT C(bool) (* stripExtension)(char * string);
LIB_EXPORT char * (* stripLastDirectory)(const char * string, char * output);
LIB_EXPORT char * (* stripQuotes)(const char * string, char * output);
LIB_EXPORT int (* tokenize)(char * string, int maxTokens, char * tokens[], C(BackSlashEscaping) esc);
LIB_EXPORT int (* tokenizeWith)(char * string, int maxTokens, char * tokens[], const char * tokenizers, C(bool) escapeBackSlashes);
LIB_EXPORT char * (* trimLSpaces)(const char * string, char * output);
LIB_EXPORT char * (* trimRSpaces)(const char * string, char * output);
LIB_EXPORT char * (* uTF16toUTF8)(const uint16 * source);
LIB_EXPORT int (* uTF16toUTF8Buffer)(const uint16 * source, char * dest, int max);
LIB_EXPORT int (* uTF32toUTF8Len)(unichar * source, int count, char * dest, int max);
LIB_EXPORT unichar (* uTF8GetChar)(const char * string, int * numBytes);
LIB_EXPORT C(bool) (* uTF8Validate)(const char * source);
LIB_EXPORT uint16 * (* uTF8toUTF16)(const char * source, int * wordCount);
LIB_EXPORT int (* uTF8toUTF16Buffer)(const char * source, uint16 * dest, int max);


LIB_EXPORT C(Application) eC_init(bool loadEcere, bool guiApp, int argc, char * argv[])
{
   Module fromModule = eC_initApp(guiApp, argc, argv);
   if(fromModule) fromModule->_refCount++;
   __thisModule = fromModule;
   if(fromModule)
   {
      C(Module) app = fromModule;
      C(Module) module = Module_load(fromModule, loadEcere ? "ecere" : "ecereCOM", AccessMode_publicAccess);
      if(module)
      {
         // Set up all the CO(x) *, property, method, ...


         CO(String) = eC_findClass(app, "String");
         if(CO(String))
         {
         }
         CO(char) = eC_findClass(app, "char");
         CO(class) = eC_findClass(app, "class");
         if(CO(class))
         {
            METHOD(class, onCompare) = Class_findMethod(CO(class), "OnCompare", app);
            if(METHOD(class, onCompare))
               M_VTBLID(class, onCompare) = METHOD(class, onCompare)->vid;

            METHOD(class, onCopy) = Class_findMethod(CO(class), "OnCopy", app);
            if(METHOD(class, onCopy))
               M_VTBLID(class, onCopy) = METHOD(class, onCopy)->vid;

            METHOD(class, onDisplay) = Class_findMethod(CO(class), "OnDisplay", app);
            if(METHOD(class, onDisplay))
               M_VTBLID(class, onDisplay) = METHOD(class, onDisplay)->vid;

            METHOD(class, onEdit) = Class_findMethod(CO(class), "OnEdit", app);
            if(METHOD(class, onEdit))
               M_VTBLID(class, onEdit) = METHOD(class, onEdit)->vid;

            METHOD(class, onFree) = Class_findMethod(CO(class), "OnFree", app);
            if(METHOD(class, onFree))
               M_VTBLID(class, onFree) = METHOD(class, onFree)->vid;

            METHOD(class, onGetDataFromString) = Class_findMethod(CO(class), "OnGetDataFromString", app);
            if(METHOD(class, onGetDataFromString))
               M_VTBLID(class, onGetDataFromString) = METHOD(class, onGetDataFromString)->vid;

            METHOD(class, onGetString) = Class_findMethod(CO(class), "OnGetString", app);
            if(METHOD(class, onGetString))
               M_VTBLID(class, onGetString) = METHOD(class, onGetString)->vid;

            METHOD(class, onSaveEdit) = Class_findMethod(CO(class), "OnSaveEdit", app);
            if(METHOD(class, onSaveEdit))
               M_VTBLID(class, onSaveEdit) = METHOD(class, onSaveEdit)->vid;

            METHOD(class, onSerialize) = Class_findMethod(CO(class), "OnSerialize", app);
            if(METHOD(class, onSerialize))
               M_VTBLID(class, onSerialize) = METHOD(class, onSerialize)->vid;

            METHOD(class, onUnserialize) = Class_findMethod(CO(class), "OnUnserialize", app);
            if(METHOD(class, onUnserialize))
               M_VTBLID(class, onUnserialize) = METHOD(class, onUnserialize)->vid;
         }
         CO(double) = eC_findClass(app, "double");
         if(CO(double))
         {
            METHOD(double, inf) = Class_findMethod(CO(double), "inf", app);
            if(METHOD(double, inf))
               double_inf = (double (*)(void))METHOD(double, inf)->function;

            METHOD(double, nan) = Class_findMethod(CO(double), "nan", app);
            if(METHOD(double, nan))
               double_nan = (double (*)(void))METHOD(double, nan)->function;

            PROPERTY(double, isNan) = Class_findProperty(CO(double), "isNan", app);
            if(PROPERTY(double, isNan))
               double_get_isNan = (void *)PROPERTY(double, isNan)->Get;

            PROPERTY(double, isInf) = Class_findProperty(CO(double), "isInf", app);
            if(PROPERTY(double, isInf))
               double_get_isInf = (void *)PROPERTY(double, isInf)->Get;

            PROPERTY(double, signBit) = Class_findProperty(CO(double), "signBit", app);
            if(PROPERTY(double, signBit))
               double_get_signBit = (void *)PROPERTY(double, signBit)->Get;
         }
         CO(enum) = eC_findClass(app, "enum");
         CO(float) = eC_findClass(app, "float");
         if(CO(float))
         {
            METHOD(float, inf) = Class_findMethod(CO(float), "inf", app);
            if(METHOD(float, inf))
               float_inf = (float (*)(void))METHOD(float, inf)->function;

            METHOD(float, nan) = Class_findMethod(CO(float), "nan", app);
            if(METHOD(float, nan))
               float_nan = (float (*)(void))METHOD(float, nan)->function;

            PROPERTY(float, isNan) = Class_findProperty(CO(float), "isNan", app);
            if(PROPERTY(float, isNan))
               float_get_isNan = (void *)PROPERTY(float, isNan)->Get;

            PROPERTY(float, isInf) = Class_findProperty(CO(float), "isInf", app);
            if(PROPERTY(float, isInf))
               float_get_isInf = (void *)PROPERTY(float, isInf)->Get;

            PROPERTY(float, signBit) = Class_findProperty(CO(float), "signBit", app);
            if(PROPERTY(float, signBit))
               float_get_signBit = (void *)PROPERTY(float, signBit)->Get;
         }
         CO(int) = eC_findClass(app, "int");
         CO(int64) = eC_findClass(app, "int64");
         CO(intptr) = eC_findClass(app, "intptr");
         CO(intsize) = eC_findClass(app, "intsize");
         CO(short) = eC_findClass(app, "short");
         CO(struct) = eC_findClass(app, "struct");
         CO(uint) = eC_findClass(app, "uint");
         CO(uint16) = eC_findClass(app, "uint16");
         CO(uint32) = eC_findClass(app, "uint32");
         CO(uint64) = eC_findClass(app, "uint64");
         CO(uintptr) = eC_findClass(app, "uintptr");
         CO(uintsize) = eC_findClass(app, "uintsize");
         CO(unichar) = eC_findClass(app, "unichar");
         CO(AVLNode) = eC_findClass(app, "AVLNode");
         if(CO(AVLNode))
         {
            METHOD(AVLNode, find) = Class_findMethod(CO(AVLNode), "Find", app);
            if(METHOD(AVLNode, find))
               AVLNode_find = (thisclass(AVLNode *) (*)(C(AVLNode) *, C(Class) *, TP(AVLNode, T)))METHOD(AVLNode, find)->function;

            PROPERTY(AVLNode, prev) = Class_findProperty(CO(AVLNode), "prev", app);
            if(PROPERTY(AVLNode, prev))
               AVLNode_get_prev = (void *)PROPERTY(AVLNode, prev)->Get;

            PROPERTY(AVLNode, next) = Class_findProperty(CO(AVLNode), "next", app);
            if(PROPERTY(AVLNode, next))
               AVLNode_get_next = (void *)PROPERTY(AVLNode, next)->Get;

            PROPERTY(AVLNode, minimum) = Class_findProperty(CO(AVLNode), "minimum", app);
            if(PROPERTY(AVLNode, minimum))
               AVLNode_get_minimum = (void *)PROPERTY(AVLNode, minimum)->Get;

            PROPERTY(AVLNode, maximum) = Class_findProperty(CO(AVLNode), "maximum", app);
            if(PROPERTY(AVLNode, maximum))
               AVLNode_get_maximum = (void *)PROPERTY(AVLNode, maximum)->Get;

            PROPERTY(AVLNode, count) = Class_findProperty(CO(AVLNode), "count", app);
            if(PROPERTY(AVLNode, count))
               AVLNode_get_count = (void *)PROPERTY(AVLNode, count)->Get;

            PROPERTY(AVLNode, depthProp) = Class_findProperty(CO(AVLNode), "depthProp", app);
            if(PROPERTY(AVLNode, depthProp))
               AVLNode_get_depthProp = (void *)PROPERTY(AVLNode, depthProp)->Get;
         }
         CO(AVLTree) = eC_findClass(app, "AVLTree");
         CO(AccessMode) = eC_findClass(app, "AccessMode");
         CO(Angle) = eC_findClass(app, "Angle");
         CO(Application) = eC_findClass(app, "Application");
         if(CO(Application))
         {
            METHOD(Application, main) = Class_findMethod(CO(Application), "Main", app);
            if(METHOD(Application, main))
               M_VTBLID(Application, main) = METHOD(Application, main)->vid;
         }
         CO(Array) = eC_findClass(app, "Array");
         if(CO(Array))
         {
            PROPERTY(Array, size) = Class_findProperty(CO(Array), "size", app);
            if(PROPERTY(Array, size))
            {
               Array_set_size = (void *)PROPERTY(Array, size)->Set;
               Array_get_size = (void *)PROPERTY(Array, size)->Get;
            }

            PROPERTY(Array, minAllocSize) = Class_findProperty(CO(Array), "minAllocSize", app);
            if(PROPERTY(Array, minAllocSize))
            {
               Array_set_minAllocSize = (void *)PROPERTY(Array, minAllocSize)->Set;
               Array_get_minAllocSize = (void *)PROPERTY(Array, minAllocSize)->Get;
            }
         }
         CO(BTNamedLink) = eC_findClass(app, "BTNamedLink");
         CO(BitMember) = eC_findClass(app, "BitMember");
         CO(BuiltInContainer) = eC_findClass(app, "BuiltInContainer");
         if(CO(BuiltInContainer))
         {
            METHOD(BuiltInContainer, add) = Class_findMethod(CO(BuiltInContainer), "Add", app);
            if(METHOD(BuiltInContainer, add))
               M_VTBLID(BuiltInContainer, add) = METHOD(BuiltInContainer, add)->vid;

            METHOD(BuiltInContainer, copy) = Class_findMethod(CO(BuiltInContainer), "Copy", app);
            if(METHOD(BuiltInContainer, copy))
               M_VTBLID(BuiltInContainer, copy) = METHOD(BuiltInContainer, copy)->vid;

            METHOD(BuiltInContainer, delete) = Class_findMethod(CO(BuiltInContainer), "Delete", app);
            if(METHOD(BuiltInContainer, delete))
               M_VTBLID(BuiltInContainer, delete) = METHOD(BuiltInContainer, delete)->vid;

            METHOD(BuiltInContainer, find) = Class_findMethod(CO(BuiltInContainer), "Find", app);
            if(METHOD(BuiltInContainer, find))
               M_VTBLID(BuiltInContainer, find) = METHOD(BuiltInContainer, find)->vid;

            METHOD(BuiltInContainer, free) = Class_findMethod(CO(BuiltInContainer), "Free", app);
            if(METHOD(BuiltInContainer, free))
               M_VTBLID(BuiltInContainer, free) = METHOD(BuiltInContainer, free)->vid;

            METHOD(BuiltInContainer, freeIterator) = Class_findMethod(CO(BuiltInContainer), "FreeIterator", app);
            if(METHOD(BuiltInContainer, freeIterator))
               M_VTBLID(BuiltInContainer, freeIterator) = METHOD(BuiltInContainer, freeIterator)->vid;

            METHOD(BuiltInContainer, getAtPosition) = Class_findMethod(CO(BuiltInContainer), "GetAtPosition", app);
            if(METHOD(BuiltInContainer, getAtPosition))
               M_VTBLID(BuiltInContainer, getAtPosition) = METHOD(BuiltInContainer, getAtPosition)->vid;

            METHOD(BuiltInContainer, getCount) = Class_findMethod(CO(BuiltInContainer), "GetCount", app);
            if(METHOD(BuiltInContainer, getCount))
               M_VTBLID(BuiltInContainer, getCount) = METHOD(BuiltInContainer, getCount)->vid;

            METHOD(BuiltInContainer, getData) = Class_findMethod(CO(BuiltInContainer), "GetData", app);
            if(METHOD(BuiltInContainer, getData))
               M_VTBLID(BuiltInContainer, getData) = METHOD(BuiltInContainer, getData)->vid;

            METHOD(BuiltInContainer, getFirst) = Class_findMethod(CO(BuiltInContainer), "GetFirst", app);
            if(METHOD(BuiltInContainer, getFirst))
               M_VTBLID(BuiltInContainer, getFirst) = METHOD(BuiltInContainer, getFirst)->vid;

            METHOD(BuiltInContainer, getLast) = Class_findMethod(CO(BuiltInContainer), "GetLast", app);
            if(METHOD(BuiltInContainer, getLast))
               M_VTBLID(BuiltInContainer, getLast) = METHOD(BuiltInContainer, getLast)->vid;

            METHOD(BuiltInContainer, getNext) = Class_findMethod(CO(BuiltInContainer), "GetNext", app);
            if(METHOD(BuiltInContainer, getNext))
               M_VTBLID(BuiltInContainer, getNext) = METHOD(BuiltInContainer, getNext)->vid;

            METHOD(BuiltInContainer, getPrev) = Class_findMethod(CO(BuiltInContainer), "GetPrev", app);
            if(METHOD(BuiltInContainer, getPrev))
               M_VTBLID(BuiltInContainer, getPrev) = METHOD(BuiltInContainer, getPrev)->vid;

            METHOD(BuiltInContainer, insert) = Class_findMethod(CO(BuiltInContainer), "Insert", app);
            if(METHOD(BuiltInContainer, insert))
               M_VTBLID(BuiltInContainer, insert) = METHOD(BuiltInContainer, insert)->vid;

            METHOD(BuiltInContainer, move) = Class_findMethod(CO(BuiltInContainer), "Move", app);
            if(METHOD(BuiltInContainer, move))
               M_VTBLID(BuiltInContainer, move) = METHOD(BuiltInContainer, move)->vid;

            METHOD(BuiltInContainer, remove) = Class_findMethod(CO(BuiltInContainer), "Remove", app);
            if(METHOD(BuiltInContainer, remove))
               M_VTBLID(BuiltInContainer, remove) = METHOD(BuiltInContainer, remove)->vid;

            METHOD(BuiltInContainer, removeAll) = Class_findMethod(CO(BuiltInContainer), "RemoveAll", app);
            if(METHOD(BuiltInContainer, removeAll))
               M_VTBLID(BuiltInContainer, removeAll) = METHOD(BuiltInContainer, removeAll)->vid;

            METHOD(BuiltInContainer, setData) = Class_findMethod(CO(BuiltInContainer), "SetData", app);
            if(METHOD(BuiltInContainer, setData))
               M_VTBLID(BuiltInContainer, setData) = METHOD(BuiltInContainer, setData)->vid;

            METHOD(BuiltInContainer, sort) = Class_findMethod(CO(BuiltInContainer), "Sort", app);
            if(METHOD(BuiltInContainer, sort))
               M_VTBLID(BuiltInContainer, sort) = METHOD(BuiltInContainer, sort)->vid;

            PROPERTY(BuiltInContainer, Container) = Class_findProperty(CO(BuiltInContainer), "ecere::com::Container", app);
            if(PROPERTY(BuiltInContainer, Container))
               BuiltInContainer_to_Container = (void *)PROPERTY(BuiltInContainer, Container)->Get;
         }
         CO(CIString) = eC_findClass(app, "CIString");
         CO(Class) = eC_findClass(app, "Class");
         if(CO(Class))
         {
            PROPERTY(Class, char_ptr) = Class_findProperty(CO(Class), "char *", app);
            if(PROPERTY(Class, char_ptr))
            {
               Class_from_char_ptr = (void *)PROPERTY(Class, char_ptr)->Set;
               Class_to_char_ptr = (void *)PROPERTY(Class, char_ptr)->Get;
            }
         }
         CO(ClassDesignerBase) = eC_findClass(app, "ClassDesignerBase");
         if(CO(ClassDesignerBase))
         {
            METHOD(ClassDesignerBase, addObject) = Class_findMethod(CO(ClassDesignerBase), "AddObject", app);
            if(METHOD(ClassDesignerBase, addObject))
               M_VTBLID(ClassDesignerBase, addObject) = METHOD(ClassDesignerBase, addObject)->vid;

            METHOD(ClassDesignerBase, createNew) = Class_findMethod(CO(ClassDesignerBase), "CreateNew", app);
            if(METHOD(ClassDesignerBase, createNew))
               M_VTBLID(ClassDesignerBase, createNew) = METHOD(ClassDesignerBase, createNew)->vid;

            METHOD(ClassDesignerBase, createObject) = Class_findMethod(CO(ClassDesignerBase), "CreateObject", app);
            if(METHOD(ClassDesignerBase, createObject))
               M_VTBLID(ClassDesignerBase, createObject) = METHOD(ClassDesignerBase, createObject)->vid;

            METHOD(ClassDesignerBase, destroyObject) = Class_findMethod(CO(ClassDesignerBase), "DestroyObject", app);
            if(METHOD(ClassDesignerBase, destroyObject))
               M_VTBLID(ClassDesignerBase, destroyObject) = METHOD(ClassDesignerBase, destroyObject)->vid;

            METHOD(ClassDesignerBase, droppedObject) = Class_findMethod(CO(ClassDesignerBase), "DroppedObject", app);
            if(METHOD(ClassDesignerBase, droppedObject))
               M_VTBLID(ClassDesignerBase, droppedObject) = METHOD(ClassDesignerBase, droppedObject)->vid;

            METHOD(ClassDesignerBase, fixProperty) = Class_findMethod(CO(ClassDesignerBase), "FixProperty", app);
            if(METHOD(ClassDesignerBase, fixProperty))
               M_VTBLID(ClassDesignerBase, fixProperty) = METHOD(ClassDesignerBase, fixProperty)->vid;

            METHOD(ClassDesignerBase, listToolBoxClasses) = Class_findMethod(CO(ClassDesignerBase), "ListToolBoxClasses", app);
            if(METHOD(ClassDesignerBase, listToolBoxClasses))
               M_VTBLID(ClassDesignerBase, listToolBoxClasses) = METHOD(ClassDesignerBase, listToolBoxClasses)->vid;

            METHOD(ClassDesignerBase, postCreateObject) = Class_findMethod(CO(ClassDesignerBase), "PostCreateObject", app);
            if(METHOD(ClassDesignerBase, postCreateObject))
               M_VTBLID(ClassDesignerBase, postCreateObject) = METHOD(ClassDesignerBase, postCreateObject)->vid;

            METHOD(ClassDesignerBase, prepareTestObject) = Class_findMethod(CO(ClassDesignerBase), "PrepareTestObject", app);
            if(METHOD(ClassDesignerBase, prepareTestObject))
               M_VTBLID(ClassDesignerBase, prepareTestObject) = METHOD(ClassDesignerBase, prepareTestObject)->vid;

            METHOD(ClassDesignerBase, reset) = Class_findMethod(CO(ClassDesignerBase), "Reset", app);
            if(METHOD(ClassDesignerBase, reset))
               M_VTBLID(ClassDesignerBase, reset) = METHOD(ClassDesignerBase, reset)->vid;

            METHOD(ClassDesignerBase, selectObject) = Class_findMethod(CO(ClassDesignerBase), "SelectObject", app);
            if(METHOD(ClassDesignerBase, selectObject))
               M_VTBLID(ClassDesignerBase, selectObject) = METHOD(ClassDesignerBase, selectObject)->vid;
         }
         CO(ClassProperty) = eC_findClass(app, "ClassProperty");
         CO(ClassTemplateArgument) = eC_findClass(app, "ClassTemplateArgument");
         CO(ClassTemplateParameter) = eC_findClass(app, "ClassTemplateParameter");
         CO(ClassType) = eC_findClass(app, "ClassType");
         CO(Container) = eC_findClass(app, "Container");
         if(CO(Container))
         {
            METHOD(Container, add) = Class_findMethod(CO(Container), "Add", app);
            if(METHOD(Container, add))
               M_VTBLID(Container, add) = METHOD(Container, add)->vid;

            METHOD(Container, copy) = Class_findMethod(CO(Container), "Copy", app);
            if(METHOD(Container, copy))
               M_VTBLID(Container, copy) = METHOD(Container, copy)->vid;

            METHOD(Container, delete) = Class_findMethod(CO(Container), "Delete", app);
            if(METHOD(Container, delete))
               M_VTBLID(Container, delete) = METHOD(Container, delete)->vid;

            METHOD(Container, find) = Class_findMethod(CO(Container), "Find", app);
            if(METHOD(Container, find))
               M_VTBLID(Container, find) = METHOD(Container, find)->vid;

            METHOD(Container, free) = Class_findMethod(CO(Container), "Free", app);
            if(METHOD(Container, free))
               M_VTBLID(Container, free) = METHOD(Container, free)->vid;

            METHOD(Container, freeIterator) = Class_findMethod(CO(Container), "FreeIterator", app);
            if(METHOD(Container, freeIterator))
               M_VTBLID(Container, freeIterator) = METHOD(Container, freeIterator)->vid;

            METHOD(Container, getAtPosition) = Class_findMethod(CO(Container), "GetAtPosition", app);
            if(METHOD(Container, getAtPosition))
               M_VTBLID(Container, getAtPosition) = METHOD(Container, getAtPosition)->vid;

            METHOD(Container, getCount) = Class_findMethod(CO(Container), "GetCount", app);
            if(METHOD(Container, getCount))
               M_VTBLID(Container, getCount) = METHOD(Container, getCount)->vid;

            METHOD(Container, getData) = Class_findMethod(CO(Container), "GetData", app);
            if(METHOD(Container, getData))
               M_VTBLID(Container, getData) = METHOD(Container, getData)->vid;

            METHOD(Container, getFirst) = Class_findMethod(CO(Container), "GetFirst", app);
            if(METHOD(Container, getFirst))
               M_VTBLID(Container, getFirst) = METHOD(Container, getFirst)->vid;

            METHOD(Container, getLast) = Class_findMethod(CO(Container), "GetLast", app);
            if(METHOD(Container, getLast))
               M_VTBLID(Container, getLast) = METHOD(Container, getLast)->vid;

            METHOD(Container, getNext) = Class_findMethod(CO(Container), "GetNext", app);
            if(METHOD(Container, getNext))
               M_VTBLID(Container, getNext) = METHOD(Container, getNext)->vid;

            METHOD(Container, getPrev) = Class_findMethod(CO(Container), "GetPrev", app);
            if(METHOD(Container, getPrev))
               M_VTBLID(Container, getPrev) = METHOD(Container, getPrev)->vid;

            METHOD(Container, insert) = Class_findMethod(CO(Container), "Insert", app);
            if(METHOD(Container, insert))
               M_VTBLID(Container, insert) = METHOD(Container, insert)->vid;

            METHOD(Container, move) = Class_findMethod(CO(Container), "Move", app);
            if(METHOD(Container, move))
               M_VTBLID(Container, move) = METHOD(Container, move)->vid;

            METHOD(Container, remove) = Class_findMethod(CO(Container), "Remove", app);
            if(METHOD(Container, remove))
               M_VTBLID(Container, remove) = METHOD(Container, remove)->vid;

            METHOD(Container, removeAll) = Class_findMethod(CO(Container), "RemoveAll", app);
            if(METHOD(Container, removeAll))
               M_VTBLID(Container, removeAll) = METHOD(Container, removeAll)->vid;

            METHOD(Container, setData) = Class_findMethod(CO(Container), "SetData", app);
            if(METHOD(Container, setData))
               M_VTBLID(Container, setData) = METHOD(Container, setData)->vid;

            METHOD(Container, sort) = Class_findMethod(CO(Container), "Sort", app);
            if(METHOD(Container, sort))
               M_VTBLID(Container, sort) = METHOD(Container, sort)->vid;

            METHOD(Container, takeOut) = Class_findMethod(CO(Container), "TakeOut", app);
            if(METHOD(Container, takeOut))
               Container_takeOut = (void (*)(C(Container), TP(Container, D)))METHOD(Container, takeOut)->function;

            PROPERTY(Container, copySrc) = Class_findProperty(CO(Container), "copySrc", app);
            if(PROPERTY(Container, copySrc))
               Container_set_copySrc = (void *)PROPERTY(Container, copySrc)->Set;

            PROPERTY(Container, firstIterator) = Class_findProperty(CO(Container), "firstIterator", app);
            if(PROPERTY(Container, firstIterator))
               Container_get_firstIterator = (void *)PROPERTY(Container, firstIterator)->Get;

            PROPERTY(Container, lastIterator) = Class_findProperty(CO(Container), "lastIterator", app);
            if(PROPERTY(Container, lastIterator))
               Container_get_lastIterator = (void *)PROPERTY(Container, lastIterator)->Get;
         }
         CO(CustomAVLTree) = eC_findClass(app, "CustomAVLTree");
         if(CO(CustomAVLTree))
         {
            METHOD(CustomAVLTree, freeKey) = Class_findMethod(CO(CustomAVLTree), "FreeKey", app);
            if(METHOD(CustomAVLTree, freeKey))
               CustomAVLTree_freeKey = (void (*)(C(CustomAVLTree), C(AVLNode) *))METHOD(CustomAVLTree, freeKey)->function;
         }
         CO(DataMember) = eC_findClass(app, "DataMember");
         CO(DataMemberType) = eC_findClass(app, "DataMemberType");
         CO(DataValue) = eC_findClass(app, "DataValue");
         CO(DefinedExpression) = eC_findClass(app, "DefinedExpression");
         CO(DesignerBase) = eC_findClass(app, "DesignerBase");
         if(CO(DesignerBase))
         {
            METHOD(DesignerBase, addDefaultMethod) = Class_findMethod(CO(DesignerBase), "AddDefaultMethod", app);
            if(METHOD(DesignerBase, addDefaultMethod))
               M_VTBLID(DesignerBase, addDefaultMethod) = METHOD(DesignerBase, addDefaultMethod)->vid;

            METHOD(DesignerBase, addToolBoxClass) = Class_findMethod(CO(DesignerBase), "AddToolBoxClass", app);
            if(METHOD(DesignerBase, addToolBoxClass))
               M_VTBLID(DesignerBase, addToolBoxClass) = METHOD(DesignerBase, addToolBoxClass)->vid;

            METHOD(DesignerBase, codeAddObject) = Class_findMethod(CO(DesignerBase), "CodeAddObject", app);
            if(METHOD(DesignerBase, codeAddObject))
               M_VTBLID(DesignerBase, codeAddObject) = METHOD(DesignerBase, codeAddObject)->vid;

            METHOD(DesignerBase, deleteObject) = Class_findMethod(CO(DesignerBase), "DeleteObject", app);
            if(METHOD(DesignerBase, deleteObject))
               M_VTBLID(DesignerBase, deleteObject) = METHOD(DesignerBase, deleteObject)->vid;

            METHOD(DesignerBase, findObject) = Class_findMethod(CO(DesignerBase), "FindObject", app);
            if(METHOD(DesignerBase, findObject))
               M_VTBLID(DesignerBase, findObject) = METHOD(DesignerBase, findObject)->vid;

            METHOD(DesignerBase, modifyCode) = Class_findMethod(CO(DesignerBase), "ModifyCode", app);
            if(METHOD(DesignerBase, modifyCode))
               M_VTBLID(DesignerBase, modifyCode) = METHOD(DesignerBase, modifyCode)->vid;

            METHOD(DesignerBase, objectContainsCode) = Class_findMethod(CO(DesignerBase), "ObjectContainsCode", app);
            if(METHOD(DesignerBase, objectContainsCode))
               M_VTBLID(DesignerBase, objectContainsCode) = METHOD(DesignerBase, objectContainsCode)->vid;

            METHOD(DesignerBase, renameObject) = Class_findMethod(CO(DesignerBase), "RenameObject", app);
            if(METHOD(DesignerBase, renameObject))
               M_VTBLID(DesignerBase, renameObject) = METHOD(DesignerBase, renameObject)->vid;

            METHOD(DesignerBase, selectObjectFromDesigner) = Class_findMethod(CO(DesignerBase), "SelectObjectFromDesigner", app);
            if(METHOD(DesignerBase, selectObjectFromDesigner))
               M_VTBLID(DesignerBase, selectObjectFromDesigner) = METHOD(DesignerBase, selectObjectFromDesigner)->vid;

            METHOD(DesignerBase, sheetAddObject) = Class_findMethod(CO(DesignerBase), "SheetAddObject", app);
            if(METHOD(DesignerBase, sheetAddObject))
               M_VTBLID(DesignerBase, sheetAddObject) = METHOD(DesignerBase, sheetAddObject)->vid;

            METHOD(DesignerBase, updateProperties) = Class_findMethod(CO(DesignerBase), "UpdateProperties", app);
            if(METHOD(DesignerBase, updateProperties))
               M_VTBLID(DesignerBase, updateProperties) = METHOD(DesignerBase, updateProperties)->vid;

            PROPERTY(DesignerBase, classDesigner) = Class_findProperty(CO(DesignerBase), "classDesigner", app);
            if(PROPERTY(DesignerBase, classDesigner))
            {
               DesignerBase_set_classDesigner = (void *)PROPERTY(DesignerBase, classDesigner)->Set;
               DesignerBase_get_classDesigner = (void *)PROPERTY(DesignerBase, classDesigner)->Get;
            }

            PROPERTY(DesignerBase, objectClass) = Class_findProperty(CO(DesignerBase), "objectClass", app);
            if(PROPERTY(DesignerBase, objectClass))
            {
               DesignerBase_set_objectClass = (void *)PROPERTY(DesignerBase, objectClass)->Set;
               DesignerBase_get_objectClass = (void *)PROPERTY(DesignerBase, objectClass)->Get;
            }

            PROPERTY(DesignerBase, isDragging) = Class_findProperty(CO(DesignerBase), "isDragging", app);
            if(PROPERTY(DesignerBase, isDragging))
            {
               DesignerBase_set_isDragging = (void *)PROPERTY(DesignerBase, isDragging)->Set;
               DesignerBase_get_isDragging = (void *)PROPERTY(DesignerBase, isDragging)->Get;
            }
         }
         CO(EnumClassData) = eC_findClass(app, "EnumClassData");
         CO(GlobalFunction) = eC_findClass(app, "GlobalFunction");
         CO(IOChannel) = eC_findClass(app, "IOChannel");
         if(CO(IOChannel))
         {
            METHOD(IOChannel, get) = Class_findMethod(CO(IOChannel), "Get", app);
            if(METHOD(IOChannel, get))
               IOChannel_get = (void (*)(C(IOChannel), C(Class) *, void *))METHOD(IOChannel, get)->function;

            METHOD(IOChannel, put) = Class_findMethod(CO(IOChannel), "Put", app);
            if(METHOD(IOChannel, put))
               IOChannel_put = (void (*)(C(IOChannel), C(Class) *, void *))METHOD(IOChannel, put)->function;

            METHOD(IOChannel, readData) = Class_findMethod(CO(IOChannel), "ReadData", app);
            if(METHOD(IOChannel, readData))
               M_VTBLID(IOChannel, readData) = METHOD(IOChannel, readData)->vid;

            METHOD(IOChannel, serialize) = Class_findMethod(CO(IOChannel), "Serialize", app);
            if(METHOD(IOChannel, serialize))
               IOChannel_serialize = (void (*)(C(IOChannel), C(Class) *, void *))METHOD(IOChannel, serialize)->function;

            METHOD(IOChannel, unserialize) = Class_findMethod(CO(IOChannel), "Unserialize", app);
            if(METHOD(IOChannel, unserialize))
               IOChannel_unserialize = (void (*)(C(IOChannel), C(Class) *, void *))METHOD(IOChannel, unserialize)->function;

            METHOD(IOChannel, writeData) = Class_findMethod(CO(IOChannel), "WriteData", app);
            if(METHOD(IOChannel, writeData))
               M_VTBLID(IOChannel, writeData) = METHOD(IOChannel, writeData)->vid;
         }
         CO(ImportType) = eC_findClass(app, "ImportType");
         CO(Instance) = eC_findClass(app, "Instance");
         CO(Iterator) = eC_findClass(app, "Iterator");
         if(CO(Iterator))
         {
            METHOD(Iterator, find) = Class_findMethod(CO(Iterator), "Find", app);
            if(METHOD(Iterator, find))
               Iterator_find = (C(bool) (*)(C(Iterator) *, TP(Iterator, T)))METHOD(Iterator, find)->function;

            METHOD(Iterator, free) = Class_findMethod(CO(Iterator), "Free", app);
            if(METHOD(Iterator, free))
               Iterator_free = (void (*)(C(Iterator) *))METHOD(Iterator, free)->function;

            METHOD(Iterator, getData) = Class_findMethod(CO(Iterator), "GetData", app);
            if(METHOD(Iterator, getData))
               Iterator_getData = (TP(Iterator, T) (*)(C(Iterator) *))METHOD(Iterator, getData)->function;

            METHOD(Iterator, index) = Class_findMethod(CO(Iterator), "Index", app);
            if(METHOD(Iterator, index))
               Iterator_index = (C(bool) (*)(C(Iterator) *, TP(Iterator, IT), C(bool)))METHOD(Iterator, index)->function;

            METHOD(Iterator, next) = Class_findMethod(CO(Iterator), "Next", app);
            if(METHOD(Iterator, next))
               Iterator_next = (C(bool) (*)(C(Iterator) *))METHOD(Iterator, next)->function;

            METHOD(Iterator, prev) = Class_findMethod(CO(Iterator), "Prev", app);
            if(METHOD(Iterator, prev))
               Iterator_prev = (C(bool) (*)(C(Iterator) *))METHOD(Iterator, prev)->function;

            METHOD(Iterator, remove) = Class_findMethod(CO(Iterator), "Remove", app);
            if(METHOD(Iterator, remove))
               Iterator_remove = (void (*)(C(Iterator) *))METHOD(Iterator, remove)->function;

            METHOD(Iterator, setData) = Class_findMethod(CO(Iterator), "SetData", app);
            if(METHOD(Iterator, setData))
               Iterator_setData = (C(bool) (*)(C(Iterator) *, TP(Iterator, T)))METHOD(Iterator, setData)->function;

            PROPERTY(Iterator, data) = Class_findProperty(CO(Iterator), "data", app);
            if(PROPERTY(Iterator, data))
            {
               Iterator_set_data = (void *)PROPERTY(Iterator, data)->Set;
               Iterator_get_data = (void *)PROPERTY(Iterator, data)->Get;
            }
         }
         CO(IteratorPointer) = eC_findClass(app, "IteratorPointer");
         CO(Link) = eC_findClass(app, "Link");
         CO(LinkElement) = eC_findClass(app, "LinkElement");
         CO(LinkList) = eC_findClass(app, "LinkList");
         if(CO(LinkList))
         {
            METHOD(LinkList, _Sort) = Class_findMethod(CO(LinkList), "_Sort", app);
            if(METHOD(LinkList, _Sort))
               LinkList__Sort = (void (*)(C(LinkList), C(bool), C(LinkList) *))METHOD(LinkList, _Sort)->function;
         }
         CO(List) = eC_findClass(app, "List");
         CO(ListItem) = eC_findClass(app, "ListItem");
         CO(Map) = eC_findClass(app, "Map");
         if(CO(Map))
         {
            PROPERTY(Map, mapSrc) = Class_findProperty(CO(Map), "mapSrc", app);
            if(PROPERTY(Map, mapSrc))
               Map_set_mapSrc = (void *)PROPERTY(Map, mapSrc)->Set;
         }
         CO(MapIterator) = eC_findClass(app, "MapIterator");
         if(CO(MapIterator))
         {
            PROPERTY(MapIterator, map) = Class_findProperty(CO(MapIterator), "map", app);
            if(PROPERTY(MapIterator, map))
            {
               MapIterator_set_map = (void *)PROPERTY(MapIterator, map)->Set;
               MapIterator_get_map = (void *)PROPERTY(MapIterator, map)->Get;
            }

            PROPERTY(MapIterator, key) = Class_findProperty(CO(MapIterator), "key", app);
            if(PROPERTY(MapIterator, key))
               MapIterator_get_key = (void *)PROPERTY(MapIterator, key)->Get;

            PROPERTY(MapIterator, value) = Class_findProperty(CO(MapIterator), "value", app);
            if(PROPERTY(MapIterator, value))
            {
               MapIterator_set_value = (void *)PROPERTY(MapIterator, value)->Set;
               MapIterator_get_value = (void *)PROPERTY(MapIterator, value)->Get;
            }
         }
         CO(MapNode) = eC_findClass(app, "MapNode");
         if(CO(MapNode))
         {
            PROPERTY(MapNode, key) = Class_findProperty(CO(MapNode), "key", app);
            if(PROPERTY(MapNode, key))
            {
               MapNode_set_key = (void *)PROPERTY(MapNode, key)->Set;
               MapNode_get_key = (void *)PROPERTY(MapNode, key)->Get;
            }

            PROPERTY(MapNode, value) = Class_findProperty(CO(MapNode), "value", app);
            if(PROPERTY(MapNode, value))
            {
               MapNode_set_value = (void *)PROPERTY(MapNode, value)->Set;
               MapNode_get_value = (void *)PROPERTY(MapNode, value)->Get;
            }

            PROPERTY(MapNode, prev) = Class_findProperty(CO(MapNode), "prev", app);
            if(PROPERTY(MapNode, prev))
               MapNode_get_prev = (void *)PROPERTY(MapNode, prev)->Get;

            PROPERTY(MapNode, next) = Class_findProperty(CO(MapNode), "next", app);
            if(PROPERTY(MapNode, next))
               MapNode_get_next = (void *)PROPERTY(MapNode, next)->Get;

            PROPERTY(MapNode, minimum) = Class_findProperty(CO(MapNode), "minimum", app);
            if(PROPERTY(MapNode, minimum))
               MapNode_get_minimum = (void *)PROPERTY(MapNode, minimum)->Get;

            PROPERTY(MapNode, maximum) = Class_findProperty(CO(MapNode), "maximum", app);
            if(PROPERTY(MapNode, maximum))
               MapNode_get_maximum = (void *)PROPERTY(MapNode, maximum)->Get;
         }
         CO(Method) = eC_findClass(app, "Method");
         CO(MethodType) = eC_findClass(app, "MethodType");
         CO(Module) = eC_findClass(app, "Module");
         if(CO(Module))
         {
            METHOD(Module, onLoad) = Class_findMethod(CO(Module), "OnLoad", app);
            if(METHOD(Module, onLoad))
               M_VTBLID(Module, onLoad) = METHOD(Module, onLoad)->vid;

            METHOD(Module, onUnload) = Class_findMethod(CO(Module), "OnUnload", app);
            if(METHOD(Module, onUnload))
               M_VTBLID(Module, onUnload) = METHOD(Module, onUnload)->vid;
         }
         CO(NameSpace) = eC_findClass(app, "NameSpace");
         CO(ObjectInfo) = eC_findClass(app, "ObjectInfo");
         CO(Platform) = eC_findClass(app, "Platform");
         if(CO(Platform))
         {
            PROPERTY(Platform, char_ptr) = Class_findProperty(CO(Platform), "char *", app);
            if(PROPERTY(Platform, char_ptr))
            {
               Platform_from_char_ptr = (void *)PROPERTY(Platform, char_ptr)->Set;
               Platform_to_char_ptr = (void *)PROPERTY(Platform, char_ptr)->Get;
            }
         }
         CO(Property) = eC_findClass(app, "Property");
         CO(SerialBuffer) = eC_findClass(app, "SerialBuffer");
         if(CO(SerialBuffer))
         {
            METHOD(SerialBuffer, free) = Class_findMethod(CO(SerialBuffer), "Free", app);
            if(METHOD(SerialBuffer, free))
               SerialBuffer_free = (void (*)(C(SerialBuffer)))METHOD(SerialBuffer, free)->function;

            PROPERTY(SerialBuffer, buffer) = Class_findProperty(CO(SerialBuffer), "buffer", app);
            if(PROPERTY(SerialBuffer, buffer))
            {
               SerialBuffer_set_buffer = (void *)PROPERTY(SerialBuffer, buffer)->Set;
               SerialBuffer_get_buffer = (void *)PROPERTY(SerialBuffer, buffer)->Get;
            }

            PROPERTY(SerialBuffer, size) = Class_findProperty(CO(SerialBuffer), "size", app);
            if(PROPERTY(SerialBuffer, size))
            {
               SerialBuffer_set_size = (void *)PROPERTY(SerialBuffer, size)->Set;
               SerialBuffer_get_size = (void *)PROPERTY(SerialBuffer, size)->Get;
            }
         }
         CO(StaticString) = eC_findClass(app, "StaticString");
         CO(SubModule) = eC_findClass(app, "SubModule");
         CO(TemplateMemberType) = eC_findClass(app, "TemplateMemberType");
         CO(TemplateParameterType) = eC_findClass(app, "TemplateParameterType");
         CO(Window) = eC_findClass(app, "Window");
         CO(BTNode) = eC_findClass(app, "BTNode");
         if(CO(BTNode))
         {
            METHOD(BTNode, findPrefix) = Class_findMethod(CO(BTNode), "FindPrefix", app);
            if(METHOD(BTNode, findPrefix))
               BTNode_findPrefix = (C(BTNode) * (*)(C(BTNode) *, const char *))METHOD(BTNode, findPrefix)->function;

            METHOD(BTNode, findString) = Class_findMethod(CO(BTNode), "FindString", app);
            if(METHOD(BTNode, findString))
               BTNode_findString = (C(BTNode) * (*)(C(BTNode) *, const char *))METHOD(BTNode, findString)->function;

            PROPERTY(BTNode, prev) = Class_findProperty(CO(BTNode), "prev", app);
            if(PROPERTY(BTNode, prev))
               BTNode_get_prev = (void *)PROPERTY(BTNode, prev)->Get;

            PROPERTY(BTNode, next) = Class_findProperty(CO(BTNode), "next", app);
            if(PROPERTY(BTNode, next))
               BTNode_get_next = (void *)PROPERTY(BTNode, next)->Get;

            PROPERTY(BTNode, minimum) = Class_findProperty(CO(BTNode), "minimum", app);
            if(PROPERTY(BTNode, minimum))
               BTNode_get_minimum = (void *)PROPERTY(BTNode, minimum)->Get;

            PROPERTY(BTNode, maximum) = Class_findProperty(CO(BTNode), "maximum", app);
            if(PROPERTY(BTNode, maximum))
               BTNode_get_maximum = (void *)PROPERTY(BTNode, maximum)->Get;

            PROPERTY(BTNode, count) = Class_findProperty(CO(BTNode), "count", app);
            if(PROPERTY(BTNode, count))
               BTNode_get_count = (void *)PROPERTY(BTNode, count)->Get;

            PROPERTY(BTNode, depthProp) = Class_findProperty(CO(BTNode), "depthProp", app);
            if(PROPERTY(BTNode, depthProp))
               BTNode_get_depthProp = (void *)PROPERTY(BTNode, depthProp)->Get;
         }
         CO(BackSlashEscaping) = eC_findClass(app, "BackSlashEscaping");
         CO(BinaryTree) = eC_findClass(app, "BinaryTree");
         if(CO(BinaryTree))
         {
            METHOD(BinaryTree, add) = Class_findMethod(CO(BinaryTree), "Add", app);
            if(METHOD(BinaryTree, add))
               BinaryTree_add = (C(bool) (*)(C(BinaryTree) *, C(BTNode) *))METHOD(BinaryTree, add)->function;

            METHOD(BinaryTree, check) = Class_findMethod(CO(BinaryTree), "Check", app);
            if(METHOD(BinaryTree, check))
               BinaryTree_check = (C(bool) (*)(C(BinaryTree) *))METHOD(BinaryTree, check)->function;

            METHOD(BinaryTree, compareInt) = Class_findMethod(CO(BinaryTree), "CompareInt", app);
            if(METHOD(BinaryTree, compareInt))
               BinaryTree_compareInt = (int (*)(C(BinaryTree) *, uintptr, uintptr))METHOD(BinaryTree, compareInt)->function;

            METHOD(BinaryTree, compareString) = Class_findMethod(CO(BinaryTree), "CompareString", app);
            if(METHOD(BinaryTree, compareString))
               BinaryTree_compareString = (int (*)(C(BinaryTree) *, const char *, const char *))METHOD(BinaryTree, compareString)->function;

            METHOD(BinaryTree, delete) = Class_findMethod(CO(BinaryTree), "Delete", app);
            if(METHOD(BinaryTree, delete))
               BinaryTree_delete = (void (*)(C(BinaryTree) *, C(BTNode) *))METHOD(BinaryTree, delete)->function;

            METHOD(BinaryTree, find) = Class_findMethod(CO(BinaryTree), "Find", app);
            if(METHOD(BinaryTree, find))
               BinaryTree_find = (C(BTNode) * (*)(C(BinaryTree) *, uintptr))METHOD(BinaryTree, find)->function;

            METHOD(BinaryTree, findAll) = Class_findMethod(CO(BinaryTree), "FindAll", app);
            if(METHOD(BinaryTree, findAll))
               BinaryTree_findAll = (C(BTNode) * (*)(C(BinaryTree) *, uintptr))METHOD(BinaryTree, findAll)->function;

            METHOD(BinaryTree, findPrefix) = Class_findMethod(CO(BinaryTree), "FindPrefix", app);
            if(METHOD(BinaryTree, findPrefix))
               BinaryTree_findPrefix = (C(BTNode) * (*)(C(BinaryTree) *, const char *))METHOD(BinaryTree, findPrefix)->function;

            METHOD(BinaryTree, findString) = Class_findMethod(CO(BinaryTree), "FindString", app);
            if(METHOD(BinaryTree, findString))
               BinaryTree_findString = (C(BTNode) * (*)(C(BinaryTree) *, const char *))METHOD(BinaryTree, findString)->function;

            METHOD(BinaryTree, free) = Class_findMethod(CO(BinaryTree), "Free", app);
            if(METHOD(BinaryTree, free))
               BinaryTree_free = (void (*)(C(BinaryTree) *))METHOD(BinaryTree, free)->function;

            METHOD(BinaryTree, freeString) = Class_findMethod(CO(BinaryTree), "FreeString", app);
            if(METHOD(BinaryTree, freeString))
               BinaryTree_freeString = (void (*)(char *))METHOD(BinaryTree, freeString)->function;

            METHOD(BinaryTree, print) = Class_findMethod(CO(BinaryTree), "Print", app);
            if(METHOD(BinaryTree, print))
               BinaryTree_print = (char * (*)(C(BinaryTree) *, char *, C(TreePrintStyle)))METHOD(BinaryTree, print)->function;

            METHOD(BinaryTree, remove) = Class_findMethod(CO(BinaryTree), "Remove", app);
            if(METHOD(BinaryTree, remove))
               BinaryTree_remove = (void (*)(C(BinaryTree) *, C(BTNode) *))METHOD(BinaryTree, remove)->function;

            PROPERTY(BinaryTree, first) = Class_findProperty(CO(BinaryTree), "first", app);
            if(PROPERTY(BinaryTree, first))
               BinaryTree_get_first = (void *)PROPERTY(BinaryTree, first)->Get;

            PROPERTY(BinaryTree, last) = Class_findProperty(CO(BinaryTree), "last", app);
            if(PROPERTY(BinaryTree, last))
               BinaryTree_get_last = (void *)PROPERTY(BinaryTree, last)->Get;
         }
         CO(Item) = eC_findClass(app, "Item");
         if(CO(Item))
         {
            METHOD(Item, copy) = Class_findMethod(CO(Item), "Copy", app);
            if(METHOD(Item, copy))
               Item_copy = (void (*)(C(Item) *, C(Item) *, int))METHOD(Item, copy)->function;
         }
         CO(Mutex) = eC_findClass(app, "Mutex");
         if(CO(Mutex))
         {
            METHOD(Mutex, release) = Class_findMethod(CO(Mutex), "Release", app);
            if(METHOD(Mutex, release))
               Mutex_release = (void (*)(C(Mutex) *))METHOD(Mutex, release)->function;

            METHOD(Mutex, wait) = Class_findMethod(CO(Mutex), "Wait", app);
            if(METHOD(Mutex, wait))
               Mutex_wait = (void (*)(C(Mutex) *))METHOD(Mutex, wait)->function;

            PROPERTY(Mutex, lockCount) = Class_findProperty(CO(Mutex), "lockCount", app);
            if(PROPERTY(Mutex, lockCount))
               Mutex_get_lockCount = (void *)PROPERTY(Mutex, lockCount)->Get;

            PROPERTY(Mutex, owningThread) = Class_findProperty(CO(Mutex), "owningThread", app);
            if(PROPERTY(Mutex, owningThread))
               Mutex_get_owningThread = (void *)PROPERTY(Mutex, owningThread)->Get;
         }
         CO(NamedItem) = eC_findClass(app, "NamedItem");
         CO(NamedLink) = eC_findClass(app, "NamedLink");
         CO(NamedLink64) = eC_findClass(app, "NamedLink64");
         CO(OldLink) = eC_findClass(app, "OldLink");
         if(CO(OldLink))
         {
            METHOD(OldLink, free) = Class_findMethod(CO(OldLink), "Free", app);
            if(METHOD(OldLink, free))
               OldLink_free = (void (*)(C(OldLink) *))METHOD(OldLink, free)->function;
         }
         CO(OldList) = eC_findClass(app, "OldList");
         if(CO(OldList))
         {
            METHOD(OldList, add) = Class_findMethod(CO(OldList), "Add", app);
            if(METHOD(OldList, add))
               OldList_add = (void (*)(C(OldList) *, void *))METHOD(OldList, add)->function;

            METHOD(OldList, addName) = Class_findMethod(CO(OldList), "AddName", app);
            if(METHOD(OldList, addName))
               OldList_addName = (C(bool) (*)(C(OldList) *, void *))METHOD(OldList, addName)->function;

            METHOD(OldList, clear) = Class_findMethod(CO(OldList), "Clear", app);
            if(METHOD(OldList, clear))
               OldList_clear = (void (*)(C(OldList) *))METHOD(OldList, clear)->function;

            METHOD(OldList, copy) = Class_findMethod(CO(OldList), "Copy", app);
            if(METHOD(OldList, copy))
               OldList_copy = (void (*)(C(OldList) *, C(OldList) *, int, void (*)(void *, void *)))METHOD(OldList, copy)->function;

            METHOD(OldList, delete) = Class_findMethod(CO(OldList), "Delete", app);
            if(METHOD(OldList, delete))
               OldList_delete = (void (*)(C(OldList) *, void *))METHOD(OldList, delete)->function;

            METHOD(OldList, findLink) = Class_findMethod(CO(OldList), "FindLink", app);
            if(METHOD(OldList, findLink))
               OldList_findLink = (C(OldLink) * (*)(C(OldList) *, void *))METHOD(OldList, findLink)->function;

            METHOD(OldList, findName) = Class_findMethod(CO(OldList), "FindName", app);
            if(METHOD(OldList, findName))
               OldList_findName = (void * (*)(C(OldList) *, const char *, C(bool)))METHOD(OldList, findName)->function;

            METHOD(OldList, findNamedLink) = Class_findMethod(CO(OldList), "FindNamedLink", app);
            if(METHOD(OldList, findNamedLink))
               OldList_findNamedLink = (void * (*)(C(OldList) *, const char *, C(bool)))METHOD(OldList, findNamedLink)->function;

            METHOD(OldList, free) = Class_findMethod(CO(OldList), "Free", app);
            if(METHOD(OldList, free))
               OldList_free = (void (*)(C(OldList) *, void (*)(void *)))METHOD(OldList, free)->function;

            METHOD(OldList, insert) = Class_findMethod(CO(OldList), "Insert", app);
            if(METHOD(OldList, insert))
               OldList_insert = (C(bool) (*)(C(OldList) *, void *, void *))METHOD(OldList, insert)->function;

            METHOD(OldList, move) = Class_findMethod(CO(OldList), "Move", app);
            if(METHOD(OldList, move))
               OldList_move = (void (*)(C(OldList) *, void *, void *))METHOD(OldList, move)->function;

            METHOD(OldList, placeName) = Class_findMethod(CO(OldList), "PlaceName", app);
            if(METHOD(OldList, placeName))
               OldList_placeName = (C(bool) (*)(C(OldList) *, const char *, void **))METHOD(OldList, placeName)->function;

            METHOD(OldList, remove) = Class_findMethod(CO(OldList), "Remove", app);
            if(METHOD(OldList, remove))
               OldList_remove = (void (*)(C(OldList) *, void *))METHOD(OldList, remove)->function;

            METHOD(OldList, removeAll) = Class_findMethod(CO(OldList), "RemoveAll", app);
            if(METHOD(OldList, removeAll))
               OldList_removeAll = (void (*)(C(OldList) *, void (*)(void *)))METHOD(OldList, removeAll)->function;

            METHOD(OldList, sort) = Class_findMethod(CO(OldList), "Sort", app);
            if(METHOD(OldList, sort))
               OldList_sort = (void (*)(C(OldList) *, int (*)(void *, void *, void *), void *))METHOD(OldList, sort)->function;

            METHOD(OldList, swap) = Class_findMethod(CO(OldList), "Swap", app);
            if(METHOD(OldList, swap))
               OldList_swap = (void (*)(C(OldList) *, void *, void *))METHOD(OldList, swap)->function;
         }
         CO(StringAllocType) = eC_findClass(app, "StringAllocType");
         CO(StringBTNode) = eC_findClass(app, "StringBTNode");
         CO(StringBinaryTree) = eC_findClass(app, "StringBinaryTree");
         CO(TreePrintStyle) = eC_findClass(app, "TreePrintStyle");
         CO(ZString) = eC_findClass(app, "ZString");
         if(CO(ZString))
         {
            METHOD(ZString, concat) = Class_findMethod(CO(ZString), "concat", app);
            if(METHOD(ZString, concat))
               ZString_concat = (void (*)(C(ZString), C(ZString)))METHOD(ZString, concat)->function;

            METHOD(ZString, concatf) = Class_findMethod(CO(ZString), "concatf", app);
            if(METHOD(ZString, concatf))
               ZString_concatf = (void (*)(C(ZString), const char *, ...))METHOD(ZString, concatf)->function;

            METHOD(ZString, copy) = Class_findMethod(CO(ZString), "copy", app);
            if(METHOD(ZString, copy))
               ZString_copy = (void (*)(C(ZString), C(ZString)))METHOD(ZString, copy)->function;

            METHOD(ZString, copyString) = Class_findMethod(CO(ZString), "copyString", app);
            if(METHOD(ZString, copyString))
               ZString_copyString = (void (*)(C(ZString), char *, int))METHOD(ZString, copyString)->function;

            PROPERTY(ZString, char_ptr) = Class_findProperty(CO(ZString), "char *", app);
            if(PROPERTY(ZString, char_ptr))
            {
               ZString_from_char_ptr = (void *)PROPERTY(ZString, char_ptr)->Set;
               ZString_to_char_ptr = (void *)PROPERTY(ZString, char_ptr)->Get;
            }

            PROPERTY(ZString, string) = Class_findProperty(CO(ZString), "string", app);
            if(PROPERTY(ZString, string))
            {
               ZString_set_string = (void *)PROPERTY(ZString, string)->Set;
               ZString_get_string = (void *)PROPERTY(ZString, string)->Get;
            }
         }



         // Set up all the function pointers, ...

         FUNCTION(checkConsistency) = eC_findFunction(app, "CheckConsistency");
         if(FUNCTION(checkConsistency))
            checkConsistency = (void *)FUNCTION(checkConsistency)->function;

         FUNCTION(checkMemory) = eC_findFunction(app, "CheckMemory");
         if(FUNCTION(checkMemory))
            checkMemory = (void *)FUNCTION(checkMemory)->function;

         FUNCTION(getActiveDesigner) = eC_findFunction(app, "GetActiveDesigner");
         if(FUNCTION(getActiveDesigner))
            getActiveDesigner = (void *)FUNCTION(getActiveDesigner)->function;

         FUNCTION(getRuntimePlatform) = eC_findFunction(app, "GetRuntimePlatform");
         if(FUNCTION(getRuntimePlatform))
            getRuntimePlatform = (void *)FUNCTION(getRuntimePlatform)->function;

         FUNCTION(locateModule) = eC_findFunction(app, "LocateModule");
         if(FUNCTION(locateModule))
            locateModule = (void *)FUNCTION(locateModule)->function;

         FUNCTION(print) = eC_findFunction(app, "Print");
         if(FUNCTION(print))
            print = (void *)FUNCTION(print)->function;

         FUNCTION(printBuf) = eC_findFunction(app, "PrintBuf");
         if(FUNCTION(printBuf))
            printBuf = (void *)FUNCTION(printBuf)->function;

         FUNCTION(printLn) = eC_findFunction(app, "PrintLn");
         if(FUNCTION(printLn))
            printLn = (void *)FUNCTION(printLn)->function;

         FUNCTION(printLnBuf) = eC_findFunction(app, "PrintLnBuf");
         if(FUNCTION(printLnBuf))
            printLnBuf = (void *)FUNCTION(printLnBuf)->function;

         FUNCTION(printLnString) = eC_findFunction(app, "PrintLnString");
         if(FUNCTION(printLnString))
            printLnString = (void *)FUNCTION(printLnString)->function;

         FUNCTION(printStdArgsToBuffer) = eC_findFunction(app, "PrintStdArgsToBuffer");
         if(FUNCTION(printStdArgsToBuffer))
            printStdArgsToBuffer = (void *)FUNCTION(printStdArgsToBuffer)->function;

         FUNCTION(printString) = eC_findFunction(app, "PrintString");
         if(FUNCTION(printString))
            printString = (void *)FUNCTION(printString)->function;

         FUNCTION(setActiveDesigner) = eC_findFunction(app, "SetActiveDesigner");
         if(FUNCTION(setActiveDesigner))
            setActiveDesigner = (void *)FUNCTION(setActiveDesigner)->function;

         FUNCTION(log2i) = eC_findFunction(app, "log2i");
         if(FUNCTION(log2i))
            log2i = (void *)FUNCTION(log2i)->function;

         FUNCTION(memswap) = eC_findFunction(app, "memswap");
         if(FUNCTION(memswap))
            memswap = (void *)FUNCTION(memswap)->function;

         FUNCTION(pow2i) = eC_findFunction(app, "pow2i");
         if(FUNCTION(pow2i))
            pow2i = (void *)FUNCTION(pow2i)->function;

         FUNCTION(qsortr) = eC_findFunction(app, "qsortr");
         if(FUNCTION(qsortr))
            qsortr = (void *)FUNCTION(qsortr)->function;

         FUNCTION(qsortrx) = eC_findFunction(app, "qsortrx");
         if(FUNCTION(qsortrx))
            qsortrx = (void *)FUNCTION(qsortrx)->function;

         FUNCTION(queryMemInfo) = eC_findFunction(app, "queryMemInfo");
         if(FUNCTION(queryMemInfo))
            queryMemInfo = (void *)FUNCTION(queryMemInfo)->function;

         FUNCTION(changeCh) = eC_findFunction(app, "ChangeCh");
         if(FUNCTION(changeCh))
            changeCh = (void *)FUNCTION(changeCh)->function;

         FUNCTION(changeChars) = eC_findFunction(app, "ChangeChars");
         if(FUNCTION(changeChars))
            changeChars = (void *)FUNCTION(changeChars)->function;

         FUNCTION(changeExtension) = eC_findFunction(app, "ChangeExtension");
         if(FUNCTION(changeExtension))
            changeExtension = (void *)FUNCTION(changeExtension)->function;

         FUNCTION(copyString) = eC_findFunction(app, "CopyString");
         if(FUNCTION(copyString))
            copyString = (void *)FUNCTION(copyString)->function;

         FUNCTION(floatFromString) = eC_findFunction(app, "FloatFromString");
         if(FUNCTION(floatFromString))
            floatFromString = (void *)FUNCTION(floatFromString)->function;

         FUNCTION(getCurrentThreadID) = eC_findFunction(app, "GetCurrentThreadID");
         if(FUNCTION(getCurrentThreadID))
            getCurrentThreadID = (void *)FUNCTION(getCurrentThreadID)->function;

         FUNCTION(getExtension) = eC_findFunction(app, "GetExtension");
         if(FUNCTION(getExtension))
            getExtension = (void *)FUNCTION(getExtension)->function;

         FUNCTION(getHexValue) = eC_findFunction(app, "GetHexValue");
         if(FUNCTION(getHexValue))
            getHexValue = (void *)FUNCTION(getHexValue)->function;

         FUNCTION(getLastDirectory) = eC_findFunction(app, "GetLastDirectory");
         if(FUNCTION(getLastDirectory))
            getLastDirectory = (void *)FUNCTION(getLastDirectory)->function;

         FUNCTION(getString) = eC_findFunction(app, "GetString");
         if(FUNCTION(getString))
            getString = (void *)FUNCTION(getString)->function;

         FUNCTION(getValue) = eC_findFunction(app, "GetValue");
         if(FUNCTION(getValue))
            getValue = (void *)FUNCTION(getValue)->function;

         FUNCTION(iSO8859_1toUTF8) = eC_findFunction(app, "ISO8859_1toUTF8");
         if(FUNCTION(iSO8859_1toUTF8))
            iSO8859_1toUTF8 = (void *)FUNCTION(iSO8859_1toUTF8)->function;

         FUNCTION(isPathInsideOf) = eC_findFunction(app, "IsPathInsideOf");
         if(FUNCTION(isPathInsideOf))
            isPathInsideOf = (void *)FUNCTION(isPathInsideOf)->function;

         FUNCTION(makePathRelative) = eC_findFunction(app, "MakePathRelative");
         if(FUNCTION(makePathRelative))
            makePathRelative = (void *)FUNCTION(makePathRelative)->function;

         FUNCTION(pathCat) = eC_findFunction(app, "PathCat");
         if(FUNCTION(pathCat))
            pathCat = (void *)FUNCTION(pathCat)->function;

         FUNCTION(pathCatSlash) = eC_findFunction(app, "PathCatSlash");
         if(FUNCTION(pathCatSlash))
            pathCatSlash = (void *)FUNCTION(pathCatSlash)->function;

         FUNCTION(printBigSize) = eC_findFunction(app, "PrintBigSize");
         if(FUNCTION(printBigSize))
            printBigSize = (void *)FUNCTION(printBigSize)->function;

         FUNCTION(printSize) = eC_findFunction(app, "PrintSize");
         if(FUNCTION(printSize))
            printSize = (void *)FUNCTION(printSize)->function;

         FUNCTION(rSearchString) = eC_findFunction(app, "RSearchString");
         if(FUNCTION(rSearchString))
            rSearchString = (void *)FUNCTION(rSearchString)->function;

         FUNCTION(repeatCh) = eC_findFunction(app, "RepeatCh");
         if(FUNCTION(repeatCh))
            repeatCh = (void *)FUNCTION(repeatCh)->function;

         FUNCTION(searchString) = eC_findFunction(app, "SearchString");
         if(FUNCTION(searchString))
            searchString = (void *)FUNCTION(searchString)->function;

         FUNCTION(splitArchivePath) = eC_findFunction(app, "SplitArchivePath");
         if(FUNCTION(splitArchivePath))
            splitArchivePath = (void *)FUNCTION(splitArchivePath)->function;

         FUNCTION(splitDirectory) = eC_findFunction(app, "SplitDirectory");
         if(FUNCTION(splitDirectory))
            splitDirectory = (void *)FUNCTION(splitDirectory)->function;

         FUNCTION(stripExtension) = eC_findFunction(app, "StripExtension");
         if(FUNCTION(stripExtension))
            stripExtension = (void *)FUNCTION(stripExtension)->function;

         FUNCTION(stripLastDirectory) = eC_findFunction(app, "StripLastDirectory");
         if(FUNCTION(stripLastDirectory))
            stripLastDirectory = (void *)FUNCTION(stripLastDirectory)->function;

         FUNCTION(stripQuotes) = eC_findFunction(app, "StripQuotes");
         if(FUNCTION(stripQuotes))
            stripQuotes = (void *)FUNCTION(stripQuotes)->function;

         FUNCTION(tokenize) = eC_findFunction(app, "Tokenize");
         if(FUNCTION(tokenize))
            tokenize = (void *)FUNCTION(tokenize)->function;

         FUNCTION(tokenizeWith) = eC_findFunction(app, "TokenizeWith");
         if(FUNCTION(tokenizeWith))
            tokenizeWith = (void *)FUNCTION(tokenizeWith)->function;

         FUNCTION(trimLSpaces) = eC_findFunction(app, "TrimLSpaces");
         if(FUNCTION(trimLSpaces))
            trimLSpaces = (void *)FUNCTION(trimLSpaces)->function;

         FUNCTION(trimRSpaces) = eC_findFunction(app, "TrimRSpaces");
         if(FUNCTION(trimRSpaces))
            trimRSpaces = (void *)FUNCTION(trimRSpaces)->function;

         FUNCTION(uTF16toUTF8) = eC_findFunction(app, "UTF16toUTF8");
         if(FUNCTION(uTF16toUTF8))
            uTF16toUTF8 = (void *)FUNCTION(uTF16toUTF8)->function;

         FUNCTION(uTF16toUTF8Buffer) = eC_findFunction(app, "UTF16toUTF8Buffer");
         if(FUNCTION(uTF16toUTF8Buffer))
            uTF16toUTF8Buffer = (void *)FUNCTION(uTF16toUTF8Buffer)->function;

         FUNCTION(uTF32toUTF8Len) = eC_findFunction(app, "UTF32toUTF8Len");
         if(FUNCTION(uTF32toUTF8Len))
            uTF32toUTF8Len = (void *)FUNCTION(uTF32toUTF8Len)->function;

         FUNCTION(uTF8GetChar) = eC_findFunction(app, "UTF8GetChar");
         if(FUNCTION(uTF8GetChar))
            uTF8GetChar = (void *)FUNCTION(uTF8GetChar)->function;

         FUNCTION(uTF8Validate) = eC_findFunction(app, "UTF8Validate");
         if(FUNCTION(uTF8Validate))
            uTF8Validate = (void *)FUNCTION(uTF8Validate)->function;

         FUNCTION(uTF8toUTF16) = eC_findFunction(app, "UTF8toUTF16");
         if(FUNCTION(uTF8toUTF16))
            uTF8toUTF16 = (void *)FUNCTION(uTF8toUTF16)->function;

         FUNCTION(uTF8toUTF16Buffer) = eC_findFunction(app, "UTF8toUTF16Buffer");
         if(FUNCTION(uTF8toUTF16Buffer))
            uTF8toUTF16Buffer = (void *)FUNCTION(uTF8toUTF16Buffer)->function;

      }
   }
   else
      printf("Unable to load eC module: %s\n", loadEcere ? "ecere" : "ecereCOM");
   return fromModule ? IPTR(fromModule, Module)->application : null;
}

C(Module) __thisModule;

