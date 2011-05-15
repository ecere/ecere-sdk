@echo off
set path=%path%;e:\msys\1.0\bin
bison -d --locations --report=lookahead --verbose grammar.y -o grammar.ec
