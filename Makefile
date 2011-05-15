.PHONY: all clean realclean distclean emptyoutput install uninstall outputdirs bootstrap deps ecere ecerecom ecerevanilla ear compiler prepbinaries epj2make ide documentor eda prepcodeguard codeguard
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

all: prepbinaries ide epj2make documentor eda codeguard
	@$(call echo,The Ecere SDK is fully built.)

outputdirs:
	$(if $(wildcard obj/),,$(call mkdirq,obj/))
	$(if $(wildcard obj/$(PLATFORM)/bin/),,$(call mkdirq,obj/$(PLATFORM)/bin/))
	$(if $(wildcard obj/$(PLATFORM)/lib/),,$(call mkdirq,obj/$(PLATFORM)/lib/))

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
	$(call cpq,ecere/obj/release.$(PLATFORM)/$(LP)ecere$(SOV),obj/$(PLATFORM)/bin/)
	$(call cpq,ecere/obj/ecereCOM.release.$(PLATFORM)/$(LP)ecereCOM$(SOV),obj/$(PLATFORM)/bin/)
	$(call cpq,compiler/libec/obj/release.$(PLATFORM)/$(LP)ec$(SOV),obj/$(PLATFORM)/bin/)
endif
ifdef LINUX
	$(call cpq,ecere/obj/release.$(PLATFORM)/$(LP)ecere$(SOV),obj/$(PLATFORM)/lib/)
	$(call cpq,ecere/obj/ecereCOM.release.$(PLATFORM)/$(LP)ecereCOM$(SOV),obj/$(PLATFORM)/lib/)
	$(call cpq,compiler/libec/obj/release.$(PLATFORM)/$(LP)ec$(SOV),obj/$(PLATFORM)/lib/)
	ln -sf $(LP)ecere$(SOV) obj/$(PLATFORM)/lib/$(LP)ecere$(SO).0
	ln -sf $(LP)ecereCOM$(SOV) obj/$(PLATFORM)/lib/$(LP)ecereCOM$(SO).0
	ln -sf $(LP)ec$(SOV) obj/$(PLATFORM)/lib/$(LP)ec$(SO).0
	ln -sf $(LP)ecere$(SOV) obj/$(PLATFORM)/lib/$(LP)ecere$(SO)
	ln -sf $(LP)ecereCOM$(SOV) obj/$(PLATFORM)/lib/$(LP)ecereCOM$(SO)
	ln -sf $(LP)ec$(SOV) obj/$(PLATFORM)/lib/$(LP)ec$(SO)
endif
ifndef WINDOWS
ifndef LINUX
	$(call cpq,ecere/obj/release.$(PLATFORM)/$(LP)ecere$(SO),obj/$(PLATFORM)/lib/)
	$(call cpq,ecere/obj/ecereCOM.release.$(PLATFORM)/$(LP)ecereCOM$(SO),obj/$(PLATFORM)/lib/)
	$(call cpq,compiler/libec/obj/release.$(PLATFORM)/$(LP)ec$(SO),obj/$(PLATFORM)/lib/)
endif
endif
	$(call cpq,ear/cmd/obj/release.$(PLATFORM)/ear$(E),obj/$(PLATFORM)/bin/)
	$(call cpq,compiler/ecc/obj/release.$(PLATFORM)/ecc$(E),obj/$(PLATFORM)/bin/)
	$(call cpq,compiler/ecp/obj/release.$(PLATFORM)/ecp$(E),obj/$(PLATFORM)/bin/)
	$(call cpq,compiler/ecs/obj/release.$(PLATFORM)/ecs$(E),obj/$(PLATFORM)/bin/)

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
	$(call cpq,eda/libeda/obj/release.$(PLATFORM)/$(LP)EDA$(SO),obj/$(PLATFORM)/bin/)
endif

ifdef LINUX
	$(call cpq,eda/libeda/obj/release.$(PLATFORM)/$(LP)EDA$(SOV),obj/$(PLATFORM)/lib/)
	ln -sf $(LP)EDA$(SOV) obj/$(PLATFORM)/lib/$(LP)EDA$(SO).0
	ln -sf $(LP)EDA$(SOV) obj/$(PLATFORM)/lib/$(LP)EDA$(SO)
