TITLE registers

INCLUDE Irvine32.inc

.code
main PROC
    mov eax, 11111111h   ; EAX:11111111 EIP:00873665
    add eax, 33333333h   ; EAX:44444444 EIP:0087366A

    mov ax, 5555h        ; EAX:44445555 EIP:0087366E
    sub ax, 2222h        ; EAX:44443333 EIP:00873672

    mov ah, 99h          ; EAX:44449933 EIP:00873674
    mov al, 00h          ; EAX:44449900 EIP:00873676
    sub ax, 11h          ; EAX:444498EF EIP:0087367A
    call DumpRegs        ; EAX:444498EF EIP:0087367F

    mov ebx, 0           ; EBX:00000000 EIP:00873684
    mov bh, 00h          ; EBX:00000000 EIP:00873686
    mov bl, 0FFh         ; EBX:000000FF EIP:00873688
    add bx, 1h           ; EBX:00000100 EIP:0087368C
    call DumpRegs        ; EBX:00000100 EIP:00873691

    invoke ExitProcess, 0  ; 

main ENDP
END main
