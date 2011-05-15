@echo off
set path=%path%;e:\msys\1.0\bin
bison -t --locations --report=lookahead --verbose grammar.y -o grammar.debug.ec