endif

ifndef WINDOWS
ifndef LINUX
	$(call cpq,eda/libeda/obj/release.$(PLATFORM)/$(LP)EDA$(SO),obj/$(PLATFORM)/lib/)
endif
endif
endif

eda: prepbinaries
	@$(call echo,Building EDA...)
	cd eda && $(MAKE)

emptyoutput: outputdirs
	$(call rmq,obj/$(PLATFORM)/lib/libecereVanilla$(A))
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
	$(call rmq,obj/$(PLATFORM)/bin/ear$(E))
	$(call rmq,obj/$(PLATFORM)/bin/ecc$(E))
	$(call rmq,obj/$(PLATFORM)/bin/ecp$(E))
	$(call rmq,obj/$(PLATFORM)/bin/ecs$(E))
	$(call rmq,obj/$(PLATFORM)/bin/epj2make$(E))
	$(call rmq,obj/$(PLATFORM)/bin/ide$(E))
	$(call rmq,obj/$(PLATFORM)/bin/documentor$(E))
ifdef EDASQLiteCipher
	$(call rmq,obj/$(PLATFORM)/bin/CodeGuard$(E))
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

DOC = doc/tao.pdf doc/ecere.eCdoc doc/ecereCOM.eCdoc doc/EDA.eCdoc

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

# Making sure everything is in obj/$(PLATFORM)/bin/ and obj/$(PLATFORM)/lib/
# Shared Libraries (in obj/$(PLATFORM)/bin/ on Windows and obj/$(PLATFORM)/lib/ otherwise)
# Symlinks for libs on Linux
# Binaries (always in obj/$(PLATFORM)/bin/) and Static Libraries (always in obj/$(PLATFORM)/lib/)
prepinstall: $(DOC) $(BINARIES) outputdirs

ifdef WINDOWS
	$(call cpq,ecere/obj/release.$(PLATFORM)/$(LP)ecere$(SO),obj/$(PLATFORM)/bin/)
	$(call cpq,ecere/obj/ecereCOM.release.$(PLATFORM)/$(LP)ecereCOM$(SO),obj/$(PLATFORM)/bin/)
	$(call cpq,compiler/libec/obj/release.$(PLATFORM)/$(LP)ec$(SO),obj/$(PLATFORM)/bin/)
	$(call cpq,eda/libeda/obj/release.$(PLATFORM)/$(LP)EDA$(SO),obj/$(PLATFORM)/bin/)
	$(call cpq,eda/drivers/sqlite/obj/release.$(PLATFORM)/$(LP)EDASQLite$(SO),obj/$(PLATFORM)/bin/)
ifdef EDASQLiteCipher
	$(call cpq,eda/drivers/sqliteCipher/obj/release.$(PLATFORM)/$(LP)EDASQLiteCipher$(SO),obj/$(PLATFORM)/bin/)
endif
endif

ifdef LINUX
	$(call cpq,ecere/obj/release.$(PLATFORM)/$(LP)ecere$(SOV),obj/$(PLATFORM)/lib/)
	$(call cpq,ecere/obj/ecereCOM.release.$(PLATFORM)/$(LP)ecereCOM$(SOV),obj/$(PLATFORM)/lib/)
	$(call cpq,compiler/libec/obj/release.$(PLATFORM)/$(LP)ec$(SOV),obj/$(PLATFORM)/lib/)
	$(call cpq,eda/libeda/obj/release.$(PLATFORM)/$(LP)EDA$(SOV),obj/$(PLATFORM)/lib/)
	$(call cpq,eda/drivers/sqlite/obj/release.$(PLATFORM)/$(LP)EDASQLite$(SOV),obj/$(PLATFORM)/lib/)
ifdef EDASQLiteCipher
	$(call cpq,eda/drivers/sqliteCipher/obj/release.$(PLATFORM)/$(LP)EDASQLiteCipher$(SOV),obj/$(PLATFORM)/lib/)
