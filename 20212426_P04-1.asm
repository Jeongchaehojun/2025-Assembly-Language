INCLUDE Irvine32.inc

.data
    stringL1   BYTE "L1", 0
    stringL2   BYTE "L2", 0
    stringL3   BYTE "L3", 0
    stringL4   BYTE "L4", 0
    stringL5   BYTE "L5", 0
    stringL6   BYTE "L6", 0

.code
main PROC

    mov eax, 0A523h                 ; eax = 0A523h
    cmp eax, 0A523h                 ; eax = 0A523h

    jne L1                          ; X 
    je L2                           ; O 
    ; Jump to L2                  

L1:
    mov edx, OFFSET stringL1
    call WriteString
    call Crlf

L2:
    mov edx, OFFSET stringL2
    call WriteString
    call Crlf

    mov cx, 0FFFFh                  ; cx = FFFFh 
    inc cx                          ; cx = 0

    jnz L3                          ; X 
    jcxz L4                         ; O 
    ; Jump to L4                 

L3:
    mov edx, OFFSET stringL3
    call WriteString
    call Crlf

L4:
    mov edx, OFFSET stringL4
    call WriteString
    call Crlf

    mov al, +127                    ; al = 7Fh
    cmp al, -127                    ; al = 81h

    jl L5                           ; X 
    jg L6                           ; O 
    ; Jump to L6                 

L5:
    mov edx, OFFSET stringL5
    call WriteString
    call Crlf

L6:
    mov edx, OFFSET stringL6
    call WriteString
    call Crlf

    exit

main ENDP
END main
