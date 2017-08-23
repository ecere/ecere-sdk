.PHONY: all objdir cleantarget clean realclean distclean

# CORE VARIABLES

MODULE := bgen
VERSION := 
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

_CF_DIR = ../

include $(_CF_DIR)crossplatform.mk
include $(_CF_DIR)default.cf

# POST-INCLUDES VARIABLES

OBJ = obj/$(CONFIG).$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/

RES = 

TARGET = obj/$(CONFIG).$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/bgen$(E)

_ECSOURCES = \
	../extras/types/DynamicString.ec \
	extras/consoleApp.ec \
	../extras/ecom.ec \
	../extras/stringTools.ec \
	src/c/genC.ec \
	src/c/cHeader.ec \
	src/c/cCode.ec \
	src/cpp/genCPP.ec \
	src/cs/genCSharp.ec \
	src/java/genJava.ec \
	src/py/genPython.ec \
	src/py/pyTools.ec \
	src/bgen.ec \
	src/str.ec \
	src/out.ec \
	src/tmp.ec \
	src/econe.ec \
	src/ectwo.ec \
	src/gen.ec \
	src/debug.ec \
	src/miscTypes.ec

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

RESOURCES = \
	src/c/c_header_open.src \
	src/c/c_header_close.src \
	src/c/c_header_ec_macros.src \
	src/c/c_header_ec_hardcoded.src \
	src/c/c_header_ec_hardcoded_after.src \
	src/py/cffi_hardcode_ec_begin.src \
	src/py/cffi_hardcode_ec_end.src \
	src/py/py_functions_ec_begin.src \
	src/py/py_functions_ec_end.src \
	src/py/py_hardcode_application.src \
	src/py/py_hardcode_array.src \
	src/py/py_hardcode_container.src \
	src/py/py_hardcode_guiapplication.src \
	src/py/py_hardcode_module.src

ifdef USE_RESOURCES_EAR
RESOURCES_EAR = $(OBJ)resources.ear
else
RESOURCES_EAR = $(RESOURCES)
endif

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
	 -L../obj/$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/bin \
	 -L../obj/$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/lib
endif

# TARGETS

all: objdir $(TARGET)

objdir:
	$(call mkdir,$(OBJ))

$(OBJ)$(MODULE).main.ec: $(SYMBOLS) $(COBJECTS)
	$(ECS) -console $(ARCH_FLAGS) $(ECSLIBOPT) $(SYMBOLS) $(IMPORTS) -symbols obj/$(CONFIG).$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX) -o $(call quote_path,$@)

$(OBJ)$(MODULE).main.c: $(OBJ)$(MODULE).main.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $(OBJ)$(MODULE).main.ec -o $(OBJ)$(MODULE).main.sym -symbols $(OBJ)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)$(MODULE).main.ec -o $(call quote_path,$@) -symbols $(OBJ)

ifdef USE_RESOURCES_EAR
$(RESOURCES_EAR): $(RESOURCES) | objdir
	$(EAR) aw$(EARFLAGS) $(RESOURCES_EAR) src/c/c_header_open.src src/c/c_header_close.src src/c/c_header_ec_macros.src src/c/c_header_ec_hardcoded.src src/c/c_header_ec_hardcoded_after.src "src/c"
	$(EAR) aw$(EARFLAGS) $(RESOURCES_EAR) src/py/cffi_hardcode_ec_begin.src src/py/cffi_hardcode_ec_end.src src/py/py_functions_ec_begin.src src/py/py_functions_ec_end.src src/py/py_hardcode_application.src src/py/py_hardcode_array.src src/py/py_hardcode_container.src src/py/py_hardcode_guiapplication.src src/py/py_hardcode_module.src "src/py"
endif

