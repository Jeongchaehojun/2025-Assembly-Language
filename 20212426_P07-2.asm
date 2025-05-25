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
    cmp al, 13         ; 엔터(Enter) 검사
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
    xor ax, ax         ; ZF = 1 세팅
    ret

NotAtoY:
    ret
IsAtoY ENDP


; 다음 문자 입력 및 출력 함수
GetNext PROC
    call ReadChar
    call WriteChar
    ret
GetNext ENDP

; 에러 메시지 출력 함수
DisplayErrorMsg PROC
    push edx
    mov edx, OFFSET InvalidInputMsg
    call WriteString
    pop edx
    ret
DisplayErrorMsg ENDP

END main