.PHONY: all objdir clean realclean distclean

# CORE VARIABLES

MODULE := ec
CONFIG := bootstrap
ifndef COMPILER
COMPILER := default
endif

TARGET_TYPE = staticlib

# FLAGS

ECFLAGS =
ifndef DEBIAN_PACKAGE
CFLAGS =
LDFLAGS =
endif
PRJ_CFLAGS =
CECFLAGS =
OFLAGS =
LIBS =

ifdef DEBUG
NOSTRIP := y
endif

CONSOLE = -mwindows

# INCLUDES

_CF_DIR = ../../../

include $(_CF_DIR)crossplatform.mk
include $(_CF_DIR)default.cf

# POST-INCLUDES VARIABLES

OBJ = obj/$(CONFIG).$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/

RES = 

TARGET = obj/$(CONFIG).$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/$(LP)ecBootstrap$(A)

OBJECTS = \
	$(OBJ)ast.o \
	$(OBJ)copy.o \
	$(OBJ)dbpass.o \
	$(OBJ)ec.main.o \
	$(OBJ)ecdefs.o \
	$(OBJ)expression.o \
	$(OBJ)firstPass.o \
	$(OBJ)freeAst.o \
	$(OBJ)grammar.o \
	$(OBJ)lexer.o \
	$(OBJ)loadSymbols.o \
	$(OBJ)output.o \
	$(OBJ)pass0.o \
	$(OBJ)pass1.o \
	$(OBJ)pass15.o \
	$(OBJ)pass16.o \
	$(OBJ)pass2.o \
	$(OBJ)pass3.o \
	$(OBJ)shortcuts.o \
	$(OBJ)type.o \
	$(OBJ)bsl.o

SOURCES = \
	bootstrap/ast.c \
	bootstrap/copy.c \
	bootstrap/dbpass.c \
	bootstrap/ec.main.c \
	bootstrap/ecdefs.c \
	bootstrap/expression.c \
	bootstrap/firstPass.c \
	bootstrap/freeAst.c \
	bootstrap/grammar.c \
	bootstrap/lexer.c \
	bootstrap/loadSymbols.c \
	bootstrap/output.c \
	bootstrap/pass0.c \
	bootstrap/pass1.c \
	bootstrap/pass15.c \
	bootstrap/pass16.c \
	bootstrap/pass2.c \
	bootstrap/pass3.c \
	bootstrap/shortcuts.c \
	bootstrap/type.c \
	../bsl.c

LIBS += $(SHAREDLIB) $(EXECUTABLE) $(LINKOPT)

ifndef STATIC_LIBRARY_TARGET
LIBS +=
endif

PRJ_CFLAGS += \
	 $(if $(DEBUG), -g, -O2 -ffast-math) $(FORCE_32_BIT) $(FPIC) -w \
			 -DECERE_STATIC
ECFLAGS += \
	 -nolinenumbers




CECFLAGS += -cpp $(_CPP)

OFLAGS += $(FORCE_32_BIT)

# TARGETS

all: objdir $(TARGET)

objdir:
	$(if $(wildcard $(OBJ)),,$(call mkdirq,$(OBJ)))

$(TARGET): $(SOURCES) $(RESOURCES) | objdir $(SYMBOLS) $(OBJECTS)
	$(AR) rcs $(TARGET) $(OBJECTS) $(LIBS)

# OBJECT RULES

$(OBJ)ast.o: bootstrap/ast.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c bootstrap/ast.c -o $(OBJ)ast.o

$(OBJ)copy.o: bootstrap/copy.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c bootstrap/copy.c -o $(OBJ)copy.o

$(OBJ)dbpass.o: bootstrap/dbpass.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c bootstrap/dbpass.c -o $(OBJ)dbpass.o

$(OBJ)ec.main.o: bootstrap/ec.main.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c bootstrap/ec.main.c -o $(OBJ)ec.main.o

$(OBJ)ecdefs.o: bootstrap/ecdefs.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c bootstrap/ecdefs.c -o $(OBJ)ecdefs.o

$(OBJ)expression.o: bootstrap/expression.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c bootstrap/expression.c -o $(OBJ)expression.o

$(OBJ)firstPass.o: bootstrap/firstPass.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c bootstrap/firstPass.c -o $(OBJ)firstPass.o

$(OBJ)freeAst.o: bootstrap/freeAst.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c bootstrap/freeAst.c -o $(OBJ)freeAst.o

$(OBJ)grammar.o: bootstrap/grammar.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c bootstrap/grammar.c -o $(OBJ)grammar.o

$(OBJ)lexer.o: bootstrap/lexer.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c bootstrap/lexer.c -o $(OBJ)lexer.o

$(OBJ)loadSymbols.o: bootstrap/loadSymbols.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c bootstrap/loadSymbols.c -o $(OBJ)loadSymbols.o

$(OBJ)output.o: bootstrap/output.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c bootstrap/output.c -o $(OBJ)output.o

$(OBJ)pass0.o: bootstrap/pass0.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c bootstrap/pass0.c -o $(OBJ)pass0.o

$(OBJ)pass1.o: bootstrap/pass1.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c bootstrap/pass1.c -o $(OBJ)pass1.o

$(OBJ)pass15.o: bootstrap/pass15.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c bootstrap/pass15.c -o $(OBJ)pass15.o

$(OBJ)pass16.o: bootstrap/pass16.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c bootstrap/pass16.c -o $(OBJ)pass16.o

$(OBJ)pass2.o: bootstrap/pass2.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c bootstrap/pass2.c -o $(OBJ)pass2.o

$(OBJ)pass3.o: bootstrap/pass3.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c bootstrap/pass3.c -o $(OBJ)pass3.o

$(OBJ)shortcuts.o: bootstrap/shortcuts.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c bootstrap/shortcuts.c -o $(OBJ)shortcuts.o

$(OBJ)type.o: bootstrap/type.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c bootstrap/type.c -o $(OBJ)type.o

$(OBJ)bsl.o: ../bsl.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c ../bsl.c -o $(OBJ)bsl.o

clean: objdir
	$(call rmq,$(TARGET))
	$(call rmq,$(OBJECTS))

realclean: objdir
	$(call rmrq,$(OBJ))

distclean: objdir
	$(call rmrq,obj/)
