TITLE Practice05-1
 INCLUDE Irvine32.inc
 .data
    aName BYTE "jeongchaehojun", 0              
    nameSize = ($ - aName) - 1                   ; nameSize == 14  
.code
 main PROC
    ;push the name on the stack
    mov ecx, nameSize                            ; ECX == 0000000Eh ;14�� ���� ��
    mov esi, 0                                   
L1: ; Write how the values of ESI, ESP, EAX, and ECX change in your report
    movzx eax, aName[esi]                         
    push eax                                      
    inc esi                                      ; ������ ���� ESI ���� 00000000���� 0000000E���� �þ��. 
    loop L1                                      ; ECX == 0000000Eh ;0000000E���� 00000000���� ������ ���� �߿� �پ���. ������ 0�� ������ �ٽ� ���� �ʱ�ȭ
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
