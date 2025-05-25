TITLE Practice05-2
 INCLUDE Irvine32.inc
 .data
    array DWORD 10000h, 20000h, 30000h, 40000h, 50000h
    theSum DWORD ?
 .code
 main PROC
    mov esi, OFFSET array                              ; EIP == 00061025h, ESI ==00064000h 
    mov ecx, LENGTHOF array                            ; EIP == 0006102Ah, ECX == 00000005h
    call ArraySum                                      ; EIP == 0006102Fh, ESP == 0006FB34h
    mov theSum, eax                                    ; EIP == 00061034h, theSum == 000F0000h
    exit
 main ENDP
 ArraySum PROC
    push esi                                           ; EIP == 0024103Ch, ESP == 003EFF6Ch, ESI == 00244000h
    push ecx                                           ; EIP == 0024103Dh, ESP == 003EFF68h, ECX == 00000005h
    mov eax, 0
 L1: ; Write how the values of ESI, ESP, EAX, and ECX change in your report
    add eax, [esi]                                     ; EIP == 00241044h
    add esi, TYPE DWORD                                ; EIP == 00241047h
    loop L1                                            ; EIP == 00241049h
    pop ecx                                            ; EIP == 0024104Ah, ESP == 003EFF6Ch, ECX == 00000005h
    pop esi                                            ; EIP == 0024102Eh, ESP == 003EFF70h, ESI == 00244000h
    ret                                                ; EIP == 00241050h, ESP == 003EFF74h
 ArraySum ENDP
 END main