$(SYMBOLS): | objdir
$(OBJECTS): | objdir
$(TARGET): $(SOURCES) $(RESOURCES_EAR) $(SYMBOLS) $(OBJECTS) | objdir
ifndef STATIC_LIBRARY_TARGET
	$(CC) $(OFLAGS) $(OBJ)$(MODULE).main$(O) $(ECOBJECTS) $(LIBS) -o $(TARGET) $(INSTALLNAME)
ifndef NOSTRIP
	$(STRIP) $(STRIPOPT) $(TARGET)
endif
ifndef USE_RESOURCES_EAR
	$(EAR) aw$(EARFLAGS) $(TARGET) src/c/c_header_open.src src/c/c_header_close.src src/c/c_header_ec_macros.src src/c/c_header_ec_hardcoded.src src/c/c_header_ec_hardcoded_after.src "src/c"
	$(EAR) aw$(EARFLAGS) $(TARGET) src/py/cffi_hardcode_ec_begin.src src/py/cffi_hardcode_ec_end.src src/py/py_functions_ec_begin.src src/py/py_functions_ec_end.src src/py/py_hardcode_application.src src/py/py_hardcode_array.src src/py/py_hardcode_container.src src/py/py_hardcode_guiapplication.src src/py/py_hardcode_module.src "src/py"
endif
else
ifdef WINDOWS_HOST
	$(AR) rcs $(TARGET) @$(OBJ)objects.lst $(LIBS)
else
	$(AR) rcs $(TARGET) $(OBJECTS) $(LIBS)
endif
endif
ifdef SHARED_LIBRARY_TARGET
ifdef LINUX_TARGET
ifdef LINUX_HOST
	$(if $(basename $(VER)),ln -sf $(LP)$(MODULE)$(SO)$(VER) $(OBJ)$(LP)$(MODULE)$(SO)$(basename $(VER)),)
	$(if $(VER),ln -sf $(LP)$(MODULE)$(SO)$(VER) $(OBJ)$(LP)$(MODULE)$(SO),)
endif
endif
endif
	$(call cp,$(TARGET),../obj/$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/bin/)

# SYMBOL RULES

$(OBJ)DynamicString.sym: ../extras/types/DynamicString.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,$<) -o $(call quote_path,$@)

$(OBJ)consoleApp.sym: extras/consoleApp.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,$<) -o $(call quote_path,$@)

$(OBJ)ecom.sym: ../extras/ecom.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,$<) -o $(call quote_path,$@)

$(OBJ)stringTools.sym: ../extras/stringTools.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,$<) -o $(call quote_path,$@)

$(OBJ)genC.sym: src/c/genC.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,$<) -o $(call quote_path,$@)

$(OBJ)cHeader.sym: src/c/cHeader.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,$<) -o $(call quote_path,$@)

$(OBJ)cCode.sym: src/c/cCode.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,$<) -o $(call quote_path,$@)

$(OBJ)genCPP.sym: src/cpp/genCPP.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,$<) -o $(call quote_path,$@)

$(OBJ)genCSharp.sym: src/cs/genCSharp.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,$<) -o $(call quote_path,$@)

$(OBJ)genJava.sym: src/java/genJava.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,$<) -o $(call quote_path,$@)

$(OBJ)genPython.sym: src/py/genPython.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,$<) -o $(call quote_path,$@)

$(OBJ)pyTools.sym: src/py/pyTools.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,$<) -o $(call quote_path,$@)

$(OBJ)bgen.sym: src/bgen.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,$<) -o $(call quote_path,$@)

$(OBJ)str.sym: src/str.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,$<) -o $(call quote_path,$@)

$(OBJ)out.sym: src/out.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,$<) -o $(call quote_path,$@)

$(OBJ)tmp.sym: src/tmp.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,$<) -o $(call quote_path,$@)

$(OBJ)econe.sym: src/econe.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,$<) -o $(call quote_path,$@)

$(OBJ)ectwo.sym: src/ectwo.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,$<) -o $(call quote_path,$@)

