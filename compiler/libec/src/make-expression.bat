@echo off
set path=e:\bison2.4\bin
bison --locations --report=lookahead --verbose expression.y -o expression.ec
