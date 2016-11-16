edge(G, X, Y) :- G = [V, E], (member([X, Y], E); member([Y, X], E)).
% path(G, X, Y, V, P).
path(G, X, X, V, P) :- reverse([X|V], P).
path(G, X, Y, V, P) :- edge(G, X, T), not(member(T, V)), path(G, T, Y, [X|V], P).
path(G, X, Y, P) :- path(G, X, Y, [], P).
graph([[1,2,3,4,5], [[1,2],[2,3],[3,4],[4,2],[3,5]]]). 
graph([[1,2,3,4,5,6], [[1,2],[2,3],[3,4],[4,2],[3,5]]]). 

connected([V, E]) :- not((member(X, V), member(Y, V), not(path(G, X, Y, _)))).

stree(G, V, [], E, E).
stree(G, V, N, E, R) :- member(X, V), member(Y, N), edge(G, X, Y),
  remove(Y, N, N1), stree(G, [Y|V], N1, [X, Y], E). 
stree([V, E], [V, E1]) :- V=[X|N], stree([V, E], [X], N, [], E1).
