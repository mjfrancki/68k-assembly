*-----------------------------------------------------------
* Title      : Lab #2A Question 2
* Written by : Michael Francki
* Description: A program that reads two numbers from the
*              keyboard and prints their difference to the
*              screen
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

* Read first input and load into D2
    move.w  #4,D0       ; load input from keyboard into D1
    trap    #15         ; read input
    move.w  D1,D2       ; load input from D1 into D2

* Read second input and load into D3
    move.w  #4,D0       ; load input from keyboard into D1
    trap    #15         ; read input
    move.w  D1,D3       ; load input from D1 into D3

* Load D2 into D1 and subtract D3 from D1
    move.w  D2,D1
    sub.w   D3,D1

* Display D1
    move.w  #14,D0      ; load task #14 into D0 (display NULL terminated string at A1)
    lea textD1,A1       ; load effective address of textD1 into A1
    trap    #15         ; display contents of A1

    move.w  #3,D0       ; load task #3 into D0 (display signed num in D1)
    trap    #15         ; display contents of D1

    SIMHALT             ; halt simulator

* Put variables and constants here
textD1  dc.w    'D1 <- D2 - D3: ',0

    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
