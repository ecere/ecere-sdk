.PHONY: all objdir clean realclean distclean
.SILENT:

# CONTENT

MODULE := ec
CONFIG := release
COMPILER := default
TARGET_TYPE = sharedlib

OBJ = obj/$(CONFIG).$(PLATFORM)/

RES = 

# CROSS-PLATFORM MAGIC

include ../../include.mk

ifdef LINUX
TARGET = obj/$(CONFIG).$(PLATFORM)/$(LP)ec$(SO).0.44
SONAME = -Wl,-soname,libec.so.0
else
TARGET = obj/$(CONFIG).$(PLATFORM)/$(LP)ec$(SO)
SONAME =
endif

# $(OBJ)bsl.o is added manually here
OBJECTS = \
	$(OBJ)ast.o \
	$(OBJ)copy.o \
	$(OBJ)dbpass.o \
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
	$(OBJ)bsl.o \
	$(OBJ)$(MODULE).main$(O)

COBJECTS = \
	$(OBJ)ast.c \
	$(OBJ)copy.c \
	$(OBJ)dbpass.c \
	$(OBJ)ecdefs.c \
	$(OBJ)expression.c \
	$(OBJ)firstPass.c \
	$(OBJ)freeAst.c \
	$(OBJ)grammar.c \
	$(OBJ)lexer.c \
	$(OBJ)loadSymbols.c \
	$(OBJ)output.c \
	$(OBJ)pass0.c \
	$(OBJ)pass1.c \
	$(OBJ)pass15.c \
	$(OBJ)pass16.c \
	$(OBJ)pass2.c \
	$(OBJ)pass3.c \
	$(OBJ)shortcuts.c \
	$(OBJ)type.c

SYMBOLS = \
	$(OBJ)ast.sym \
	$(OBJ)copy.sym \
	$(OBJ)dbpass.sym \
	$(OBJ)ecdefs.sym \
	$(OBJ)expression.sym \
	$(OBJ)firstPass.sym \
	$(OBJ)freeAst.sym \
	$(OBJ)grammar.sym \
	$(OBJ)lexer.sym \
	$(OBJ)loadSymbols.sym \
	$(OBJ)output.sym \
	$(OBJ)pass0.sym \
	$(OBJ)pass1.sym \
	$(OBJ)pass15.sym \
	$(OBJ)pass16.sym \
	$(OBJ)pass2.sym \
	$(OBJ)pass3.sym \
	$(OBJ)shortcuts.sym \
	$(OBJ)type.sym

IMPORTS = \
	$(OBJ)ast.imp \
	$(OBJ)copy.imp \
	$(OBJ)dbpass.imp \
	$(OBJ)ecdefs.imp \
	$(OBJ)expression.imp \
	$(OBJ)firstPass.imp \
	$(OBJ)freeAst.imp \
	$(OBJ)grammar.imp \
	$(OBJ)lexer.imp \
	$(OBJ)loadSymbols.imp \
	$(OBJ)output.imp \
	$(OBJ)pass0.imp \
	$(OBJ)pass1.imp \
	$(OBJ)pass15.imp \
	$(OBJ)pass16.imp \
	$(OBJ)pass2.imp \
	$(OBJ)pass3.imp \
	$(OBJ)shortcuts.imp \
	$(OBJ)type.imp

SOURCES = \
	src/ast.ec \
	src/copy.ec \
	src/dbpass.ec \
	src/ecdefs.ec \
	src/expression.ec \
	src/firstPass.ec \
	src/freeAst.ec \
	src/grammar.ec \
	src/lexer.ec \
	src/loadSymbols.ec \
	src/output.ec \
	src/pass0.ec \
	src/pass1.ec \
	src/pass15.ec \
	src/pass16.ec \
	src/pass2.ec \
	src/pass3.ec \
	src/shortcuts.ec \
	src/type.ec

RESOURCES = \
	locale/zh_CN/LC_MESSAGES/ec.mo

# TOOLCHAIN

ifdef WINDOWS
else
export LD_LIBRARY_PATH = ../../obj/$(PLATFORM)/lib/
export DYLD_LIBRARY_PATH = ../../obj/$(PLATFORM)/lib/
endif

ECP := $(call psep,../bootstrap/obj/bin.$(PLATFORM)/ecp)
ECC := $(call psep,../bootstrap/obj/bin.$(PLATFORM)/ecc)
ECS := $(call psep,../bootstrap/obj/bin.$(PLATFORM)/ecs)

# FLAGS

