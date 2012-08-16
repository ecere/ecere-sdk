.PHONY: all clean realclean distclean emptyoutput prepinstall actualinstall install copyonlyinstall uninstall troubleshoot outputdirs bootstrap deps ecere ecerecom ecerevanilla ear compiler prepbinaries epj2make ide documentor eda prepcodeguard codeguard
.SILENT:

include include.mk

LIBVER := .0.44

ifdef WINDOWS

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

ifndef SLIBDIR
export SLIBDIR=$(DESTDIR)$(prefix)/lib
endif

ifndef SAMPLESDIR
export SAMPLESDIR=$(DESTDIR)$(prefix)/samples
endif

ifndef EXTRASDIR
export EXTRASDIR=$(DESTDIR)$(prefix)/extras
endif


else # WINDOWS

SOV := $(SO)$(LIBVER)

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

ifndef LIBDIR
ifeq "$(HOSTTYPE)" "x86_64"
export LIBDIR=$(DESTDIR)$(prefix)/lib32
else
export LIBDIR=$(DESTDIR)$(prefix)/lib
endif
endif

ifndef SLIBDIR
ifeq "$(HOSTTYPE)" "x86_64"
export SLIBDIR=$(DESTDIR)$(prefix)/lib32
else
export SLIBDIR=$(DESTDIR)$(prefix)/lib
endif
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

all: prepbinaries ide epj2make documentor eda codeguard
	@$(call echo,The Ecere SDK is fully built.)

outputdirs:
	$(if $(wildcard $(OBJDIR)),,$(call mkdirq,$(OBJDIR)))
	$(if $(wildcard $(OBJBINDIR)),,$(call mkdirq,$(OBJBINDIR)))
	$(if $(wildcard $(OBJLIBDIR)),,$(call mkdirq,$(OBJLIBDIR)))

bootstrap: outputdirs
	cd compiler && $(MAKE) bootstrap

deps:
	@$(call echo,Building dependencies...)
	cd deps && $(MAKE)

ecere: bootstrap deps
	@$(call echo,Building 2nd stage ecere...)
	cd ecere && $(MAKE) nores
	cd ear && $(MAKE) nores
	cd ecere && $(MAKE) cleantarget
	cd ecere && $(MAKE)

ecerecom: bootstrap
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
	@$(call echo,Building 2nd stage compiler)
	cd compiler && $(MAKE)

prepbinaries: compiler ecerecom
	@$(call echo,Enabling 2nd stage binaries...)
ifdef WINDOWS
	$(call cpq,ecere/obj/release.$(PLATFORM)/$(LP)ecere$(SOV),$(OBJBINDIR))
	$(call cpq,ecere/obj/ecereCOM.release.$(PLATFORM)/$(LP)ecereCOM$(SOV),$(OBJBINDIR))
	$(call cpq,compiler/libec/obj/release.$(PLATFORM)/$(LP)ec$(SOV),$(OBJBINDIR))
endif
ifdef LINUX
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
ifndef WINDOWS
ifndef LINUX
	$(call cpq,ecere/obj/release.$(PLATFORM)/$(LP)ecere$(SO),$(OBJLIBDIR))
	$(call cpq,ecere/obj/ecereCOM.release.$(PLATFORM)/$(LP)ecereCOM$(SO),$(OBJLIBDIR))
	$(call cpq,compiler/libec/obj/release.$(PLATFORM)/$(LP)ec$(SO),$(OBJLIBDIR))
endif
endif
	$(call cpq,ear/cmd/obj/release.$(PLATFORM)/ear$(E),$(OBJBINDIR))
	$(call cpq,compiler/ecc/obj/release.$(PLATFORM)/ecc$(E),$(OBJBINDIR))
	$(call cpq,compiler/ecp/obj/release.$(PLATFORM)/ecp$(E),$(OBJBINDIR))
	$(call cpq,compiler/ecs/obj/release.$(PLATFORM)/ecs$(E),$(OBJBINDIR))

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
ifdef WINDOWS
	$(call cpq,eda/libeda/obj/release.$(PLATFORM)/$(LP)EDA$(SO),$(OBJBINDIR))
endif

