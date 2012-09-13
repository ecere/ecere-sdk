@echo off
set path=e:\bison2.4\bin
bison --locations --report=lookahead --verbose type.y -o type.ec
