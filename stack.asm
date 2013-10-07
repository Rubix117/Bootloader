;
; A simple boot selector program that demonstrates the stack
;

	mov ah, 0x0e
	mov bp, 0x8000	;set the base of the stack a little above the
			;bios

	mov sp, bp	;loads our boot selector - so it wont overwrite
			;us
	
	push 'A'	;Push some characters on the stack for later
	push 'B'	;retrival. Note these are pushed on as 
	push 'C'	;16-bit values, so the most significant byte
			;will be added by our assebler as 0x00

	pop bx		;note we can only pop 16-bits. so pop to bx
	mov al, bl	;then copy bl (i.e 8-bit char) to al
	int 0x10	

	pop bx		;Pop the next char off the stack
	mov al, bl	
	int 0x10	;print(al)
	
	mov al, [0x7ffe] ;To prove our stack grows downwards from bp,
			;fetch the char at 0x8000 - 0x2 (ie 16-bits)
	int 0x10	;print(al) 
	
	jmp $

;padding an magic BIOS numbers

	times 510-($-$$) db 0
	dw 0xaa55
			
