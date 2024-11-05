ORG 100h              ; Origin, to specify that the program starts at 100h

MOV CX, 26            ; Set the loop counter to 26 (for letters 'Z' to 'A')
MOV AL, 'Z'           ; Initialize AL with ASCII code for 'Z'

PrintLoop:
    MOV DL, AL        ; Move the current character to DL for printing
    MOV AH, 02h       ; DOS function 02h: print a single character
    INT 21h           ; Call DOS interrupt to print the character

    DEC AL            ; Decrement AL to get the previous ASCII character ('Y', 'X', etc.)
    LOOP PrintLoop    ; Repeat until CX reaches 0

MOV AH, 4Ch           ; DOS function 4Ch: terminate the program
INT 21h               ; Call DOS interrupt to exit

END                   ; End of program
