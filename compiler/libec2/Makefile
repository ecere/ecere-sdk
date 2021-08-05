.PHONY: all objdir cleantarget clean realclean wipeclean distclean

# CORE VARIABLES

MODULE := ec2
VERSION := 0.44
CONFIG := release
ifndef COMPILER
COMPILER := default
endif

TARGET_TYPE = sharedlib

# FLAGS

ECFLAGS =
ifndef DEBIAN_PACKAGE

_CPPFLAGS := $(CPPFLAGS)
override CPPFLAGS = $(_CPPFLAGS)

_CFLAGS := $(CFLAGS)
override CFLAGS = $(_CFLAGS)

_CXXFLAGS := $(CXXFLAGS)
override CXXFLAGS = $(_CXXFLAGS)

_LDFLAGS := $(LDFLAGS)
override LDFLAGS = $(_LDFLAGS)


_OWFLAGS := $(OWFLAGS)
override OWFLAGS = $(_OWFLAGS)

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

_CF_DIR = ../../

include $(_CF_DIR)crossplatform.mk
include $(_CF_DIR)default.cf

# POST-INCLUDES VARIABLES

OBJ = obj/$(CONFIG).$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/

RES =

TARGET = $(OBJ)$(LP)ec2$(OUT)

_ECSOURCES = \
	src/lexing.ec \
	src/expressions.ec \
	src/statements.ec \
	src/declarators.ec \
	src/specifiers.ec \
	src/classes.ec \
	src/externals.ec \
	src/astNode.ec

ECSOURCES = $(call shwspace,$(_ECSOURCES))

_COBJECTS = $(addprefix $(OBJ),$(patsubst %.ec,%$(C),$(notdir $(_ECSOURCES))))
_SYMBOLS = $(addprefix $(OBJ),$(patsubst %.ec,%$(S),$(notdir $(_ECSOURCES))))
_IMPORTS = $(addprefix $(OBJ),$(patsubst %.ec,%$(I),$(notdir $(_ECSOURCES))))
_ECOBJECTS = $(addprefix $(OBJ),$(patsubst %.ec,%$(O),$(notdir $(_ECSOURCES))))
_BOWLS = $(addprefix $(OBJ),$(patsubst %.ec,%$(B),$(notdir $(_ECSOURCES))))

COBJECTS = $(call shwspace,$(_COBJECTS))
SYMBOLS = $(call shwspace,$(_SYMBOLS))
IMPORTS = $(call shwspace,$(_IMPORTS))
ECOBJECTS = $(call shwspace,$(_ECOBJECTS))
BOWLS = $(call shwspace,$(_BOWLS))

OBJECTS = $(ECOBJECTS) $(OBJ)$(MODULE).main$(O)

SOURCES = $(ECSOURCES)

RESOURCES =

LIBS += $(SHAREDLIB) $(EXECUTABLE) $(LINKOPT)

ifndef STATIC_LIBRARY_TARGET
LIBS += \
	$(call _L,ecere)
OFLAGS += $(if $(ENABLE_PYTHON_RPATHS),-Wl$(comma)-rpath='$$ORIGIN',)
OFLAGS += $(RPATHS_FOR_PORTABLE_BINARIES)
endif

PRJ_CFLAGS += \
	 $(if $(DEBUG), -g, -O2 -ffast-math) $(FPIC) -Wall

ECFLAGS += -module $(MODULE)
ECFLAGS += \
	 -nolinenumbers

CECFLAGS += -cpp $(_CPP)

ifndef STATIC_LIBRARY_TARGET
OFLAGS += \
	 -L$(call quote_path,../../obj/$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/bin) \
	 -L$(call quote_path,../../obj/$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/lib)
endif

# TARGETS

all: objdir $(TARGET)

objdir:
	$(if $(wildcard $(OBJ)),,$(call mkdir,$(OBJ)))

$(OBJ)$(MODULE).main.ec: $(SYMBOLS) $(COBJECTS)
	$(ECS) $(ARCH_FLAGS) $(ECSLIBOPT) $(SYMBOLS) $(IMPORTS) -symbols obj/$(CONFIG).$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX) -o $(call quote_path,$@)

$(OBJ)$(MODULE).main.c: $(OBJ)$(MODULE).main.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,$<) -o $(OBJ)$(MODULE).main.sym -symbols $(OBJ)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(call quote_path,$<) -o $(call quote_path,$@) -symbols $(OBJ)

$(SYMBOLS): | objdir
$(OBJECTS): | objdir
$(TARGET): $(SOURCES) $(RESOURCES) $(SYMBOLS) $(OBJECTS) | objdir
ifndef STATIC_LIBRARY_TARGET
	$(CC) $(OFLAGS) $(OBJECTS) $(LIBS) -o $(TARGET) $(INSTALLNAME) $(SONAME)
ifndef NOSTRIP
	$(STRIP) $(STRIPOPT) $(TARGET)
endif
else
	$(AR) rcs $(TARGET) $(OBJECTS) $(LIBS)
