.PHONY: all clean realclean distclean emptyoutput prepinstall actualinstall install copyonlyinstall uninstall troubleshoot outputdirs bootstrap deps ecere ecerecom ecerevanilla ear compiler prepbinaries epj2make ide documentor eda prepcodeguard codeguard
.SILENT:

include crossplatform.mk
include default.cf

ifdef BSD_HOST
INSTALL_FLAGS :=
CPFLAGS := -pRf
else
INSTALL_FLAGS := -D
CPFLAGS := -dpRf
endif

XBOOT := $(if $(CROSS_TARGET),GCC_PREFIX= TARGET_PLATFORM=$(HOST_PLATFORM) PLATFORM=$(HOST_PLATFORM),)

LIBVER := .0.44

ifdef WINDOWS_HOST
HOST_SOV := $(HOST_SO)
else
HOST_SOV := $(HOST_SO)$(LIBVER)
endif

ifdef WINDOWS_TARGET

SOV := $(SO)

ifndef DESTDIR

ifdef ProgramFiles(x86)
export DESTDIR=${ProgramFiles(x86)}/Ecere SDK
else
ifdef ProgramFiles
export DESTDIR=$(ProgramFiles)/Ecere SDK
else
export DESTDIR=$(SystemDrive)/Ecere SDK
endif
endif

endif # DESTDIR

export prefix=

ifndef DOCDIR
export DOCDIR=$(DESTDIR)$(prefix)/doc
endif

ifndef BINDIR
export BINDIR=$(DESTDIR)$(prefix)/bin
endif

ifndef LIBDIR
export LIBDIR=$(BINDIR)
endif
export DESTLIBDIR=$(LIBDIR)

ifndef SLIBDIR
export SLIBDIR=$(DESTDIR)$(prefix)/lib
endif
export DESTSLIBDIR=$(SLIBDIR)

ifndef SAMPLESDIR
export SAMPLESDIR=$(DESTDIR)$(prefix)/samples
endif

ifndef EXTRASDIR
export EXTRASDIR=$(DESTDIR)$(prefix)/extras
endif


else # WINDOWS_TARGET

ifdef OSX_TARGET
# TODO: OSX soname
SOV := $(SO)
else
SOV := $(SO)$(LIBVER)
endif

ifndef DESTDIR
export DESTDIR=
endif

ifndef prefix
export prefix=/usr
endif

ifndef DOCDIR
export DOCDIR=$(DESTDIR)$(prefix)/share/ecere/doc
endif

ifndef MANDIR
export MANDIR=$(DESTDIR)$(prefix)/share/man/
endif

ifndef BINDIR
export BINDIR=$(DESTDIR)$(prefix)/bin
endif

HOSTTYPE := $(shell uname -m)

ifdef LIBDIR
export PREFIXLIBDIR=$(LIBDIR)
else

ifeq "$(HOSTTYPE)" "x86_64"
ifdef OSX_HOST
export PREFIXLIBDIR=$(prefix)/lib
else
export PREFIXLIBDIR=$(prefix)/lib32
endif
else
export PREFIXLIBDIR=$(prefix)/lib
endif

endif

DESTLIBDIR := $(DESTDIR)$(PREFIXLIBDIR)
ifdef SLIBDIR
DESTSLIBDIR := $(DESTDIR)$(SLIBDIR)
else
DESTSLIBDIR := $(DESTLIBDIR)
endif

ifndef SAMPLESDIR
export SAMPLESDIR=$(DESTDIR)$(prefix)/share/ecere/samples
endif

ifndef EXTRASDIR
export EXTRASDIR=$(DESTDIR)$(prefix)/share/ecere/extras
endif


endif

OBJDIR := obj$(OBJALT)/
OBJBINDIR := $(OBJDIR)$(PLATFORM)/bin/
OBJLIBDIR := $(OBJDIR)$(PLATFORM)/lib/
XOBJDIR := obj$(OBJALT)/
XOBJBINDIR := $(OBJDIR)$(HOST_PLATFORM)/bin/
XOBJLIBDIR := $(OBJDIR)$(HOST_PLATFORM)/lib/

all: prepbinaries ide epj2make documentor eda codeguard
	@$(call echo,The Ecere SDK is fully built.)

outputdirs:
	$(if $(wildcard $(OBJDIR)),,$(call mkdirq,$(OBJDIR)))
	$(if $(wildcard $(OBJBINDIR)),,$(call mkdirq,$(OBJBINDIR)))
	$(if $(wildcard $(OBJLIBDIR)),,$(call mkdirq,$(OBJLIBDIR)))
ifdef CROSS_TARGET
	$(if $(wildcard $(XOBJDIR)),,$(call mkdirq,$(XOBJDIR)))
	$(if $(wildcard $(XOBJBINDIR)),,$(call mkdirq,$(XOBJBINDIR)))
	$(if $(wildcard $(XOBJLIBDIR)),,$(call mkdirq,$(XOBJLIBDIR)))
endif

bootstrap: outputdirs
	cd compiler && $(MAKE) $(XBOOT) bootstrap

deps:
ifdef CROSS_TARGET
	@$(call echo,Building dependencies (host)...)
	cd deps && $(MAKE) $(XBOOT)
endif
	@$(call echo,Building dependencies...)
	cd deps && $(MAKE)

ecere: bootstrap deps
ifdef CROSS_TARGET
	@$(call echo,Building 2nd stage ecere (host)...)
else
	@$(call echo,Building 2nd stage ecere...)
endif
	cd ecere && $(MAKE) nores $(XBOOT)
	cd ear && $(MAKE) nores $(XBOOT)
	cd ecere && $(MAKE) cleantarget
ifdef CROSS_TARGET
	@$(call echo,Building 2nd stage ecere...)
endif
	cd ecere && $(MAKE)

