:- initialization anthem, halt.

anthem :-
    consult('_knowledge/anthem.pl'), 
    X = liberty(wanted), write(X). % consults the stories prolog file.
