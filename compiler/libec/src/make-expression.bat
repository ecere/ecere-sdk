@echo off
set path=d:\bison2.4\bin
bison --locations --report=lookahead --verbose expression.y -o expression.ec