ifdef LINUX
	$(call cpq,eda/libeda/obj/release.$(PLATFORM)/$(LP)EDA$(SOV),$(OBJLIBDIR))
	ln -sf $(LP)EDA$(SOV) $(OBJLIBDIR)$(LP)EDA$(SO).0
	ln -sf $(LP)EDA$(SOV) $(OBJLIBDIR)$(LP)EDA$(SO)
endif

ifndef WINDOWS
ifndef LINUX
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
ifdef LINUX
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

ifdef WINDOWS
	$(call cpq,ecere/obj/release.$(PLATFORM)/$(LP)ecere$(SO),$(OBJBINDIR))
	$(call cpq,ecere/obj/ecereCOM.release.$(PLATFORM)/$(LP)ecereCOM$(SO),$(OBJBINDIR))
	$(call cpq,compiler/libec/obj/release.$(PLATFORM)/$(LP)ec$(SO),$(OBJBINDIR))
	$(call cpq,eda/libeda/obj/release.$(PLATFORM)/$(LP)EDA$(SO),$(OBJBINDIR))
	$(call cpq,eda/drivers/sqlite/obj/release.$(PLATFORM)/$(LP)EDASQLite$(SO),$(OBJBINDIR))
ifdef EDASQLiteCipher
	$(call cpq,eda/drivers/sqliteCipher/obj/release.$(PLATFORM)/$(LP)EDASQLiteCipher$(SO),$(OBJBINDIR))
endif
endif

ifdef LINUX
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

ifndef WINDOWS
ifndef LINUX
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
ifdef WINDOWS
	$(call mkdirq,"$(BINDIR)/")
	$(call mkdirq,"$(SLIBDIR)/")
	$(call mkdirq,"$(DOCDIR)/")
	$(call cpq,$(OBJBINDIR)$(LP)ecere$(SO),"$(LIBDIR)/")
	$(call cpq,$(OBJBINDIR)$(LP)ecereCOM$(SO),"$(LIBDIR)/")
	$(call cpq,$(OBJBINDIR)$(LP)ec$(SO),"$(LIBDIR)/")
	$(call cpq,$(OBJBINDIR)$(LP)EDA$(SO),"$(LIBDIR)/")
	$(call cpq,$(OBJBINDIR)$(LP)EDASQLite$(SO),"$(LIBDIR)/")
ifdef EDASQLiteCipher
	$(call cpq,$(OBJBINDIR)$(LP)EDASQLiteCipher$(SO),"$(LIBDIR)/")
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
	$(call cpq,$(OBJLIBDIR)libecereVanilla$(A),"$(SLIBDIR)/")
	$(call cpq,doc/tao.pdf,"$(DOCDIR)/Ecere Tao of Programming [work in progress].pdf") || echo "The Ecere Tao of Programming is available at http://ecere.com/tao.pdf"
	$(call cpq,doc/ecere.eCdoc,"$(DOCDIR)/")
	$(call cpq,doc/ecereCOM.eCdoc,"$(DOCDIR)/")
	$(call cpq,doc/EDA.eCdoc,"$(DOCDIR)/")
endif

ifdef OSX 
	install $(OBJLIBDIR)$(LP)ecere$(SO) $(LIBDIR)/
	install $(OBJLIBDIR)$(LP)ecereCOM$(SO) $(LIBDIR)/
	install $(OBJLIBDIR)$(LP)ec$(SO) $(LIBDIR)/
	install $(OBJLIBDIR)$(LP)EDA$(SO) $(LIBDIR)/
	install $(OBJLIBDIR)$(LP)EDASQLite$(SO) $(LIBDIR)/
