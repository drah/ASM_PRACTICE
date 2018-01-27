TITLE MASM Template						(main.asm)

; Description:
; 
; Revision date:

INCLUDE Irvine32.inc
.data
	
.code
strc PROC C,
	s1:dword,s2:dword,count:dword
	
	push esi
	push edi
	;mov esi,dword ptr [ebp+8]
	;mov edi,dword ptr [ebp+12]
	
	mov ecx,count
	mov esi,s1
	mov edi,s2
	cld
	rep movsb
	pop edi
	pop esi

	ret
strc ENDP
END 
