@echo off
rem set path=e:\bison2.4\bin
set path=e:\msysW64\bin
bison --defines=grammar.h --locations --report=lookahead --verbose grammar.y -o grammar.ec
