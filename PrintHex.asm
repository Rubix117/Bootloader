[org 0x7C00]

	mov dx, 0x1FB6
	call print_hex
	jmp $
	
	;printing the hex value of DX
	
	print_hex:
		
		mov bx,  HEX_OUT
		call print_string
		ret 
		
	;global variables
	HEX_OUT: db  '0x0000', 0;
	
	
	%include 'asm/print.asm'
	times 510-($-$$) db 0
	
	dw 0xaa55
	