$(OBJ)gen.sym: src/gen.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,$<) -o $(call quote_path,$@)

$(OBJ)debug.sym: src/debug.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,$<) -o $(call quote_path,$@)

$(OBJ)miscTypes.sym: src/miscTypes.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,$<) -o $(call quote_path,$@)

# C OBJECT RULES

$(OBJ)DynamicString.c: ../extras/types/DynamicString.ec $(OBJ)DynamicString.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(call quote_path,$<) -o $(call quote_path,$@) -symbols $(OBJ)

$(OBJ)consoleApp.c: extras/consoleApp.ec $(OBJ)consoleApp.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(call quote_path,$<) -o $(call quote_path,$@) -symbols $(OBJ)

$(OBJ)ecom.c: ../extras/ecom.ec $(OBJ)ecom.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(call quote_path,$<) -o $(call quote_path,$@) -symbols $(OBJ)

$(OBJ)stringTools.c: ../extras/stringTools.ec $(OBJ)stringTools.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(call quote_path,$<) -o $(call quote_path,$@) -symbols $(OBJ)

$(OBJ)genC.c: src/c/genC.ec $(OBJ)genC.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(call quote_path,$<) -o $(call quote_path,$@) -symbols $(OBJ)

$(OBJ)cHeader.c: src/c/cHeader.ec $(OBJ)cHeader.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(call quote_path,$<) -o $(call quote_path,$@) -symbols $(OBJ)

$(OBJ)cCode.c: src/c/cCode.ec $(OBJ)cCode.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(call quote_path,$<) -o $(call quote_path,$@) -symbols $(OBJ)

$(OBJ)genCPP.c: src/cpp/genCPP.ec $(OBJ)genCPP.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(call quote_path,$<) -o $(call quote_path,$@) -symbols $(OBJ)

$(OBJ)genCSharp.c: src/cs/genCSharp.ec $(OBJ)genCSharp.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(call quote_path,$<) -o $(call quote_path,$@) -symbols $(OBJ)

$(OBJ)genJava.c: src/java/genJava.ec $(OBJ)genJava.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(call quote_path,$<) -o $(call quote_path,$@) -symbols $(OBJ)

$(OBJ)genPython.c: src/py/genPython.ec $(OBJ)genPython.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(call quote_path,$<) -o $(call quote_path,$@) -symbols $(OBJ)

$(OBJ)pyTools.c: src/py/pyTools.ec $(OBJ)pyTools.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(call quote_path,$<) -o $(call quote_path,$@) -symbols $(OBJ)

$(OBJ)bgen.c: src/bgen.ec $(OBJ)bgen.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(call quote_path,$<) -o $(call quote_path,$@) -symbols $(OBJ)

$(OBJ)str.c: src/str.ec $(OBJ)str.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(call quote_path,$<) -o $(call quote_path,$@) -symbols $(OBJ)

$(OBJ)out.c: src/out.ec $(OBJ)out.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(call quote_path,$<) -o $(call quote_path,$@) -symbols $(OBJ)

$(OBJ)tmp.c: src/tmp.ec $(OBJ)tmp.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(call quote_path,$<) -o $(call quote_path,$@) -symbols $(OBJ)

$(OBJ)econe.c: src/econe.ec $(OBJ)econe.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(call quote_path,$<) -o $(call quote_path,$@) -symbols $(OBJ)

$(OBJ)ectwo.c: src/ectwo.ec $(OBJ)ectwo.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(call quote_path,$<) -o $(call quote_path,$@) -symbols $(OBJ)

$(OBJ)gen.c: src/gen.ec $(OBJ)gen.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(call quote_path,$<) -o $(call quote_path,$@) -symbols $(OBJ)

$(OBJ)debug.c: src/debug.ec $(OBJ)debug.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(call quote_path,$<) -o $(call quote_path,$@) -symbols $(OBJ)

