default rel
global two_fer

             	section .data
message1:    	db      "One for you, one for me.", 0
messageHead: 	db      "One for ", 0
messageHeadLen  equ     $-messageHead
messageEnd:  	db      ", one for me.", 0

;source addr, destination addr
%macro readStr 2
		
	push rdx

	%%load:
		mov dl, byte [%1]
		mov byte [%2], dl

		inc %1
		inc %2

		cmp dl, 0
		jne %%load

	dec %1
	dec %2
	pop rdx


%endmacro

             	section .text
two_fer:
				cmp rdi, 0 ;check rdi == NULL
				je load_msg_no_name

load_msg_with_name:
				lea rax, [messageHead]
				readStr rax, rsi

				readStr rdi, rsi

				lea rax, [messageEnd]
				readStr rax, rsi
				jmp finish

load_msg_no_name:
				lea rax, [message1]
				readStr rax, rsi
				jmp finish
finish:
				ret			 