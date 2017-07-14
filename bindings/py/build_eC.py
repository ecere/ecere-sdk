from cffi import FFI

ffi_eC = FFI()
ffi_eC.cdef(open('cffi-eC.h').read())
ffi_eC.set_source("_pyeC",
               '#include "eC.h"',
               sources=["../c/eC.c"],
               define_macros=[('BINDINGS_SHARED', None), ('EC_EXPORT', None)],
               extra_compile_args=["-O2"],
               include_dirs=["../c"],
               libraries=["ecere"],
               library_dirs=["C:/Program Files/Ecere SDK/bin"])

if __name__ == "__main__":
    ffi_eC.compile(verbose=True)
