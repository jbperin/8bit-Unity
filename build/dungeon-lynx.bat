echo off

setlocal enableextensions enabledelayedexpansion

mkdir lynx
cd lynx
del *.* /F /Q

echo --------------- CONVERT ASSETS ---------------  

copy ..\..\utils\scripts\lynx\cursor.png cursor.png
..\..\utils\scripts\png2bmp cursor.png
..\..\utils\scripts\lynx\sprpck -t6 -p2 -u cursor.bmp

copy ..\..\utils\scripts\lynx\keyboard.png keyboard.png
..\..\utils\scripts\png2bmp keyboard.png
..\..\utils\scripts\lynx\sprpck -t6 -p2 -u keyboard.bmp

copy ..\..\projects\dungeon\bitmaps\menu-lynx.png menu.png
..\..\utils\scripts\png2bmp menu.png
..\..\utils\scripts\lynx\sprpck -t6 -p2 -u menu.bmp

..\..\utils\py27\python ..\..\utils\scripts\lynx\LynxCharset.py ..\..\projects\dungeon\charmaps\quedex-lynx.png quedex.chr

copy ..\..\projects\dungeon\sprites\sprites-lynx.png sprites.png
..\..\utils\scripts\png2bmp sprites.png
..\..\utils\scripts\lynx\sprpck -t6 -p2 -u -r001032 -S008012 -a004006 sprites.bmp

copy ..\..\projects\dungeon\charmaps\level1.map level1.map
copy ..\..\projects\dungeon\charmaps\level1.tls level1.tls

set /a CHUNKNUM=0
set /a FILENUM=!CHUNKNUM!+5
copy ..\..\unity\Lynx\chipper.s soundbs.mac
..\..\utils\py27\python ../../utils/scripts/lynx/LynxChipper.py ../../projects/dungeon/music/dungeon-lynx.asm music00.asm _musData00 MUS0DATA"
del *.png /F /Q
del *.bmp /F /Q
del *.pal /F /Q

set FILESIZES=
for %%I in (menu.spr,level1.map,level1.tls,quedex.chr,music00.asm) do set FILESIZES=!FILESIZES!%%~zI,

for /f "tokens=*" %%A in (chunks.lst) do set FILESIZES=!FILESIZES!%%~zA,
@echo .global _fileNum  >> data.asm
@echo .global _fileSizes >> data.asm
@echo .global _fileNames >> data.asm
@echo .global _spriteNum  >> data.asm
@echo .global _spriteData >> data.asm
@echo .global _cursorData >> data.asm
@echo .global _keybrdData >> data.asm
@echo ; >> data.asm
@echo .segment "RODATA" >> data.asm
@echo _fileNum: .byte %FILENUM% >> data.asm
@echo _fileSizes: .word %FILESIZES:~0,-1% >> data.asm
@echo _fileNames: .addr _bmpName00,_mapName00,_mapName01,_chrName00,_musName00 >> data.asm
@echo _bmpName00: .byte "menu.img",0 >> data.asm
@echo _mapName00: .byte "level1.map",0 >> data.asm
@echo _mapName01: .byte "level1.tls",0 >> data.asm
@echo _chrName00: .byte "quedex.chr",0 >> data.asm
@echo _musName00: .byte "dungeon.mus",0 >> data.asm
@echo ; >> data.asm
@echo .segment "BMP0DATA" >> data.asm
@echo _bmpData00: .incbin "menu.spr" >> data.asm
@echo ; >> data.asm
@echo .segment "BMP1DATA" >> data.asm
@echo _mapData00: .incbin "level1.map" >> data.asm
@echo .segment "BMP2DATA" >> data.asm
@echo _mapData01: .incbin "level1.tls" >> data.asm
@echo ; >> data.asm
@echo .segment "BMP3DATA" >> data.asm
@echo _chrData00: .incbin "quedex.chr" >> data.asm
@echo .segment "MUS0DATA" >> data.asm
@echo .import _musData00 >> data.asm
@echo ; >> data.asm
@echo .segment "RODATA" >> data.asm
@echo _spriteNum: .byte 32 >> data.asm
@echo _spriteData: .addr _spr000, _spr001, _spr002, _spr003, _spr004, _spr005, _spr006, _spr007, _spr008, _spr009, _spr010, _spr011, _spr012, _spr013, _spr014, _spr015, _spr016, _spr017, _spr018, _spr019, _spr020, _spr021, _spr022, _spr023, _spr024, _spr025, _spr026, _spr027, _spr028, _spr029, _spr030, _spr031 >> data.asm
@echo _spr000: .incbin "sprites000000.spr" >> data.asm
@echo _spr001: .incbin "sprites001000.spr" >> data.asm
@echo _spr002: .incbin "sprites002000.spr" >> data.asm
@echo _spr003: .incbin "sprites003000.spr" >> data.asm
@echo _spr004: .incbin "sprites004000.spr" >> data.asm
@echo _spr005: .incbin "sprites005000.spr" >> data.asm
@echo _spr006: .incbin "sprites006000.spr" >> data.asm
@echo _spr007: .incbin "sprites007000.spr" >> data.asm
@echo _spr008: .incbin "sprites008000.spr" >> data.asm
@echo _spr009: .incbin "sprites009000.spr" >> data.asm
@echo _spr010: .incbin "sprites010000.spr" >> data.asm
@echo _spr011: .incbin "sprites011000.spr" >> data.asm
@echo _spr012: .incbin "sprites012000.spr" >> data.asm
@echo _spr013: .incbin "sprites013000.spr" >> data.asm
@echo _spr014: .incbin "sprites014000.spr" >> data.asm
@echo _spr015: .incbin "sprites015000.spr" >> data.asm
@echo _spr016: .incbin "sprites016000.spr" >> data.asm
@echo _spr017: .incbin "sprites017000.spr" >> data.asm
@echo _spr018: .incbin "sprites018000.spr" >> data.asm
@echo _spr019: .incbin "sprites019000.spr" >> data.asm
@echo _spr020: .incbin "sprites020000.spr" >> data.asm
@echo _spr021: .incbin "sprites021000.spr" >> data.asm
@echo _spr022: .incbin "sprites022000.spr" >> data.asm
@echo _spr023: .incbin "sprites023000.spr" >> data.asm
@echo _spr024: .incbin "sprites024000.spr" >> data.asm
@echo _spr025: .incbin "sprites025000.spr" >> data.asm
@echo _spr026: .incbin "sprites026000.spr" >> data.asm
@echo _spr027: .incbin "sprites027000.spr" >> data.asm
@echo _spr028: .incbin "sprites028000.spr" >> data.asm
@echo _spr029: .incbin "sprites029000.spr" >> data.asm
@echo _spr030: .incbin "sprites030000.spr" >> data.asm
@echo _spr031: .incbin "sprites031000.spr" >> data.asm
@echo ; >> data.asm
@echo _cursorData: .incbin "cursor.spr" >> data.asm
@echo _keybrdData: .incbin "keyboard.spr" >> data.asm

