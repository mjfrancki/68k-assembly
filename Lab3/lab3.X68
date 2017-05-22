*-----------------------------------------------------------
* Title      : Lab 3
* Written by : Michael Francki
* Description: Write a subroutine called QUAD to compute the
*              value of following expression:
*
*              x = 3a + del
*              where,
*              del = sqrt(2b)
*
*              The values of a, and b are passed to the subroutine
*              by value. The subroutine stores the result in
*              the location x.
*              - There is no overflow occuring during any operations
*              - Not allowed to use MULTU, MULTS, DIVS, or DIVU
*              del is evaluated by calling a function called SQRT in
*              order to obtain the square root of the expression del.
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

* Put program code here
    move.w  a,-(sp)         ; push value of coefficient a on stack
    move.w  b,-(sp)         ; push value of coefficient b on stack
    move.l  #x,-(sp)        ; push the address of x on stack
    jsr QUAD                ; call subroutine
    add.w   #8,sp           ; reseting the stack pointer
    bra done                ; branch to end of program
* Saving current state to stack
QUAD    move.l  a0,-(sp)
        move.w  d0,-(sp)
        move.w  d1,-(sp)
        move.w  d2,-(sp)
        move.w  d3,-(sp)
        move.w  d4,-(sp)
* Moving from stack into registers
        move.w  24(sp),d0   ; move value of a into d0
        move.w  22(sp),d1   ; move value of b into d1
        movea.l 18(sp),a0   ; move address of x into a0
        add.w   a,d0
        add.w   a,d0        ; d0 = 3a
        add.w   b,d1        ; d1 = 2b
        clr.w   d2          ; clears d2
        clr.w   d3          ; clears d3
        bsr SQRT            ; branch to sqrt function
* Restoring to previous state
        move.w  (sp)+,d4
        move.w  (sp)+,d3
        move.w  (sp)+,d2
        move.w  (sp)+,d1
        move.w  (sp)+,d0
        movea.l  (sp)+,a0
        rts
SQRT    addq.w  #1,d2       ; d2 (= sqrt(2b)) will be used to compare with d1 (2b)
        move.w  d2,d3       ; d3 will be a counter for the loop
        clr.w   d4          ; clears d4
loop    tst.w   d3
        beq endloop         ; if d3 = 0 then end loop
        subq.w  #1,d3       ; subtract 1 from counter
        add.w   d2,d4       ; add d2 with d4 (trying to reach 2b)
        bra loop            ; repeat loop
endloop cmp.w   d1,d4       ; compare d4 with d1 (2b)
        bgt finish          ; if d4 > d1 (2b), then  (d2 - 1) = sqrt(2b) and finish
        bra SQRT            ; else then repeat SQRT function
finish  subq.w  #1,d2       ; d2 - 1 = sqrt(2b)
        move.w  d2,(a0)     ; move d2 (sqrt(2b)) into location a0
        add.w   d0,(a0)     ; add d0 (3a) into location a0 -> (3a + sqrt(2b))
        rts
done
    SIMHALT             ; halt simulator

* Put variables and constants here
    ORG $2000
a   dc.w    1
b   dc.w    2
x   ds.w    1

    END    START        ; last line of source



*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