endif
	ln -sf $(LP)ecere$(SOV) obj/$(PLATFORM)/lib/$(LP)ecere$(SO).0
	ln -sf $(LP)ecereCOM$(SOV) obj/$(PLATFORM)/lib/$(LP)ecereCOM$(SO).0
	ln -sf $(LP)ec$(SOV) obj/$(PLATFORM)/lib/$(LP)ec$(SO).0
	ln -sf $(LP)EDA$(SOV) obj/$(PLATFORM)/lib/$(LP)EDA$(SO).0
	ln -sf $(LP)EDASQLite$(SOV) obj/$(PLATFORM)/lib/$(LP)EDASQLite$(SO).0
ifdef EDASQLiteCipher
	ln -sf $(LP)EDASQLiteCipher$(SOV) obj/$(PLATFORM)/lib/$(LP)EDASQLiteCipher$(SO).0
endif
	ln -sf $(LP)ecere$(SOV) obj/$(PLATFORM)/lib/$(LP)ecere$(SO)
	ln -sf $(LP)ecereCOM$(SOV) obj/$(PLATFORM)/lib/$(LP)ecereCOM$(SO)
	ln -sf $(LP)ec$(SOV) obj/$(PLATFORM)/lib/$(LP)ec$(SO)
	ln -sf $(LP)EDA$(SOV) obj/$(PLATFORM)/lib/$(LP)EDA$(SO)
	ln -sf $(LP)EDASQLite$(SOV) obj/$(PLATFORM)/lib/$(LP)EDASQLite$(SO)
ifdef EDASQLiteCipher
	ln -sf $(LP)EDASQLiteCipher$(SOV) obj/$(PLATFORM)/lib/$(LP)EDASQLiteCipher$(SO)
endif
endif

ifndef WINDOWS
ifndef LINUX
	$(call cpq,ecere/obj/release.$(PLATFORM)/$(LP)ecere$(SO),obj/$(PLATFORM)/lib/)
	$(call cpq,ecere/obj/ecereCOM.release.$(PLATFORM)/$(LP)ecereCOM$(SO),obj/$(PLATFORM)/lib/)
	$(call cpq,compiler/libec/obj/release.$(PLATFORM)/$(LP)ec$(SO),obj/$(PLATFORM)/lib/)
	$(call cpq,eda/libeda/obj/release.$(PLATFORM)/$(LP)EDA$(SO),obj/$(PLATFORM)/lib/)
	$(call cpq,eda/drivers/sqlite/obj/release.$(PLATFORM)/$(LP)EDASQLite$(SO),obj/$(PLATFORM)/lib/)
ifdef EDASQLiteCipher
	$(call cpq,eda/drivers/sqliteCipher/obj/release.$(PLATFORM)/$(LP)EDASQLiteCipher$(SO),obj/$(PLATFORM)/lib/)
endif
endif
endif

	$(call cpq,ide/obj/release.$(PLATFORM)/ide$(E),obj/$(PLATFORM)/bin/)
	$(call cpq,ear/cmd/obj/release.$(PLATFORM)/ear$(E),obj/$(PLATFORM)/bin/)
	$(call cpq,compiler/ecc/obj/release.$(PLATFORM)/ecc$(E),obj/$(PLATFORM)/bin/)
	$(call cpq,compiler/ecp/obj/release.$(PLATFORM)/ecp$(E),obj/$(PLATFORM)/bin/)
	$(call cpq,compiler/ecs/obj/release.$(PLATFORM)/ecs$(E),obj/$(PLATFORM)/bin/)
	$(call cpq,epj2make/obj/release.$(PLATFORM)/epj2make$(E),obj/$(PLATFORM)/bin/)
	$(call cpq,documentor/obj/release.$(PLATFORM)/documentor$(E),obj/$(PLATFORM)/bin/)
ifdef CodeGuard
	$(call cpq,codeGuard/obj/release.$(PLATFORM)/CodeGuard$(E),obj/$(PLATFORM)/bin/)
endif
	$(call cpq,ecere/obj/vanilla.$(PLATFORM)/libecereVanilla$(A),obj/$(PLATFORM)/lib/)

#TODO: Samples?
install: prepinstall

