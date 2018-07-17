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
% (1) halflist(L1, L2, L3).
%     ex) halflist([a, b, c, d, e], [a, b], [c, d, e]). -> yes
halflist(L1, L2, L3) :-
  conc(L2, L3, L1),
  length(L2, N2),
  length(L3, N3),
  (N3 is N2; N3 is N2 + 1).

% (2) del(X, L, L1).
%     ex) del(a, [a, b, a], [a, b]). -> yes
%         del(a, [a, b, a], [b, a]). -> yes
del(X, L, L1) :-
  conc([X], L1, L);
  conc(L1, [X], L).
  
% (3) flatten(L, Flatlist).
%     ex) flatten([[a], b, [], [c, [d]]], [a, b, c, d]). -> yes
flatten(L, Flatlist).

% (4) rotate_right(L1, L2).
%     ex) rotate_right([a, b, c, d], [d, a, b, c]). -> yes
rotate_right(L1, [L2Head| L2Tail]) :-
  conc(L2Tail, [L2Head], L1).

