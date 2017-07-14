from build_ecere import FFI, ffi_eC, ffi_ecere

ffi_EDA = FFI()
ffi_EDA.include(ffi_ecere)
ffi_EDA.cdef(open('cffi-EDA.h').read())
ffi_EDA.set_source("_pyEDA",
               '#include "EDA.h"',
               sources=["../c/EDA.c"],
               define_macros=[('BINDINGS_SHARED', None), ('EDA_EXPORT', None)],
               extra_compile_args=["-O2"],
               include_dirs=["../c"],
               libraries=["ecere"],
               extra_link_args=["_pyecere.pyd", "_pyeC.pyd", "-O2"],
               library_dirs=["C:/Program Files/Ecere SDK/bin"])

if __name__ == "__main__":
    ffi_EDA.compile(verbose=True)
