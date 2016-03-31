# pic16f1455 - pic14 lvp arduino programmer
---

	build.sh - script i am using for building test.c
	pic_programmer.ino - arduino project for programmer
	prog.py - programmer interface
    
---
Sample:

	./build.sh test.c
	./prog.py test.hex

Output of programmer:

	[mistrall@werkzeug pic16f1455] 21:34:06 0 $ ./prog.py test.hex 
	Dev info
	User ID = 3FFF 3FFF 3FFF 3FFF  Revision ID = 1006 Device ID = 3021 Configuration = 3FFF 3F4F Calibration = 3CC4 1DF3

	Reset
	Erase
	Program
	[##############################] 100.0% Done
	Read back
	Verify
	0 Error(s)
	Fusing config word 1. Fused = 3FFF OK
	Fusing config word 2. Fused = 3F4F OK
	Exit prog
	[mistrall@werkzeug pic16f1455] 21:37:52 0 $

---
	
Arduino (tested on Arduino Due) wiring:
    
	#define  CLOCK  9 -> goes to pic pin 9
	#define  DATA   8 -> goes to pic pin 10
	#define  MCLR   7 -> goes to pic pin 4
	#define  VPP1   2 -\
	#define  VPP2   3 ---> goes to pic pin 14 (just one should do the job)
	#define  VPP3   4 -/
	pic pin 1 goest to GND
    
---

Tested on pic16f1455, probably works (after some tune-ups) with other pic's.

Based on this doc: http://ww1.microchip.com/downloads/en/DeviceDoc/41620C.pdf

Have fun.
