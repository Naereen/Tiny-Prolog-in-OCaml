integer(o).
integer(s(X)) <-- integer(X).

lowerEq(o,X) <-- integer(X).
lowerEq(s(X),s(Y)) <-- lowerEq(X,Y).

sum(o,X,X).
sum(s(X),Y,s(Z)) <-- sum(X,Y,Z).

product(o,X,o) <-- integer(X).
product(s(X),Y,Z) <-- product(X,Y,Z1),sum(Z1,Y,Z).

exponentiation(X,o,s(o)) <-- integer(X).
exponentiation(X,s(Y),Z) <-- exponentiation(X,Y,Z1),product(Z1,X,Z).
