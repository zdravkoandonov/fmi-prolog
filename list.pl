% my implementation of lists:
list(_, e).
list(_, list(_, _)).

firstl(X, list(X, _)).
secondl(X, list(_, list(X, _))).

lastl(X, list(X, e)).
lastl(X, list(_, T)) :- lastl(X, T).

appendl(e, L, L).
appendl(list(H1, T1), L2, list(H1, L)) :- appendl(T1, L2, L).

% first(X, L).
first(X, [X|_]).

% last(X, L).
last(X, [X]).
last(X, [_|T]) :- last(X, T).

% append(L1, L2, NL).
append([], L, L).
append([H1|T1], L2, [H1|NL]) :- append(T1, L2, NL).

% member(X, L).
member(X, [X|_]).
member(X, [_|T]) :- member(X, T).
