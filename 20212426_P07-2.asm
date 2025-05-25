TITLE Practice07-2

INCLUDE Irvine32.inc

.data
InvalidInputMsg BYTE 0Dh, 0Ah, "Invalid input", 0Dh, 0Ah, 0

.code
main PROC

    call Clrscr

StateA:
    call GetNext
    cmp al, 'x'
    je StateB
    call DisplayErrorMsg
    jmp Quit

StateB:
    call GetNext
    call IsAtoY
    jz StateB          

    cmp al, 'z'
    je StateC          

    call DisplayErrorMsg
    jmp Quit

StateC:
    call GetNext
    cmp al, 13         ; ����(Enter) �˻�
    je Quit
    call DisplayErrorMsg
    jmp Quit

Quit:
    call Crlf
    exit

main ENDP

IsAtoY PROC
    cmp al, 'a'
    jb NotAtoY
    cmp al, 'y'
    ja NotAtoY
    xor ax, ax         ; ZF = 1 ����
    ret

NotAtoY:
    ret
IsAtoY ENDP


; ���� ���� �Է� �� ��� �Լ�
GetNext PROC
    call ReadChar
    call WriteChar
    ret
GetNext ENDP

; ���� �޽��� ��� �Լ�
DisplayErrorMsg PROC
    push edx
    mov edx, OFFSET InvalidInputMsg
    call WriteString
    pop edx
    ret
DisplayErrorMsg ENDP

END main