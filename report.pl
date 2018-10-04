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
del(H, [H|T], T).
del(X, [H|T], [H|Ans]) :-
  del(X, T, Ans).
 
% (3) flatten(L, Flatlist).
%     ex) flatten([[a], b, [], [c, [d]]], [a, b, c, d]). -> yes
flatten([H|T], Flatlist) :-
  flatten(H, AnsH),
  flatten(T, AnsT),
  conc(AnsH, AnsT, Flatlist),
  !.
flatten([], []).
flatten(X, [X]).

% (4) rotate_right(L1, L2).
%     ex) rotate_right([a, b, c, d], [d, a, b, c]). -> yes
rotate_right(L1, [L2Head| L2Tail]) :-
  conc(L2Tail, [L2Head], L1).

% (5) insert(X, L, L2).
%     ex) insert(new, [a, b, c], [new, a, b, c]). -> yes
%         insert(new, [a, b, c], [a, new, b, c]). -> yes
%         insert(new, [a, b, c], [a, b, new, c]). -> yes
%         insert(new, [a, b, c], [a, b, c, new]). -> yes
insert(X, L, [X|L]).
insert(X, [H|T], [H|L]) :-
  insert(X, T, L).

% (6) sublist(L1, L2).
%     ex) sublist([a, b, c, d], [b, c]). -> yes
%         sublist([a, b, c, d], []). -> yes
%         sublist([a, b, c, d], [b, d]). -> no
sublist(_, []).
sublist([H1|T1], [H2|T2]) :-
  H1 = H2,
  conc([H2|T2], _, [H1|T1]),
  sublist(T1, T2);
  sublist(T1, [H2|T2]).

/*
sublist([H|T], L) :-
  subsublist([H|T], L);
  sublist(T, L).
subsublist(_, []).
subsublist([H|T1], [H|T2]) :-
  subsublist(T1, T2).
*/

% (7) subset(Set, Subset).
%     ex) subset([a, b, c], S).
%         -> S=[a,b,c]; [b,c]; [a,c]; [a,b]; [a]; [b]; [c]; []
subset(_, []).
subset([H1|T1], [H2|T2]) :-
  H1 = H2,
  subset(T1, T2);
  subset(T1, [H2|T2]).

/*
subset(_, []).
subset([H|T1], [H|T2]) :- subset(T1, T2).
subset([H|T1], L) :- subset(T1, L).
*/

% (8) reverse(L1, L2).
%     ex) reverse([a, b, c, d], [d, c, b, a]). -> yes
reverse([], []).
reverse([H|T], L) :-
  reverse(T, RvsT),
  conc(RvsT, [H], L).

% (9) max-num(L1, N).
%     ex) max-num([4, 5, 2, 1], 5). -> yes
max-num([X], X).
max-num([H|T], N) :-
  max-num(T, MaxT),
  ((H > MaxT, N is H);
  (H =< MaxT, N is MaxT)).

% (10) total-num(L1, N).
%      ex) total-num([4, 5, 2, 1], 12). -> yes
total-num([X], X).
total-num([H|T], N) :-
  total-num(T, SumT),
  N is SumT + H.

% (11) list-ave(L1, N).
%      ex) list-ave([1, 4, 4], 3). -> yes
list-ave(L1, N) :-
  total-num(L1, Sum),
  length(L1, Len),
  N is Sum / Len.

% (12) kaibun(List).
%      ex) kaibun([a, b, c]). -> no
%          kaibun([ta, ke, ya, bu, ya, ke, ta]). -> yes
kaibun(List) :-
  reverse(List, RvsList),
  List = RvsList.

% (13) assoc-pro(Key, Alist, Result).
%      ex) assoc-pro(b, [[a, x], [b, y], [c, z]], [b, y]). -> yes
assoc-pro(Key, [[Key|T]|_], [Key|T]).
assoc-pro(Key, [_|T], Result) :-
  assoc-pro(Key, T, Result).

% (14) translate(L1, L2).
%      ex) translate([dog, cat, monkey], [inu, neko, saru]). -> yes
means(dog, inu).
means(cat, neko).
means(monkey, saru).
translate([], []).
translate([H1|T1], [H2|T2]) :-
  translate(T1, T2),
  means(H1, H2).

