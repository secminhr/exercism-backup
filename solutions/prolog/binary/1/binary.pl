binary("0", 0).
binary("1", 1).
binary(BS, Ans) :- string_concat(S, "0", BS), binary(S, D), Ans is D*2.
binary(BS, Ans) :- string_concat(S, "1", BS), binary(S, D), Ans is D*2 + 1.