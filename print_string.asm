print_string:
  pusha

  begin:
    mov ax, [bx]    ; write to ax value stored at bx address

    cmp al, 0       ; compare the value with 0
      je stop       ; jump to stop if equals

    mov ah, 0x0e    ; if not equals then print
    int 0x10

    add bl, 0x1     ; increase address to print from by 1
    jmp begin       ; jump to beginnig

  stop:
    popa
    ret
