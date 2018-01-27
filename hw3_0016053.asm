include irvine32.inc
.data

.code
	main PROC
		mov ecx,1600
		randomcolorchar:
			mov eax,10
			call RandomRange

			cmp eax,2
			jle W
			cmp eax,3
			je B

			G:
				mov eax,2
				call SetTextColor 
				jmp next	
			W:
				mov eax,15
				call SetTextColor
				jmp next
			B:
				mov eax,1
				call SetTextColor
			next:
				mov al,'A'
				call WriteChar
		loop randomcolorchar
		exit
	main ENDP
end main