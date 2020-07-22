@echo off

echo flex 2.5.5b compiled from source on linux was successfully used to regenerate lexer.ec at some point
echo
echo           https://github.com/westes/flex/releases
echo           https://github.com/westes/flex/archive/flex-2-5-5b.tar.gz
echo
echo           install dependencies:
echo                 sudo pacman -S automake autoconf libtool
echo                 git clone https://aur.archlinux.org/shtool.git && shtool && makepkg -si
echo
echo           compile from source:
echo                 ./autogen.sh
echo                 automake --add-missing
echo                 autoreconf -i
echo                 ./configure
echo                 make
echo
echo check if the following 2 versions are close enough
echo 2.5.4 -- original required version of flex
set path=e:\msys.bak\1.0\bin;%path%
flex --version
flex -olexer.ec lexer.l
