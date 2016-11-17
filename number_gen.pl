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

% test p with length
pn(0, [], _).
pn(I, [H|T], N) :- I > 0, Im1 is I - 1, pn(Im1, T, N), member(H, N).

% bt(T) generates all binary trees
bt(0, []).
bt(1, [[], []]).
bt(H, [A, B]) :- H > 1, Hm1 is H - 1, Hm2 is H - 2, between(H2, 0, Hm2), bt(Hm1, A), bt(H2, B).
bt(H, [A, B]) :- H > 1, Hm1 is H - 1, between(H1, 0, Hm1), bt(H1, A), bt(Hm1, B).
% bt(H, [A, B]) :- H > 0, Hm1 is H - 1, bt(Hm1, A), bt(Hm1, B).
bt(T) :- nat(H), bt(H, T).

% t(T) same as bt but with vertex count
t([], 0).
t([A, B], N) :- N > 0, Nm1 is N - 1, between(K, 0, Nm1), M is Nm1 - K, 
  t(A, K), t(B, M).
t(T) :- nat(N), t(T, N).
