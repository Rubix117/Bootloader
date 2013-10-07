;
;print a string
;


	;main program
	print_string:
		mov si, bx
		call PutStr
	;Procedures

	PutStr:
		mov ah, 0x0E ;set the registers for the interupt call
		mov al, [si]
		cmp al, 0
		jz return
		int 0x10
		inc si
		jmp PutStr
	return:
	ret

