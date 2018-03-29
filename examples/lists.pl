list(nil).
list(cons(X, Y)) <-- list(Y).

last(X, cons(X, L)).
penultimate(Y, cons(X, cons(Y, L))).

length(o, nil).
length(s(K), cons(X, L)) <-- length(K, L).

kth_element(X, o, cons(X, L)).
kth_element(X, s(K), cons(Y, L)) <-- kth_element(X, K, L).

# [a,b,c] -> [a,a,b,b,c,c]
duplicate(nil, nil).
duplicate(cons(X, cons(X, L2)), cons(X, L)) <-- duplicate(L2, L).
