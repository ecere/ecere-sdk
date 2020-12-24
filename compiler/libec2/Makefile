ifneq ($(V),1)
.SILENT:
endif

.PHONY: all objdir cleantarget clean realclean wipeclean distclean

# CORE VARIABLES

MODULE := ec2
VERSION :=
CONFIG := release
ifndef COMPILER
COMPILER := default
endif

TARGET_TYPE = sharedlib

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

_CF_DIR = ../../

include $(_CF_DIR)crossplatform.mk
include $(_CF_DIR)default.cf

# POST-INCLUDES VARIABLES

OBJ = obj/$(CONFIG).$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/

RES =

ifdef LINUX_TARGET
TARGET = obj/$(CONFIG).$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/$(LP)ec2$(SO).0.44
SONAME = -Wl,-soname,libec2.so.0
else
TARGET = obj/$(CONFIG).$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/$(LP)ec2$(SO)
SONAME =
endif


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

COBJECTS = $(call shwspace,$(addprefix $(OBJ),$(patsubst %.ec,%$(C),$(notdir $(_ECSOURCES)))))

SYMBOLS = $(call shwspace,$(addprefix $(OBJ),$(patsubst %.ec,%$(S),$(notdir $(_ECSOURCES)))))

IMPORTS = $(call shwspace,$(addprefix $(OBJ),$(patsubst %.ec,%$(I),$(notdir $(_ECSOURCES)))))

ECOBJECTS = $(call shwspace,$(addprefix $(OBJ),$(patsubst %.ec,%$(O),$(notdir $(_ECSOURCES)))))

BOWLS = $(call shwspace,$(addprefix $(OBJ),$(patsubst %.ec,%$(B),$(notdir $(_ECSOURCES)))))

_OBJECTS =

OBJECTS = $(_OBJECTS) $(ECOBJECTS) $(OBJ)$(MODULE).main$(O)

SOURCES = $(ECSOURCES)

RESOURCES =

LIBS += $(SHAREDLIB) $(EXECUTABLE) $(LINKOPT)

ifndef STATIC_LIBRARY_TARGET
LIBS += \
	$(call _L,ecere)
OFLAGS += $(if $(ENABLE_PYTHON_RPATHS),-Wl$(comma)-rpath='$$ORIGIN',)
endif

PRJ_CFLAGS += \
	 $(if $(DEBUG), -g, -O2 -ffast-math) $(FPIC) -Wall

CUSTOM1_PRJ_CFLAGS = \
			 -I../bootstrap/include \
	 $(PRJ_CFLAGS)

ECFLAGS += -module $(MODULE)
ECFLAGS += \
	 -nolinenumbers

CECFLAGS += -cpp $(_CPP)

ifndef STATIC_LIBRARY_TARGET
OFLAGS += \
	 -L../../obj/$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/bin \
	 -L../../obj/$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/lib
endif

# TARGETS

all: objdir $(TARGET)

objdir:
	$(call mkdir,$(OBJ))

$(OBJ)$(MODULE).main.ec: $(SYMBOLS) $(COBJECTS)
	$(ECS) $(ARCH_FLAGS) $(ECSLIBOPT) $(SYMBOLS) $(IMPORTS) -symbols obj/$(CONFIG).$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX) -o $(OBJ)$(MODULE).main.ec

$(OBJ)$(MODULE).main.c: $(OBJ)$(MODULE).main.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $(OBJ)$(MODULE).main.ec -o $(OBJ)$(MODULE).main.sym -symbols $(OBJ)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)$(MODULE).main.ec -o $(OBJ)$(MODULE).main.c -symbols $(OBJ)

$(SYMBOLS): | objdir
$(OBJECTS): | objdir
$(TARGET): $(SOURCES) $(RESOURCES) $(SYMBOLS) $(OBJECTS) | objdir
ifndef STATIC_LIBRARY_TARGET
	$(CC) $(OFLAGS) $(OBJECTS) $(LIBS) -o $(TARGET) $(SONAME) $(INSTALLNAME)
ifndef NOSTRIP
	$(STRIP) $(STRIPOPT) $(TARGET)
endif
else
	$(AR) rcs $(TARGET) $(OBJECTS) $(LIBS)
endif
	$(call cp,$(TARGET),../../$(SODESTDIR))
