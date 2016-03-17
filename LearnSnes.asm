 ; SNES Initialization Tutorial code
 ; This code is in the public domain.

.include "header.inc"
.include "register.inc"
.include "snes_init.asm"

 ; Needed to satisfy interrupt definition in "Header.inc".
VblankHandler:
     RTI

.bank 0
.section "MainCode"

Start:
     ; Initialize the SNES.
     SnesInit

     ; Set the background color to green.
     sep     #$20        ; Set the A register to 8-bit.
     lda     #%10000000  ; Force VBlank by turning off the screen.
     sta     $2100
     lda     #%00000000  ; Load the low byte of the color.
     sta     $2122
     lda     #%11111000  ; Load the high byte of the color.
     sta     $2122
     lda     #%00001111  ; End VBlank, setting brightness to 15 (100%).
     sta     $2100

     ; Loop forever.
Forever:
     jmp Forever

.ends
