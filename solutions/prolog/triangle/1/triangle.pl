valid_triangle(L1, L2, L3):- L1+L2 > L3, L1+L3 > L2, L2+L3 > L1.

triangle(L, L, L, "equilateral"):- valid_triangle(L, L, L), !.

triangle(L1, L1, L2, "isosceles"):- valid_triangle(L1, L1, L2).
triangle(L1, L2, L1, "isosceles"):- valid_triangle(L1, L2, L1).
triangle(L2, L1, L1, "isosceles"):- valid_triangle(L2, L1, L1).



triangle(L1, L2, L3, "scalene"):- valid_triangle(L1, L2, L3), not(triangle(L1, L2, L3, "isosceles")).