ifdef LINUX_TARGET
	ln -sf $(LP)$(MODULE)$(SO).0.44 $(OBJ)$(LP)$(MODULE)$(SO).0
	ln -sf $(LP)$(MODULE)$(SO).0.44 $(OBJ)$(LP)$(MODULE)$(SO)
	ln -sf $(LP)$(MODULE)$(SO).0.44 ../../$(SODESTDIR)$(LP)$(MODULE)$(SO).0
	ln -sf $(LP)$(MODULE)$(SO).0.44 ../../$(SODESTDIR)$(LP)$(MODULE)$(SO)
endif
ifdef WINDOWS_TARGET
ifndef CROSS_TARGET
	$(call cp,$(TARGET),../../compiler/bootstrap/obj/bin.$(HOST_PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/)
endif
endif

# SYMBOL RULES

$(OBJ)lexing.sym: $(srcdir)src/lexing.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,$<) -o $(call quote_path,$@)

$(OBJ)expressions.sym: $(srcdir)src/expressions.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,$<) -o $(call quote_path,$@)

$(OBJ)statements.sym: $(srcdir)src/statements.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,$<) -o $(call quote_path,$@)

$(OBJ)declarators.sym: $(srcdir)src/declarators.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,$<) -o $(call quote_path,$@)

$(OBJ)specifiers.sym: $(srcdir)src/specifiers.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,$<) -o $(call quote_path,$@)

$(OBJ)classes.sym: $(srcdir)src/classes.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,$<) -o $(call quote_path,$@)

$(OBJ)externals.sym: $(srcdir)src/externals.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,$<) -o $(call quote_path,$@)

$(OBJ)astNode.sym: $(srcdir)src/astNode.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,$<) -o $(call quote_path,$@)

# C OBJECT RULES

$(OBJ)lexing.c: $(srcdir)src/lexing.ec $(OBJ)lexing.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(call quote_path,$<) -o $(call quote_path,$@) -symbols $(OBJ)

$(OBJ)expressions.c: $(srcdir)src/expressions.ec $(OBJ)expressions.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(call quote_path,$<) -o $(call quote_path,$@) -symbols $(OBJ)

$(OBJ)statements.c: $(srcdir)src/statements.ec $(OBJ)statements.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(call quote_path,$<) -o $(call quote_path,$@) -symbols $(OBJ)

$(OBJ)declarators.c: $(srcdir)src/declarators.ec $(OBJ)declarators.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(call quote_path,$<) -o $(call quote_path,$@) -symbols $(OBJ)

$(OBJ)specifiers.c: $(srcdir)src/specifiers.ec $(OBJ)specifiers.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(call quote_path,$<) -o $(call quote_path,$@) -symbols $(OBJ)

$(OBJ)classes.c: $(srcdir)src/classes.ec $(OBJ)classes.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(call quote_path,$<) -o $(call quote_path,$@) -symbols $(OBJ)

$(OBJ)externals.c: $(srcdir)src/externals.ec $(OBJ)externals.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(call quote_path,$<) -o $(call quote_path,$@) -symbols $(OBJ)

$(OBJ)astNode.c: $(srcdir)src/astNode.ec $(OBJ)astNode.sym | $(SYMBOLS)
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
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)$(MODULE).main.c -o $(call quote_path,$@)

cleantarget:
	$(call rm,$(OBJ)$(MODULE).main$(O) $(OBJ)$(MODULE).main.c $(OBJ)$(MODULE).main.ec $(OBJ)$(MODULE).main$(I) $(OBJ)$(MODULE).main$(S))
	$(call rm,$(OBJ)symbols.lst)
	$(call rm,$(OBJ)objects.lst)
	$(call rm,$(TARGET))
ifdef SHARED_LIBRARY_TARGET
ifdef LINUX_TARGET
ifdef LINUX_HOST
	$(call rm,$(OBJ)$(LP)$(MODULE)$(SO)$(basename $(VER)))
	$(call rm,$(OBJ)$(LP)$(MODULE)$(SO))
endif
endif
endif

clean: cleantarget
	$(call rm,$(_OBJECTS))
	$(call rm,$(ECOBJECTS))
	$(call rm,$(COBJECTS))
	$(call rm,$(BOWLS))
	$(call rm,$(IMPORTS))
	$(call rm,$(SYMBOLS))

realclean: cleantarget
	$(call rmr,$(OBJ))

wipeclean:
	$(call rmr,obj/)

distclean:
	$(_MAKE) -f $(_CF_DIR)Cleanfile distclean distclean_all_subdirs

$(MAKEFILE_LIST): ;
$(SOURCES): ;
$(RESOURCES): ;
