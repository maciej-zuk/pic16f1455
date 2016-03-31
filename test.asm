;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Dec  6 2015) (Linux)
; This file was generated Thu Mar 31 21:39:02 2016
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
;	.file	"test.c"
	list	p=16f1455
	radix dec
	include "p16f1455.inc"
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_STATUSbits
	extern	_BSRbits
	extern	_INTCONbits
	extern	_PORTAbits
	extern	_PORTCbits
	extern	_PIR1bits
	extern	_PIR2bits
	extern	_T1CONbits
	extern	_T1GCONbits
	extern	_T2CONbits
	extern	_TRISAbits
	extern	_TRISCbits
	extern	_PIE1bits
	extern	_PIE2bits
	extern	_OPTION_REGbits
	extern	_PCONbits
	extern	_WDTCONbits
	extern	_OSCTUNEbits
	extern	_OSCCONbits
	extern	_OSCSTATbits
	extern	_ADCON0bits
	extern	_ADCON1bits
	extern	_ADCON2bits
	extern	_LATAbits
	extern	_LATCbits
	extern	_CM1CON0bits
	extern	_CM1CON1bits
	extern	_CM2CON0bits
	extern	_CM2CON1bits
	extern	_CMOUTbits
	extern	_BORCONbits
	extern	_FVRCONbits
	extern	_DACCON0bits
	extern	_DACCON1bits
	extern	_APFCONbits
	extern	_ANSELAbits
	extern	_ANSELCbits
	extern	_PMCON1bits
	extern	_VREGCONbits
	extern	_RCSTAbits
	extern	_TXSTAbits
	extern	_BAUDCONbits
	extern	_WPUAbits
	extern	_SSP1STATbits
	extern	_SSPSTATbits
	extern	_SSP1CON1bits
	extern	_SSPCONbits
	extern	_SSPCON1bits
	extern	_SSP1CON2bits
	extern	_SSPCON2bits
	extern	_SSP1CON3bits
	extern	_SSPCON3bits
	extern	_IOCAPbits
	extern	_IOCANbits
	extern	_IOCAFbits
	extern	_CLKRCONbits
	extern	_ACTCONbits
	extern	_PWM1DCLbits
	extern	_PWM1DCHbits
	extern	_PWM1CONbits
	extern	_PWM1CON0bits
	extern	_PWM2DCLbits
	extern	_PWM2DCHbits
	extern	_PWM2CONbits
	extern	_CWG1DBRbits
	extern	_CWG1DBFbits
	extern	_CWG1CON0bits
	extern	_CWG1CON1bits
	extern	_CWG1CON2bits
	extern	_UCONbits
	extern	_USTATbits
	extern	_UIRbits
	extern	_UCFGbits
	extern	_UIEbits
	extern	_UEIRbits
	extern	_UFRMHbits
	extern	_UFRMLbits
	extern	_UADDRbits
	extern	_UEIEbits
	extern	_UEP0bits
	extern	_UEP1bits
	extern	_UEP2bits
	extern	_UEP3bits
	extern	_UEP4bits
	extern	_UEP5bits
	extern	_UEP6bits
	extern	_UEP7bits
	extern	_STATUS_SHADbits
	extern	_INDF0
	extern	_INDF1
	extern	_PCL
	extern	_STATUS
	extern	_FSR0
	extern	_FSR0L
	extern	_FSR0H
	extern	_FSR1
	extern	_FSR1L
	extern	_FSR1H
	extern	_BSR
	extern	_WREG
	extern	_PCLATH
	extern	_INTCON
	extern	_PORTA
	extern	_PORTC
	extern	_PIR1
	extern	_PIR2
	extern	_TMR0
	extern	_TMR1
	extern	_TMR1L
	extern	_TMR1H
	extern	_T1CON
	extern	_T1GCON
	extern	_TMR2
	extern	_PR2
	extern	_T2CON
	extern	_TRISA
	extern	_TRISC
	extern	_PIE1
	extern	_PIE2
	extern	_OPTION_REG
	extern	_PCON
	extern	_WDTCON
	extern	_OSCTUNE
	extern	_OSCCON
	extern	_OSCSTAT
	extern	_ADRES
	extern	_ADRESL
	extern	_ADRESH
	extern	_ADCON0
	extern	_ADCON1
	extern	_ADCON2
	extern	_LATA
	extern	_LATC
	extern	_CM1CON0
	extern	_CM1CON1
	extern	_CM2CON0
	extern	_CM2CON1
	extern	_CMOUT
	extern	_BORCON
	extern	_FVRCON
	extern	_DACCON0
	extern	_DACCON1
	extern	_APFCON
	extern	_ANSELA
	extern	_ANSELC
	extern	_PMADR
	extern	_PMADRL
	extern	_PMADRH
	extern	_PMDAT
	extern	_PMDATL
	extern	_PMDATH
	extern	_PMCON1
	extern	_PMCON2
	extern	_VREGCON
	extern	_RCREG
	extern	_TXREG
	extern	_SPBRG
	extern	_SPBRGL
	extern	_SPBRGH
	extern	_RCSTA
	extern	_TXSTA
	extern	_BAUDCON
	extern	_WPUA
	extern	_SSP1BUF
	extern	_SSPBUF
	extern	_SSP1ADD
	extern	_SSPADD
	extern	_SSP1MSK
	extern	_SSPMSK
	extern	_SSP1STAT
	extern	_SSPSTAT
	extern	_SSP1CON1
	extern	_SSPCON
	extern	_SSPCON1
	extern	_SSP1CON2
	extern	_SSPCON2
	extern	_SSP1CON3
	extern	_SSPCON3
	extern	_IOCAP
	extern	_IOCAN
	extern	_IOCAF
	extern	_CLKRCON
	extern	_ACTCON
	extern	_PWM1DCL
	extern	_PWM1DCH
	extern	_PWM1CON
	extern	_PWM1CON0
	extern	_PWM2DCL
	extern	_PWM2DCH
	extern	_PWM2CON
	extern	_CWG1DBR
	extern	_CWG1DBF
	extern	_CWG1CON0
	extern	_CWG1CON1
	extern	_CWG1CON2
	extern	_UCON
	extern	_USTAT
	extern	_UIR
	extern	_UCFG
	extern	_UIE
	extern	_UEIR
	extern	_UFRM
	extern	_UFRMH
	extern	_UFRML
	extern	_UADDR
	extern	_UEIE
	extern	_UEP0
	extern	_UEP1
	extern	_UEP2
	extern	_UEP3
	extern	_UEP4
	extern	_UEP5
	extern	_UEP6
	extern	_UEP7
	extern	_STATUS_SHAD
	extern	_WREG_SHAD
	extern	_BSR_SHAD
	extern	_PCLATH_SHAD
	extern	_FSR0L_SHAD
	extern	_FSR0H_SHAD
	extern	_FSR1L_SHAD
	extern	_FSR1H_SHAD
	extern	_STKPTR
	extern	_TOSL
	extern	_TOSH
	extern	__sdcc_gsinit_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	global	_main

	global PSAVE
	global SSAVE
	global WSAVE
	global STK12
	global STK11
	global STK10
	global STK09
	global STK08
	global STK07
	global STK06
	global STK05
	global STK04
	global STK03
	global STK02
	global STK01
	global STK00

