TITLE MASM Template						(main.asm)

; Description:
; 
; Revision date:

INCLUDE Irvine32.inc
.data
several=5
numbers DWORD 5,20,24,18,11,7,432,226,26,13
disp BYTE " ªºGCD¬° ",0 
.code
main PROC
	mov ECX,several	     	;loop several times
	mov ESI,0				;esi means the index

	L1:
	mov EAX,numbers[esi]
	mov EDI,EAX
	mov EAX,numbers[esi+4]
	;---------------------make them both positive
	cmp EAX,0
	jg p1
	neg EAX
	p1:
	cmp EDI,0
	jg p2
	neg EDI
	p2:				; EAX EDI both positive
	;---------------------call the proc
	call foo
	call display
	loop L1
	;---------------------loop
	call readchar
	exit
main ENDP
;-----------------------------------------------------------------foo---------------
foo PROC
;	call ReadInt    ; put in EAX
;	mov EDI,EAX
;	call ReadInt
	mov EDX,0
	div EDI			; R=EDX  Q=EAX
	mov EAX,EDX
	xchg EAX,EDI
	cmp EDI,0
	jz get
	call foo	
	get:	
	ret				;EDI is GCD
foo ENDP
;-----------------------------------------------------------end foo---------------------------------
;------------------------------------------------------------------display-----------
display PROC
	push eax
	mov al,'<'
	call writechar
	mov eax,numbers[esi]
	call writedec
	mov al,','
	call writechar
	mov eax,numbers[esi+4]
	call writedec
	add esi,8
	mov al,'>'
	call writechar
	mov edx,OFFSET disp
	call writestring
	pop eax
	call writedec
	call crlf
	ret
display ENDP
;-----------------------------------------------------------end display-----------------------------
END main