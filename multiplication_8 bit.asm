org 100h              ; Set starting address

mov al, 03h           ; Load AL with 03h
mov bl, 04h           ; Load BL with 04h
mul bl                ; Multiply AL by BL, result in AX (AL * BL)

mov bl, al            ; Move result (AL) to BL for later use
mov ah, al            ; Move AL to AH

; Convert upper nibble to ASCII
and ah, 0F0h          ; Mask lower nibble, keep upper
shr ah, 4             ; Shift upper nibble to lower position
add ah, 30h           ; Convert to ASCII '0'-'9'

cmp ah, 39h           ; Compare with '9'
jle print_first_digit ; If less or equal to '9', skip next step
add ah, 7             ; Convert to ASCII 'A'-'F'

print_first_digit:
mov dl, ah            ; Move first digit to DL
mov ah, 02h           ; Prepare for output
int 21h               ; Print first digit

; Convert lower nibble to ASCII
mov ah, bl            ; Move result (BL) back to AH
and ah, 0Fh           ; Mask upper nibble, keep lower
add ah, 30h           ; Convert to ASCII '0'-'9'

cmp ah, 39h           ; Compare with '9'
jle print_sec_digit   ; If less or equal to '9', skip next step
add ah, 7             ; Convert to ASCII 'A'-'F'

print_sec_digit:
mov dl, ah            ; Move second digit to DL
mov ah, 02h           ; Prepare for output
int 21h               ; Print second digit

mov ah, 4Ch           ; Prepare for program termination
int 21h               ; Terminate program
