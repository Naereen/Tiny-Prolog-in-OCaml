cat(tom).
mouse(jerry).

fast(X) <-- mouse(X).
stupid(X) <-- cat(X).

ishuntedby(X, Y) <-- mouse(X), cat(Y).