ecerecom: bootstrap
ifdef CROSS_TARGET
	@$(call echo,Building eC Core Runtime (host)...)
	cd ecere && $(MAKE) -f Makefile.ecereCOM $(XBOOT)
endif
	@$(call echo,Building eC Core Runtime...)
	cd ecere && $(MAKE) -f Makefile.ecereCOM

ecerevanilla: bootstrap
	@$(call echo,Building Vanilla Ecere...)
	cd ecere && $(MAKE) -f Makefile.vanilla

ear: ecere ecerevanilla
	@$(call echo,Building ear...)
	cd ear && cd cmd && $(MAKE) cleantarget
	cd ear && $(MAKE)

compiler: ecere ear
ifdef CROSS_TARGET
	@$(call echo,Building 2nd stage compiler (host))
	cd compiler && $(MAKE) $(XBOOT)
endif
	@$(call echo,Building 2nd stage compiler)
	cd compiler && $(MAKE)

prepbinaries: compiler ecerecom
	@$(call echo,Enabling 2nd stage binaries...)
ifdef WINDOWS_TARGET
	$(call cpq,ecere/obj/release.$(PLATFORM)/$(LP)ecere$(SOV),$(OBJBINDIR))
	$(call cpq,ecere/obj/ecereCOM.release.$(PLATFORM)/$(LP)ecereCOM$(SOV),$(OBJBINDIR))
	$(call cpq,compiler/libec/obj/release.$(PLATFORM)/$(LP)ec$(SOV),$(OBJBINDIR))
endif
ifdef LINUX_TARGET
	$(call cpq,ecere/obj/release.$(PLATFORM)/$(LP)ecere$(SOV),$(OBJLIBDIR))
	$(call cpq,ecere/obj/ecereCOM.release.$(PLATFORM)/$(LP)ecereCOM$(SOV),$(OBJLIBDIR))
	$(call cpq,compiler/libec/obj/release.$(PLATFORM)/$(LP)ec$(SOV),$(OBJLIBDIR))
	ln -sf $(LP)ecere$(SOV) $(OBJLIBDIR)$(LP)ecere$(SO).0
	ln -sf $(LP)ecereCOM$(SOV) $(OBJLIBDIR)$(LP)ecereCOM$(SO).0
	ln -sf $(LP)ec$(SOV) $(OBJLIBDIR)$(LP)ec$(SO).0
	ln -sf $(LP)ecere$(SOV) $(OBJLIBDIR)$(LP)ecere$(SO)
	ln -sf $(LP)ecereCOM$(SOV) $(OBJLIBDIR)$(LP)ecereCOM$(SO)
	ln -sf $(LP)ec$(SOV) $(OBJLIBDIR)$(LP)ec$(SO)
endif
ifndef WINDOWS_TARGET
ifndef LINUX_TARGET
	$(call cpq,ecere/obj/release.$(PLATFORM)/$(LP)ecere$(SO),$(OBJLIBDIR))
	$(call cpq,ecere/obj/ecereCOM.release.$(PLATFORM)/$(LP)ecereCOM$(SO),$(OBJLIBDIR))
	$(call cpq,compiler/libec/obj/release.$(PLATFORM)/$(LP)ec$(SO),$(OBJLIBDIR))
endif
endif
	$(call cpq,ear/cmd/obj/release.$(PLATFORM)/ear$(E),$(OBJBINDIR))
	$(call cpq,compiler/ecc/obj/release.$(PLATFORM)/ecc$(E),$(OBJBINDIR))
	$(call cpq,compiler/ecp/obj/release.$(PLATFORM)/ecp$(E),$(OBJBINDIR))
	$(call cpq,compiler/ecs/obj/release.$(PLATFORM)/ecs$(E),$(OBJBINDIR))

ifdef CROSS_TARGET

ifdef WINDOWS_HOST
	$(call cpq,ecere/obj/release.$(HOST_PLATFORM)/$(HOST_LP)ecere$(HOST_SOV),$(XOBJBINDIR))
	$(call cpq,ecere/obj/ecereCOM.release.$(HOST_PLATFORM)/$(HOST_LP)ecereCOM$(HOST_SOV),$(XOBJBINDIR))
	$(call cpq,compiler/libec/obj/release.$(HOST_PLATFORM)/$(HOST_LP)ec$(HOST_SOV),$(XOBJBINDIR))
endif
ifdef WINDOWS_HOST
	$(call cpq,ecere/obj/release.$(HOST_PLATFORM)/$(HOST_LP)ecere$(HOST_SOV),$(XOBJLIBDIR))
	$(call cpq,ecere/obj/ecereCOM.release.$(HOST_PLATFORM)/$(HOST_LP)ecereCOM$(HOST_SOV),$(XOBJLIBDIR))
	$(call cpq,compiler/libec/obj/release.$(HOST_PLATFORM)/$(HOST_LP)ec$(HOST_SOV),$(XOBJLIBDIR))
	ln -sf $(HOST_LP)ecere$(HOST_SOV) $(XOBJLIBDIR)$(LP)ecere$(HOST_SO).0
	ln -sf $(HOST_LP)ecereCOM$(HOST_SOV) $(XOBJLIBDIR)$(LP)ecereCOM$(HOST_SO).0
	ln -sf $(HOST_LP)ec$(HOST_SOV) $(XOBJLIBDIR)$(LP)ec$(HOST_SO).0
	ln -sf $(HOST_LP)ecere$(HOST_SOV) $(XOBJLIBDIR)$(LP)ecere$(HOST_SO)
	ln -sf $(HOST_LP)ecereCOM$(HOST_SOV) $(XOBJLIBDIR)$(LP)ecereCOM$(HOST_SO)
	ln -sf $(HOST_LP)ec$(HOST_SOV) $(XOBJLIBDIR)$(LP)ec$(HOST_SO)
