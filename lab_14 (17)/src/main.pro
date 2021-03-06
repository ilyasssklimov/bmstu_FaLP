domains
list = integer*.


predicates
list_length(list, unsigned).
list_length_help(list, unsigned, unsigned).

list_sum(list, integer).
list_sum_help(list, integer, integer).

sum_odd(unsigned, integer, integer, integer).
list_sum_odd(list, integer).
list_sum_odd_help(list, integer, unsigned, integer).


clauses
list_length_help([], Sum, Sum) :- !.
list_length_help([_|T], Length, Sum) :-
    UpdSum = Sum + 1,
    list_length_help(T, Length, UpdSum).
list_length(List, Length) :- list_length_help(List, Length, 0).


list_sum_help([], Sum, Sum) :- !.
list_sum_help([H|T], ResultSum, Sum) :-
    UpdSum = Sum + H,
    list_sum_help(T, ResultSum, UpdSum).
list_sum(List, Sum) :- list_sum_help(List, Sum, 0).


sum_odd(Position, Number, Sum, NewSum) :- 
    Position mod 2 = 1, 
    NewSum = Sum + Number, 
    !.
sum_odd(_, _, Sum, Sum) :- !.

list_sum_odd_help([], Sum, _, Sum) :- !.
list_sum_odd_help([H|T], ResultSum, Position, Sum) :-
    sum_odd(Position, H, Sum, UpdSum),
    IncPosition = Position + 1,
    list_sum_odd_help(T, ResultSum, IncPosition, UpdSum).
list_sum_odd(List, Sum) :- list_sum_odd_help(List, Sum, 0, 0).


goal
write("Len of [ ]: "),
list_length([], Length);
write("Len of [ 1, 2, 3 ]: "),
list_length([1, 2, 3], Length);

write("\nSum of [ ]: "),
list_sum([], Sum);
write("Sum of [ 1, 2, 3 ]: "),
list_sum([1, 2, 3], Sum);

write("\nSum of numbers in odd positions of [ ]: "),
list_sum_odd([], Sum);
write("Sum of numbers in odd positions of [ 1, 2, 3, 4, 5 ]: "),
list_sum_odd([1, 2, 3, 4, 5], Sum).