CFLAGS = -fmessage-length=0 -O2 -ffast-math -m32 $(FPIC) -w -I../bootstrap/include

# BSL CFLAGS
BSL_CFLAGS = -fmessage-length=0 -O2 -ffast-math -m32 $(FPIC) -w

CECFLAGS =

ECFLAGS = -nolinenumbers

OFLAGS = -m32 \
	 -L../../obj/$(PLATFORM)/bin \
	 -L../../obj/$(PLATFORM)/lib

LIBS = -lecere $(SHAREDLIB) $(EXECUTABLE) $(LINKOPT)

UPXFLAGS = -9 -q

# HARD CODED PLATFORM-SPECIFIC OPTIONS
ifdef LINUX
OFLAGS += -Wl,--no-undefined
endif

# TARGETS

all: objdir $(TARGET)

objdir:
ifneq "$(wildcard $(OBJ))" "$(OBJ)"
	$(call mkdirq,$(OBJ))
endif

$(OBJ)$(MODULE).main.ec: $(SYMBOLS) $(COBJECTS)
	$(ECS) $(ECSLIBOPT) $(SYMBOLS) $(IMPORTS) -symbols obj/$(CONFIG).$(PLATFORM) -o $(OBJ)$(MODULE).main.ec

$(OBJ)$(MODULE).main.c: $(OBJ)$(MODULE).main.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c $(OBJ)$(MODULE).main.ec -o $(OBJ)$(MODULE).main.sym -symbols $(OBJ)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)$(MODULE).main.ec -o $(OBJ)$(MODULE).main.c -symbols $(OBJ)

$(SYMBOLS): | objdir
$(OBJECTS): | objdir
$(TARGET): $(SOURCES) $(RESOURCES) $(SYMBOLS) $(OBJECTS) | objdir
	$(CC) $(OFLAGS) $(OBJECTS) $(LIBS) -o $(TARGET) $(INSTALLNAME)
	$(STRIP) $(STRIPOPT) $(TARGET)
	$(EAR) awq $(TARGET) locale/zh_CN/LC_MESSAGES/ec.mo "locale/zh_CN/LC_MESSAGES"
	$(call cpq,$(TARGET),../../$(SODESTDIR))
ifdef LINUX
	ln -sf $(LP)$(MODULE)$(SO).0.44 ../../$(SODESTDIR)$(LP)$(MODULE)$(SO).0
	ln -sf $(LP)$(MODULE)$(SO).0.44 ../../$(SODESTDIR)$(LP)$(MODULE)$(SO)
endif	
ifdef WINDOWS
	$(call cpq,$(TARGET),../../compiler/bootstrap/obj/bin.$(PLATFORM)/)
endif

# SYMBOL RULES

$(OBJ)ast.sym: src/ast.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/ast.ec -o $(OBJ)ast.sym

$(OBJ)copy.sym: src/copy.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/copy.ec -o $(OBJ)copy.sym

$(OBJ)dbpass.sym: src/dbpass.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/dbpass.ec -o $(OBJ)dbpass.sym

$(OBJ)ecdefs.sym: src/ecdefs.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/ecdefs.ec -o $(OBJ)ecdefs.sym

$(OBJ)expression.sym: src/expression.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/expression.ec -o $(OBJ)expression.sym

$(OBJ)firstPass.sym: src/firstPass.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/firstPass.ec -o $(OBJ)firstPass.sym

$(OBJ)freeAst.sym: src/freeAst.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/freeAst.ec -o $(OBJ)freeAst.sym

$(OBJ)grammar.sym: src/grammar.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/grammar.ec -o $(OBJ)grammar.sym

$(OBJ)lexer.sym: src/lexer.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/lexer.ec -o $(OBJ)lexer.sym

$(OBJ)loadSymbols.sym: src/loadSymbols.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/loadSymbols.ec -o $(OBJ)loadSymbols.sym

$(OBJ)output.sym: src/output.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/output.ec -o $(OBJ)output.sym

$(OBJ)pass0.sym: src/pass0.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/pass0.ec -o $(OBJ)pass0.sym

$(OBJ)pass1.sym: src/pass1.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/pass1.ec -o $(OBJ)pass1.sym

$(OBJ)pass15.sym: src/pass15.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/pass15.ec -o $(OBJ)pass15.sym

$(OBJ)pass16.sym: src/pass16.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/pass16.ec -o $(OBJ)pass16.sym

$(OBJ)pass2.sym: src/pass2.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/pass2.ec -o $(OBJ)pass2.sym

