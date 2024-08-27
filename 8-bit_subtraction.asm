org 100h           ; Set code origin at 100h for COM file format

num1 db 24h        ; Define first 8-bit number (36 in decimal)
num2 db 21h        ; Define second 8-bit number (33 in decimal)

start:
    mov al, num1   ; Load num1 into AL register
    sub al, num2   ; Subtract num2 from AL (AL = num1 - num2)
    mov bl, al     ; Store the result in BL for later use

    ; Extract the upper nibble of the result
    mov ah, al     ; Copy AL to AH
    and ah, 0F0h   ; Mask the lower nibble to get the upper nibble
    shr ah, 4      ; Shift right to position the upper nibble in the lower nibble
    add ah, 30h    ; Convert to ASCII by adding '0'
    cmp ah, 39h    ; Compare with ASCII '9'
    jle print_first_digit ; If less than or equal to '9', jump to print_first_digit

    add ah, 7      ; Adjust for hexadecimal letters (A-F)

print_first_digit:
    mov dl, ah     ; Move the first digit to DL for output
    mov ah, 02h    ; DOS function: Display character
    int 21h        ; Call DOS interrupt to print the character

    ; Extract the lower nibble of the result
    mov ah, bl     ; Move the result back to AH from BL
    and ah, 0Fh    ; Mask the upper nibble to get the lower nibble
    add ah, 30h    ; Convert to ASCII by adding '0'
    cmp ah, 39h    ; Compare with ASCII '9'
    jle print_second_digit ; If less than or equal to '9', jump to print_second_digit

    add ah, 7      ; Adjust for hexadecimal letters (A-F)

print_second_digit:
    mov dl, ah     ; Move the second digit to DL for output
    mov ah, 02h    ; DOS function: Display character
    int 21h        ; Call DOS interrupt to print the character

    ; Exit program
    mov ah, 4Ch    ; DOS function: Terminate program
    int 21h        ; Call DOS interrupt to terminate the program
