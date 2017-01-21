;*********************************************
;    Boot1.asm
;        - A Simple Bootloader for testing if cd is booting or not
;
;    Operating Systems Development Tutorial
;*********************************************

[BITS 16]    ;tell the assembler that its a 16 bit code
[ORG 0x7C00]    ;Origin, tell the assembler that where the code will

Start:
    mov SI, BootString
    call PrintString
    cli
    hlt


PrintCharacter: ;Procedure to print character on screen
                ;Assume that ASCII value is in register AL
mov AH, 0x0E    ;Tell BIOS that we need to print one charater on screen.
mov BH, 0x00    ;Page no.
mov BL, 0x07    ;Text attribute 0x07 is lightgrey font on black background

int 0x10        ;Call video interrupt
ret                ;Return to calling procedure


;Data
BootString db 'Booting TomOS...', 0 ;BootString string ending with 0



times 510 - ($-$$) db 0                ; We have to be 512 bytes. Clear the rest of the bytes with 0

dw 0xAA55                    ; Boot Signature