$(OBJ)miscTypes.c: src/miscTypes.ec $(OBJ)miscTypes.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(call quote_path,$<) -o $(call quote_path,$@) -symbols $(OBJ)

# OBJECT RULES

$(OBJ)DynamicString$(O): $(OBJ)DynamicString.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(call quote_path,$<) -o $(call quote_path,$@)

$(OBJ)consoleApp$(O): $(OBJ)consoleApp.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(call quote_path,$<) -o $(call quote_path,$@)

$(OBJ)ecom$(O): $(OBJ)ecom.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(call quote_path,$<) -o $(call quote_path,$@)

$(OBJ)stringTools$(O): $(OBJ)stringTools.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(call quote_path,$<) -o $(call quote_path,$@)

$(OBJ)genC$(O): $(OBJ)genC.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(call quote_path,$<) -o $(call quote_path,$@)

$(OBJ)cHeader$(O): $(OBJ)cHeader.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(call quote_path,$<) -o $(call quote_path,$@)

$(OBJ)cCode$(O): $(OBJ)cCode.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(call quote_path,$<) -o $(call quote_path,$@)

$(OBJ)genCPP$(O): $(OBJ)genCPP.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(call quote_path,$<) -o $(call quote_path,$@)

$(OBJ)genCSharp$(O): $(OBJ)genCSharp.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(call quote_path,$<) -o $(call quote_path,$@)

$(OBJ)genJava$(O): $(OBJ)genJava.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(call quote_path,$<) -o $(call quote_path,$@)

$(OBJ)genPython$(O): $(OBJ)genPython.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(call quote_path,$<) -o $(call quote_path,$@)

$(OBJ)pyTools$(O): $(OBJ)pyTools.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(call quote_path,$<) -o $(call quote_path,$@)

$(OBJ)bgen$(O): $(OBJ)bgen.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(call quote_path,$<) -o $(call quote_path,$@)

$(OBJ)str$(O): $(OBJ)str.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(call quote_path,$<) -o $(call quote_path,$@)

$(OBJ)out$(O): $(OBJ)out.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(call quote_path,$<) -o $(call quote_path,$@)

$(OBJ)tmp$(O): $(OBJ)tmp.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(call quote_path,$<) -o $(call quote_path,$@)

$(OBJ)econe$(O): $(OBJ)econe.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(call quote_path,$<) -o $(call quote_path,$@)

$(OBJ)ectwo$(O): $(OBJ)ectwo.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(call quote_path,$<) -o $(call quote_path,$@)

$(OBJ)gen$(O): $(OBJ)gen.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(call quote_path,$<) -o $(call quote_path,$@)

$(OBJ)debug$(O): $(OBJ)debug.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(call quote_path,$<) -o $(call quote_path,$@)

$(OBJ)miscTypes$(O): $(OBJ)miscTypes.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(call quote_path,$<) -o $(call quote_path,$@)

$(OBJ)$(MODULE).main$(O): $(OBJ)$(MODULE).main.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)$(MODULE).main.c -o $(call quote_path,$@)

cleantarget:
	$(call rm,$(OBJ)$(MODULE).main$(O) $(OBJ)$(MODULE).main.c $(OBJ)$(MODULE).main.ec $(OBJ)$(MODULE).main$(I) $(OBJ)$(MODULE).main$(S))
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
	$(call rm,$(_ECOBJECTS))
	$(call rm,$(_COBJECTS))
	$(call rm,$(_BOWLS))
	$(call rm,$(_IMPORTS))
	$(call rm,$(_SYMBOLS))
ifdef USE_RESOURCES_EAR
	$(call rm,$(RESOURCES_EAR))
endif

realclean: cleantarget
	$(call rmr,$(OBJ))

distclean:
	$(_MAKE) -f $(_CF_DIR)Cleanfile distclean distclean_all_subdirs

Makefile: ;
$(_CF_DIR)crossplatform.mk: ;
$(_CF_DIR)default.cf: ;
