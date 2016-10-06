p(ivan,maria).
p(maria,alex).
p(conko,canka).

v(X,Y):-p(Y,Z),p(Z,X).
