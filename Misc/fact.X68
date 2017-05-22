*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program
    move.w n, d0
    move.l #1, d7
    clr d2
    jsr fact
    
     
    trap #15
        SIMHALT 
    
fact:

     addq  #1,d2
     mulu d2,d7
     cmp.w d0, d2
     blt fact
     rts
* Put program code here

    SIMHALT             ; halt simulator

* Put variables and constants here
n dc.w 3
    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
