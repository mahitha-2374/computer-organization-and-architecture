org 100h              ; Set starting address

mov ax, 1234h ; Load AX with first 16-bit number (e.g., 1234h)
mov bx, 5678h; Load BX with second 16-bit number (e.g., 5678h)

mul bx                ; Multiply AX by BX, result in DX:AX (AX * BX)

; Display high 16-bit result (DX) in hexadecimal
mov cx, dx            ; Move DX to CX for later use
call print_hex        ; Call function to print DX

; Display low 16-bit result (AX) in hexadecimal
mov cx, ax            ; Move AX to CX for printing
call print_hex        ; Call function to print AX

mov ah, 4Ch           ; Prepare for program termination
int 21h               ; Terminate program

; Subroutine to print a 16-bit register in hexadecimal
print_hex:
    push ax           ; Save AX (will be modified)
    push bx           ; Save BX (will be used for shifting)

    mov bx, cx        ; Move the value in CX to BX
    mov ah, bh        ; Load high byte for processing first

    ; Print high nibble of high byte
    and ah, 0F0h      ; Mask lower nibble, keep upper nibble
    shr ah, 4         ; Shift upper nibble to lower position
    call print_digit  ; Call subroutine to print the digit

    ; Print low nibble of high byte
    mov ah, bh        ; Reload high byte
    and ah, 0Fh       ; Mask upper nibble, keep lower nibble
    call print_digit  ; Call subroutine to print the digit

    ; Print high nibble of low byte
    mov ah, bl        ; Load low byte for processing
    and ah, 0F0h      ; Mask lower nibble, keep upper nibble
    shr ah, 4         ; Shift upper nibble to lower position
    call print_digit  ; Call subroutine to print the digit

    ; Print low nibble of low byte
    mov ah, bl        ; Reload low byte
    and ah, 0Fh       ; Mask upper nibble, keep lower nibble
    call print_digit  ; Call subroutine to print the digit

    pop bx            ; Restore BX
    pop ax            ; Restore AX
    ret               ; Return to the caller

; Subroutine to print a single hexadecimal digit
print_digit:
    add ah, 30h       ; Convert to ASCII '0'-'9'

    cmp ah, 39h       ; If greater than '9', it's 'A'-'F'
    jle print_it      ; If less or equal to '9', print it
    add ah, 7         ; Adjust to get ASCII 'A'-'F'

print_it:
    mov dl, ah        ; Move digit to DL
    mov ah, 02h       ; Prepare for printing
    int 21h           ; Print digit
    ret               ; Return to caller
; Terminate the program
