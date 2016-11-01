intersection(X, A, B) :- member(X, A), member(X, B).

nat(0).
nat(X) :- nat(Y), X is Y + 1.

odd(1).
odd(X) :- odd(Y), X is Y + 2.

fib(0, 1).
fib(Y, Z) :- fib(X, Y), Z is X + Y.
fib(X) :- fib(X, _).

fibn(0, 0, 1).
fibn(N, Y, Z) :- fibn(M, X, Y), N is M + 1, Z is X + Y.
fibn(N, X) :- fibn(N, X, _).

between(A, A, B) :- A =< B.
between(X, A, B) :- A < B, A1 is A + 1, between(X, A1, B).

nat(X, Y) :- nat(S), between(X, 0, S), Y is S - X.

% p(M, N) M contains all lists of elements of N
p([], _).
p([H|T], N) :- p(T, N), member(H, N).

% bt(T) generates all binary trees
bt(0, []).
bt(H, [A, B]) :- H > 1, Hm1 is H - 1, Hm2 is H - 2, between(H2, 0, Hm2), bt(Hm1, A), bt(H2, B).
bt(H, [A, B]) :- H > 1, Hm1 is H - 1, Hm2 is H - 2, between(H1, 0, Hm2), bt(H1, A), bt(Hm1, B).
bt(H, [A, B]) :- H > 0, Hm1 is H - 1, bt(Hm1, A), bt(Hm1, B).
bt(T) :- nat(H), bt(H, T).
