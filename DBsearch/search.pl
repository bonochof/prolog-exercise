/*
  search.pl
  Ryosuke Takata
*/

husband(X) :-
  family(X, _, _).

wife(X) :-
  family(_, X, _).

child(X) :-
  family(_, _, Children), member(X, Children).

exists(X) :- husband(X).
exists(X) :- wife(X).
exists(X) :- child(X).