endif
ifndef WINDOWS_HOST
ifndef LINUX_HOST
	$(call cpq,ecere/obj/release.$(HOST_PLATFORM)/$(HOST_LP)ecere$(HOST_SO),$(XOBJLIBDIR))
	$(call cpq,ecere/obj/ecereCOM.release.$(HOST_PLATFORM)/$(HOST_LP)ecereCOM$(HOST_SO),$(XOBJLIBDIR))
	$(call cpq,compiler/libec/obj/release.$(HOST_PLATFORM)/$(HOST_LP)ec$(HOST_SO),$(XOBJLIBDIR))
endif
endif
	$(call cpq,ear/cmd/obj/release.$(HOST_PLATFORM)/ear$(HOST_E),$(XOBJBINDIR))
	$(call cpq,compiler/ecc/obj/release.$(HOST_PLATFORM)/ecc$(HOST_E),$(XOBJBINDIR))
	$(call cpq,compiler/ecp/obj/release.$(HOST_PLATFORM)/ecp$(HOST_E),$(XOBJBINDIR))
	$(call cpq,compiler/ecs/obj/release.$(HOST_PLATFORM)/ecs$(HOST_E),$(XOBJBINDIR))

endif

epj2make: prepbinaries
	@$(call echo,Building epj2make...)
	cd epj2make && $(MAKE)

ide: prepbinaries
	@$(call echo,Building IDE...)
	cd ide && $(MAKE)

documentor: prepbinaries
	@$(call echo,Building Documentor...)
	cd documentor && $(MAKE)

codeguard: prepcodeguard
ifdef CodeGuard
	@$(call echo,Building CodeGuard client...)
	cd codeGuard && $(MAKE)
endif

prepcodeguard: eda
ifdef CodeGuard
ifdef WINDOWS_TARGET
	$(call cpq,eda/libeda/obj/release.$(PLATFORM)/$(LP)EDA$(SO),$(OBJBINDIR))
endif

ifdef LINUX_TARGET
	$(call cpq,eda/libeda/obj/release.$(PLATFORM)/$(LP)EDA$(SOV),$(OBJLIBDIR))
	ln -sf $(LP)EDA$(SOV) $(OBJLIBDIR)$(LP)EDA$(SO).0
	ln -sf $(LP)EDA$(SOV) $(OBJLIBDIR)$(LP)EDA$(SO)
endif

ifndef WINDOWS_TARGET
ifndef LINUX_TARGET
	$(call cpq,eda/libeda/obj/release.$(PLATFORM)/$(LP)EDA$(SO),$(OBJLIBDIR))
endif
endif
endif

eda: prepbinaries
	@$(call echo,Building EDA...)
	cd eda && $(MAKE)

emptyoutput: outputdirs
	$(call rmq,$(OBJLIBDIR)libecereVanilla$(A))
	$(call rmq,$(SODESTDIR)$(LP)ecere$(SO))
	$(call rmq,$(SODESTDIR)$(LP)ecereCOM$(SO))
	$(call rmq,$(SODESTDIR)$(LP)ec$(SO))
	$(call rmq,$(SODESTDIR)$(LP)EDA$(SO))
	$(call rmq,$(SODESTDIR)$(LP)EDASQLite$(SO))
ifdef EDASQLiteCipher
	$(call rmq,$(SODESTDIR)$(LP)EDASQLiteCipher$(SO))
endif
ifdef LINUX_TARGET
	$(call rmq,$(SODESTDIR)$(LP)ecere$(SO).0)
	$(call rmq,$(SODESTDIR)$(LP)ecereCOM$(SO).0)
	$(call rmq,$(SODESTDIR)$(LP)ec$(SO).0)
	$(call rmq,$(SODESTDIR)$(LP)EDA$(SO).0)
	$(call rmq,$(SODESTDIR)$(LP)EDASQLite$(SO).0)
ifdef EDASQLiteCipher
	$(call rmq,$(SODESTDIR)$(LP)EDASQLiteCipher$(SO).0)
endif
	$(call rmq,$(SODESTDIR)$(LP)ecere$(SOV))
	$(call rmq,$(SODESTDIR)$(LP)ecereCOM$(SOV))
	$(call rmq,$(SODESTDIR)$(LP)ec$(SOV))
	$(call rmq,$(SODESTDIR)$(LP)EDA$(SOV))
	$(call rmq,$(SODESTDIR)$(LP)EDASQLite$(SOV))
ifdef EDASQLiteCipher
	$(call rmq,$(SODESTDIR)$(LP)EDASQLiteCipher$(SOV))
endif
endif	
	$(call rmq,$(OBJBINDIR)ear$(E))
	$(call rmq,$(OBJBINDIR)ecc$(E))
	$(call rmq,$(OBJBINDIR)ecp$(E))
	$(call rmq,$(OBJBINDIR)ecs$(E))
	$(call rmq,$(OBJBINDIR)epj2make$(E))
	$(call rmq,$(OBJBINDIR)ide$(E))
	$(call rmq,$(OBJBINDIR)documentor$(E))
ifdef EDASQLiteCipher
	$(call rmq,$(OBJBINDIR)CodeGuard$(E))
endif

clean: emptyoutput
	cd deps && $(MAKE) clean
	cd ecere && $(MAKE) clean
	cd compiler && $(MAKE) clean
	cd ear && $(MAKE) clean
	cd epj2make && $(MAKE) clean
	cd ide && $(MAKE) clean
	cd documentor && $(MAKE) clean
ifdef CodeGuard
	cd codeGuard && $(MAKE) clean
endif
	cd eda && $(MAKE) clean
	@$(call echo,Done.)

realclean:
	cd deps && $(MAKE) realclean
	cd ecere && $(MAKE) realclean
	cd compiler && $(MAKE) realclean
	cd ear && $(MAKE) realclean
	cd epj2make && $(MAKE) realclean
	cd ide && $(MAKE) realclean
	cd documentor && $(MAKE) realclean
