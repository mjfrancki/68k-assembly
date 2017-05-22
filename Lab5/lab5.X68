*-----------------------------------------------------------
* Title      : Lab #5
* Written by : Michael Francki
* Description: 1. A program that reads a number from the keyboard
*              and searches for that number in a given sorted file.
*              If the number is found in the file then the program
*              outputs "Found", otherwise, "Not Found".
*
*              2. Extend the program by writing a subroutine called
*              "search" to perform the same task in part 1 where the
*              search value and the address of the file are passed
*              via user stack.
*-----------------------------------------------------------
    ORG    $1000
START:
*==========================MAIN=============================
     clr d0

*------------------------I/O READ---------------------------
     move #4,d0
     trap #15     ;read number from key board
*----------------------END I/O READ-------------------------

     move d1,d3
     add.w #$30, d3

     lea filename,a1
     move    #51,d0
     trap #15            ;Open existing file.

     move.l #filesize,d2
     lea buffer,a1
     move #53,d0
     trap #15            ;read file.

*========================END MAIN===========================     

iterator
     add #1,d4
     cmp.w d2, d4
     bgt NOTFOUND

     move.b (a1)+,d6
     cmp.w d3,d6
     beq FOUND

     bra iterator


NOTFOUND
     lea NF,a1
     move #14,d0
     trap #15
     bra DONE

FOUND
     lea F,a1
     move #14,d0
     trap #15
     bra DONE

DONE
      SIMHALT             ; halt simulator

* Put variables and constants here
    ORG $2000

filename dc.b  'file.txt',0
buffer   ds.b  80
filesize dc.b  10
NF dc.w 'NotFound ',0
F  dc.w 'Found ',0
    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
