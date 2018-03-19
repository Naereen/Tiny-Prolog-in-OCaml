enchainement([]).
enchainement([_]).
enchainement([ [_, X] | [[X, Y]| Q] ]) <-- enchainement([[X, Y]|Q]).

insere(X, L, [X|L]).
insere(X, [T|Q1], [T|Q2]) <-- insere(X, Q1, Q2).

miroir([X, Y], [Y, X]).

perm([], []).
perm(L, [T|Q]) <-- perm(L2, Q), insere(T, L2, L).

assemblage([], []).
assemblage(L, [T|Q]) <-- assemblage(L2, Q), insere(T, L2, L).
assemblage(L, [T|Q]) <-- assemblage(L2, Q), miroir(T2, T), insere(T2, L2, L).

quasisolution(L1, L2) <-- perm(L1, L2), enchainement(L1).
solution(L1, L2) <-- assemblage(L1, L2), enchainement(L1).
