include irvine32.inc
.data
fore DWORD 0
back DWORD 0
color DWORD 0
.code
	main proc
		mov ecx,16
		backcolor:
		push ecx
		mov ecx,16
		mov fore,0
			forecolor:
			mov edx,fore
			add edx,back
			mov eax,edx
			call SetTextColor
			mov eax,'A'
			call WriteChar
			inc fore
			loop forecolor
		call crlf
		pop ecx
		add back,16

		loop backcolor
		
	main endp
end main