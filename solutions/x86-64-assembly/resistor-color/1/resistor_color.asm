default rel

section .data
black     db "black", 0
brown     db "brown", 0
red       db "red", 0
orange    db "orange", 0
yellow    db "yellow", 0
green     db "green", 0
blue      db "blue", 0
violet    db "violet", 0
grey      db "grey", 0
white     db "white", 0
color_arr dq black, brown, red, orange, yellow, green, blue, violet, grey, white, 0


;cmp_str addr_a addr_b ne_location eq_location
%macro cmp_str 4
push rbx
push rdx
push rcx

mov rbx, %1
mov rdx, %2
%%cmp_loop:
mov cl, byte [rbx]
cmp cl, byte [rdx]
jne %%exit_ne
test cl, cl
jz %%exit_eq
inc rbx
inc rdx
jmp %%cmp_loop

%%exit_ne:
pop rcx
pop rdx
pop rbx
jmp %3

%%exit_eq:
pop rcx
pop rdx
pop rbx
jmp %4
%endmacro

section .text
global color_code
color_code:
	lea rbx, [color_arr]
color_loop:
	mov rax, qword [rbx]
	test rax, rax
	jz not_found
	cmp_str rax, rdi, color_code_inc, return
color_code_inc:
	add rbx, 8
	jmp color_loop

return:
	lea rax, [color_arr]
	sub rbx, rax
	mov rax, rbx
	shr rax, 3
	ret
not_found:
	mov rax, -1
	ret

global colors
colors:
    lea rax, [color_arr]
    ret
