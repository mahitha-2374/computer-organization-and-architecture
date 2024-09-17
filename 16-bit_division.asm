org 100h               ; Set origin address

mov ax, 2400h          ; Load ax with the value 2400h
mov bx, 1200h          ; Load bx with the value 1200h
div bx                 ; Divide ax by bx, result in ax, remainder in dx

mov bx, ax             ; Store quotient from ax into bx
mov cx, dx             ; Store remainder from dx into cx

; Print high nibble of ch
mov ah, ch             ; Move the content of ch into ah
and ah, 0f0h           ; Mask the lower nibble of ah
shr ah, 4              ; Shift high nibble to the lower nibble position
add ah, 30h            ; Convert to ASCII
cmp ah, 39h            ; Check if it is a digit
jle print_high_nibble32 ; Jump if less than or equal to '9'
add ah, 7              ; Convert to ASCII letter if greater than '9'

print_high_nibble32:
mov dl, ah             ; Load ah (ASCII value) into dl for printing
mov ah, 02h            ; Set function for printing a character
int 21h                ; Call DOS interrupt to print

; Print low nibble of ch
mov ah, ch             ; Move the content of ch into ah
and ah, 0fh            ; Mask the high nibble of ah
add ah, 30h            ; Convert to ASCII
cmp ah, 39h            ; Check if it is a digit
jle print_low_nibble32 ; Jump if less than or equal to '9'
add ah, 7              ; Convert to ASCII letter if greater than '9'

print_low_nibble32:
mov dl, ah             ; Load ah (ASCII value) into dl for printing
mov ah, 02h            ; Set function for printing a character
int 21h                ; Call DOS interrupt to print

; Print high nibble of cl
mov ah, cl             ; Move the content of cl into ah
and ah, 0f0h           ; Mask the lower nibble of ah
shr ah, 4              ; Shift high nibble to the lower nibble position
add ah, 30h            ; Convert to ASCII
cmp ah, 39h            ; Check if it is a digit
jle print_low_nibble24 ; Jump if less than or equal to '9'
add ah, 7              ; Convert to ASCII letter if greater than '9'

print_low_nibble24:
mov dl, ah             ; Load ah (ASCII value) into dl for printing
mov ah, 02h            ; Set function for printing a character
int 21h                ; Call DOS interrupt to print

; Print low nibble of cl
mov ah, cl             ; Move the content of cl into ah
and ah, 0fh            ; Mask the high nibble of ah
add ah, 30h            ; Convert to ASCII
cmp ah, 39h            ; Check if it is a digit
jle print_high_nibble24 ; Jump if less than or equal to '9'
add ah, 7              ; Convert to ASCII letter if greater than '9'

print_high_nibble24:
mov dl, ah             ; Load ah (ASCII value) into dl for printing
mov ah, 02h            ; Set function for printing a character
int 21h                ; Call DOS interrupt to print

; Print high nibble of bh
mov ah, bh             ; Move the content of bh into ah
shr ah, 4              ; Shift high nibble to the lower nibble position
add ah, 30h            ; Convert to ASCII
cmp ah, 39h            ; Check if it is a digit
jle print_high_nibble  ; Jump if less than or equal to '9'
add ah, 7              ; Convert to ASCII letter if greater than '9'

print_high_nibble:
mov dl, ah             ; Load ah (ASCII value) into dl for printing
mov ah, 02h            ; Set function for printing a character
int 21h                ; Call DOS interrupt to print

; Print low nibble of bh
mov ah, bh             ; Move the content of bh into ah
and ah, 0fh            ; Mask the high nibble of ah
add ah, 30h            ; Convert to ASCII
cmp ah, 39h            ; Check if it is a digit
jle print_low_nibble   ; Jump if less than or equal to '9'
add ah, 7              ; Convert to ASCII letter if greater than '9'

print_low_nibble:
mov dl, ah             ; Load ah (ASCII value) into dl for printing
mov ah, 02h            ; Set function for printing a character
int 21h                ; Call DOS interrupt to print

; Print high nibble of bl
mov ah, bl             ; Move the content of bl into ah
shr ah, 4              ; Shift high nibble to the lower nibble position
add ah, 30h            ; Convert to ASCII
cmp ah, 39h            ; Check if it is a digit
jle print_high_nibble2 ; Jump if less than or equal to '9'
add ah, 7              ; Convert to ASCII letter if greater than '9'

print_high_nibble2:
mov dl, ah             ; Load ah (ASCII value) into dl for printing
mov ah, 02h            ; Set function for printing a character
int 21h                ; Call DOS interrupt to print

; Print low nibble of bl
mov ah, bl             ; Move the content of bl into ah
and ah, 0fh            ; Mask the high nibble of ah
add ah, 30h            ; Convert to ASCII
cmp ah, 39h            ; Check if it is a digit
jle print_low_nibble2  ; Jump if less than or equal to '9'
add ah, 7              ; Convert to ASCII letter if greater than '9'

print_low_nibble2:
mov dl, ah             ; Load ah (ASCII value) into dl for printing
mov ah, 02h            ; Set function for printing a character
int 21h                ; Call DOS interrupt to print

; Exit program
mov ah, 4ch            ; DOS interrupt to exit program
int 21h                ; Call interrupt
