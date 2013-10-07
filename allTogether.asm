;
;a boot sector program that prins a string using our function 
;


[org 0x7c00]

	mov bx, HELLO_MSG	;use bx as a param to our function so
	call print_string	;we can specify the address of a string
	
	mov bx, GOODBYE_MSG
	call print_string


	jmp $			;hang

	%include "ASM/print.asm"

	;Data

	HELLO_MSG:

	db 'Hello, World',0Dh, 0Ah, 0

	GOODBYE_MSG:
	db 'Goodbye!', 0Dh, 0Ah, 0

	;padding 
	times 510-($-$$) db 0
	dw 0xaa55
