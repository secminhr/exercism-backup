global reverse
default rel

%macro getLength 2

	%%prologue:
				push rax
				mov %2, 0
	%%count:
				mov al, byte [%1+%2]
				cmp al, 0
				je %%epilogue

				inc %2
				jmp %%count

	%%epilogue:
			    pop rax

%endmacro



		   section .text
reverse:
		   getLength rdi, rcx
swap_init:
		   dec rcx
swap:
	 	   mov rdx, rdi
		   add rdx, rcx
		   cmp rdi, rdx
		   jge finish

		   mov al, byte [rdi]
		   mov bl, byte [rdi+rcx]
		   mov byte [rdi], bl
		   mov byte [rdi+rcx], al
		   inc rdi
		   sub rcx, 2
		   jmp swap
finish:
		   ret