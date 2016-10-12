append([], L, L).
append([H|T], L, [H|N]) :- append(T, L, N).

prefix(P, L) :- append(P, _, L).
suffix(S, L) :- append(_, S, L).
infix(I, L) :- prefix(P, L), suffix(I, P).

% member(X, [X|_]).
% member(X, [_|T]) :- member(X, T).
member(X, L) :- append(_, [X|_], L).

last(X, L) :- append(_, [X], L).

add(X, L, [X|L]).
add(X, [H|T], [H|N]) :- add(X, T, N).
remove(X, L, N) :- add(X, N, L).

perm([], []).
perm([H|P], L) :- remove(H, L, T), perm(P, T).

sorted([]).
sorted([_]).
sorted([A,B|T]) :- A=<B, sorted([B|T]).

psort(L, S) :- perm(S, L), sorted(S).

sorted2(L) :- not((infix([A,B], L), A>B)).

% subset(S, L).
subset([], _).
subset([H|T], L) :- remove(H, L, Q), subset(T, Q).
