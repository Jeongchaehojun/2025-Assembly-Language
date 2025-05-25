TITLE Practice03-4      

INCLUDE Irvine32.inc

.data
    arrayB  BYTE   10h, 20h, 30h, 40h
    arrayW  WORD   30 DUP(1), 0, 0
    arrayD  DWORD  12345678h

.code
main PROC

; PTR Operator

    mov ax, WORD PTR [arrayB+2] ; AX = 4030h  ; arrayB[2]=30h, arrayB[3]=40h → 4030h (리틀 엔디안)
    mov bl, BYTE PTR arrayD     ; BL = 78h    ; DWORD 12345678h → 하위 바이트는 78h
    mov bl, BYTE PTR [arrayW+2] ; BL = 01h    ; arrayW[1] = 0001h → 하위 바이트 01h
    mov ax, WORD PTR [arrayD+2] ; AX = 3412h  ; arrayD+2 = 56h, 34h → 3412h (리틀 엔디안)
    mov eax, DWORD PTR arrayW   ; EAX = 00010101h ; 앞 4개 WORD 전부 1 → DWORD로 4개 = 00010101h

; TYPE Operator

    mov eax, TYPE arrayB ; EAX = 00000001h ; BYTE 타입의 크기 = 1
    mov eax, TYPE arrayW ; EAX = 00000002h ; WORD 타입의 크기 = 2
    mov eax, TYPE arrayD ; EAX = 00000004h ; DWORD 타입의 크기 = 4

; LENGTHOF Operator

    mov ebx, LENGTHOF arrayB ; EBX = 00000004h ; arrayB 요소 개수 = 4
    mov ebx, LENGTHOF arrayW ; EBX = 00000020h ; 30 DUP(1), 0, 0 → 총 32개
    mov ebx, LENGTHOF arrayD ; EBX = 00000001h ; arrayD는 DWORD 하나

; SIZEOF Operator

    mov ecx, SIZEOF arrayB ; ECX = 00000004h ; 1 * 4 = 4
    mov ecx, SIZEOF arrayW ; ECX = 00000040h ; 2 * 32 = 64
    mov ecx, SIZEOF arrayD ; ECX = 00000004h ; 4 * 1 = 4

exit
main ENDP

END main