$(OBJ)pass3.sym: src/pass3.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/pass3.ec -o $(OBJ)pass3.sym

$(OBJ)shortcuts.sym: src/shortcuts.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/shortcuts.ec -o $(OBJ)shortcuts.sym

$(OBJ)type.sym: src/type.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/type.ec -o $(OBJ)type.sym

# C OBJECT RULES

$(OBJ)ast.c: src/ast.ec $(OBJ)ast.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/ast.ec -o $(OBJ)ast.c -symbols $(OBJ)

$(OBJ)copy.c: src/copy.ec $(OBJ)copy.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/copy.ec -o $(OBJ)copy.c -symbols $(OBJ)

$(OBJ)dbpass.c: src/dbpass.ec $(OBJ)dbpass.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/dbpass.ec -o $(OBJ)dbpass.c -symbols $(OBJ)

$(OBJ)ecdefs.c: src/ecdefs.ec $(OBJ)ecdefs.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/ecdefs.ec -o $(OBJ)ecdefs.c -symbols $(OBJ)

$(OBJ)expression.c: src/expression.ec | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/expression.ec -o $(OBJ)expression.c -symbols $(OBJ)

$(OBJ)firstPass.c: src/firstPass.ec $(OBJ)firstPass.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/firstPass.ec -o $(OBJ)firstPass.c -symbols $(OBJ)

$(OBJ)freeAst.c: src/freeAst.ec $(OBJ)freeAst.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/freeAst.ec -o $(OBJ)freeAst.c -symbols $(OBJ)

$(OBJ)grammar.c: src/grammar.ec | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/grammar.ec -o $(OBJ)grammar.c -symbols $(OBJ)

$(OBJ)lexer.c: src/lexer.ec $(OBJ)lexer.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/lexer.ec -o $(OBJ)lexer.c -symbols $(OBJ)

$(OBJ)loadSymbols.c: src/loadSymbols.ec $(OBJ)loadSymbols.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/loadSymbols.ec -o $(OBJ)loadSymbols.c -symbols $(OBJ)

$(OBJ)output.c: src/output.ec $(OBJ)output.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/output.ec -o $(OBJ)output.c -symbols $(OBJ)

$(OBJ)pass0.c: src/pass0.ec $(OBJ)pass0.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/pass0.ec -o $(OBJ)pass0.c -symbols $(OBJ)

$(OBJ)pass1.c: src/pass1.ec $(OBJ)pass1.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/pass1.ec -o $(OBJ)pass1.c -symbols $(OBJ)

$(OBJ)pass15.c: src/pass15.ec $(OBJ)pass15.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/pass15.ec -o $(OBJ)pass15.c -symbols $(OBJ)

$(OBJ)pass16.c: src/pass16.ec $(OBJ)pass16.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/pass16.ec -o $(OBJ)pass16.c -symbols $(OBJ)

$(OBJ)pass2.c: src/pass2.ec $(OBJ)pass2.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/pass2.ec -o $(OBJ)pass2.c -symbols $(OBJ)

$(OBJ)pass3.c: src/pass3.ec $(OBJ)pass3.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/pass3.ec -o $(OBJ)pass3.c -symbols $(OBJ)

$(OBJ)shortcuts.c: src/shortcuts.ec $(OBJ)shortcuts.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/shortcuts.ec -o $(OBJ)shortcuts.c -symbols $(OBJ)

$(OBJ)type.c: src/type.ec | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/type.ec -o $(OBJ)type.c -symbols $(OBJ)

# IMPLICIT OBJECT RULE

$(OBJ)%$(O) : $(OBJ)%.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $< -o $@

# OBJECT RULES

$(OBJ)$(MODULE).main$(O): $(OBJ)$(MODULE).main.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)$(MODULE).main.c -o $(OBJ)$(MODULE).main$(O)

$(OBJ)bsl.o: ../bootstrap/bsl.c
	$(CC) $(BSL_CFLAGS) $(FVISIBILITY) -c ../bootstrap/bsl.c -o $(OBJ)bsl.o

clean: objdir
	$(call rmq,$(OBJ)$(MODULE).main.c $(OBJ)$(MODULE).main.ec $(OBJ)$(MODULE).main$(I) $(OBJ)$(MODULE).main$(S) $(TARGET))
	$(call rmq,$(OBJECTS))
	$(call rmq,$(COBJECTS))
	$(call rmq,$(IMPORTS))
	$(call rmq,$(SYMBOLS))

realclean:
	$(call rmrq,$(OBJ))

distclean:
	$(call rmrq,obj/)
