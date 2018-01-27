TITLE MASM Template						(main.asm)

; Description:
; 
; Revision date:

INCLUDE Irvine32.inc
.data
several=4
numbers DWORD 100,25,75,18,64,27,91,52
.code
main PROC
	mov ECX,several			;loop several times
	mov ESI,0				;esi means the index

	L1:
	mov EAX,numbers[esi]
	call Writeint
	call crlf
	mov EDI,EAX
	mov EAX,numbers[esi+4]
	call Writeint
	call crlf
	add esi,8

	call foo
	call crlf
	loop L1
	call readchar
	exit
main ENDP
;-----------------------------------------------------------------foo---------------
foo PROC
;	call ReadInt    ; put in EAX
;	mov EDI,EAX
;	call ReadInt
	cmp EAX,0
	jg p1
	neg EAX
	p1:
	cmp EDI,0
	jg p2
	neg EDI
	p2:				; EAX EDI both positive
	mov EDX,0
	div EDI			; R=EDX  Q=EAX
	mov EAX,EDX
	xchg EAX,EDI
	cmp EDI,0
	ja p2			;EDI is GCD
	call WriteDec
	ret
foo ENDP
;-----------------------------------------------------------end foo---------------------------------
END main