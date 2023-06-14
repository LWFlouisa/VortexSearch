:- initialization glass, halt.

glass :-
    consult('_knowledge/fromglasstograss.pl'), 
    X = season(spring), write(X). % consults the stories prolog file.
