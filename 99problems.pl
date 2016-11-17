% http://www.ic.unicamp.br/~meidanis/courses/mc336/2009s2/prolog/problemas/

last(X, [X]).
last(X, [_|N]) :- last(X, N).

last_but_one(X, [X, _]).
last_but_one(X, [_|N]) :- last_but_one(X, N).

% element_at(X, L, I).
element_at(X, [X|_], 1).
element_at(X, [_|T], I) :- J is I - 1, element_at(X, T, J).

% length(L, N)
len([], 0).
len([_|T], N) :- length(T, N1), N is N1 + 1.

reverse(List, Rev) :- rev(List, [], Rev).
rev([], R, R).
rev([H|T], S, R) :- rev(T, [H|S], R).

palindrome(L) :- reverse(L, L).

my_flatten([], []).
my_flatten([H|T], L) :- 
  is_list(H), my_flatten(H, FH), my_flatten(T, FT), append(FH, FT, L).
my_flatten([H|T], [H|FT]) :- not(is_list(H)), my_flatten(T, FT).

compress([], []).
compress([X], [X]).
compress([X,X|T], C) :- compress([X|T], C).
compress([A,B|T], [A|C]) :- A \= B, compress([B|T], C).

move_same([H|T], [], [H|T], []).
move_same([H|T], [H1|T1], [H|T], [H1|T1]) :- H \= H1.
move_same([H|T], [H1|T1], P, S) :- H = H1, move_same([H1, H|T], T1, P, S).
pack([], []).
pack([H|T], [HX|TX]) :- move_same([H], T, HX, LN), pack(LN, TX).

encode_packed([], []).
encode_packed([[HHP|THP]|TP], [[HPL, HHP]|TE]) :- length([HHP|THP], HPL),
  encode_packed(TP, TE).
rle(L, E) :- pack(L, P), encode_packed(P, E).
