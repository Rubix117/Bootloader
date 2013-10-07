;
;print a string
;


[org 0x7c00]

	;main program
	main:
		mov si, booting
		call PutStr

		jmp $		;Never ending loop

	;Procedures

	PutStr:
			;set the registers for the interupt call
		mov ah, 0x0E
		mov al, [si]
		cmp al, 0
		jz return
		int 0x10
		inc si
		jmp PutStr
	return:
	ret

	booting db 'booting_os',0

	;padding
	times 510-($-$$) db 0
	dw 0xaa55