ifdef CodeGuard
	cd codeGuard && $(MAKE) realclean
endif
	cd eda && $(MAKE) realclean
	$(call rmrq,obj/$(PLATFORM)/)
	@$(call echo,Done.)

distclean:
	cd deps && $(MAKE) distclean
	cd ecere && $(MAKE) distclean
	cd compiler && $(MAKE) distclean
	cd ear && $(MAKE) distclean
	cd epj2make && $(MAKE) distclean
	cd ide && $(MAKE) distclean
	cd documentor && $(MAKE) distclean
ifdef CodeGuard
	cd codeGuard && $(MAKE) distclean
endif
	cd eda && $(MAKE) distclean
	$(call rmrq,obj/)
	@$(call echo,Done.)

DOC = doc/ecere.eCdoc doc/ecereCOM.eCdoc doc/EDA.eCdoc

BINARIES = \
	ecere/obj/release.$(PLATFORM)/$(LP)ecere$(SOV) \
	ecere/obj/ecereCOM.release.$(PLATFORM)/$(LP)ecereCOM$(SOV) \
	ecere/obj/vanilla.$(PLATFORM)/libecereVanilla$(A) \
	compiler/libec/obj/release.$(PLATFORM)/$(LP)ec$(SOV) \
	compiler/ecp/obj/release.$(PLATFORM)/ecp$(E) \
	compiler/ecc/obj/release.$(PLATFORM)/ecc$(E) \
	compiler/ecs/obj/release.$(PLATFORM)/ecs$(E) \
	ear/cmd/obj/release.$(PLATFORM)/ear$(E) \
	epj2make/obj/release.$(PLATFORM)/epj2make$(E) \
	documentor/obj/release.$(PLATFORM)/documentor$(E) \
	ide/obj/release.$(PLATFORM)/ide$(E) \
	eda/libeda/obj/release.$(PLATFORM)/$(LP)EDA$(SOV) \
	eda/drivers/sqlite/obj/release.$(PLATFORM)/$(LP)EDASQLite$(SOV)

ifdef CodeGuard
BINARIES += codeGuard/obj/release.$(PLATFORM)/CodeGuard$(E)
endif

ifdef EDASQLiteCipher
BINARIES += eda/drivers/sqliteCipher/obj/release.$(PLATFORM)/$(LP)EDASQLiteCipher$(SOV)
endif

# Making sure everything is in $(OBJBINDIR) and $(OBJLIBDIR)
# Shared Libraries (in $(OBJBINDIR) on Windows and $(OBJLIBDIR) otherwise)
# Symlinks for libs on Linux
# Binaries (always in $(OBJBINDIR)) and Static Libraries (always in $(OBJLIBDIR))
prepinstall: $(DOC) $(BINARIES) outputdirs

ifdef WINDOWS_TARGET
	$(call cpq,ecere/obj/release.$(PLATFORM)/$(LP)ecere$(SO),$(OBJBINDIR))
	$(call cpq,ecere/obj/ecereCOM.release.$(PLATFORM)/$(LP)ecereCOM$(SO),$(OBJBINDIR))
	$(call cpq,compiler/libec/obj/release.$(PLATFORM)/$(LP)ec$(SO),$(OBJBINDIR))
	$(call cpq,eda/libeda/obj/release.$(PLATFORM)/$(LP)EDA$(SO),$(OBJBINDIR))
	$(call cpq,eda/drivers/sqlite/obj/release.$(PLATFORM)/$(LP)EDASQLite$(SO),$(OBJBINDIR))
ifdef EDASQLiteCipher
	$(call cpq,eda/drivers/sqliteCipher/obj/release.$(PLATFORM)/$(LP)EDASQLiteCipher$(SO),$(OBJBINDIR))
endif
endif

ifdef LINUX_TARGET
	$(call cpq,ecere/obj/release.$(PLATFORM)/$(LP)ecere$(SOV),$(OBJLIBDIR))
	$(call cpq,ecere/obj/ecereCOM.release.$(PLATFORM)/$(LP)ecereCOM$(SOV),$(OBJLIBDIR))
	$(call cpq,compiler/libec/obj/release.$(PLATFORM)/$(LP)ec$(SOV),$(OBJLIBDIR))
	$(call cpq,eda/libeda/obj/release.$(PLATFORM)/$(LP)EDA$(SOV),$(OBJLIBDIR))
	$(call cpq,eda/drivers/sqlite/obj/release.$(PLATFORM)/$(LP)EDASQLite$(SOV),$(OBJLIBDIR))
ifdef EDASQLiteCipher
	$(call cpq,eda/drivers/sqliteCipher/obj/release.$(PLATFORM)/$(LP)EDASQLiteCipher$(SOV),$(OBJLIBDIR))
endif
	ln -sf $(LP)ecere$(SOV) $(OBJLIBDIR)$(LP)ecere$(SO).0
	ln -sf $(LP)ecereCOM$(SOV) $(OBJLIBDIR)$(LP)ecereCOM$(SO).0
	ln -sf $(LP)ec$(SOV) $(OBJLIBDIR)$(LP)ec$(SO).0
	ln -sf $(LP)EDA$(SOV) $(OBJLIBDIR)$(LP)EDA$(SO).0
	ln -sf $(LP)EDASQLite$(SOV) $(OBJLIBDIR)$(LP)EDASQLite$(SO).0
ifdef EDASQLiteCipher
	ln -sf $(LP)EDASQLiteCipher$(SOV) $(OBJLIBDIR)$(LP)EDASQLiteCipher$(SO).0
