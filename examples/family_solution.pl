parent(cyrill, renaud).
parent(cyrill, claire).
parent(renaud, clovis).
parent(valentin, olivier).
parent(claire, olivier).
parent(renaud, claudia).
parent(claire, gaelle).

ancetre(X, Y) <-- parent(X, Y).
ancetre(X, Y) <-- parent(Z, Y), ancetre(X, Z).

cousin(X, Y) <-- parent(Z, X), parent(Z, Y).
cousin(X, Y) <-- parent(A, X), parent(B, Y), cousin(A, B).
