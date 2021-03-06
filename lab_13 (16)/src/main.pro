predicates
factorial(unsigned, unsigned).
factorial_help(unsigned, unsigned, unsigned).

fibonacci(unsigned, unsigned).
fibonacci_help(unsigned, unsigned, unsigned, unsigned).

clauses
factorial_help(Number, TmpResult, TmpResult) :- Number < 2, !.

factorial_help(Number, Result, TmpResult) :-
    UpdResult = TmpResult * Number,
    DecNumber = Number - 1,
    factorial_help(DecNumber, Result, UpdResult).
    
factorial(Number, Result) :- factorial_help(Number, Result, 1).


fibonacci_help(N, Result, First, Second) :-
    N = 2, Result = First + Second, !.
    
fibonacci_help(N, Result, First, Second) :-
    UpdFirst = Second,
    UpdSecond = First + Second,
    DecN = N - 1,
    fibonacci_help(DecN, Result, UpdFirst, UpdSecond).
    
fibonacci(N, N) :- N < 2, !.
fibonacci(N, Result) :- fibonacci_help(N, Result, 0, 1).


goal
write("factorial(5): "),
factorial(5, Result);

write("\nfibonacci(8): "),
fibonacci(8, Result).
