parent(cyrill, renaud).
parent(cyrill, claire).
parent(renaud, clovis).
parent(valentin, olivier).
parent(claire, olivier).
parent(renaud, claudia).
parent(claire, gaelle).

brothersister(X,Y) <-- parent(Z,X), parent(Z,Y).

grandparent(X,Y) <-- parent(X,Z), parent(Z,Y).

cousin(X,Y) <-- grandparent(Z,X), grandparent(Z,Y).

ancester(X,Y) <-- parent(X,Y).
ancester(X,Y) <-- grandparent(X,Y).
