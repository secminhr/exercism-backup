default rel
global two_fer

             section .data
message1:    db      "One for you, one for me.", 0
messageHead: db      "One for "
messageEnd:  db      ", one for me.", 0

             section .text
two_fer:
			 cmp rdi, ?? ;check rdi == NULL
			 je load_msgH

			 mov rcx, 0 ;loop counter 0<=rcx<3
load_msg1:
			 mov rax, 8
			 mov rbx, rcx
			 imul rbx, rax ;bx = offset

			 lea rax, [message1]
			 add rax, rbx ;rax = *message1 + offset
			 mov rdx, qword [rax]
			 mov qword [rsi+rbx], rdx ;rsi is the second parameter
			 inc cl
			 cmp cl, 3
			 jne load_msg1
			 jmp finish
load_msgH:
			 lea rax, [message1]
			 mov rdx, qword [rax]
			 mov qword [rsi], rdx
finish:
			 ret			 