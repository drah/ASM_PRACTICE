TITLE MASM Template						(main.asm)

; Description:
; 
; Revision date:

INCLUDE Irvine32.inc
.data
	freq DWORD 256 dup(0)
	str1 BYTE 'aaaaabbbbcccddezzzzzzzzzz'
.code
main PROC
	push LENGTHOF str1
	push OFFSET freq
	push OFFSET str1
	
	call Get_frequencies
	call readint
	exit
main ENDP
;========================================Get_frequencies=======================================
Get_frequencies PROC
	push ebp
	mov ebp,esp

	;count
	mov edi,[ebp+12]		;the freq
	mov esi,[ebp+8]			;the str1
	mov ecx,[ebp+16]		;the length of str1
	count:
		movzx eax,BYTE PTR [esi]
		inc DWORD PTR [edi+eax*4]
		inc esi
		loop count

	;display
	mov ecx,256
	mov esi,0
	display:
		mov eax,esi
		call WriteHex
		mov al,':'
		call Writechar
		mov eax,DWORD PTR [edi+esi*4]
		call WriteDec
		call crlf
		inc esi
		loop display

	mov esp,ebp
	pop ebp
	ret
Get_frequencies ENDP

END main