.PHONY: all objdir clean realclean distclean

# CONTENT

MODULE := ecereBootstrap
CONFIG := bootstrap
COMPILER := default
TARGET_TYPE = staticlib

OBJ = obj/$(CONFIG).$(PLATFORM)/

RES = res/

TARGET = obj/$(CONFIG).$(PLATFORM)/$(LP)ecereBootstrap$(A)

OBJECTS = \
	$(OBJ)Array.o \
	$(OBJ)AVLTree.o \
	$(OBJ)BinaryTree.o \
	$(OBJ)BTNode.o \
	$(OBJ)BufferedFile.o \
	$(OBJ)BuiltInContainer.o \
	$(OBJ)Container.o \
	$(OBJ)CustomAVLTree.o \
	$(OBJ)dataTypes.o \
	$(OBJ)DualPipe.o \
	$(OBJ)ecere.main.o \
	$(OBJ)File.o \
	$(OBJ)instance.o \
	$(OBJ)LinkList.o \
	$(OBJ)List.o \
	$(OBJ)Map.o \
	$(OBJ)memory.o \
	$(OBJ)OldList.o \
	$(OBJ)String.o \
	$(OBJ)System.o \
	$(OBJ)TempFile.o \
	$(OBJ)instance.c.o \
	$(OBJ)DualPipe.c.o \
	$(OBJ)File.c.o \
	$(OBJ)System.c.o \
	$(OBJ)i18n.o

SOURCES = \
	bootstrap/Array.c \
	bootstrap/AVLTree.c \
	bootstrap/BinaryTree.c \
	bootstrap/i18n.c \
	bootstrap/BTNode.c \
	bootstrap/BufferedFile.c \
	bootstrap/BuiltInContainer.c \
	bootstrap/Container.c \
	bootstrap/CustomAVLTree.c \
	bootstrap/dataTypes.c \
	bootstrap/DualPipe.c \
	bootstrap/ecere.main.c \
	bootstrap/File.c \
	bootstrap/instance.c \
	bootstrap/LinkList.c \
	bootstrap/List.c \
	bootstrap/Map.c \
	bootstrap/memory.c \
	bootstrap/OldList.c \
	bootstrap/String.c \
	bootstrap/System.c \
	bootstrap/TempFile.c \
	../../../ecere/src/com/instance.c \
	../../../ecere/src/sys/DualPipe.c \
	../../../ecere/src/sys/File.c \
	../../../ecere/src/sys/System.c

ifndef DEBIAN_PACKAGE
CFLAGS =
endif
OFLAGS =

# CROSS-PLATFORM MAGIC

include ../../../crossplatform.mk
include ../../../include.mk

# FLAGS

CFLAGS += -fmessage-length=0 -O2 -ffast-math -m32 $(FPIC) -w \
	 -DBUILDING_ECERE_COM -DECERE_STATIC -DECERE_BOOTSTRAP

CECFLAGS =

ECFLAGS = -defaultns ecere -nolinenumbers

LIBS = $(SHAREDLIB) $(EXECUTABLE) $(LINKOPT)

UPXFLAGS = -9 -q

# HARD CODED PLATFORM-SPECIFIC OPTIONS
ifdef LINUX_TARGET
OFLAGS += -Wl,--no-undefined
endif

# TARGETS

all: objdir $(TARGET)

objdir:
	$(if $(wildcard $(OBJ)),,$(call mkdirq,$(OBJ)))

$(TARGET): $(SOURCES) $(RESOURCES) | objdir $(SYMBOLS) $(OBJECTS)
	$(AR) rcs $(TARGET) $(OBJECTS) $(LIBS)

$(OBJ)Array.o: bootstrap/Array.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c bootstrap/Array.c -o $(OBJ)Array.o

$(OBJ)AVLTree.o: bootstrap/AVLTree.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c bootstrap/AVLTree.c -o $(OBJ)AVLTree.o

$(OBJ)BinaryTree.o: bootstrap/BinaryTree.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c bootstrap/BinaryTree.c -o $(OBJ)BinaryTree.o

$(OBJ)BTNode.o: bootstrap/BTNode.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c bootstrap/BTNode.c -o $(OBJ)BTNode.o

$(OBJ)BufferedFile.o: bootstrap/BufferedFile.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c bootstrap/BufferedFile.c -o $(OBJ)BufferedFile.o

$(OBJ)BuiltInContainer.o: bootstrap/BuiltInContainer.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c bootstrap/BuiltInContainer.c -o $(OBJ)BuiltInContainer.o

$(OBJ)Container.o: bootstrap/Container.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c bootstrap/Container.c -o $(OBJ)Container.o

$(OBJ)CustomAVLTree.o: bootstrap/CustomAVLTree.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c bootstrap/CustomAVLTree.c -o $(OBJ)CustomAVLTree.o

$(OBJ)dataTypes.o: bootstrap/dataTypes.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c bootstrap/dataTypes.c -o $(OBJ)dataTypes.o

$(OBJ)DualPipe.o: bootstrap/DualPipe.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c bootstrap/DualPipe.c -o $(OBJ)DualPipe.o

$(OBJ)ecere.main.o: bootstrap/ecere.main.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c bootstrap/ecere.main.c -o $(OBJ)ecere.main.o

$(OBJ)File.o: bootstrap/File.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c bootstrap/File.c -o $(OBJ)File.o

$(OBJ)instance.o: bootstrap/instance.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c bootstrap/instance.c -o $(OBJ)instance.o

$(OBJ)i18n.o: bootstrap/i18n.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c bootstrap/i18n.c -o $(OBJ)i18n.o

$(OBJ)LinkList.o: bootstrap/LinkList.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c bootstrap/LinkList.c -o $(OBJ)LinkList.o

$(OBJ)List.o: bootstrap/List.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c bootstrap/List.c -o $(OBJ)List.o

$(OBJ)Map.o: bootstrap/Map.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c bootstrap/Map.c -o $(OBJ)Map.o

$(OBJ)memory.o: bootstrap/memory.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c bootstrap/memory.c -o $(OBJ)memory.o

$(OBJ)OldList.o: bootstrap/OldList.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c bootstrap/OldList.c -o $(OBJ)OldList.o

$(OBJ)String.o: bootstrap/String.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c bootstrap/String.c -o $(OBJ)String.o

$(OBJ)System.o: bootstrap/System.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c bootstrap/System.c -o $(OBJ)System.o

$(OBJ)TempFile.o: bootstrap/TempFile.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c bootstrap/TempFile.c -o $(OBJ)TempFile.o

$(OBJ)instance.c.o: ../../../ecere/src/com/instance.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c ../../../ecere/src/com/instance.c -o $(OBJ)instance.c.o

$(OBJ)DualPipe.c.o: ../../../ecere/src/sys/DualPipe.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c ../../../ecere/src/sys/DualPipe.c -o $(OBJ)DualPipe.c.o

$(OBJ)File.c.o: ../../../ecere/src/sys/File.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c ../../../ecere/src/sys/File.c -o $(OBJ)File.c.o

$(OBJ)System.c.o: ../../../ecere/src/sys/System.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c ../../../ecere/src/sys/System.c -o $(OBJ)System.c.o

clean: objdir
	$(call rmq,$(TARGET))
	$(call rmq,$(OBJECTS))

realclean:
	$(call rmrq,$(OBJ))

distclean:
	$(call rmrq,obj/)