sharebank udata_ovr 0x0070
PSAVE	res 1
SSAVE	res 1
WSAVE	res 1
STK12	res 1
STK11	res 1
STK10	res 1
STK09	res 1
STK08	res 1
STK07	res 1
STK06	res 1
STK05	res 1
STK04	res 1
STK03	res 1
STK02	res 1
STK01	res 1
STK00	res 1

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_test_0	udata
r0x1000	res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	udata_ovr
;--------------------------------------------------------
; reset vector 
;--------------------------------------------------------
STARTUP	code 0x0000
	nop
	pagesel __sdcc_gsinit_startup
	goto	__sdcc_gsinit_startup
;--------------------------------------------------------
; code
;--------------------------------------------------------
code_test	code
;***
;  pBlock Stats: dbName = M
;***
;entry:  _main	;Function start
; 2 exit points
;has an exit
;1 compiler assigned register :
;   r0x1000
;; Starting pCode block
_main	;Function start
; 2 exit points
;	.line	4; "test.c"	unsigned char c=0;
	BANKSEL	r0x1000
	CLRF	r0x1000
;	.line	5; "test.c"	TRISC3 = 0;
	BANKSEL	_TRISCbits
	BCF	_TRISCbits,3
;	.line	6; "test.c"	ANSC3 = 0;
	BANKSEL	_ANSELCbits
	BCF	_ANSELCbits,3
;	.line	7; "test.c"	OSCCON = 0xbf;
	MOVLW	0xbf
	BANKSEL	_OSCCON
	MOVWF	_OSCCON
_00106_DS_
;	.line	10; "test.c"	PORTC=c;
	BANKSEL	r0x1000
	MOVF	r0x1000,W
	BANKSEL	_PORTC
	MOVWF	_PORTC
;	.line	11; "test.c"	c^=1<<3;
	MOVLW	0x08
	BANKSEL	r0x1000
	XORWF	r0x1000,F
	GOTO	_00106_DS_
	RETURN	
; exit point of _main


;	code size estimation:
;	   11+    7 =    18 instructions (   50 byte)

	end