endif
	ln -sf $(LP)ecere$(SOV) $(OBJLIBDIR)$(LP)ecere$(SO)
	ln -sf $(LP)ecereCOM$(SOV) $(OBJLIBDIR)$(LP)ecereCOM$(SO)
	ln -sf $(LP)ec$(SOV) $(OBJLIBDIR)$(LP)ec$(SO)
	ln -sf $(LP)EDA$(SOV) $(OBJLIBDIR)$(LP)EDA$(SO)
	ln -sf $(LP)EDASQLite$(SOV) $(OBJLIBDIR)$(LP)EDASQLite$(SO)
ifdef EDASQLiteCipher
	ln -sf $(LP)EDASQLiteCipher$(SOV) $(OBJLIBDIR)$(LP)EDASQLiteCipher$(SO)
endif
endif

ifndef WINDOWS_TARGET
ifndef LINUX_TARGET
	$(call cpq,ecere/obj/release.$(PLATFORM)/$(LP)ecere$(SO),$(OBJLIBDIR))
	$(call cpq,ecere/obj/ecereCOM.release.$(PLATFORM)/$(LP)ecereCOM$(SO),$(OBJLIBDIR))
	$(call cpq,compiler/libec/obj/release.$(PLATFORM)/$(LP)ec$(SO),$(OBJLIBDIR))
	$(call cpq,eda/libeda/obj/release.$(PLATFORM)/$(LP)EDA$(SO),$(OBJLIBDIR))
	$(call cpq,eda/drivers/sqlite/obj/release.$(PLATFORM)/$(LP)EDASQLite$(SO),$(OBJLIBDIR))
ifdef EDASQLiteCipher
	$(call cpq,eda/drivers/sqliteCipher/obj/release.$(PLATFORM)/$(LP)EDASQLiteCipher$(SO),$(OBJLIBDIR))
endif
endif
endif

	$(call cpq,ide/obj/release.$(PLATFORM)/ide$(E),$(OBJBINDIR))
	$(call cpq,ear/cmd/obj/release.$(PLATFORM)/ear$(E),$(OBJBINDIR))
	$(call cpq,compiler/ecc/obj/release.$(PLATFORM)/ecc$(E),$(OBJBINDIR))
	$(call cpq,compiler/ecp/obj/release.$(PLATFORM)/ecp$(E),$(OBJBINDIR))
	$(call cpq,compiler/ecs/obj/release.$(PLATFORM)/ecs$(E),$(OBJBINDIR))
	$(call cpq,epj2make/obj/release.$(PLATFORM)/epj2make$(E),$(OBJBINDIR))
	$(call cpq,documentor/obj/release.$(PLATFORM)/documentor$(E),$(OBJBINDIR))
ifdef CodeGuard
	$(call cpq,codeGuard/obj/release.$(PLATFORM)/CodeGuard$(E),$(OBJBINDIR))
endif
	$(call cpq,ecere/obj/vanilla.$(PLATFORM)/libecereVanilla$(A),$(OBJLIBDIR))

#TODO: Samples?
install: prepinstall actualinstall
	@$(call echo,The Ecere SDK has been installed.)

copyonlyinstall: actualinstall
	@$(call echo,The Ecere SDK has been installed. copyonlyinstall.)

actualinstall:
ifdef WINDOWS_TARGET
	$(call mkdirq,"$(BINDIR)/")
	$(call mkdirq,"$(DESTSLIBDIR)/")
	$(call mkdirq,"$(DOCDIR)/")
	$(call cpq,$(OBJBINDIR)$(LP)ecere$(SO),"$(DESTLIBDIR)/")
	$(call cpq,$(OBJBINDIR)$(LP)ecereCOM$(SO),"$(DESTLIBDIR)/")
	$(call cpq,$(OBJBINDIR)$(LP)ec$(SO),"$(DESTLIBDIR)/")
	$(call cpq,$(OBJBINDIR)$(LP)EDA$(SO),"$(DESTLIBDIR)/")
	$(call cpq,$(OBJBINDIR)$(LP)EDASQLite$(SO),"$(DESTLIBDIR)/")
ifdef EDASQLiteCipher
	$(call cpq,$(OBJBINDIR)$(LP)EDASQLiteCipher$(SO),"$(DESTLIBDIR)/")
endif
	$(call cpq,$(OBJBINDIR)ide$(E),"$(BINDIR)/")
	$(call cpq,$(OBJBINDIR)ear$(E),"$(BINDIR)/")
	$(call cpq,$(OBJBINDIR)ecc$(E),"$(BINDIR)/")
	$(call cpq,$(OBJBINDIR)ecp$(E),"$(BINDIR)/")
	$(call cpq,$(OBJBINDIR)ecs$(E),"$(BINDIR)/")
	$(call cpq,$(OBJBINDIR)epj2make$(E),"$(BINDIR)/")
	$(call cpq,$(OBJBINDIR)documentor$(E),"$(BINDIR)/")
ifdef CodeGuard
	$(call cpq,$(OBJBINDIR)CodeGuard$(E),"$(BINDIR)/")
endif
	$(call cpq,$(OBJLIBDIR)libecereVanilla$(A),"$(DESTSLIBDIR)/")
	$(call cpq,doc/tao.pdf,"$(DOCDIR)/Ecere Tao of Programming [work in progress].pdf") || echo "The Ecere Tao of Programming is available at http://ecere.com/tao.pdf"
	$(call cpq,doc/ecere.eCdoc,"$(DOCDIR)/")
	$(call cpq,doc/ecereCOM.eCdoc,"$(DOCDIR)/")
	$(call cpq,doc/EDA.eCdoc,"$(DOCDIR)/")
endif

