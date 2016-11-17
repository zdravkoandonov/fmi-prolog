% http://www.ic.unicamp.br/~meidanis/courses/mc336/2009s2/prolog/problemas/

% P1
last(X, [X]).
last(X, [_|N]) :- last(X, N).

% P2
last_but_one(X, [X, _]).
last_but_one(X, [_|N]) :- last_but_one(X, N).

% P3
% element_at(X, L, I).
element_at(X, [X|_], 1).
element_at(X, [_|T], I) :- J is I - 1, element_at(X, T, J).

% P4
% length(L, N)
len([], 0).
len([_|T], N) :- length(T, N1), N is N1 + 1.

% P5
reverse(List, Rev) :- rev(List, [], Rev).
rev([], R, R).
rev([H|T], S, R) :- rev(T, [H|S], R).

% P6
palindrome(L) :- reverse(L, L).

% P7
my_flatten([], []).
my_flatten([H|T], L) :- 
  is_list(H), my_flatten(H, FH), my_flatten(T, FT), append(FH, FT, L).
my_flatten([H|T], [H|FT]) :- not(is_list(H)), my_flatten(T, FT).

% P8
compress([], []).
compress([X], [X]).
compress([X,X|T], C) :- compress([X|T], C).
compress([A,B|T], [A|C]) :- A \= B, compress([B|T], C).

% P9
move_same([H|T], [], [H|T], []).
move_same([H|T], [H1|T1], [H|T], [H1|T1]) :- H \= H1.
move_same([H|T], [H1|T1], P, S) :- H = H1, move_same([H1, H|T], T1, P, S).
pack([], []).
pack([H|T], [HX|TX]) :- move_same([H], T, HX, LN), pack(LN, TX).

% P10
encode_packed([], []).
encode_packed([[HHP|THP]|TP], [[HPL, HHP]|TE]) :- length([HHP|THP], HPL),
  encode_packed(TP, TE).
rle(L, E) :- pack(L, P), encode_packed(P, E).

% P11
encode_packed_mod([], []).
encode_packed_mod([[HHP|THP]|TP], [HHP|TE]) :- length([HHP|THP], HPL),
  HPL = 1, encode_packed_mod(TP, TE).
encode_packed_mod([[HHP|THP]|TP], [[HPL, HHP]|TE]) :- length([HHP|THP], HPL),
  HPL > 1, encode_packed_mod(TP, TE).
rle_mod(L, E) :- pack(L, P), encode_packed_mod(P, E).

% P12
rle_mod_decode([], []).
rle_mod_decode([[HENumber, _]|TE], D) :- HENumber = 0, rle_mod_decode(TE, D).
rle_mod_decode([[HENumber, HEChar]|TE], [HEChar|DecodedTail]) :- HENumber >=1, N1 is HENumber - 1,  
  rle_mod_decode([[N1, HEChar]|TE], DecodedTail).
rle_mod_decode([HE|TE], [HE|TD]) :- not(is_list(HE)), rle_mod_decode(TE, TD).


% P13
% encode_direct(List, EncodedList).
% Runs kind of slow...
% TODO: try to optimize this
encode_direct([], []).
encode_direct([X], [X]).
encode_direct([H|T], [H, HEChar|TTE]) :- encode_direct(T, [HEChar|TTE]), 
  not(is_list(HEChar)), H \= HEChar.
encode_direct([H|T], [H, [HENum, HEChar]|TTE]) :- encode_direct(T, [[HENum, HEChar]|TTE]), 
  H \= HEChar.
encode_direct([H|T], [[2, HEChar]|TE]) :- encode_direct(T, [HEChar|TE]),
  not(is_list(HEChar)), H = HEChar.
encode_direct([H|T], [[HENum1, HEChar]|TE]) :- encode_direct(T, [[HENum, HEChar]|TE]),
  HENum1 is HENum + 1, H = HEChar.
