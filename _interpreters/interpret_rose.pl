:- initialization rose, halt.

rose :-
    consult('_knowledge/ravenrose.pl'), 
    X = raven(bird, sign), write(X). % consults the stories prolog file.