cd ..
cd ..

utils\py27\python utils/scripts/lynx/LynxConfig.py unity/Lynx/lynx.cfg build/lynx/lynx.cfg 4 1 0 %CHUNKNUM%
utils\py27\python utils/scripts/lynx/LynxDirectory.py unity/Lynx/directory.s build/lynx/directory.asm 4 1 0 %CHUNKNUM%

echo DONE!

echo --------------- COMPILE PROGRAM ---------------

utils\cc65\bin\cc65 -Cl -O -t lynx -I unity unity\bitmap.c
utils\cc65\bin\ca65 -t lynx --cpu 65SC02 unity\bitmap.s
del unity\bitmap.s
utils\cc65\bin\cc65 -Cl -O -t lynx -I unity unity\charmap.c
utils\cc65\bin\ca65 -t lynx --cpu 65SC02 unity\charmap.s
del unity\charmap.s
utils\cc65\bin\cc65 -Cl -O -t lynx -I unity unity\chunks.c
utils\cc65\bin\ca65 -t lynx --cpu 65SC02 unity\chunks.s
del unity\chunks.s
utils\cc65\bin\cc65 -Cl -O -t lynx -I unity unity\geom2d.c
utils\cc65\bin\ca65 -t lynx --cpu 65SC02 unity\geom2d.s
del unity\geom2d.s
utils\cc65\bin\cc65 -Cl -O -t lynx -I unity unity\hub.c
utils\cc65\bin\ca65 -t lynx --cpu 65SC02 unity\hub.s
del unity\hub.s
utils\cc65\bin\cc65 -Cl -O -t lynx -I unity unity\joystick.c
utils\cc65\bin\ca65 -t lynx --cpu 65SC02 unity\joystick.s
del unity\joystick.s
utils\cc65\bin\cc65 -Cl -O -t lynx -I unity unity\mouse.c
utils\cc65\bin\ca65 -t lynx --cpu 65SC02 unity\mouse.s
del unity\mouse.s
utils\cc65\bin\cc65 -Cl -O -t lynx -I unity unity\music.c
utils\cc65\bin\ca65 -t lynx --cpu 65SC02 unity\music.s
del unity\music.s
utils\cc65\bin\cc65 -Cl -O -t lynx -I unity unity\net-base.c
utils\cc65\bin\ca65 -t lynx --cpu 65SC02 unity\net-base.s
del unity\net-base.s
utils\cc65\bin\cc65 -Cl -O -t lynx -I unity unity\net-url.c
utils\cc65\bin\ca65 -t lynx --cpu 65SC02 unity\net-url.s
del unity\net-url.s
utils\cc65\bin\cc65 -Cl -O -t lynx -I unity unity\net-tcp.c
utils\cc65\bin\ca65 -t lynx --cpu 65SC02 unity\net-tcp.s
del unity\net-tcp.s
utils\cc65\bin\cc65 -Cl -O -t lynx -I unity unity\net-udp.c
utils\cc65\bin\ca65 -t lynx --cpu 65SC02 unity\net-udp.s
del unity\net-udp.s
utils\cc65\bin\cc65 -Cl -O -t lynx -I unity unity\net-web.c
utils\cc65\bin\ca65 -t lynx --cpu 65SC02 unity\net-web.s
del unity\net-web.s
utils\cc65\bin\cc65 -Cl -O -t lynx -I unity unity\pixel.c
utils\cc65\bin\ca65 -t lynx --cpu 65SC02 unity\pixel.s
del unity\pixel.s
utils\cc65\bin\cc65 -Cl -O -t lynx -I unity unity\print.c
utils\cc65\bin\ca65 -t lynx --cpu 65SC02 unity\print.s
del unity\print.s
utils\cc65\bin\cc65 -Cl -O -t lynx -I unity unity\scaling.c
utils\cc65\bin\ca65 -t lynx --cpu 65SC02 unity\scaling.s
del unity\scaling.s
utils\cc65\bin\cc65 -Cl -O -t lynx -I unity unity\sfx.c
utils\cc65\bin\ca65 -t lynx --cpu 65SC02 unity\sfx.s
del unity\sfx.s
utils\cc65\bin\cc65 -Cl -O -t lynx -I unity unity\sprites.c
utils\cc65\bin\ca65 -t lynx --cpu 65SC02 unity\sprites.s
del unity\sprites.s
utils\cc65\bin\cc65 -Cl -O -t lynx -I unity unity\widgets.c
utils\cc65\bin\ca65 -t lynx --cpu 65SC02 unity\widgets.s
del unity\widgets.s
utils\cc65\bin\cc65 -Cl -O -t lynx -I unity unity\Lynx\display.c
utils\cc65\bin\ca65 -t lynx --cpu 65SC02 unity\Lynx\display.s
del unity\Lynx\display.s
utils\cc65\bin\cc65 -Cl -O -t lynx -I unity unity\Lynx\files.c
utils\cc65\bin\ca65 -t lynx --cpu 65SC02 unity\Lynx\files.s
del unity\Lynx\files.s
utils\cc65\bin\ca65 -t lynx --cpu 65SC02 unity\atan2.s
utils\cc65\bin\ca65 -t lynx --cpu 65SC02 unity\chars.s
utils\cc65\bin\ca65 -t lynx --cpu 65SC02 unity\tiles.s
utils\cc65\bin\ca65 -t lynx --cpu 65SC02 unity\Lynx\header.s
utils\cc65\bin\ca65 -t lynx --cpu 65SC02 unity\Lynx\scroll.s
utils\cc65\bin\ca65 -t lynx --cpu 65SC02 unity\Lynx\serial.s
utils\cc65\bin\ca65 -t lynx --cpu 65SC02 unity\Lynx\suzy.s
utils\cc65\bin\ar65 r build/lynx/unity.lib unity\bitmap.o unity\charmap.o unity\chunks.o unity\geom2d.o unity\hub.o unity\joystick.o unity\mouse.o unity\music.o unity\net-base.o unity\net-url.o unity\net-tcp.o unity\net-udp.o unity\net-web.o unity\pixel.o unity\print.o unity\scaling.o unity\sfx.o unity\sprites.o unity\widgets.o unity\Lynx\display.o unity\Lynx\files.o unity\atan2.o unity\chars.o unity\tiles.o unity\Lynx\header.o unity\Lynx\scroll.o unity\Lynx\serial.o unity\Lynx\suzy.o 
utils\cc65\bin\cl65 -o build/dungeon-lynx.lnx -m build/dungeon-lynx.map -Cl -O -t lynx -C build/lynx/lynx.cfg -I unity projects/dungeon/src/dungeon.c projects/dungeon/src/interface.c build/lynx/music00.asm unity/Lynx/sfx.s build/lynx/directory.asm build/lynx/data.asm build/lynx/unity.lib

echo DONE!

pause

cd "utils\emulators\Handy-0.98-Hub"
handy.exe "..\..\..\build\dungeon-lynx.lnx"