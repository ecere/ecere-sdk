@echo off
set path=%path%;e:\msys\1.0\bin
bison --locations --report=lookahead --verbose expression.y -o expression.ec
