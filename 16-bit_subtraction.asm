org 100h           ; Set code origin at 100h for COM file format

num1 dw 5678h      ; Define first 16-bit number (5678h)
num2 dw 2024h      ; Define second 16-bit number (2024h)

start:
    ; Load num1 into AX and subtract num2 from AX
    mov ax, num1   ; Load the first number into AX
    sub ax, num2   ; Subtract the second number from AX
    mov bx, ax     ; Store the result in BX for further processing

    ; Extract and print the upper nibble of the high byte (AH)
    mov ah, bh     ; Load the high byte of BX into AH
    shr ah, 4      ; Shift right by 4 to isolate the upper nibble
    add ah, 30h    ; Convert to ASCII ('0'-'9')
    cmp ah, 39h    ; Check if it's greater than '9'
    jle print_high_nibble ; If less than or equal to '9', jump to print_high_nibble
    add ah, 7      ; Adjust for hexadecimal characters (A-F)

print_high_nibble:
    mov dl, ah     ; Move the converted upper nibble to DL for output
    mov ah, 02h    ; DOS function: Display character
    int 21h        ; Call DOS interrupt to print the character

    ; Extract and print the lower nibble of the high byte (AH)
    mov ah, bh     ; Load the high byte of BX into AH again
    and ah, 0Fh    ; Mask out the upper nibble to isolate the lower nibble
    add ah, 30h    ; Convert to ASCII ('0'-'9')
    cmp ah, 39h    ; Check if it's greater than '9'
    jle print_low_nibble ; If less than or equal to '9', jump to print_low_nibble
    add ah, 7      ; Adjust for hexadecimal characters (A-F)

print_low_nibble:
    mov dl, ah     ; Move the converted lower nibble to DL for output
    mov ah, 02h    ; DOS function: Display character
    int 21h        ; Call DOS interrupt to print the character

    ; Extract and print the upper nibble of the low byte (AL)
    mov ah, bl     ; Load the low byte of BX into AH
    shr ah, 4      ; Shift right by 4 to isolate the upper nibble
    add ah, 30h    ; Convert to ASCII ('0'-'9')
    cmp ah, 39h    ; Check if it's greater than '9'
    jle print_high_nibble2 ; If less than or equal to '9', jump to print_high_nibble2
    add ah, 7      ; Adjust for hexadecimal characters (A-F)

print_high_nibble2:
    mov dl, ah     ; Move the converted upper nibble to DL for output
    mov ah, 02h    ; DOS function: Display character
    int 21h        ; Call DOS interrupt to print the character

    ; Extract and print the lower nibble of the low byte (AL)
    mov ah, bl     ; Load the low byte of BX into AH again
    and ah, 0Fh    ; Mask out the upper nibble to isolate the lower nibble
    add ah, 30h    ; Convert to ASCII ('0'-'9')
    cmp ah, 39h    ; Check if it's greater than '9'
    jle print_low_nibble2 ; If less than or equal to '9', jump to print_low_nibble2
    add ah, 7      ; Adjust for hexadecimal characters (A-F)

print_low_nibble2:
    mov dl, ah     ; Move the converted lower nibble to DL for output
    mov ah, 02h    ; DOS function: Display character
    int 21h        ; Call DOS interrupt to print the character

    ; Exit the program
    mov ah, 4Ch    ; DOS function: Terminate program
    int 21h        ; Call DOS interrupt to terminate the program
