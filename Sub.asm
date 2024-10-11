org 100h                    ; Set starting address for the program

mov dx, offset msg_input1   ; Load the offset address of msg_input1 into DX
mov ah, 09h                 ; Prepare to display string function (09h)
int 21h                     ; Interrupt to display the first input message

mov ah, 01h                 ; Prepare to read a character from input
int 21h                     ; Read the first character into AL

sub al, '0'                 ; Convert the ASCII character to its integer value
cmp al, 0                   ; Compare AL with 0
jl NotDigit                 ; Jump to NotDigit if AL is less than 0 (not a digit)
cmp al, 9                   ; Compare AL with 9
jg NotDigit                 ; Jump to NotDigit if AL is greater than 9 (not a digit)

mov bl, al                  ; Store the first input (digit) into BL

mov dx, offset msg_input2   ; Load the offset address of msg_input2 into DX
mov ah, 09h                 ; Prepare to display string function (09h)
int 21h                     ; Interrupt to display the second input message

mov ah, 01h                 ; Prepare to read a character from input
int 21h                     ; Read the second character into AL

sub al, '0'                 ; Convert the ASCII character to its integer value
cmp al, 0                   ; Compare AL with 0
jl NotDigit                 ; Jump to NotDigit if AL is less than 0 (not a digit)
cmp al, 9                   ; Compare AL with 9
jg NotDigit                 ; Jump to NotDigit if AL is greater than 9 (not a digit)

mov cl, al                  ; Store the second input (digit) into CL

mov dx, offset msg_sub      ; Load the offset address of msg_sub into DX
mov ah, 09h                 ; Prepare to display string function (09h)
int 21h                     ; Interrupt to display the subtraction message

sub bl, cl                  ; Subtract CL (second digit) from BL (first digit)
js NegativeResult           ; Jump to NegativeResult if the result is negative

add bl, '0'                 ; Convert the result into its ASCII representation
mov dl, bl                  ; Move the result into DL for display
mov ah, 02h                 ; Prepare to display a character function (02h)
int 21h                     ; Display the subtraction result
jmp endprogram              ; Jump to the end of the program

NegativeResult:
mov dl, '-'                 ; Load '-' into DL to indicate negative result
mov ah, 02h                 ; Prepare to display a character function (02h)
int 21h                     ; Display '-'

neg bl                      ; Negate the result to get the positive value of subtraction
add bl, '0'                 ; Convert the result into its ASCII representation
mov dl, bl                  ; Move the result into DL for display
mov ah, 02h                 ; Prepare to display a character function (02h)
int 21h                     ; Display the positive result after the negative sign
jmp endprogram              ; Jump to the end of the program

NotDigit:
mov dx, offset msg_error    ; Load the offset address of msg_error into DX
mov ah, 09h                 ; Prepare to display string function (09h)
int 21h                     ; Interrupt to display the error message

endprogram:
mov ah, 4Ch                 ; Prepare to terminate the program function (4Ch)
int 21h                     ; Interrupt to terminate the program

msg_input1 DB "enter first digit:$"       ; Message to prompt for the first digit input
msg_input2 DB 0dh, 0ah, "enter second digit:$"    ; Message to prompt for the second digit input
msg_sub db 0dh, 0ah, "The subtraction of given two digits is: $" ; Message for subtraction result
msg_error db 0dh, 0ah, "Error: Not a digit!$"    ; Error message for non-digit input
END                               ; End of the program
