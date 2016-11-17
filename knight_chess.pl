%
on_board(X) :- X >= 1, X =< 8.
move(X, Y, X1, Y1) :- X1 is X - 1, on_board(X1), Y1 is Y - 2, on_board(Y1).
move(X, Y, X1, Y1) :- X1 is X - 1, on_board(X1), Y1 is Y + 2, on_board(Y1).
move(X, Y, X1, Y1) :- X1 is X + 1, on_board(X1), Y1 is Y - 2, on_board(Y1).
move(X, Y, X1, Y1) :- X1 is X + 1, on_board(X1), Y1 is Y + 2, on_board(Y1).
move(X, Y, X1, Y1) :- X1 is X - 2, on_board(X1), Y1 is Y - 1, on_board(Y1).
move(X, Y, X1, Y1) :- X1 is X - 2, on_board(X1), Y1 is Y + 1, on_board(Y1).
move(X, Y, X1, Y1) :- X1 is X + 2, on_board(X1), Y1 is Y - 1, on_board(Y1).
move(X, Y, X1, Y1) :- X1 is X + 2, on_board(X1), Y1 is Y + 1, on_board(Y1).
k(X, Y, P) :- dfs(X, Y, [[X, Y]], P).
dfs(X, Y, V, V) :- length(V, 64).
dfs(X, Y, V, P) :- move(X, Y, X1, Y1), not(member([X1, Y1], V)), 
  dfs(X1, Y1, [[X1, Y1]|V], P).
