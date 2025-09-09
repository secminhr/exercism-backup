global leap_year
default rel

			section .text
leap_year:

mod_4:
			mov ax, di
			and ax, 3
			jnz not_leap

div_by_100:
			mov cl, 100
			mov ax, di
			div cl
			test ah, ah
			jne is_leap	

div_by_400:

			mov cx, 400
			mov dx, 0
			mov ax, di
			div cx
			test dx, dx
			je is_leap


not_leap:
			mov rax, 0
			jmp finish
is_leap:
			mov rax, 1
finish:
			ret
