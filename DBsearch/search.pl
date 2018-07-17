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

someoffice(X) :-
  family(
    person(_, X, _, works(Office, _)),
    person(_, X, _, works(Office, _)),
    _).

morethan3children(X) :-
  family(
    person(_, X, _, _),
    _,
    [_, _, _|_]).

richwife(X) :-
  family(
    person(_, X, _, works(_, Sarary1)),
    person(_, X, _, works(_, Sarary2)),
    _),
  Sarary1 < Sarary2.

