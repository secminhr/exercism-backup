global leap_year
default rel

			section .text
leap_year:

div_by_400:

			mov cx, 400
			mov dx, 0
			mov ax, di
			div cx
			cmp dx, 0
			je is_leap
div_by_100:
			mov cl, 100
			mov ax, di
			div cl
			cmp ah, 0
			je not_leap
div_by_4:
			mov ax, di
			shl ax, 6
			cmp al, 0
			je is_leap
not_leap:
			mov rax, 0
			jmp finish
is_leap:
			mov rax, 1
finish:
			ret