ifdef EDASQLiteCipher
	install $(OBJLIBDIR)$(LP)EDASQLiteCipher$(SO) $(LIBDIR)/
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
	install $(OBJLIBDIR)libecereVanilla$(A) $(SLIBDIR)/
	install -d $(DOCDIR)/
	install doc/tao.pdf $(DOCDIR)/"Ecere Tao of Programming [work in progress].pdf" >/dev/null 2>&1 || echo "The Ecere Tao of Programming is available at http://ecere.com/tao.pdf"
	install doc/ecere.eCdoc $(DOCDIR)/
	install doc/ecereCOM.eCdoc $(DOCDIR)/
	install doc/EDA.eCdoc $(DOCDIR)/
	mkdir -p -m 777 $(SAMPLESDIR)
	cp -pRf samples/* $(SAMPLESDIR)
	mkdir -p -m 777 $(EXTRASDIR)
	cp -pRf extras/* $(EXTRASDIR)
endif

ifndef OSX
ifndef WINDOWS
ifdef LINUX
	install -D $(OBJLIBDIR)$(LP)ecere$(SOV) $(LIBDIR)/$(LP)ecere$(SOV)
	install -D $(OBJLIBDIR)$(LP)ecereCOM$(SOV) $(LIBDIR)/$(LP)ecereCOM$(SOV)
	install -D $(OBJLIBDIR)$(LP)ec$(SOV) $(LIBDIR)/$(LP)ec$(SOV)
	install -D $(OBJLIBDIR)$(LP)EDA$(SOV) $(LIBDIR)/$(LP)EDA$(SOV)
	install -D $(OBJLIBDIR)$(LP)EDASQLite$(SOV) $(LIBDIR)/$(LP)EDASQLite$(SOV)
ifdef EDASQLiteCipher
	install -D $(OBJLIBDIR)$(LP)EDASQLiteCipher$(SOV) $(LIBDIR)/$(LP)EDASQLiteCipher$(SOV)
endif
	ln -sf $(LP)ecere$(SOV) $(LIBDIR)/$(LP)ecere$(SO).0
	ln -sf $(LP)ecereCOM$(SOV) $(LIBDIR)/$(LP)ecereCOM$(SO).0
	ln -sf $(LP)ec$(SOV) $(LIBDIR)/$(LP)ec$(SO).0
	ln -sf $(LP)EDA$(SOV) $(LIBDIR)/$(LP)EDA$(SO).0
	ln -sf $(LP)EDASQLite$(SOV) $(LIBDIR)/$(LP)EDASQLite$(SO).0
ifdef EDASQLiteCipher
	ln -sf $(LP)EDASQLiteCipher$(SOV) $(LIBDIR)/$(LP)EDASQLiteCipher$(SO).0
endif
	ln -sf $(LP)ecere$(SOV) $(LIBDIR)/$(LP)ecere$(SO)
	ln -sf $(LP)ecereCOM$(SOV) $(LIBDIR)/$(LP)ecereCOM$(SO)
	ln -sf $(LP)ec$(SOV) $(LIBDIR)/$(LP)ec$(SO)
	ln -sf $(LP)EDA$(SOV) $(LIBDIR)/$(LP)EDA$(SO)
	ln -sf $(LP)EDASQLite$(SOV) $(LIBDIR)/$(LP)EDASQLite$(SO)
	mkdir -p -m 777 $(DESTDIR)$(prefix)/lib/ec
	ln -sf $(LIBDIR)/$(LP)ecere$(SOV) $(DESTDIR)$(prefix)/lib/ec/$(LP)ecere$(SO)
	ln -sf $(LIBDIR)/$(LP)ecereCOM$(SOV) $(DESTDIR)$(prefix)/lib/ec/$(LP)ecereCOM$(SO)
	ln -sf $(LIBDIR)/$(LP)ec$(SOV) $(DESTDIR)$(prefix)/lib/ec/$(LP)ec$(SO)
	ln -sf $(LIBDIR)/$(LP)EDA$(SOV) $(DESTDIR)$(prefix)/lib/ec/$(LP)EDA$(SO)
	ln -sf $(LIBDIR)/$(LP)EDASQLite$(SOV) $(DESTDIR)$(prefix)/lib/ec/$(LP)EDASQLite$(SO)
ifdef EDASQLiteCipher
	ln -sf $(LP)EDASQLiteCipher$(SOV) $(LIBDIR)/$(LP)EDASQLiteCipher$(SO)
endif
	install -D -m 644 share/pixmaps/ecere.png $(DESTDIR)$(prefix)/share/pixmaps/ecere.png
	install -D -m 644 share/applications/ecere.desktop $(DESTDIR)$(prefix)/share/applications/ecere.desktop
else
	install -D $(OBJLIBDIR)$(LP)ecere$(SO) $(LIBDIR)/$(LP)ecere$(SO)
	install -D $(OBJLIBDIR)$(LP)ecereCOM$(SO) $(LIBDIR)/$(LP)ecereCOM$(SO)
	install -D $(OBJLIBDIR)$(LP)ec$(SO) $(LIBDIR)/$(LP)ec$(SO)
	install -D $(OBJLIBDIR)$(LP)EDA$(SO) $(LIBDIR)/$(LP)EDA$(SO)
	install -D $(OBJLIBDIR)$(LP)EDASQLite$(SO) $(LIBDIR)/$(LP)EDASQLite$(SO)
ifdef EDASQLiteCipher
	install -D $(OBJLIBDIR)$(LP)EDASQLiteCipher$(SO) $(LIBDIR)/$(LP)EDASQLiteCipher$(SO)
endif
endif
	install -D $(OBJBINDIR)ide$(E) $(BINDIR)/ide$(E)
	install -D $(OBJBINDIR)ear$(E) $(BINDIR)/ear$(E)
	install -D $(OBJBINDIR)ecc$(E) $(BINDIR)/ecc$(E)
	install -D $(OBJBINDIR)ecp$(E) $(BINDIR)/ecp$(E)
	install -D $(OBJBINDIR)ecs$(E) $(BINDIR)/ecs$(E)
	install -D $(OBJBINDIR)epj2make$(E) $(BINDIR)/epj2make$(E)
	install -D $(OBJBINDIR)documentor$(E) $(BINDIR)/documentor$(E)
ifdef CodeGuard
	install -D $(OBJBINDIR)CodeGuard$(E) $(BINDIR)/CodeGuard$(E)
endif
	install -D $(OBJLIBDIR)libecereVanilla$(A) $(SLIBDIR)/libecereVanilla$(A)
	install -D -m 644 doc/EDA.eCdoc $(DOCDIR)/EDA.eCdoc
	install -D -m 644 doc/tao.pdf $(DOCDIR)/"Ecere Tao of Programming [work in progress].pdf" >/dev/null 2>&1 || echo "The Ecere Tao of Programming is available at http://ecere.com/tao.pdf"
	install -D -m 644 doc/ecere.eCdoc $(DOCDIR)/ecere.eCdoc
	install -D -m 644 doc/ecereCOM.eCdoc $(DOCDIR)/ecereCOM.eCdoc
	install -D -m 644 doc/EDA.eCdoc $(DOCDIR)/EDA.eCdoc
	mkdir -p -m 777 $(MANDIR)/man1
	cp -pRf share/man/man1/* $(MANDIR)/man1
	mkdir -p -m 777 $(SAMPLESDIR)
	cp -pRf samples/* $(SAMPLESDIR)
	mkdir -p -m 777 $(EXTRASDIR)
	cp -pRf extras/* $(EXTRASDIR)
ifdef DEBIAN_PACKAGE
	mkdir -p -m 777 $(DESTDIR)$(prefix)/share/doc/libecere0
	install -D -m644 NEWS $(DESTDIR)$(prefix)/share/doc/libecere0/changelog
	gzip -f -9 $(DESTDIR)$(prefix)/share/doc/libecere0/changelog
	mkdir -p -m 777 $(DESTDIR)$(prefix)/share/doc/ecere-dev
	ln -sf ../libecere0/changelog.gz $(DESTDIR)$(prefix)/share/doc/ecere-dev/
	mkdir -p -m 777 $(DESTDIR)$(prefix)/share/doc/ecere-extras
	ln -sf ../libecere0/changelog.gz $(DESTDIR)$(prefix)/share/doc/ecere-extras/
	mkdir -p -m 777 $(DESTDIR)$(prefix)/share/doc/ecere-samples
	ln -sf ../libecere0/changelog.gz $(DESTDIR)$(prefix)/share/doc/ecere-samples/
	mkdir -p -m 777 $(DESTDIR)$(prefix)/share/doc/ecere-sdk
	ln -sf ../libecere0/changelog.gz $(DESTDIR)$(prefix)/share/doc/ecere-sdk/
	mkdir -p -m 777 $(DESTDIR)$(prefix)/share/doc/libec0
	ln -sf ../libecere0/changelog.gz $(DESTDIR)$(prefix)/share/doc/libec0/
	mkdir -p -m 777 $(DESTDIR)$(prefix)/share/doc/libecerecom0
	ln -sf ../libecere0/changelog.gz $(DESTDIR)$(prefix)/share/doc/libecerecom0/
	mkdir -p -m 777 $(DESTDIR)$(prefix)/share/doc/libeda0
	ln -sf ../libecere0/changelog.gz $(DESTDIR)$(prefix)/share/doc/libeda0/
	mkdir -p -m 777 $(DESTDIR)$(prefix)/share/doc/libedasqlite0
	ln -sf ../libecere0/changelog.gz $(DESTDIR)$(prefix)/share/doc/libedasqlite0/
endif
endif
endif

uninstall:
	$(call rmq,"$(LIBDIR)/$(LP)ecere$(SO)")
	$(call rmq,"$(LIBDIR)/$(LP)ecereCOM$(SO)")
	$(call rmq,"$(LIBDIR)/$(LP)ec$(SO)")
	$(call rmq,"$(LIBDIR)/$(LP)EDA$(SO)")
	$(call rmq,"$(LIBDIR)/$(LP)EDASQLite$(SO)")
ifdef EDASQLiteCipher
	$(call rmq,"$(LIBDIR)/$(LP)EDASQLiteCipher$(SO)")
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
	$(call rmq,"$(SLIBDIR)/libecereVanilla$(A)")
	$(call rmq,"$(DOCDIR)/Ecere Tao of Programming [work in progress].pdf")
	$(call rmq,"$(DOCDIR)/ecere.eCdoc")
	$(call rmq,"$(DOCDIR)/ecereCOM.eCdoc")
	$(call rmq,"$(DOCDIR)/EDA.eCdoc")
ifdef LINUX
	$(call rmq,"$(LIBDIR)/$(LP)ecere$(SO).0")
	$(call rmq,"$(LIBDIR)/$(LP)ecereCOM$(SO).0")
	$(call rmq,"$(LIBDIR)/$(LP)ec$(SO).0")
	$(call rmq,"$(LIBDIR)/$(LP)EDA$(SO).0")
	$(call rmq,"$(LIBDIR)/$(LP)EDASQLite$(SO).0")
ifdef EDASQLiteCipher
	$(call rmq,"$(LIBDIR)/$(LP)EDASQLiteCipher$(SO).0")
endif
	$(call rmq,"$(LIBDIR)/$(LP)ecere$(SOV)")
	$(call rmq,"$(LIBDIR)/$(LP)ecereCOM$(SOV)")
	$(call rmq,"$(LIBDIR)/$(LP)ec$(SOV)")
	$(call rmq,"$(LIBDIR)/$(LP)EDA$(SOV)")
	$(call rmq,"$(LIBDIR)/$(LP)EDASQLite$(SOV)")
ifdef EDASQLiteCipher
	$(call rmq,"$(LIBDIR)/$(LP)EDASQLiteCipher$(SOV)")
endif
	$(call rmq,"$(DESTDIR)$(prefix)/share/pixmaps/ecere.png")
	$(call rmq,"$(DESTDIR)$(prefix)/share/applications/ecere.desktop")
endif
	$(call rmdirq,"$(BINDIR)/")
	$(call rmdirq,"$(LIBDIR)/")
	$(call rmdirq,"$(SLIBDIR)/")
	$(call rmdirq,"$(DOCDIR)/")
ifdef WINDOWS
	$(call rmdirq,"$(DESTDIR)/")
endif
	@$(call echo,The Ecere SDK has been uninstalled.)

troubleshoot:
	@$(call echo,Printing values of some variables.)
	@$(call echo,CCACHE=$(CCACHE))
	@$(call echo,CCACHE_COMPILE=$(CCACHE_COMPILE))
	@$(call echo,CCACHE_PREFIX=$(CCACHE_PREFIX))
	@$(call echo,DISTCC=$(DISTCC))
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
