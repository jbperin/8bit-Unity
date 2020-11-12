/*
 *	API of the "8bit-Unity" SDK for CC65
 *	All functions are cross-platform for the Apple IIe, Atari XL/XE, and C64/C128
 *	
 *	Last modified: 2019/07/12
 *	
 * Copyright (c) 2019 Anthony Beaucamp.
 *
 * This software is provided 'as-is', without any express or implied warranty.
 * In no event will the authors be held liable for any damages arising from
 * the use of this software.
 *
 * Permission is granted to anyone to use this software for any purpose,
 * including commercial applications, and to alter it and redistribute it
 * freely, subject to the following restrictions:
 *
 *   1. The origin of this software must not be misrepresented * you must not
 *   claim that you wrote the original software. If you use this software in a
 *   product, an acknowledgment in the product documentation would be
 *   appreciated but is not required.
 *
 *   2. Altered source versions must be plainly marked as such, and must not
 *   be misrepresented as being the original software.
 *
 *   3. This notice may not be removed or altered from any distribution.
 *
 *   4. The names of this software and/or it's copyright holders may not be
 *   used to endorse or promote products derived from this software without
 *   specific prior written permission.
 *
 *	Credits: 
 *		* Oliver Schmidt for his IP65 network interface
 *		* Christian Groessler for helping optimize the memory maps on Commodore and Atari
 *		* Bill Buckels for his Apple II Double Hi-Res bitmap code
 */
 
// Memory Map
#define BITMAPRAM  (0x2000)
#define SPRITERAM  (0xa800)	// A800-BBFF (sprites.app loaded here)
#define MUSICRAM   (0xbc00) // BC00-BEFF (electric duet track loaded here)
#define CHARMAPRAM (0x0000) // 6000-7BFF (charmap data)
#define CHARSETRAM (0x0000) // 7B00-7EFF (charset data)
#define CHARFLGRAM (0x0000) // 7F00-7FFF (charflag data)

// Character Mode
#define CHR_COLS 40
#define CHR_ROWS 24

// Bitmap Mode (Single or Double Hires)
#define BMP_COLS 140
#define BMP_ROWS 192
#define BMP_PALETTE 16

// Bitmap Palette
#if defined __DHR__
  #define BLACK   0
  #define DBLUE	  1
  #define DGREEN  2
  #define BLUE	  3
  #define CYAN	  3
  #define BROWN	  4
  #define GREY	  5
  #define GREEN	  6
  #define LGREEN  7
  #define RED 	  8
  #define PURPLE  9
  #define LGREY	 10
  #define LBLUE	 11
  #define ORANGE 12
  #define PINK	 13
  #define YELLOW 14
  #define WHITE  15
#else
  #define BLACK   0
  #define DBLUE	  1
  #define DGREEN  2
  #define BLUE	  3
  #define CYAN	  3
  #define BROWN	  4
  #define GREY	  3
  #define GREEN	  2
  #define LGREEN  2
  #define RED 	  4
  #define PURPLE  1
  #define LGREY	  3
  #define LBLUE	  3
  #define ORANGE  4
  #define PINK	  5
  #define YELLOW  2
  #define WHITE   5	
#endif

// Workaround for missing chardefs
#define CH_DEL  0x08

// Hires functions (see hires.s, pixel.c, blitXXX.s, pixelXXX.c)
extern unsigned char *hiresPtr, hiresPixel;
void SetHiresPointer(unsigned int x, unsigned int y);
#if defined __DHR__
  extern unsigned char *dhrmain, *dhraux;
  void SetColorDHR(unsigned char color);
  unsigned char GetColorDHR(void);
#else
  void SetColorSHR(unsigned char color);
  unsigned char GetColorSHR(void);
#endif

// Output for SFX/Music (see DUET.s, MOCKING.s)
extern unsigned char hasMocking;	
void DetectMocking(void);
void SFXMocking(unsigned int address);
void PlayMocking(unsigned int address);		
void PlaySpeaker(unsigned int address);
void UpdateMocking(void);		
void UpdateSpeaker(void);		
void StopMocking(void);

// Workaround for missing clock (see CLOCK.c)
#define TCK_PER_SEC	59u
void wait(unsigned char ticks);
clock_t clock(void);
unsigned sleep(unsigned seconds);
extern clock_t clk;	

// Using ProDos for File Management (see files.c)
void DirList(void);
unsigned char FileOpen(const char* fname);
void FileRead(char* buf, unsigned int len);
