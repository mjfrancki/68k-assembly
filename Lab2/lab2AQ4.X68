*-----------------------------------------------------------
* Title      : Lab #2A Question 4
* Written by : Michael Francki
* Description: A program that executes the following C program:
*
* Unsigned int var1 = 0x00000000;
* Unsigned int var2 = 0x11223344;
* Unsigned int var3 = 0x55667788;
* main()
* {
*   if(a > b)
*   printf(�Hello CPS310�);
*   else
*   printf(�Good Bye CPS213�);
* }
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

    move.l  var1,D2
    move.l  var2,D3
    move.l  var3,D4

if  cmp.l   D4,D3
    bgt then
else    move.w  #14,D0
    lea text1,A1
    trap    #15
    bra endif
then    move.w  #14,D0
    lea text2,A1
    trap    #15
endif

    SIMHALT             ; halt simulator

* Put variables and constants here
var1    dc.l    $00000000
var2    dc.l    $11223344
var3    dc.l    $55667788
text1   dc.w    'Good Bye CPS213',0
text2   dc.w    'Hello CPS310',0
    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
