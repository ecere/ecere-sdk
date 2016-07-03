.PHONY: all objdir cleantarget clean realclean distclean

# CORE VARIABLES

MODULE := ecs
CONFIG := release
ifndef COMPILER
COMPILER := default
endif

TARGET_TYPE = executable

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

CONSOLE = -mconsole

# INCLUDES

_CF_DIR = ../../
USE_BOOTSTRAP := defined

include $(_CF_DIR)crossplatform.mk
include $(_CF_DIR)default.cf

# POST-INCLUDES VARIABLES

OBJ = obj/$(CONFIG).$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/

RES = 

TARGET = obj/$(CONFIG).$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/ecs$(E)

_ECSOURCES = \
	ecs.ec

ECSOURCES = $(call shwspace,$(_ECSOURCES))

COBJECTS = $(call shwspace,$(addprefix $(OBJ),$(patsubst %.ec,%$(C),$(notdir $(_ECSOURCES)))))

SYMBOLS = $(call shwspace,$(addprefix $(OBJ),$(patsubst %.ec,%$(S),$(notdir $(_ECSOURCES)))))

IMPORTS = $(call shwspace,$(addprefix $(OBJ),$(patsubst %.ec,%$(I),$(notdir $(_ECSOURCES)))))

ECOBJECTS = $(call shwspace,$(addprefix $(OBJ),$(patsubst %.ec,%$(O),$(notdir $(_ECSOURCES)))))

BOWLS = $(call shwspace,$(addprefix $(OBJ),$(patsubst %.ec,%$(B),$(notdir $(_ECSOURCES)))))

OBJECTS = $(ECOBJECTS) $(OBJ)$(MODULE).main$(O)

SOURCES = $(ECSOURCES)

RESOURCES = \
	locale/es.mo \
	locale/he.mo \
	locale/pt_BR.mo \
	locale/ru.mo \
	locale/zh_CN.mo

LIBS += $(SHAREDLIB) $(EXECUTABLE) $(LINKOPT)

ifndef STATIC_LIBRARY_TARGET
LIBS += \
	$(call _L,ecere)
endif

PRJ_CFLAGS += \
	 $(if $(DEBUG), -g, -O2 -ffast-math) $(FPIC) -w

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
	$(ECS) -console $(ARCH_FLAGS) $(ECSLIBOPT) $(SYMBOLS) $(IMPORTS) -symbols obj/$(CONFIG).$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX) -o $(OBJ)$(MODULE).main.ec

$(OBJ)$(MODULE).main.c: $(OBJ)$(MODULE).main.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $(OBJ)$(MODULE).main.ec -o $(OBJ)$(MODULE).main.sym -symbols $(OBJ)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)$(MODULE).main.ec -o $(OBJ)$(MODULE).main.c -symbols $(OBJ)

$(SYMBOLS): | objdir
$(OBJECTS): | objdir
$(TARGET): $(SOURCES) $(RESOURCES) $(SYMBOLS) $(OBJECTS) | objdir
ifndef STATIC_LIBRARY_TARGET
	$(CC) $(OFLAGS) $(OBJECTS) $(LIBS) -o $(TARGET) $(INSTALLNAME)
ifndef NOSTRIP
	$(STRIP) $(STRIPOPT) $(TARGET)
endif
	$(EAR) aw$(EARFLAGS) $(TARGET) locale/es.mo locale/he.mo locale/pt_BR.mo locale/ru.mo locale/zh_CN.mo "locale"
else
	$(AR) rcs $(TARGET) $(OBJECTS) $(LIBS)
endif
	$(call cp,$(TARGET),../../obj/$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/bin/)

# SYMBOL RULES

$(OBJ)ecs.sym: ecs.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c ecs.ec -o $(OBJ)ecs.sym

# C OBJECT RULES

$(OBJ)ecs.c: ecs.ec $(OBJ)ecs.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c ecs.ec -o $(OBJ)ecs.c -symbols $(OBJ)

# OBJECT RULES

$(OBJ)ecs.o: $(OBJ)ecs.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)ecs.c -o $(OBJ)ecs.o

$(OBJ)$(MODULE).main$(O): $(OBJ)$(MODULE).main.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)$(MODULE).main.c -o $(OBJ)$(MODULE).main$(O)

cleantarget:
	$(call rm,$(OBJ)$(MODULE).main.o $(OBJ)$(MODULE).main.c $(OBJ)$(MODULE).main.ec $(OBJ)$(MODULE).main$(I) $(OBJ)$(MODULE).main$(S))
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

distclean:
	$(_MAKE) -f $(_CF_DIR)Cleanfile distclean distclean_all_subdirs

Makefile: ;
$(_CF_DIR)crossplatform.mk: ;
$(_CF_DIR)default.cf: ;
