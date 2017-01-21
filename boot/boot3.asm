[BITS 16]    ;tell the assembler that its a 16 bit code
[ORG 0x7C00]    ;Origin, tell the assembler that where the code will

Start:
    mov SI, BootString
    call PrintString
    cli
    hlt


PrintCharacter:     ;Procedure to print character on screen
                    ;Assume that ASCII value is in register AL
    mov AH, 0x0E    ;Tell BIOS that we need to print one charater on screen.
    mov BH, 0x00    ;Page no.
    mov BL, 0x07    ;Text attribute 0x07 is lightgrey font on black background

    int 0x10        ;Call video interrupt
    ret             ;Return to calling procedure


PrintString:    ;Procedure to print string on screen
                ;Assume that string starting pointer is in register SI

    next_character:     ;Label to fetch next character from string
    mov AL, [SI]        ;Get a byte from string and store in AL register
    inc SI              ;Increment SI pointer
    or AL, AL           ;Check if value in AL is zero (end of string)
    jz exit_function    ;If end then return
    call PrintCharacter ;Else print the character which is in AL register
    jmp next_character  ;Fetch next character from string
    exit_function:      ;End label
ret                     ;Return from procedure


;Data
BootString db 'Booting TomOS...', 0 ;BootString string ending with 0



times 510 - ($-$$) db 0                ; We have to be 512 bytes. Clear the rest of the bytes with 0

dw 0xAA55                    ; Boot Signature
