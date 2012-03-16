@echo off
set path=e:\bison2.4\bin
bison --defines=grammar.h --locations --report=lookahead --verbose grammar.y -o grammar.ec
