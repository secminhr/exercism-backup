% Please visit https://exercism.io/tracks/prolog/installation
% for instructions on setting up prolog.
% Visit https://exercism.io/tracks/prolog/tests
% for help running the tests for prolog exercises.

% Replace the goal below with
% your implementation.

create((Row, Col)):- Row<8, Col<8, Row>=0, Col>=0.

abs(0, 0).
abs(X, N):- 
	X>0, 
	Y is X-1,
	abs(Y, Z),
	N is Z+1.

abs(X, N):- 
	X<0, 
	Y is X+1,
	abs(Y, Z),
	N is Z+1.

attack((Row1, _), (Row2, _)):- Row1 = Row2.
attack((_, Col1), (_, Col2)):- Col1 = Col2.
attack((Row1, Col1), (Row2, Col2)):- 
	Diff1 is Row1-Row2,
	Diff2 is Col1-Col2,
	abs(Diff1, X),
	abs(Diff2, Y),
	X =:= Y.

