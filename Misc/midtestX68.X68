*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program
    move.w num, d0
    move.w n, d1
    move #A, A0
    clr.l d2

LOOP:
    
    add.b #1,d2
    cmp.w d1,d2
    bgt DONE
    cmp.w (a0)+ ,d0
    bne COUNT
    bra LOOP
    
Count:
    
    addi.l #1,d4
    move.w (a0), d7
    bra LOOP


Done:
    
    trap #15    
* Put program code here

    SIMHALT             ; halt simulator

* Put variables and constants here

A dc.w 1,2,1,4,1,6,7,1,1,10
num dc.w 1
n dc.w 10     
    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
