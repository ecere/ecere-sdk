[![GitHub version](https://badge.fury.io/gh/ecere%2Fecere-sdk.svg)](https://github.com/ecere/ecere-sdk/releases/latest)
[![Travis status](https://api.travis-ci.org/ecere/ecere-sdk.svg?branch=master)](https://travis-ci.org/ecere/ecere-sdk)
[![Ecere docs](https://img.shields.io/badge/docs-being_improved-yellow.svg)](http://ecere.org/overview)<br>
[![GitHub size](https://reposs.herokuapp.com/?path=ecere/ecere-sdk&style=flat)](https://github.com/ecere/ecere-sdk/graphs/traffic)
[![GitHub license](https://img.shields.io/badge/license-BSD%203--Clause%20(Revised)-blue.svg)](https://tldrlegal.com/license/bsd-3-clause-license-(revised))<br>
[![Ecere web](https://img.shields.io/badge/web-ecere.org-9DA1CA.svg)](http://ecere.org)
[![Ecere web](https://img.shields.io/badge/web-ec--lang.org-9DA1CA.svg)](http://ec-lang.org)
[![Ecere forum](https://img.shields.io/badge/forum-ecere.org%2Fforums-9DA1CA.svg)](http://ecere.org/forums)
[![Ecere tracker](https://img.shields.io/badge/tracker-ecere.org%2Fmantis-9DA1CA.svg)](http://ecere.org/mantis)
[![Freenode chat](https://img.shields.io/badge/irc-%20Freenode_%23ecere-9DA1CA.svg)](http://webchat.freenode.net/?channels=ecere)<br>
[![Meetup group](https://img.shields.io/badge/meetup-Ottawa-88B094.svg)](http://www.meetup.com/eC-Programming-Language-Meetup)

# Ecere SDK
#### Free Open Source Software released under the New BSD license

The **Ecere SDK** is a Software Development Kit including:

   * A set of compiling tools for the **[eC programming language](http://ec-lang.org)**

   * An Integrated Development Environment, with the usual features such as:
      - A source code editor with auto-completion, syntax highlighting
      - Management of application and library projects
      - A visual debugger
      - A Rapid Application Development form designer, based on
        properties & methods

![Ecere IDE Screenshot](http://ecere.com/wiki/images/0/01/IdeShotSept2011.png)

   * A run time library, providing a uniform API across platforms, featuring:
      - A GUI toolkit (with a vast collection of powerful controls:
        Buttons, Edit boxes, Drop/Combo boxes, Menus, Tabs,
        Tree views/Grids/List boxes, file dialogs, ...)
      - A 2D graphics API (bitmaps, fonts, international text, basic drawing)
      - A 3D graphics API, supporting both Direct3D and OpenGL
        (3DS file format support)
      - A networking API which provide Sockets as well as a
        distributed objects system for eC
      - System functionality such as file access, multi-threading &
        synchronization, handling date & time, etc.

![Ecere Games Screenshot](http://ecere.com/shots/games.jpg)

![GNOSIS Screenshot](http://ecere.com/wiki/images/7/76/NorthWest.jpg)

   * Additional libraries and code for more features, such as:
      - The Ecere Data Access (EDA) layer, an abstract relational database
        API, providing an active record system for eC. Currently it has
        drivers for a minimal Ecere RDBMS and SQLite (as well as an encrypted
        version using SQLCipher), and recently a basic Oracle driver was
        introduced
      - An audio library (supporting DirectSound on Windows and ALSA on Linux)
      - WIA Scanning support on Windows
      - SSL Sockets suport through OpenSSL
      - A 2D tiled based game graphics engine (Tiled map, Sprites, A*)

![Acovel Media Player Screenshot](http://ecere.com/wiki/images/7/72/Acovel3.png)

-----------------------------------------------------------------------------

## INSTALLATION

Please refer to the latest instructions at http://ecere.org/install.

Windows binaries are available from that page.

Daily-built Ubuntu Debian packages are available from our [Ubuntu PPA](https://code.launchpad.net/~ecere-team/+archive/ppa).

To build from source, simply type 'make' ('mingw32-make' on Windows).

It should build fine on Linux, on Windows with [MinGW](http://mingw.org) or [MinGW-w64](http://mingw-w64.org),
on Mac OS X with Xcode command line tools installed or on FreeBSD (with gmake).

To install, type 'make install' ('mingw32-make install' on Windows).

64-bit is now supported.

Executables can also be deployed to the Android platform using the Android NDK. Please refer to http://ecere.org/android .

They can also deployed to the Web using [Emscripten](http://emscripten.org). Please refer to http://ecere.org/web .

## DOCUMENTATION

[![Tao](http://ecere.com/images/tao.png)](http://ecere.org/tao.pdf)
The [Ecere Tao of Programming](http://ecere.org/tao.pdf) is a Programmer's Guide (still work in progress)
that will teach you the foundations of eC and Ecere. You will find it under:

   *(Windows)*    %PROGRAMFILES%\Ecere SDK\doc\Ecere Tao of Programming [work in progress].pdf
   *(Linux/Unix)* /usr/share/doc/tao.pdf

Please check out the [samples](http://github.com/ecere/ecere-sdk/tree/master/samples) that come with the SDK.

You can see a list of the most interesting ones as well as prebuilt binaries at http://ecere.org/software.

When installing the SDK, the samples get installed in:

   *(Windows)*      %APPDATA%\Ecere SDK\Samples
   *(Linux/Unix)*   /usr/share/ecere/samples/

On Unix you might need to make a copy to a directory with write permissions in order to compile them.

The Documentor is a tool under development to browse and document the APIs of
eC modules. You can use it to browse all available classes, methods and properties
of the Ecere runtime library. It is available from the Help menu in the IDE (F1).
However, at the moment the tool itself is being improved, and so not much
descriptive info has been added yet.

## COMMUNITY

[Git Repository](http://github.com/ecere/ecere-sdk) ( git://github.com/ecere/ecere-sdk.git )<br>
[Support forums](http://ecere.org/forums)<br>
[Bug tracker](http://ecere.org/mantis)<br>
[IRC](http://webchat.freenode.net/?channels=ecere) - **#ecere** on irc.freenode.net<br>
