# etcpak 0.7 #
(Updated 2020-05-27)

## The fastest ETC compressor on the planet ##

etcpak is an extremely fast [Ericsson Texture Compression](http://en.wikipedia.org/wiki/Ericsson_Texture_Compression) and S3 Texture Compression (DXT1/DXT5) utility. Currently it's best suited for rapid assets preparation during development, when graphics quality is not a concern, but it's also used in production builds of applications used by millions of people.

## Compression times ##

Benchmark performed on an AMD Ryzen 9 3900X, using a real-life RGBA 16K × 16K atlas. Tests were performed using a single CPU core.

ETC1: **370.3 Mpx/s**  
ETC1 + dithering: **278.8 Mpx/s**  
ETC1 alpha: **568.1 Mpx/s**  
ETC2 RGB: **188.6 Mpx/s**  
ETC2 RGBA: **140.8 Mpx/s**  
DXT1: **2372 Mpx/s**  
DXT5: **1167 Mps/s**

ARM benchmark performed on Odroid C2, using the same atlas:

ETC1: **23.6 Mpx/s**  
ETC1 + dithering: **23.4 Mpx/s**  
ETC1 alpha: **36.6 Mpx/s**  
ETC2 RGB: **12.1 Mpx/s**  
ETC2 RGBA: **2.83 Mpx/s**  
DXT1: **120.2 Mpx/s**  
DXT5: **83.3 Mps/s**

[Why there's no image quality metrics? / Quality comparison.](http://i.imgur.com/FxlmUOF.png)

## Decompression times ##

etcpak can also decompress ETC1, ETC2 (no T or H blocks), DXT1 and DXT5 textures. Timings on Ryzen:

ETC1: **332.5 Mpx/s**  
ETC2 RGB: **470.1 Mpx/s**  
ETC2 RGBA: **340.8 Mpx/s**  
DXT1: **682.7 Mpx/s**  
DXT5: **518.9 Mpx/s**

ARM timings:

ETC1: **60 Mpx/s**  
ETC2 RGB: **88.5 Mpx/s**  
ETC2 RGBA: **64.2 Mpx/s**  
DXT1: **120.2 Mpx/s**  
DXT5: **83.3 Mpx/s**

To give some perspective here, Nvidia in-driver ETC2 decoder can do only 42.5 Mpx/s.

## Quality comparison ##

Original image:

![](http://1.bp.blogspot.com/-kqFgRVL0uKY/UbSclN-fZdI/AAAAAAAAAxU/Fy87I8P4Yxs/s1600/kodim23.png)

Compressed image:

ETC1:
![](http://i.imgur.com/xmdht4u.png "ETC1 mode")
ETC2:
![](http://i.imgur.com/v7Dw2Yz.png "ETC2 mode")

## More information ##

[etcpak 0.6](http://zgredowo.blogspot.com/2018/07/etcpak-06.html)  
[etcpak 0.5](http://zgredowo.blogspot.com/2016/01/etcpak-05.html)  
[etcpak 0.4](http://zgredowo.blogspot.com/2016/01/etcpak-04.html)  
[etcpak 0.3](http://zgredowo.blogspot.com/2014/05/etcpak-03.html)  
[etcpak 0.2.2](http://zgredowo.blogspot.com/2014/03/etcpack-022.html)  
[etcpak 0.2.1](http://zgredowo.blogspot.com/2013/08/etcpak-021.html)   
[etcpak 0.2](http://zgredowo.blogspot.com/2013/07/etcpak-02.html)  
[etcpak 0.1](http://zgredowo.blogspot.com/2013/06/fastest-etc-compressor-on-planet.html)
