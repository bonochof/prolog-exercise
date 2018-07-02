/*
  member.pl
  Ryosuke Takata
*/

member(X, [X| Tail]).
member(X, [Head| Tail]) :- member(X, Tail).

