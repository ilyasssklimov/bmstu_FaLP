domains
list = integer*.


predicates
add_more_number(integer, integer, list, list).
greater_help(list, integer, list, list).
greater(list, integer, list).

add_odd_pos(integer, unsigned, list, list)
odd_pos_help(list, list, unsigned, list).
odd_pos(list, list).

delete_equal(integer, integer, list, list).
delete_from_list_help(list, integer, list, list).
delete_from_list(list, integer, list).

member(list, integer).
add_member(integer, list, list).
list_to_set_help(list, list, list).
list_to_set(list, list).


clauses
add_more_number(NumFromList, Number, List, ResultList) :-
    NumFromList > Number,
    ResultList = [NumFromList | List],
    !.
add_more_number(_, _, List, List) :- !.

greater_help([], _, TmpList, TmpList) :- !.
greater_help([H|T], Number, ResultList, TmpList) :-
    add_more_number(H, Number, TmpList, UpdTmpList),
    greater_help(T, Number, ResultList, UpdTmpList).
    
greater(List, Number, ResultList) :- greater_help(List, Number, ResultList, []).


add_odd_pos(NumFromList, Position, List, UpdTmpList) :-
    Position mod 2 = 1,
    UpdTmpList = [NumFromList | List],
    !.
add_odd_pos(_, _, List, List) :- !.

odd_pos_help([], TmpList, _, TmpList) :- !.
odd_pos_help([H|T], ResultList, Position, TmpList) :-
    add_odd_pos(H, Position, TmpList, UpdTmpList),
    IncPosition = Position + 1,
    odd_pos_help(T, ResultList, IncPosition, UpdTmpList).

odd_pos(List, Result) :- odd_pos_help(List, Result, 0, []).


delete_equal(NumFromList, Number, TmpList, UpdTmpList) :- 
    not(NumFromList = Number),
    UpdTmpList = [NumFromList | TmpList],
    !.
delete_equal(_, _, TmpList, TmpList) :- !.

delete_from_list_help([], _, TmpList, TmpList) :- !.
delete_from_list_help([H|T], Number, ResultList, TmpList) :- 
    delete_equal(H, Number, TmpList, UpdTmpList),
    delete_from_list_help(T, Number, ResultList, UpdTmpList).

delete_from_list(List, Number, ResultList) :- delete_from_list_help(List, Number, ResultList, []).


member([H|_], Number) :- H = Number, !.
member([_|T], Number) :- member(T, Number).

add_member(NumFromList, TmpSet, UpdTmpSet) :-
    not(member(TmpSet, NumFromList)),
    UpdTmpSet = [NumFromList | TmpSet],
    !.
add_member(_, TmpSet, TmpSet) :- !.

list_to_set_help([], TmpSet, TmpSet) :- !.
list_to_set_help([H|T], Set, TmpSet) :-
    add_member(H, TmpSet, UpdTmpSet),
    list_to_set_help(T, Set, UpdTmpSet).
    
list_to_set(List, Set) :- list_to_set_help(List, Set, []).

goal
write("Elements of list [ 1, 2, 3 ] greate than 1 : "), 
greater([1, 2, 3], 1, Result);

write("\nElements in odd positions of list [ 1, 2, 3 ] : "),
odd_pos([1, 2, 3], Result);

write("\nList with deleted 2 from list [ 1, 2, 3, 2] : "),
delete_from_list([1, 2, 3, 2], 2, Result);

write("\nSet from list [ 1, 2, 3, 2, 1 ] : "),
list_to_set([1, 2, 3, 3, 2, 1], Result).
