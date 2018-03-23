whiteFur(bugsBunny).
longEars(bugsBunny).
whiteFur(Y) <-- child(bugsBunny,Y).
child(X,sonWithBlueEyes(X)) <-- longEars(X),cleanTeeth(X).
blueEyes(sonWithBlueEyes(X)) <-- longEars(X),cleanTeeth(X).
cleanTeeth(X) <-- whiteFur(X).
