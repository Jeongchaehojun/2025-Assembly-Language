TITLE Practice08-1
INCLUDE Irvine32.inc

.data
    arrayD DWORD 10000h, 20000h, 30000h

.code
main PROC
    push ebp                                  ; ebp = 0039F9CC
    mov ebp, esp                              ; esp = 0039F9BC
    mov esi, OFFSET arrayD                    ; esi = 00FB6000
    mov ecx, LENGTHOF arrayD                  ; ecx = 00000003
    push ecx
    call ArraySum
    pop ebp
    call WriteHex
    call Crlf
exit
main ENDP

ArraySum PROC
    push ebp                                  ; ebp = 006FFF00
    mov ebp, esp                              ; esp = 006FFEF4
    mov ecx, [esp+8]                          ; ecx = 00000003

L1: ; input array to stack
    push [esi]                                ; esi = 00FB6000, 00FB6004, 00FB6008
    add esi, 4  
    loop L1

    mov ecx, [esp+20]                         ; ecx = 00000000 -> 00000003
    mov eax, 0

L2: ; add stack
    pop ebx                                   ; ebx = 00030000, 00020000, 00010000
    add eax, ebx                       
    loop L2
    pop ebp
    ret 4
ArraySum ENDP
END main