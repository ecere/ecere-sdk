from build_eC import FFI, ffi_eC

ffi_ecere = FFI()
ffi_ecere.include(ffi_eC)
ffi_ecere.cdef(open('cffi-ecere.h').read())
ffi_ecere.set_source("_pyecere",
               '#include "ecere.h"',
               sources=["../c/ecere.c"],
               define_macros=[('BINDINGS_SHARED', None), ('ECERE_EXPORT', None)],
               extra_compile_args=["-O2"],
               include_dirs=["../c"],
               libraries=["ecere"],
               extra_link_args=["_pyeC.pyd", "-O2"],
               library_dirs=["C:/Program Files/Ecere SDK/bin"])

if __name__ == "__main__":
    ffi_ecere.compile(verbose=True)
