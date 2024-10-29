ORG 100h

; Prompt for the single-digit number
MOV DX, OFFSET msg_input
MOV AH, 09h
INT 21h

; Get the single digit
MOV AH, 01h
INT 21h
MOV BL, AL          ; Store the input in BL

; Check if it's a valid digit (ASCII '0' = 48)
CMP AL, '0'         ; Compare with '0'
JL NotDigit         ; If less than '0', it's not a digit
CMP AL, '9'         ; Compare with '9'
JG NotDigit         ; If greater than '9', it's not a digit

; Display the input digit
MOV DX, OFFSET msg_output
MOV AH, 09h
INT 21h

MOV DL, BL          ; Load the digit into DL for display
MOV AH, 02h
INT 21h

; Convert the digit from ASCII to numeric value
SUB BL, '0'

; Check if the number is odd or even using bitwise AND
MOV AL, BL          ; Move the number to AL for bitwise operation
AND AL, 1           ; AND with 1 to check the least significant bit
JZ Even             ; If zero, the number is even
JMP Odd             ; If not zero, the number is odd

Even:
; Display "The number is even"
MOV DX, OFFSET msg_even
MOV AH, 09h
INT 21h
JMP EndProgram

Odd:
; Display "The number is odd"
MOV DX, OFFSET msg_odd
MOV AH, 09h
INT 21h
JMP EndProgram

NotDigit:
; Handle invalid input
MOV DX, OFFSET msg_error
MOV AH, 09h
INT 21h

EndProgram:
; End the program
MOV AH, 4Ch
INT 21h

; Data section
msg_input DB "Enter a single-digit number: $"
msg_output DB 0Dh, 0Ah, "The number you entered is: $"
msg_even DB 0Dh, 0Ah, "The number is even.$"
msg_odd DB 0Dh, 0Ah, "The number is odd.$"
msg_error DB 0Dh, 0Ah, "Error: Not a digit!$"

END
