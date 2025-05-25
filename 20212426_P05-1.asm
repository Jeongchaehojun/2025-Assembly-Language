TITLE Practice05-1
 INCLUDE Irvine32.inc
 .data
    aName BYTE "jeongchaehojun", 0              
    nameSize = ($ - aName) - 1                   ; nameSize == 14  
.code
 main PROC
    ;push the name on the stack
    mov ecx, nameSize                            ; ECX == 0000000Eh ;14와 같은 값
    mov esi, 0                                   
L1: ; Write how the values of ESI, ESP, EAX, and ECX change in your report
    movzx eax, aName[esi]                         
    push eax                                      
    inc esi                                      ; 루프를 돌며 ESI 값은 00000000부터 0000000E까지 늘어난다. 
    loop L1                                      ; ECX == 0000000Eh ;0000000E부터 00000000까지 루프를 도는 중에 줄어든다. 마지막 0을 만나고 다시 값이 초기화
    ; pop the name from the stack, in reverse,
    ; and store in the aName array.
    mov ecx, nameSize
    mov esi, 0
 L2: ; Write how the values of ESI, ESP, EAX, and ECX change in your report
    pop eax
    mov aName[esi], al
    inc esi
    loop L2
 exit
 main ENDP
 END main
