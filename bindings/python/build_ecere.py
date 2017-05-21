from cffi import FFI
ffi = FFI()
ffi.cdef(open('cffi-ecere.h').read())  
ffi.set_source("_pyecere",
   '#include "ecere.h"',
   sources = [ "../c/eC.c", "../c/ecere.c" ],
   include_dirs = ["../c"],
   libraries = ["ecere"],
   library_dirs = ["C:/Program Files/Ecere SDK/bin"])
if __name__ == "__main__":
   ffi.compile(verbose=True)
