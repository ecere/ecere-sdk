# makefiles.Makefile

ifneq ($(V),1)
.SILENT:
endif

ROOT_ABSPATH := $(dir $(realpath $(firstword $(MAKEFILE_LIST))))
_CF_DIR = $(ROOT_ABSPATH)

include crossplatform.mk
include default.cf

OBJ = obj/misc/

OBJDIR := obj$(OBJALT)/
OBJBINDIR := $(OBJDIR)$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/bin/
OBJLIBDIR := $(OBJDIR)$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/lib/

MELD := C:\z\start-meld.bat

E2M := $(OBJBINDIR)epj2make$(E)
E2M_FLAGS := -noglobalsettings -includecf $$(_CF_DIR)default.cf

# complete list of all the makefiles?

      # Makefile
      # deps/Makefile
      # compiler/Makefile
      # compiler/bootstrap/Makefile
      # eda/Makefile
      # ear/Makefile

_ALL_GENERATABLE_TARBALL_MAKEFILES := \
      deps/curl-7.51.0/Makefile \
      deps/freetype-2.3.12/Makefile \
      deps/jpeg-9a/Makefile \
      deps/libffi-3.0.11/Makefile \
      deps/libpng-1.6.12/Makefile \
      deps/libungif-4.1.1/Makefile \
      deps/zlib-1.2.8/Makefile \
      compiler/bootstrap/ecc/Makefile \
      compiler/bootstrap/ecere/Makefile \
      compiler/bootstrap/ecp/Makefile \
      compiler/bootstrap/ecs/Makefile \
      compiler/bootstrap/libec/Makefile \
      compiler/ecc/Makefile.bootstrap \
      compiler/ecp/Makefile.bootstrap \
      compiler/ecs/Makefile.bootstrap \
      compiler/libec/Makefile.bootstrap \
      compiler/ecc/Makefile \
      compiler/ecp/Makefile \
      compiler/ecs/Makefile \
      compiler/libec/Makefile \
      compiler/libec2/Makefile \
      ecere/Makefile \
      ecere/Makefile.bootstrap \
      ecere/Makefile.ecereCOM \
      ecere/Makefile.vanilla \
      eda/drivers/sqlite/Makefile \
      eda/drivers/sqliteCipher/Makefile \
      eda/libeda/Makefile \
      audio/Makefile \
      ear/cmd/Makefile \
      ear/extract/Makefile \
      epj2make/Makefile \
      bgen/Makefile \
      documentor/Makefile \
      ide/Makefile \
      installer/Makefile \

.PHONY: all
all: objdir
all: $(OUTPUT_MAKEFILES)
	@$(call echo,Generation completed.)

.PHONY: objdir
objdir:
	$(if $(wildcard $(OBJ)),,$(call mkdir,$(OBJ)))

.PHONY: clean
clean:
	@$(call rm,$(OUTPUT_MAKEFILES))

.PHONY: realclean
realclean: clean
	@$(call rm,$(OBJ)original.concat)
	@$(call rm,$(OBJ)generated.concat)

UNWANTED_EPJS := \
      compiler/ecs/CleanPo.epj \
		compiler/libec2/rdParser.epj \
		ear/cmd/emEar.epj \
		eda/drivers/sqlite/SQLiteShellCmd.epj \
		eda/drivers/sqliteCipher/SQLiteCipherShellCmd.epj

nix_double_space = $(subst $(space)$(space),$(space),$1)
_single_space = $(subst $(space)$(space),$(space),$(subst $(space)$(space)$(space),$(space),$(subst $(space)$(space)$(space)$(space),$(space),$1)))
single_space = $(call nix_double_space,$(call _single_space,$(call _single_space,$1)))
get_originmf = $(subst $(CMP_DIR_GENERATED),,$(subst $(CMP_DIR_TARBALL),,$1))
get_cfdir = $(subst $(space),,$(foreach dir,$(subst /, ,$(dir $(call get_originmf,$1))),../))
get_makegenopt_file = $(call get_originmf,$1)-genconf.econ
get_config_name = $(if $(findstring bootstrap,$(notdir $1)),Bootstrap,$(if $(findstring .vanilla,$(notdir $1)),Vanilla,Release))
get_optional_unwanted_epj = $(if $(findstring .ecereCOM,$(notdir $1)),ecere/ecere.epj,ecere/ecereCOM.epj)
get_epj_search_dir = $(subst bootstrap/,,$(subst compiler/bootstrap/ecere/,ecere/,$(1)))
get_epj = $(filter-out $(UNWANTED_EPJS) $(call get_optional_unwanted_epj,$1),$(wildcard $(call get_epj_search_dir,$(dir $(call get_originmf,$1)))*.epj))

