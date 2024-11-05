ORG 100h            ; Origin, to specify that the program starts at 100h

MOV CX, 10          ; Set the loop counter to 10 (for numbers 0 to 9)
MOV AL, '0'         ; Initialize AL with ASCII code for '0'

PrintLoop:
    MOV DL, AL      ; Move the current character (number) to DL for printing
    MOV AH, 02h     ; DOS function 02h: print a single character
    INT 21h         ; Call DOS interrupt to print the character

    INC AL          ; Increment AL to get the next ASCII character ('1', '2', etc.)
    LOOP PrintLoop  ; Repeat until CX reaches 0

MOV AH, 4Ch         ; DOS function 4Ch: terminate the program
INT 21h             ; Call DOS interrupt to exit

END                 ; End of program