ifdef OSX_TARGET
	install $(OBJLIBDIR)$(LP)ecere$(SO) $(DESTLIBDIR)/
	install $(OBJLIBDIR)$(LP)ecereCOM$(SO) $(DESTLIBDIR)/
	install $(OBJLIBDIR)$(LP)ec$(SO) $(DESTLIBDIR)/
	install $(OBJLIBDIR)$(LP)EDA$(SO) $(DESTLIBDIR)/
	install $(OBJLIBDIR)$(LP)EDASQLite$(SO) $(DESTLIBDIR)/
ifdef EDASQLiteCipher
	install $(OBJLIBDIR)$(LP)EDASQLiteCipher$(SO) $(DESTLIBDIR)/
endif
	install $(OBJBINDIR)ide$(E) $(BINDIR)/
	install $(OBJBINDIR)ear$(E) $(BINDIR)/
	install $(OBJBINDIR)ecc$(E) $(BINDIR)/
	install $(OBJBINDIR)ecp$(E) $(BINDIR)/
	install $(OBJBINDIR)ecs$(E) $(BINDIR)/
	install $(OBJBINDIR)epj2make$(E) $(BINDIR)/
	install $(OBJBINDIR)documentor$(E) $(BINDIR)/
ifdef CodeGuard
	install $(OBJBINDIR)CodeGuard$(E) $(BINDIR)/
