/*
  report.pl
  Ryosuke Takata
*/

%%% Base Predict %%%
conc([], L2, L2).
conc([L1Head| L1Tail], L2, [L1Head| LoutTail]) :-
  conc(L1Tail, L2, LoutTail).

/*
length([], 0).
length([H|T], N) :-
  length(T, N1),
  N is 1 + N1.
*/

%%% Report Predict %%%
% (1) halflist([a, b, c, d, e], [a, b], [c, d, e]). -> yes
halflist(L1, L2, L3) :-
  conc(L2, L3, L1),
  length(L2, N2),
  length(L3, N3),
  (N3 is N2; N3 is N2 + 1).

% (2) del(a, [a, b, a], [a, b]). -> yes
%     del(a, [a, b, a], [b, a]). -> yes
del(X, L, L1) :-
  conc([X], L1, L);
  conc(L1, [X], L).
  
