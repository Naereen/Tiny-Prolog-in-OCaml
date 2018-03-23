entier(o).
entier(s(X)) <-- entier(X).

infEq(o,X) <-- entier(X).
infEq(s(X),s(Y)) <-- infEq(X,Y).

plus(o,X,X).
plus(s(X),Y,s(Z)) <-- plus(X,Y,Z).

mult(o,X,o) <-- entier(X).
mult(s(X),Y,Z) <-- mult(X,Y,Z1),plus(Z1,Y,Z).
