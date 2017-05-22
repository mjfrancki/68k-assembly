*-----------------------------------------------------------
* Title      : Lab #2A Question 1
* Written by : Michael Francki
* Description: A program that prints to screen the sum of two predefined numbers.
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

* Load A into D0 and add B into D1
    move.w  A,D1
    add.w   B,D1

* Display D1
    move.w    #14,D0    ; load task #14 into D0 (display NULL terminated string at A1)
    lea textD1,A1       ; load effective address of textD1 into A1
    trap    #15         ; display contents of A1

    move.w  #3,D0       ; load task #3 into D0 (display signed num in D1)
    trap    #15         ; display contents of D1
    SIMHALT             ; halt simulator

A   dc.w    1
B   dc.w    2
textD1  dc.w    'D1 contains: ',0   ; null terminated string

    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
