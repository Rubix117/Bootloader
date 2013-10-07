;
;A simple boot sector program that compares numbers
;

	mov ah, 0x0e 	;int 10/ah = 0eh -> scrolling teletype BIOS routine

	mov bx, 4

	cmp bx, 4
	je equal

	mov bl, 'c'
	int 0x10

	jmp $

	times 510-($-$$) db 0
	dw 0xaa55	

	
	equal:
		mov al, 'A'
		int 0x10
	
