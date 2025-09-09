default rel
global two_fer

             section .data
message1:    db      "One for you, one, for me.", 0

             section .text
two_fer:

	         mov byte [rsi], message1
	         ret