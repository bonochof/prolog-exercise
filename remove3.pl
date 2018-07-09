/*
  remove3.pl
  Ryosuke Takata
*/

conc([], L2, L2).
conc([L1Head| L1Tail], L2, [L1Head| LoutTail]) :-
  conc(L1Tail, L2, LoutTail).

remove3(L, L1) :-
  conc(L1, [_, _, _], L).

