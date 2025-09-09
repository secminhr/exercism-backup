					default rel
					global to_rna
					section .text
to_rna:				mov rax, 0; offset

looping:			mov bl, byte [rdi+rax]; rdi is the first argument (dna)
			    	cmp bl, 0
			    	je finish

	compare:		cmp bl, "C"
					je transcript_C
					cmp bl, "G"
					je transcript_G
					cmp bl, "T"
					je transcript_T
					cmp bl, "A"
					je transcript_A
					jmp finish

	transcript_C:	mov byte [rsi+rax], "G" ;rsi is the second argument (rna)
					jmp looping_end
	transcript_G:	mov byte [rsi+rax], "C"
					jmp looping_end
	transcript_T:	mov byte [rsi+rax], "A"
					jmp looping_end
	transcript_A: 	mov byte [rsi+rax], "U"
					jmp looping_end

	looping_end:	inc rax
					jmp looping


finish:				mov byte [rsi+rax], 0 ;end string with 0
			    	ret