endif
	install $(OBJLIBDIR)libecereVanilla$(A) $(DESTSLIBDIR)/
	install -d $(DOCDIR)/
	install doc/tao.pdf $(DOCDIR)/"Ecere Tao of Programming [work in progress].pdf" >/dev/null 2>&1 || echo "The Ecere Tao of Programming is available at http://ecere.com/tao.pdf"
	install doc/ecere.eCdoc $(DOCDIR)/
	install doc/ecereCOM.eCdoc $(DOCDIR)/
	install doc/EDA.eCdoc $(DOCDIR)/
	mkdir -p $(SAMPLESDIR)
	cp -pRf samples/* $(SAMPLESDIR)
	find $(SAMPLESDIR) -type d -exec chmod 777 {} \;
	mkdir -p $(EXTRASDIR)
	cp -pRf extras/* $(EXTRASDIR)
	chmod 777 $(EXTRASDIR)/audio
endif

ifndef OSX_TARGET
ifndef WINDOWS_TARGET
ifdef LINUX_TARGET
	install $(INSTALL_FLAGS) $(OBJLIBDIR)$(LP)ecere$(SOV) $(DESTLIBDIR)/$(LP)ecere$(SOV)
	install $(INSTALL_FLAGS) $(OBJLIBDIR)$(LP)ecereCOM$(SOV) $(DESTLIBDIR)/$(LP)ecereCOM$(SOV)
	install $(INSTALL_FLAGS) $(OBJLIBDIR)$(LP)ec$(SOV) $(DESTLIBDIR)/$(LP)ec$(SOV)
	install $(INSTALL_FLAGS) $(OBJLIBDIR)$(LP)EDA$(SOV) $(DESTLIBDIR)/$(LP)EDA$(SOV)
	install $(INSTALL_FLAGS) $(OBJLIBDIR)$(LP)EDASQLite$(SOV) $(DESTLIBDIR)/$(LP)EDASQLite$(SOV)
ifdef EDASQLiteCipher
	install $(INSTALL_FLAGS) $(OBJLIBDIR)$(LP)EDASQLiteCipher$(SOV) $(DESTLIBDIR)/$(LP)EDASQLiteCipher$(SOV)
endif
	ln -sf $(LP)ecere$(SOV) $(DESTLIBDIR)/$(LP)ecere$(SO).0
	ln -sf $(LP)ecereCOM$(SOV) $(DESTLIBDIR)/$(LP)ecereCOM$(SO).0
	ln -sf $(LP)ec$(SOV) $(DESTLIBDIR)/$(LP)ec$(SO).0
	ln -sf $(LP)EDA$(SOV) $(DESTLIBDIR)/$(LP)EDA$(SO).0
	ln -sf $(LP)EDASQLite$(SOV) $(DESTLIBDIR)/$(LP)EDASQLite$(SO).0
ifdef EDASQLiteCipher
	ln -sf $(LP)EDASQLiteCipher$(SOV) $(DESTLIBDIR)/$(LP)EDASQLiteCipher$(SO).0
endif
	ln -sf $(LP)ecere$(SOV) $(DESTLIBDIR)/$(LP)ecere$(SO)
	ln -sf $(LP)ecereCOM$(SOV) $(DESTLIBDIR)/$(LP)ecereCOM$(SO)
	ln -sf $(LP)ec$(SOV) $(DESTLIBDIR)/$(LP)ec$(SO)
	ln -sf $(LP)EDA$(SOV) $(DESTLIBDIR)/$(LP)EDA$(SO)
	ln -sf $(LP)EDASQLite$(SOV) $(DESTLIBDIR)/$(LP)EDASQLite$(SO)
	mkdir -p $(DESTLIBDIR)/ec
	ln -sf $(PREFIXLIBDIR)/$(LP)ecere$(SOV) $(DESTLIBDIR)/ec/$(LP)ecere$(SO)
	ln -sf $(PREFIXLIBDIR)/$(LP)ecereCOM$(SOV) $(DESTLIBDIR)/ec/$(LP)ecereCOM$(SO)
	ln -sf $(PREFIXLIBDIR)/$(LP)ec$(SOV) $(DESTLIBDIR)/ec/$(LP)ec$(SO)
	ln -sf $(PREFIXLIBDIR)/$(LP)EDA$(SOV) $(DESTLIBDIR)/ec/$(LP)EDA$(SO)
	ln -sf $(PREFIXLIBDIR)/$(LP)EDASQLite$(SOV) $(DESTLIBDIR)/ec/$(LP)EDASQLite$(SO)
ifdef EDASQLiteCipher
	ln -sf $(LP)EDASQLiteCipher$(SOV) $(DESTLIBDIR)/$(LP)EDASQLiteCipher$(SO)
endif
ifndef BSD_HOST
	install $(INSTALL_FLAGS) -m 644 share/pixmaps/ecere.png $(DESTDIR)$(prefix)/share/pixmaps/ecere.png
	install $(INSTALL_FLAGS) -m 644 share/applications/ecere.desktop $(DESTDIR)$(prefix)/share/applications/ecere.desktop
endif
else
	install $(INSTALL_FLAGS) $(OBJLIBDIR)$(LP)ecere$(SO) $(DESTLIBDIR)/$(LP)ecere$(SO)
	install $(INSTALL_FLAGS) $(OBJLIBDIR)$(LP)ecereCOM$(SO) $(DESTLIBDIR)/$(LP)ecereCOM$(SO)
	install $(INSTALL_FLAGS) $(OBJLIBDIR)$(LP)ec$(SO) $(DESTLIBDIR)/$(LP)ec$(SO)
	install $(INSTALL_FLAGS) $(OBJLIBDIR)$(LP)EDA$(SO) $(DESTLIBDIR)/$(LP)EDA$(SO)
	install $(INSTALL_FLAGS) $(OBJLIBDIR)$(LP)EDASQLite$(SO) $(DESTLIBDIR)/$(LP)EDASQLite$(SO)
ifdef EDASQLiteCipher
	install $(INSTALL_FLAGS) $(OBJLIBDIR)$(LP)EDASQLiteCipher$(SO) $(DESTLIBDIR)/$(LP)EDASQLiteCipher$(SO)
endif
endif
	install $(INSTALL_FLAGS) $(OBJBINDIR)ide$(E) $(BINDIR)/ide$(E)
	install $(INSTALL_FLAGS) $(OBJBINDIR)ear$(E) $(BINDIR)/ear$(E)
	install $(INSTALL_FLAGS) $(OBJBINDIR)ecc$(E) $(BINDIR)/ecc$(E)
	install $(INSTALL_FLAGS) $(OBJBINDIR)ecp$(E) $(BINDIR)/ecp$(E)
	install $(INSTALL_FLAGS) $(OBJBINDIR)ecs$(E) $(BINDIR)/ecs$(E)
	install $(INSTALL_FLAGS) $(OBJBINDIR)epj2make$(E) $(BINDIR)/epj2make$(E)
	install $(INSTALL_FLAGS) $(OBJBINDIR)documentor$(E) $(BINDIR)/documentor$(E)
ifdef CodeGuard
	install $(INSTALL_FLAGS) $(OBJBINDIR)CodeGuard$(E) $(BINDIR)/CodeGuard$(E)
endif
	install $(INSTALL_FLAGS) $(OBJLIBDIR)libecereVanilla$(A) $(DESTSLIBDIR)/libecereVanilla$(A)
	install $(INSTALL_FLAGS) -m 644 doc/EDA.eCdoc $(DOCDIR)/EDA.eCdoc
	install $(INSTALL_FLAGS) -m 644 doc/tao.pdf $(DOCDIR)/"Ecere Tao of Programming [work in progress].pdf" >/dev/null 2>&1 || echo "The Ecere Tao of Programming is available at http://ecere.com/tao.pdf"
	install $(INSTALL_FLAGS) -m 644 doc/ecere.eCdoc $(DOCDIR)/ecere.eCdoc
	install $(INSTALL_FLAGS) -m 644 doc/ecereCOM.eCdoc $(DOCDIR)/ecereCOM.eCdoc
	install $(INSTALL_FLAGS) -m 644 doc/EDA.eCdoc $(DOCDIR)/EDA.eCdoc
	mkdir -p $(MANDIR)/man1
	cp -pRf share/man/man1/* $(MANDIR)/man1
	mkdir -p $(SAMPLESDIR)
	cp -pRf samples/* $(SAMPLESDIR)
	find $(SAMPLESDIR) -type d -exec chmod 777 {} \;
	mkdir -p $(EXTRASDIR)
	cp $(CPFLAGS) extras/* $(EXTRASDIR)
	chmod 777 $(EXTRASDIR)/audio
ifdef DEBIAN_PACKAGE
	mkdir -p $(DESTDIR)$(prefix)/share/doc/libecere0
	install $(INSTALL_FLAG) -m644 NEWS $(DESTDIR)$(prefix)/share/doc/libecere0/changelog
	gzip -n -f -9 $(DESTDIR)$(prefix)/share/doc/libecere0/changelog
	mkdir -p $(DESTDIR)$(prefix)/share/doc/ecere-dev
	ln -sf ../libecere0/changelog.gz $(DESTDIR)$(prefix)/share/doc/ecere-dev/
	mkdir -p $(DESTDIR)$(prefix)/share/doc/ecere-extras
	cp $(DESTDIR)$(prefix)/share/doc/libecere0/changelog.gz $(DESTDIR)$(prefix)/share/doc/ecere-extras/
	mkdir -p $(DESTDIR)$(prefix)/share/doc/ecere-samples
	cp $(DESTDIR)$(prefix)/share/doc/libecere0/changelog.gz $(DESTDIR)$(prefix)/share/doc/ecere-samples/
	mkdir -p $(DESTDIR)$(prefix)/share/doc/ecere-sdk
	cp $(DESTDIR)$(prefix)/share/doc/libecere0/changelog.gz $(DESTDIR)$(prefix)/share/doc/ecere-sdk/
	mkdir -p $(DESTDIR)$(prefix)/share/doc/libec0
	ln -sf ../libecere0/changelog.gz $(DESTDIR)$(prefix)/share/doc/libec0/
	mkdir -p $(DESTDIR)$(prefix)/share/doc/libecerecom0
	cp $(DESTDIR)$(prefix)/share/doc/libecere0/changelog.gz $(DESTDIR)$(prefix)/share/doc/libecerecom0/
	mkdir -p $(DESTDIR)$(prefix)/share/doc/libeda0
	ln -sf ../libecere0/changelog.gz $(DESTDIR)$(prefix)/share/doc/libeda0/
	mkdir -p $(DESTDIR)$(prefix)/share/doc/libedasqlite0
	ln -sf ../libecere0/changelog.gz $(DESTDIR)$(prefix)/share/doc/libedasqlite0/
endif
endif
endif

uninstall:
	$(call rmq,"$(DESTLIBDIR)/$(LP)ecere$(SO)")
	$(call rmq,"$(DESTLIBDIR)/$(LP)ecereCOM$(SO)")
	$(call rmq,"$(DESTLIBDIR)/$(LP)ec$(SO)")
	$(call rmq,"$(DESTLIBDIR)/$(LP)EDA$(SO)")
	$(call rmq,"$(DESTLIBDIR)/$(LP)EDASQLite$(SO)")
ifdef EDASQLiteCipher
	$(call rmq,"$(DESTLIBDIR)/$(LP)EDASQLiteCipher$(SO)")
endif
	$(call rmq,"$(BINDIR)/ide$(E)")
	$(call rmq,"$(BINDIR)/ear$(E)")
	$(call rmq,"$(BINDIR)/ecc$(E)")
	$(call rmq,"$(BINDIR)/ecp$(E)")
	$(call rmq,"$(BINDIR)/ecs$(E)")
	$(call rmq,"$(BINDIR)/epj2make$(E)")
	$(call rmq,"$(BINDIR)/documentor$(E)")
ifdef CodeGuard
	$(call rmq,"$(BINDIR)/CodeGuard$(E)")
endif
	$(call rmq,"$(DESTSLIBDIR)/libecereVanilla$(A)")
	$(call rmq,"$(DOCDIR)/Ecere Tao of Programming [work in progress].pdf")
	$(call rmq,"$(DOCDIR)/ecere.eCdoc")
	$(call rmq,"$(DOCDIR)/ecereCOM.eCdoc")
	$(call rmq,"$(DOCDIR)/EDA.eCdoc")
ifdef LINUX_TARGET
	$(call rmq,"$(DESTLIBDIR)/$(LP)ecere$(SO).0")
	$(call rmq,"$(DESTLIBDIR)/$(LP)ecereCOM$(SO).0")
	$(call rmq,"$(DESTLIBDIR)/$(LP)ec$(SO).0")
	$(call rmq,"$(DESTLIBDIR)/$(LP)EDA$(SO).0")
	$(call rmq,"$(DESTLIBDIR)/$(LP)EDASQLite$(SO).0")
ifdef EDASQLiteCipher
	$(call rmq,"$(DESTLIBDIR)/$(LP)EDASQLiteCipher$(SO).0")
endif
	$(call rmq,"$(DESTLIBDIR)/$(LP)ecere$(SOV)")
	$(call rmq,"$(DESTLIBDIR)/$(LP)ecereCOM$(SOV)")
	$(call rmq,"$(DESTLIBDIR)/$(LP)ec$(SOV)")
	$(call rmq,"$(DESTLIBDIR)/$(LP)EDA$(SOV)")
	$(call rmq,"$(DESTLIBDIR)/$(LP)EDASQLite$(SOV)")
ifdef EDASQLiteCipher
	$(call rmq,"$(DESTLIBDIR)/$(LP)EDASQLiteCipher$(SOV)")
endif
	$(call rmq,"$(DESTDIR)$(prefix)/share/pixmaps/ecere.png")
	$(call rmq,"$(DESTDIR)$(prefix)/share/applications/ecere.desktop")
endif
	$(call rmdirq,"$(BINDIR)/")
	$(call rmdirq,"$(DESTLIBDIR)/")
	$(call rmdirq,"$(DESTSLIBDIR)/")
	$(call rmdirq,"$(DOCDIR)/")
ifdef WINDOWS_TARGET
	$(call rmdirq,"$(DESTDIR)/")
endif
	@$(call echo,The Ecere SDK has been uninstalled.)

troubleshoot:
	@$(call echo,Printing values of some variables.)
	@$(call echo,HOST_PLATFORM=$(HOST_PLATFORM))
	@$(call echo,TARGET_PLATFORM=$(HOST_PLATFORM))
	@$(call echo,PLATFORM=$(PLATFORM))
	@$(call echo,LINUX_HOST=$(LINUX_HOST))
	@$(call echo,LINUX_TARGET=$(LINUX_TARGET))
	@$(call echo,OSX_HOST=$(OSX_HOST))
	@$(call echo,OSX_TARGET=$(OSX_TARGET))
	@$(call echo,WINDOWS_HOST=$(WINDOWS_HOST))
	@$(call echo,WINDOWS_TARGET=$(WINDOWS_TARGET))
	@$(call echo,BSD_HOST=$(BSD_HOST))
	@$(call echo,BSD_TARGET=$(BSD_TARGET))
	@$(call echo,CCACHE=$(CCACHE))
	@$(call echo,CCACHE_COMPILE=$(CCACHE_COMPILE))
	@$(call echo,CCACHE_PREFIX=$(CCACHE_PREFIX))
	@$(call echo,DISTCC=$(DISTCC))
	@$(call echo,GCC_PREFIX=$(GCC_PREFIX))
	@$(call echo,CC=$(CC))
	@$(call echo,CPP=$(CPP))
	@$(call echo,ECP=$(ECP))
	@$(call echo,ECC=$(ECC))
	@$(call echo,ECS=$(ECS))
	@$(call echo,EAR=$(EAR))
	@$(call echo,AS=$(AS))
	@$(call echo,LD=$(LD))
	@$(call echo,AR=$(AR))
	@$(call echo,STRIP=$(STRIP))
	@$(call echo,UPX=$(UPX))
