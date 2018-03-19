blanc(jeannot).
grandesOreilles(jeannot).
blanc(Y) <-- enfant(jeannot,Y).
enfant(X,filsAuYeuxBleus(X)) <-- grandesOreilles(X),dentsNonCaries(X).
yeuxBleus(filsAuYeuxBleus(X)) <-- grandesOreilles(X),dentsNonCaries(X).
dentsNonCaries(X) <-- blanc(X).
