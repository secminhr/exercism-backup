% Please visit https://exercism.io/tracks/prolog/installation
% for instructions on setting up prolog.
% Visit https://exercism.io/tracks/prolog/tests
% for help running the tests for prolog exercises.

% Replace the goal below with
% your implementation.

create((Row, Col)):- Row<8, Col<8, Row>=0, Col>=0.

attack((Row, _), (Row, _)).
attack((_, Col), (_, Col)).

attack((Row1, Col1), (Row2, Col2)):- abs(Row1-Row2) =:= abs(Col1-Col2).

