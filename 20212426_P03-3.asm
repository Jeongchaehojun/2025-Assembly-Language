TITLE Practice03-3

INCLUDE Irvine32.inc

.data
    val1  WORD   1000h
    val2  WORD   2000h

    arrayB BYTE  10h, 20h, 30h, 40h, 50h       ; index 0~4
    arrayW WORD  100h, 200h, 300h              ; index 0~2 (2����Ʈ��)
    arrayD DWORD 10000h, 20000h                ; index 0~1 (4����Ʈ��)

.code
main PROC

    ; ----- BYTE �迭 -----
    mov al,arrayB          ; AL = 10h (0��°)
    mov al,[arrayB+4]      ; AL = 50h (4��°)
    mov al,[arrayB+2]      ; AL = 30h (2��°)

    ; ----- WORD �迭 -----
    mov ax,arrayW          ; AX = 0100h (0��°)
    mov ax,[arrayW+4]      ; AX = 0300h (index 2 * 2)
    mov ax,[arrayW+2]      ; AX = 0200h (index 1 * 2)

    ; ----- DWORD �迭 -----
    mov eax,arrayD         ; EAX = 00010000h (0��°)
    mov eax,[arrayD+4]     ; EAX = 00020000h (index 1 * 4)

    call DumpRegs
    exit
main ENDP

END main