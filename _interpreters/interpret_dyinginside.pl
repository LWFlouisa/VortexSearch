:- initialization dyinginside, halt.

dyinginside :-
    consult('_knowledge/dyinginside.pl'), 
    X = under_skin(rotting, within), write(X). % consults the stories prolog file.
