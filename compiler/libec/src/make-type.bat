@echo off
set path=d:\bison2.4\bin
bison --locations --report=lookahead --verbose type.y -o type.ec
