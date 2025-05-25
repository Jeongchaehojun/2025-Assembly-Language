INCLUDE Irvine32.inc
.data
 string DWORD 30 DUP(?)
.code
InputName PROC C
 mov ecx, LENGTHOF string ; ECX: 0000001E, EIP: 00B34135
 mov esi, OFFSET string ; ESI: 00B3C000, EIP: 00B3413A
L1 :
 call ReadChar ; EAX: 00000B30, ECX: 0000001E , EIP: 00B3413F
 mov [esi], eax
 add esi, 4 ; ESI: 00B3C004, EIP: 00B34144
 cmp al, 30h ; EIP: 00B34146
 je L2 ; Jump Condition
 loop L1
L2 :
 ret
InputName ENDP
PrintName PROC C
 mov ecx, LENGTHOF string ; ECX: 0000001E, EIP: 00B34150
 mov esi, OFFSET string ; ESI: 00B3C000, EIP: 00B34155
L1 :
 mov eax, [esi] ; EAX: 00000B30, EIP: 00B34157
 cmp al, 30h ; EAX: 00000B30, EIP: 00B34159
 je L2
 call WriteChar
 add esi, 4 ; ESI: 00B3C004, EIP: 00B3415E
 loop L1 ; ECX: 0000001D, EIP: 00B34160
L2 :
 ret
PrintName ENDP
END