each_epj = $(foreach mkfl,$1,$(call get_epj,$(mkfl)))

CMP_DIR := ../../../b/ecere-sdk-makefiles/
CMP_DIR_TARBALL := $(CMP_DIR)tarball/
CMP_DIR_GENERATED := $(CMP_DIR)generated/
ALL_GENERATABLE_TARBALL_MAKEFILES := $(call nix_double_space,$(_ALL_GENERATABLE_TARBALL_MAKEFILES))
CMP_TARBALL_MAKEFILES := $(foreach mkfl,$(ALL_GENERATABLE_TARBALL_MAKEFILES),$(CMP_DIR_TARBALL)$(mkfl))
CMP_GENERATED_MAKEFILES := $(foreach mkfl,$(ALL_GENERATABLE_TARBALL_MAKEFILES),$(CMP_DIR_GENERATED)$(mkfl))
ALL_TARBALL_MAKEFILES_OPTIONFILES := $(foreach mkfl,$(ALL_GENERATABLE_TARBALL_MAKEFILES),$(call get_makegenopt_file,$(mkfl)))
ALL_TARBALL_MAKEFILES_EPJS := $(call each_epj,$(ALL_GENERATABLE_TARBALL_MAKEFILES))

#substring_epj_match = $(if $(findstring $(subst -,,$1),$(subst /,,$(call get_epj,$(mkfl)))),$(mkfl)$(info looking for $(subst -,,$1) in $(subst /,,$(mkfl)) or it's epj path $(subst /,,$(call get_epj,$(mkfl))) -- found),)
# good with info: substring_epj_match = $(if $(findstring $1,$(subst /,-,$(mkfl))),$(mkfl)$(info looking for $1 in $(subst /,-,$(mkfl)) or it's epj path $(subst /,-,$(call get_epj,$(mkfl))) -- found),)
substring_epj_match = $(if $(findstring $1,$(subst /,-,$(call get_epj,$(mkfl)))),$(mkfl),)
substring_epj_search = $(wildcard $(call single_space,$(foreach mkfl,$(ALL_GENERATABLE_TARBALL_MAKEFILES),$(call substring_epj_match,$1))))
single_epj_found = $(if $(firstword $(call substring_epj_search,$1)),$(if $(word 2,$(call substring_epj_search,$1)),,ok),)
substring_match = $(if $(findstring $1,$(subst /,-,$(mkfl))),$(mkfl),)
substring_makefile_search = $(wildcard $(call single_space,$(foreach mkfl,$(ALL_GENERATABLE_TARBALL_MAKEFILES),$(call substring_match,$1))))
substring_search = $(if $(call single_epj_found,$1),$(call substring_epj_search,$1),$(call substring_makefile_search,$1))
single_found = $(if $(firstword $(call substring_search,$1)),$(if $(word 2,$(call substring_search,$1)),,ok),)
#get_makefile_match = $(firstword $(call substring_epj_search,$1))
#get_favored = $(foreach res,$(1),$(if $(findstring .,$(res)),$(info found . in $(res)),$(info result $(res) is ok)$(res)))
get_favored = $(foreach res,$(1),$(if $(findstring .,$(res)),,$(res)))
get_makefile_match = $(if $(call get_favored,$(call substring_search,$1)),$(firstword $(call get_favored,$(call substring_search,$1))),$(firstword $(call substring_search,$1)))

.PHONY: compare
compare: compcopytarballmakefiles
compare: compgenerateinplace
#	$(MELD) $(CMP_DIR_TARBALL) $(CMP_DIR_GENERATED)
	@$(call echo,Compare folder ready.)

.PHONY: cleancompare
cleancompare:
	$(call rmr,$(CMP_DIR))
	@$(call echo,Cleaned $(CMP_DIR))

.PHONY: cmptarballdir
cmptarballdir:
	$(if $(wildcard $(CMP_DIR_TARBALL)),,$(call mkdir,$(CMP_DIR_TARBALL)))

.PHONY: cmpgenerateddir
cmpgenerateddir:
	$(if $(wildcard $(CMP_DIR_GENERATED)),,$(call mkdir,$(CMP_DIR_GENERATED)))

