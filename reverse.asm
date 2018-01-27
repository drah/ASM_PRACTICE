include irvine32.inc
.data
	source BYTE "This is the source string",0
	target BYTE SIZEOF source DUP('#')
.code
	main proc
		mov esi,OFFSET source
		mov edi,OFFSET target
		add edi,SIZEOF source
		dec edi
		mov BYTE PTR[edi],0
		dec edi
		mov ecx,SIZEOF source
		dec ecx
		L1:
			mov al,BYTE PTR[esi]
			mov BYTE PTR[edi],al
			inc esi
			dec edi
		loop L1

		mov esi,OFFSET target ; offset of variable
		mov ebx,1 ; byte format
		mov ecx,SIZEOF target ; counter
		call DumpMem


	main endp
end main