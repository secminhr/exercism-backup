default rel
global two_fer

             	section .data
message1:    	db      "One for you, one for me.", 0
messageHead: 	db      "One for ", 0
messageEnd:  	db      ", one for me.", 0

%macro readString 4
		
	push rdx

	%%load:
		%1 %2 ,dl
		%3 dl, %4

		cmp dl, 0
		jne %%load

	dec %2
	dec %4
	pop rdx


%endmacro

;source, destination
%macro from 2

	mov %2, byte [%1]
	inc %1

%endmacro

;source, destination
%macro to 2

	mov byte [%2], %1
	inc %2

%endmacro


             	section .text
two_fer:
				cmp rdi, 0 ;check rdi == NULL
				je load_msg_no_name

load_msg_with_name:
				lea rax, [messageHead]
				readString from, rax, to, rsi

				readString from, rdi, to, rsi

				lea rax, [messageEnd]
				readString from, rax, to, rsi
				jmp finish

load_msg_no_name:
				lea rax, [message1]
				readString from, rax, to, rsi
				jmp finish
finish:
				ret