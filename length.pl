/*
  length.pl
  Ryosuke Takata
*/

length([], 0).
length([H|T], N) :-
  length(T, N1),
  N is 1 + N1.