ifdef WINDOWS
	$(call mkdirq,"$(BINDIR)/")
	$(call mkdirq,"$(SLIBDIR)/")
	$(call mkdirq,"$(DOCDIR)/")
	$(call cpq,obj/$(PLATFORM)/bin/$(LP)ecere$(SO),"$(LIBDIR)/")
	$(call cpq,obj/$(PLATFORM)/bin/$(LP)ecereCOM$(SO),"$(LIBDIR)/")
	$(call cpq,obj/$(PLATFORM)/bin/$(LP)ec$(SO),"$(LIBDIR)/")
	$(call cpq,obj/$(PLATFORM)/bin/$(LP)EDA$(SO),"$(LIBDIR)/")
	$(call cpq,obj/$(PLATFORM)/bin/$(LP)EDASQLite$(SO),"$(LIBDIR)/")
ifdef EDASQLiteCipher
	$(call cpq,obj/$(PLATFORM)/bin/$(LP)EDASQLiteCipher$(SO),"$(LIBDIR)/")
endif
	$(call cpq,obj/$(PLATFORM)/bin/ide$(E),"$(BINDIR)/")
	$(call cpq,obj/$(PLATFORM)/bin/ear$(E),"$(BINDIR)/")
	$(call cpq,obj/$(PLATFORM)/bin/ecc$(E),"$(BINDIR)/")
	$(call cpq,obj/$(PLATFORM)/bin/ecp$(E),"$(BINDIR)/")
	$(call cpq,obj/$(PLATFORM)/bin/ecs$(E),"$(BINDIR)/")
	$(call cpq,obj/$(PLATFORM)/bin/epj2make$(E),"$(BINDIR)/")
	$(call cpq,obj/$(PLATFORM)/bin/documentor$(E),"$(BINDIR)/")
ifdef CodeGuard
	$(call cpq,obj/$(PLATFORM)/bin/CodeGuard$(E),"$(BINDIR)/")
endif
	$(call cpq,obj/$(PLATFORM)/lib/libecereVanilla$(A),"$(SLIBDIR)/")
	$(call cpq,doc/tao.pdf,"$(DOCDIR)/Ecere Tao of Programming [work in progress].pdf")
	$(call cpq,doc/ecere.eCdoc,"$(DOCDIR)/")
	$(call cpq,doc/ecereCOM.eCdoc,"$(DOCDIR)/")
	$(call cpq,doc/EDA.eCdoc,"$(DOCDIR)/")
endif

ifdef OSX 
	install obj/$(PLATFORM)/lib/$(LP)ecere$(SO) $(LIBDIR)/
	install obj/$(PLATFORM)/lib/$(LP)ecereCOM$(SO) $(LIBDIR)/
	install obj/$(PLATFORM)/lib/$(LP)ec$(SO) $(LIBDIR)/
	install obj/$(PLATFORM)/lib/$(LP)EDA$(SO) $(LIBDIR)/
	install obj/$(PLATFORM)/lib/$(LP)EDASQLite$(SO) $(LIBDIR)/
ifdef EDASQLiteCipher
	install obj/$(PLATFORM)/lib/$(LP)EDASQLiteCipher$(SO) $(LIBDIR)/
endif
	install obj/$(PLATFORM)/bin/ide$(E) $(BINDIR)/
	install obj/$(PLATFORM)/bin/ear$(E) $(BINDIR)/
	install obj/$(PLATFORM)/bin/ecc$(E) $(BINDIR)/
	install obj/$(PLATFORM)/bin/ecp$(E) $(BINDIR)/
	install obj/$(PLATFORM)/bin/ecs$(E) $(BINDIR)/
	install obj/$(PLATFORM)/bin/epj2make$(E) $(BINDIR)/
	install obj/$(PLATFORM)/bin/documentor$(E) $(BINDIR)/
ifdef CodeGuard
	install obj/$(PLATFORM)/bin/CodeGuard$(E) $(BINDIR)/
