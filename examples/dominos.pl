is_list(emptylist).
is_list(c(X, L)) <-- is_list(L).
is_pair(p(A, B)).

chaining(emptylist).
chaining(c(p(A, B), emptylist)).
chaining(c(p(Z, X), c(p(X, Y), Q))) <-- chaining(c(p(X, Y), Q)).

insert(X, L, c(X, L)).
insert(X, c(T, Q1), c(T, Q2)) <-- insert(X, Q1, Q2).

permutations(emptylist, emptylist).
permutations(L, c(T, Q)) <-- insert(T, L2, L), permutations(L2, Q).

mirror(p(A, B), p(B, A)).

arrangements(emptylist, emptylist).
arrangements(L, c(T,Q)) <-- insert(T, L2, L), arrangements(L2, Q).
arrangements(L, c(T,Q)) <-- mirror(T2, T), insert(T2, L2, L), arrangements(L2, Q).

quasisolution(L1, L2) <-- permutations(L1, L2), chaining(L2).

solution(L1, L2) <-- arrangements(L1, L2), chaining(L2).
