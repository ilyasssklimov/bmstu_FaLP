predicates
max_two(integer, integer, integer);
max_two_cut(integer, integer, integer);
max_three(integer, integer, integer, integer);
max_three_cut(integer, integer, integer, integer);


clauses
max_two(A, B, Max) :- A < B, Max = B; A >= B, Max = A.

max_two_cut(A, B, A) :- A >= B, !.
max_two_cut(_, B, B).

max_three(A, B, C, Max) :- A >= B, A >= C, Max = A; 
                           B >= A, B >= C, Max = B;
                           C >= A, C >= B, Max = C.

max_three_cut(A, B, C, A) :- A >= B, A >= C, !.
max_three_cut(_, B, C, B) :- B >= C, !.
max_three_cut(_, _, C, C).


goal
max_two(19, 4, Max);
max_two(1, 5, Max);
max_two(1, 1, Max);

max_two_cut(19, 4, Max);
max_two_cut(1, 5, Max);
max_two_cut(1, 1, Max);

max_three(9, 1, 4, Max);
max_three(5, 10, 2, Max);
max_three(0, 1, 20, Max);

max_three_cut(9, 1, 4, Max);
max_three_cut(5, 10, 2, Max);
max_three_cut(0, 1, 20, Max).
