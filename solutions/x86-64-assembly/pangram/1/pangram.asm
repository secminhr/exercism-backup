default rel

;jmp_if_not_between source, lower_bound, upper_bound, jmp_des :- 
;jump to jmp_des if source < lower_bound or source > upper_bound
%macro jmp_if_not_between 4
cmp %1, %2
jl %4
cmp %1, %3
jg %4
%endmacro

section .text
global is_pangram
is_pangram:
	mov edx, 0 ;use edx to store the usage of alphabet
char_loop:
	mov al, byte [rdi]
	test al, al
	jz check_usage
	and al, 0xdf ;capitalize
	jmp_if_not_between al, 'A', 'Z', increment
	and al, 0x1f ;a to 1, b to 2...
	dec al
	mov ebx, 1
shifting:
	test al, al
	jz set_arr
	shl ebx, 1
	dec al
	jmp shifting
set_arr:
	or edx, ebx
increment:
	inc rdi
	jmp char_loop
check_usage:
	mov ebx, 1
	mov rcx, 26
arr_loop:
	and ebx, edx
	jz false
	shl ebx, 1
	loop arr_loop
true:
	mov rax, 1
	jmp return
false:
	mov rax, 0
return:
	ret