*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

    clr.w d0
    move.w #$AB00, d1
    move.l #$7002, a4
    move.l #$70016, a5
loopy: 
    add.b d1, d0
    move.w do, (a4)+
    move.w d1, -(a5)
    addq.b #1, d1
    cmp.b #6, d1
    ble loopy
 trap #15
* Put program code here

    SIMHALT             ; halt simulator

* Put variables and constants here

    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
