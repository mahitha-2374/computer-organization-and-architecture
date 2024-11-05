ORG 100h            ; Origin, to specify that the program starts at 100h

MOV CX, 10          ; Set the loop counter to 10 (for numbers 9 to 0)
MOV AL, '9'         ; Initialize AL with ASCII code for '9'

PrintLoop:
    MOV DL, AL      ; Move the current character (number) to DL for printing
    MOV AH, 02h     ; DOS function 02h: print a single character
    INT 21h         ; Call DOS interrupt to print the character

    DEC AL          ; Decrement AL to get the previous ASCII character ('8', '7', etc.)
    LOOP PrintLoop  ; Repeat until CX reaches 0

MOV AH, 4Ch         ; DOS function 4Ch: terminate the program
INT 21h             ; Call DOS interrupt to exit

END                 ; End of program
