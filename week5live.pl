% d(D, L) :- L is list of lists, D is decart product
d([], []).
d([H|T], [HL|TL]) :- member(H, HL), d(T, TL).

% s(N, L) :- sum(L) = N.
s(0, []).
s(N, [H|T]) :- between(1, N, H), N1 is N - H, s(N1, T).

% split(L, M) :- concat(M) = L, M is array of arrays.
split([], []).
split(L, [A|T]) :- append(A, B, L), A \= [], split(B, T).

% p(X1, Y1, X2, Y2, X3, Y3) :- perpendicular at (X2, Y2).
z(X, X).
z(X, Y) :- X > 0, Y is -X.
decr([], []).
decr([H|T], [H1|T1]) :- H1 is H - 1, decr(T, T1).
n(N, L) :- n(S), s(S, M), length(M, N), decr(M, L).
all_z([], []).
all_z([H|T], [H1|T1]) :- z(H, H1), all_z(T, T1).
m(N, L) :- n(N, L1), all_z(L1, L).
p(X1, Y1, X2, Y2, X3, Z3) :- m(6, [X1, Y1, X2, Y2, X3, Y3]), scalar product.

% sumn
sumn(0, [], 0).
sumn(N, [H|T], S) :- N > 0, S1 is S - N + 1, between(1, S1, H), S2 is S - H,
  Nm1 is N - 1, sumn(Nm1, T, S2).

% incircle(X, Y, R, X1, Y1) :- (X,Y) -center, R-radius, (X1, Y1) - point in circle?

% chessboard 8x8
% p(X, Y, L) :- (X, Y) - starting point of a bishop (has to be a horse?), 
% L- списък от координатите на точките на 
% последователност от ходове без да повтаря за да се обходят всички полета
% dfs(X) :- goal(X).
% dfs(X) :- move(X, Y) , dfs(Y).
