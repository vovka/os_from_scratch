;
; A boot sector that prints hex digit.
;

[org 0x7c00]            ; Tell the assembler where this code will be loaded

mov dx, 0xdcba
call print_hex

newline: db 0x000a,0
mov bx, newline
call print_string

mov dx, 0xabcd
call print_hex0

; mov bx, newline
; call print_string

; call print_ascii_table

jmp $                   ; Hang

%include "print_hex.asm"
%include "print_ascii_table.asm"

; Padding and magic BIOS number.
times 510-($-$$) db 0
dw 0xaa55
