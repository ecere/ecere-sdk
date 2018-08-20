gen:
	@$(call echo,Generating $(_BGEN_LANGNAME) Bindings...)
	$(BGEN) $(_BGEN_ARGS)

cleangen:
	$(call rm,$(_BGEN_OUTPUT))

cleanobj:
	$(call rm,$(_BINDINGS_OBJECTS))
	$(call rmr,$(_BINDINGS_TMP_DIRS))

cleantarget: cleanobj
	$(call bgen_lib_cd_make,1,cleantarget)
	$(call bgen_lib_cd_make,2,cleantarget)
	$(call bgen_lib_cd_make,3,cleantarget)
	$(call bgen_lib_cd_make,4,cleantarget)
	$(call bgen_lib_cd_make,5,cleantarget)
	$(call bgen_lib_cd_make,6,cleantarget)
	$(call bgen_lib_cd_make,7,cleantarget)
	$(call bgen_lib_cd_make,8,cleantarget)
	$(call bgen_lib_cd_make,9,cleantarget)

clean: cleanobj
	$(call bgen_lib_cd_make,1,clean)
	$(call bgen_lib_cd_make,2,clean)
	$(call bgen_lib_cd_make,3,clean)
	$(call bgen_lib_cd_make,4,clean)
	$(call bgen_lib_cd_make,5,clean)
	$(call bgen_lib_cd_make,6,clean)
	$(call bgen_lib_cd_make,7,clean)
	$(call bgen_lib_cd_make,8,clean)
	$(call bgen_lib_cd_make,9,clean)

realclean: cleanobj
	$(call bgen_lib_cd_make,1,realclean)
	$(call bgen_lib_cd_make,2,realclean)
	$(call bgen_lib_cd_make,3,realclean)
	$(call bgen_lib_cd_make,4,realclean)
	$(call bgen_lib_cd_make,5,realclean)
	$(call bgen_lib_cd_make,6,realclean)
	$(call bgen_lib_cd_make,7,realclean)
	$(call bgen_lib_cd_make,8,realclean)
	$(call bgen_lib_cd_make,9,realclean)

wipeclean: cleanobj cleangen
	$(call bgen_lib_cd_make,1,wipeclean)
	$(call bgen_lib_cd_make,2,wipeclean)
	$(call bgen_lib_cd_make,3,wipeclean)
	$(call bgen_lib_cd_make,4,wipeclean)
	$(call bgen_lib_cd_make,5,wipeclean)
	$(call bgen_lib_cd_make,6,wipeclean)
	$(call bgen_lib_cd_make,7,wipeclean)
	$(call bgen_lib_cd_make,8,wipeclean)
	$(call bgen_lib_cd_make,9,wipeclean)

distclean:
	$(_MAKE) -f $(_CF_DIR)Cleanfile distclean distclean_all_subdirs

Makefile: ;
$(_CF_DIR)crossplatform.mk: ;
$(_CF_DIR)default.cf: ;
../bgen_setup.mk: ;
../bgen_targets.mk: ;
