gen:
	@$(call echo,Generating $(_BGEN_LANGNAME) Bindings...)
	$(BGEN) $(_BGEN_ARGS)

cleangen:
	$(call rm,$(_BGEN_OUTPUT))

cleanobj: cleangen
	$(call rm,$(_BINDINGS_OBJECTS))
	$(call rmr,$(_BINDINGS_TMP_DIRS))

cleantarget: cleanobj
	$(if $(_BGL1),+cd $(_BGL1) && $(_MAKE) cleantarget,)
	$(if $(_BGL2),+cd $(_BGL2) && $(_MAKE) cleantarget,)
	$(if $(_BGL3),+cd $(_BGL3) && $(_MAKE) cleantarget,)
	$(if $(_BGL4),+cd $(_BGL4) && $(_MAKE) cleantarget,)

clean: cleanobj
	$(if $(_BGL1),+cd $(_BGL1) && $(_MAKE) clean,)
	$(if $(_BGL2),+cd $(_BGL2) && $(_MAKE) clean,)
	$(if $(_BGL3),+cd $(_BGL3) && $(_MAKE) clean,)
	$(if $(_BGL4),+cd $(_BGL4) && $(_MAKE) clean,)

realclean: cleanobj
	$(if $(_BGL1),+cd $(_BGL1) && $(_MAKE) realclean,)
	$(if $(_BGL2),+cd $(_BGL2) && $(_MAKE) realclean,)
	$(if $(_BGL3),+cd $(_BGL3) && $(_MAKE) realclean,)
	$(if $(_BGL4),+cd $(_BGL4) && $(_MAKE) realclean,)

distclean:
	$(_MAKE) -f $(_CF_DIR)Cleanfile distclean distclean_all_subdirs

Makefile: ;
$(_CF_DIR)crossplatform.mk: ;
$(_CF_DIR)default.cf: ;
../bgen_setup.mk: ;
../bgen_targets.mk: ;
