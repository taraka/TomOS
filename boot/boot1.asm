;*********************************************
;    Boot1.asm
;        - A Simple Bootloader for testing if cd is booting or not
;
;    Operating Systems Development Tutorial
;*********************************************

[BITS 16]    ;tell the assembler that its a 16 bit code
[ORG 0x7C00]    ;Origin, tell the assembler that where the code will

Start:

    cli                    ; Clear all Interrupts
    hlt                    ; halt the system

times 510 - ($-$$) db 0                ; We have to be 512 bytes. Clear the rest of the bytes with 0

dw 0xAA55                    ; Boot Signature