.PHONY: compcopytarballmakefiles
compcopytarballmakefiles: cmptarballdir
compcopytarballmakefiles: $(CMP_TARBALL_MAKEFILES)

.PHONY: compgenerateinplace
compgenerateinplace: cmpgenerateddir
compgenerateinplace:	$(CMP_GENERATED_MAKEFILES)

.PHONY: all-meld
all-meld:
	@$(MELD) $(CMP_DIR_TARBALL) $(CMP_DIR_GENERATED)

.PHONY: info-meld-%
info-meld-%:
	@$(call echo,$(MELD) $(call get_makefile_match,$*) $(CMP_DIR_GENERATED)$(call get_makefile_match,$*))

.PHONY: dbg-meld-%
meld-%:
	@$(call echo,meld command results: $(call substring_epj_search,$*))
	@$(call echo,meld command results: $(call substring_search,$*))
	@$(call echo,meld command finding: $(call get_makefile_match,$*) for $*)
#	$(if $(call substring_epj_search,$*),,$(error error: couldn't find a makefile to compare based on $* entry))
#	$(if $(call substring_search,$*),,$(error error: couldn't find a makefile to compare based on $* entry))
#	$(if $(call single_epj_found,$*),,$(warning warning: more than one match for $*: $(call each_epj,$(call substring_epj_search,$*))))
#	$(warning test: get_favored for $*: $(call get_favored,$(call substring_search,$*)))
#	$(warning test: get_makefile_match for $*: $(call get_makefile_match,$*))
	@$(call echo,$(call get_makefile_match,$*))
	@$(call echo,$(MELD) $(call get_makefile_match,$*) $(CMP_DIR_GENERATED)$(call get_makefile_match,$*))

.PHONY: meld-%
meld-%:
	$(if $(call substring_search,$*),,$(error error: couldn't find a makefile to compare based on $* entry))
# todo: we should keep this warning but only if get_favored returns more than one result
#	$(if $(call single_found,$*),,$(warning warning: more than one match for $*: $(call each_epj,$(call substring_search,$*))))
	@$(call echo,$(call get_makefile_match,$*))
	@$(MELD) $(call get_makefile_match,$*) $(CMP_DIR_GENERATED)$(call get_makefile_match,$*)

$(CMP_TARBALL_MAKEFILES): $(ALL_GENERATABLE_TARBALL_MAKEFILES)
	$(if $(wildcard $(dir $@)),,$(call mkdir,$(dir $@)))
#	@$(call echo,ok? $< to $(dir $@)) # $< also not working here, used to work in the beginning I think
	@$(call cp,$(call get_originmf,$@),$@)
#	@$(call echo,Copied $< to $(dir $@))
	@$(call echo,$@)

# warning: $< is always the first item in the ALL_GENERATABLE_TARBALL_MAKEFILES list
# warning: do not use $< in this generic rule
# note: should add assertion that get_epj will return a single .epj file
$(CMP_GENERATED_MAKEFILES): $(ALL_TARBALL_MAKEFILES_OPTIONFILES)
	$(if $(wildcard $(dir $@)),,$(call mkdir,$(dir $@)))
#	@$(call echo,ok? $< to $(dir $@)) # $< still not working
#	@$(call cp,makefiles.econ,$(call get_makegenopt_file,$@))
#	@$(call echo,cfdir $(call get_cfdir,$@) for $(call get_originmf,$@))
#	@$(call echo,genoptfile $(call get_makegenopt_file,$@) for $(call get_originmf,$@))
#	@$(call echo,$(call get_makegenopt_file,$@))
#	@$(call echo,config $(call get_config_name,$@) for $(call get_originmf,$@))
#	@$(call echo,output $@)
#	@$(call echo,epj $(call get_epj,$@) for $(call get_originmf,$@))
#	@$(call echo,$(E2M) -cfdir $(call get_cfdir,$@) -genoptfile $(call get_makegenopt_file,$@) -c $(call get_config_name,$@) $(E2M_FLAGS) -o $@ $(call get_epj,$@))
	@$(E2M) -cfdir $(call get_cfdir,$@) -genoptfile $(call get_makegenopt_file,$@) -c $(call get_config_name,$@) $(E2M_FLAGS) -o $@ $(call get_epj,$@)

$(MAKEFILE_LIST): ;
