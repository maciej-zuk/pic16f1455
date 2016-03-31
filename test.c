#include <pic14/pic16f1455.h>
#include <pic14/pic16f1455.h>
void  main(){
	unsigned char c=0;
	TRISC3 = 0;
	ANSC3 = 0;
	OSCCON = 0xbf;

	for(;;){
		PORTC=c;
		c^=1<<3;
	}
}

