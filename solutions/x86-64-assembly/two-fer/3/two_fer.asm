default rel
global two_fer

             	section .data
message1:    	db      "One for you, one for me.", 0
messageHead: 	db      "One for "
messageHeadLen  equ     $-messageHead
messageEnd:  	db      ", one for me.", 0

             	section .text
two_fer:
				cmp rdi, 0 ;check rdi == NULL
				jne load_msgH

load_msg1_init:
				mov rcx, 0 ;loop counter 0<=rcx<3
load_msg1:
				mov rax, 8
				mov rbx, rcx
				imul rbx, rax ;rbx = offset

				lea rax, [message1]
				add rax, rbx ;rax = *message1 + offset
				mov rdx, qword [rax]
				mov qword [rsi+rbx], rdx ;rsi is the second parameter
				inc rcx
				cmp rcx, 3
				jne load_msg1
				jmp finish
load_msgH:
				lea rax, [message1]
				mov rdx, qword [rax]
				mov qword [rsi], rdx
load_name_init:
				mov rcx, 0 ;offset
load_name:
				mov al, byte [rdi+rcx]
				cmp al, 0
				je load_msgE_init ;jump if read to the end of name
				mov byte [rsi+messageHeadLen+rcx], al
				inc rcx
				jmp load_name
load_msgE_init:
				; rcx = name.length
				mov rbx, 0; loop counter 0<=rbx<4
load_msgE:
				mov rax, 4
				mov rdx, rbx
				imul rdx, rax ;rdx = offset

				push rbx
				lea rax, [messageEnd]
				add rax, rdx
				mov ebx, dword [rax]
				add rdx, rcx
				mov dword [rsi+messageHeadLen+rdx], ebx
				pop rbx
				inc rbx
				cmp rbx, 4
				jne load_msgE
finish:
				ret			 