endif
	install obj/$(PLATFORM)/lib/libecereVanilla$(A) $(SLIBDIR)/
	install -d $(DOCDIR)/
	install doc/tao.pdf $(DOCDIR)/"Ecere Tao of Programming [work in progress].pdf"
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
	install -D obj/$(PLATFORM)/lib/$(LP)ecere$(SOV) $(LIBDIR)/$(LP)ecere$(SOV)
	install -D obj/$(PLATFORM)/lib/$(LP)ecereCOM$(SOV) $(LIBDIR)/$(LP)ecereCOM$(SOV)
	install -D obj/$(PLATFORM)/lib/$(LP)ec$(SOV) $(LIBDIR)/$(LP)ec$(SOV)
	install -D obj/$(PLATFORM)/lib/$(LP)EDA$(SOV) $(LIBDIR)/$(LP)EDA$(SOV)
	install -D obj/$(PLATFORM)/lib/$(LP)EDASQLite$(SOV) $(LIBDIR)/$(LP)EDASQLite$(SOV)
ifdef EDASQLiteCipher
	install -D obj/$(PLATFORM)/lib/$(LP)EDASQLiteCipher$(SOV) $(LIBDIR)/$(LP)EDASQLiteCipher$(SOV)
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
ifdef EDASQLiteCipher
	ln -sf $(LP)EDASQLiteCipher$(SOV) $(LIBDIR)/$(LP)EDASQLiteCipher$(SO)
endif
	install -D share/pixmaps/ecere.png $(DESTDIR)$(prefix)/share/pixmaps/ecere.png
	install -D share/applications/ecere.desktop $(DESTDIR)$(prefix)/share/applications/ecere.desktop
else
	install -D obj/$(PLATFORM)/lib/$(LP)ecere$(SO) $(LIBDIR)/$(LP)ecere$(SO)
	install -D obj/$(PLATFORM)/lib/$(LP)ecereCOM$(SO) $(LIBDIR)/$(LP)ecereCOM$(SO)
	install -D obj/$(PLATFORM)/lib/$(LP)ec$(SO) $(LIBDIR)/$(LP)ec$(SO)
	install -D obj/$(PLATFORM)/lib/$(LP)EDA$(SO) $(LIBDIR)/$(LP)EDA$(SO)
	install -D obj/$(PLATFORM)/lib/$(LP)EDASQLite$(SO) $(LIBDIR)/$(LP)EDASQLite$(SO)
ifdef EDASQLiteCipher
	install -D obj/$(PLATFORM)/lib/$(LP)EDASQLiteCipher$(SO) $(LIBDIR)/$(LP)EDASQLiteCipher$(SO)
endif
endif
	install -D obj/$(PLATFORM)/bin/ide$(E) $(BINDIR)/ide$(E)
	install -D obj/$(PLATFORM)/bin/ear$(E) $(BINDIR)/ear$(E)
	install -D obj/$(PLATFORM)/bin/ecc$(E) $(BINDIR)/ecc$(E)
	install -D obj/$(PLATFORM)/bin/ecp$(E) $(BINDIR)/ecp$(E)
	install -D obj/$(PLATFORM)/bin/ecs$(E) $(BINDIR)/ecs$(E)
	install -D obj/$(PLATFORM)/bin/epj2make$(E) $(BINDIR)/epj2make$(E)
	install -D obj/$(PLATFORM)/bin/documentor$(E) $(BINDIR)/documentor$(E)
ifdef CodeGuard
	install -D obj/$(PLATFORM)/bin/CodeGuard$(E) $(BINDIR)/CodeGuard$(E)
endif
	install -D obj/$(PLATFORM)/lib/libecereVanilla$(A) $(SLIBDIR)/libecereVanilla$(A)
	install -D doc/tao.pdf $(DOCDIR)/"Ecere Tao of Programming [work in progress].pdf"
	install -D doc/ecere.eCdoc $(DOCDIR)/ecere.eCdoc
	install -D doc/ecereCOM.eCdoc $(DOCDIR)/ecereCOM.eCdoc
	install -D doc/EDA.eCdoc $(DOCDIR)/EDA.eCdoc
	mkdir -p -m 777 $(SAMPLESDIR)
	cp -pRf samples/* $(SAMPLESDIR)
	mkdir -p -m 777 $(EXTRASDIR)
	cp -pRf extras/* $(EXTRASDIR)
endif
endif
	@$(call echo,The Ecere SDK has been installed.)

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
