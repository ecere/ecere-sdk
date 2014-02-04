@echo off
rem set path=e:\bison2.4\bin
set path=e:\msysW64\bin
bison --locations --report=lookahead --verbose type.y -o type.ec
