append([], L, L).
append([H|T], L, [H|S]) :- append(T, L, S).

split([], _, [], []).
split([H|T], X, [H|A], B) :- H < X, split(T, X, A, B).
split([H|T], X, A, [H|B]) :- not(H < X), split(T, X, A, B).

qsort([], []).
qsort([H|T], S) :- split(T, H, A, B), qsort(A, SA), qsort(B, SB), append(SA, [H|SB], S).

bubble_sort(List, Sorted) :- bsort(List, [], Sorted).
bsort([], Acc, Acc).
bsort(L, Acc, Sorted) :- bubble(L, NT, Max), bsort(NT, [Max|Acc], Sorted).

bubble([X], [], X).
bubble([X,Y|T], [Y|NT], Max) :- X > Y, bubble([X|T], NT, Max).
bubble([X,Y|T], [X|NT], Max) :- not(X > Y), bubble([Y|T], NT, Max).

quick_sort(List, Sorted) :- q_sort(List, [], Sorted).
q_sort([], Acc, Acc).
q_sort([H|T], Acc, Sorted) :- split(T, H, L1, L2), q_sort(L1, Acc, Sorted1), q_sort(L2, [H|Sorted1], Sorted).
