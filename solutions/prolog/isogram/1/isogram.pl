in_list(X, []):- fail.
in_list(X, [Head|Tail]):- char_type(X, lower), (in_list(X, Tail); Head == X).

isogram_list([]).
isogram_list([H|Rest]):- isogram_list(Rest), not(in_list(H, Rest)).


isogram(X):- string_lower(X, Lower), string_chars(Lower, Chars), isogram_list(Chars).