endif
	$(call cp,$(TARGET),../../$(SODESTDIR))
	$(if $(CROSS_TARGET_WIN_BOOTSTRAP),$(call cp,$(TARGET),../../compiler/bootstrap/obj/bin.$(HOST_PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/),)
	$(if SO_LIB_LINKS,$(if $(VER_MAJ),ln -sf $(LP)$(MODULE)$(OUT) ../../$(SODESTDIR)$(LP)$(MODULE)$(SO)$(VER_MAJ),),)
	$(if SO_LIB_LINKS,$(if $(VER),ln -sf $(LP)$(MODULE)$(OUT) ../../$(SODESTDIR)$(LP)$(MODULE)$(SO),),)
	$(if SO_LIB_LINKS,$(if $(VER_MAJ),ln -sf $(LP)$(MODULE)$(OUT) $(OBJ)$(LP)$(MODULE)$(SO)$(VER_MAJ),),)
	$(if SO_LIB_LINKS,$(if $(VER),ln -sf $(LP)$(MODULE)$(OUT) $(OBJ)$(LP)$(MODULE)$(SO),),)

# SYMBOL RULES

$(OBJ)lexing.sym: src/lexing.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,$<) -o $(call quote_path,$@)

$(OBJ)expressions.sym: src/expressions.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,$<) -o $(call quote_path,$@)

$(OBJ)statements.sym: src/statements.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,$<) -o $(call quote_path,$@)

$(OBJ)declarators.sym: src/declarators.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,$<) -o $(call quote_path,$@)

$(OBJ)specifiers.sym: src/specifiers.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,$<) -o $(call quote_path,$@)

$(OBJ)classes.sym: src/classes.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,$<) -o $(call quote_path,$@)

$(OBJ)externals.sym: src/externals.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,$<) -o $(call quote_path,$@)

$(OBJ)astNode.sym: src/astNode.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,$<) -o $(call quote_path,$@)

# C OBJECT RULES

$(OBJ)lexing.c: src/lexing.ec $(OBJ)lexing.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(call quote_path,$<) -o $(call quote_path,$@) -symbols $(OBJ)

$(OBJ)expressions.c: src/expressions.ec $(OBJ)expressions.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(call quote_path,$<) -o $(call quote_path,$@) -symbols $(OBJ)

$(OBJ)statements.c: src/statements.ec $(OBJ)statements.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(call quote_path,$<) -o $(call quote_path,$@) -symbols $(OBJ)

$(OBJ)declarators.c: src/declarators.ec $(OBJ)declarators.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(call quote_path,$<) -o $(call quote_path,$@) -symbols $(OBJ)

$(OBJ)specifiers.c: src/specifiers.ec $(OBJ)specifiers.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(call quote_path,$<) -o $(call quote_path,$@) -symbols $(OBJ)

$(OBJ)classes.c: src/classes.ec $(OBJ)classes.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(call quote_path,$<) -o $(call quote_path,$@) -symbols $(OBJ)

$(OBJ)externals.c: src/externals.ec $(OBJ)externals.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(call quote_path,$<) -o $(call quote_path,$@) -symbols $(OBJ)

$(OBJ)astNode.c: src/astNode.ec $(OBJ)astNode.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(call quote_path,$<) -o $(call quote_path,$@) -symbols $(OBJ)

# OBJECT RULES

$(OBJ)lexing$(O): $(OBJ)lexing.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(call quote_path,$<) -o $(call quote_path,$@)

$(OBJ)expressions$(O): $(OBJ)expressions.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(call quote_path,$<) -o $(call quote_path,$@)

$(OBJ)statements$(O): $(OBJ)statements.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(call quote_path,$<) -o $(call quote_path,$@)

$(OBJ)declarators$(O): $(OBJ)declarators.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(call quote_path,$<) -o $(call quote_path,$@)

$(OBJ)specifiers$(O): $(OBJ)specifiers.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(call quote_path,$<) -o $(call quote_path,$@)

$(OBJ)classes$(O): $(OBJ)classes.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(call quote_path,$<) -o $(call quote_path,$@)

$(OBJ)externals$(O): $(OBJ)externals.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(call quote_path,$<) -o $(call quote_path,$@)

$(OBJ)astNode$(O): $(OBJ)astNode.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(call quote_path,$<) -o $(call quote_path,$@)

$(OBJ)$(MODULE).main$(O): $(OBJ)$(MODULE).main.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(call quote_path,$<) -o $(call quote_path,$@)

cleantarget:
	$(call rm,$(OBJ)$(MODULE).main$(O) $(OBJ)$(MODULE).main.c $(OBJ)$(MODULE).main.ec $(OBJ)$(MODULE).main$(I) $(OBJ)$(MODULE).main$(S))
	$(call rm,$(TARGET))
	$(if SO_LIB_LINKS,$(call rm,$(OBJ)$(LP)$(MODULE)$(SO)$(VER_MAJ)),)
	$(if SO_LIB_LINKS,$(call rm,$(OBJ)$(LP)$(MODULE)$(SO)),)

clean: cleantarget
	$(call rm,$(_OBJECTS))
	$(call rm,$(_ECOBJECTS))
	$(call rm,$(_COBJECTS))
	$(call rm,$(_BOWLS))
	$(call rm,$(_IMPORTS))
	$(call rm,$(_SYMBOLS))

realclean: cleantarget
	$(call rmr,$(OBJ))

wipeclean:
	$(call rmr,obj/)

distclean:
	$(_MAKE) -f $(_CF_DIR)Cleanfile distclean distclean_all_subdirs

$(MAKEFILE_LIST): ;
$(SOURCES): ;
$(RESOURCES): ;
