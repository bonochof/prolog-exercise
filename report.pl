/*
  report.pl
  Ryosuke Takata
*/

%%% Base Predict %%%
conc([], L2, L2).
conc([L1Head| L1Tail], L2, [L1Head| LoutTail]) :-
  conc(L1Tail, L2, LoutTail).

length([], 0).
length([H|T], N) :-
  length(T, N1),
  N is 1 + N1.

% ex) halflist([a, b, c, d, e], [a, b], [c, d, e]). -> yes
halflist(L1, L2, L3) :-
  conc(L2, L3, L1).
