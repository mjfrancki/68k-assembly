*-----------------------------------------------------------
* Title      : Lab #4
* Written by : Michael Francki
* Description: 1. A program that sorts a numerical file in order
*              of ascending. Use a sorting algorithm of your
*              own choosing. You need to create your own input
*              file that includes only positive integers.
*
*              2. Extend the program in part 1 such that the
*              sorting is performed by calling a function sort
*-----------------------------------------------------------



    ORG    $1000

START:                  ; first instruction of program
    lea filename,a1
    move    #51,d0
    trap #15            ;Open existing file.
    lea buffer,a1
    move #20,d2
    move #53,d0
    trap #15            ;read file.
    move.b  n,d1 ;n-1
    sub.b   #1,d1
    bsr sort
sort:
outer cmp.w n,d6
    bge done
    move.w  #$2000,a0
    clr d3 ;y
    add.w #1,d6
inner cmp.w d1,d3
    bge outer
    move.b (a0),d7
    cmp.b 2(a0),d7
    bgt if
all add.w #1,d3
    add.w #2,a0
    bra inner
if  move.w  2(a0),d5 ;temp
    move.w  (a0),2(a0)
    move.w  d5,(a0)
    bra all
done  SIMHALT
rts


* Put variables and constants here
    org $2000
buffer ds.w 80
n   dc.b    10
filename    dc.b    'file.txt',0

    END    START

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
