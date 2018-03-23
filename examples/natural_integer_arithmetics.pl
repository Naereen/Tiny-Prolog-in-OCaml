# o and s*(o) are integers
integer(o).
integer(s(X)) <-- integer(X).

# o <= X for any X
lowerEq(o,X) <-- integer(X).
# X+1 <= Y+1 <=> X <= Y for any X, Y
lowerEq(s(X),s(Y)) <-- lowerEq(X,Y).

# o + X = X for any X
sum(o,X,X).
# (X+1) + Y = Z+1 <=> X + Y = Z
sum(s(X),Y,s(Z)) <-- sum(X,Y,Z).

# o * X = o for any X
product(o,X,o) <-- integer(X).
# (X+1)*Y = Z <=> X*Y = Z1 and Z1 + Y = Z for some Z1, for any X, Y
product(s(X),Y,Z) <-- product(X,Y,Z1),sum(Z1,Y,Z).

# X^o = 1 = o+1 for any X
exponentiation(X,o,s(o)) <-- integer(X).
# X^(Y+1) = X^Y * X so X^(Y+1) = Z <=> X^Y = Z1 and Z1 * X = Z for some Z1, for any X, Y
exponentiation(X,s(Y),Z) <-- exponentiation(X,Y,Z1),product(Z1,X,Z).
