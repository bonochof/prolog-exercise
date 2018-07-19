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
flatten(L, Flatlist).

% (4) rotate_right(L1, L2).
%     ex) rotate_right([a, b, c, d], [d, a, b, c]). -> yes
rotate_right(L1, [L2Head| L2Tail]) :-
  conc(L2Tail, [L2Head], L1).

% (5) insert(X, L, L2).
%     ex) insert(new, [a, b, c], [new, a, b, c]). -> yes
%         insert(new, [a, b, c], [a, new, b, c]). -> yes
%         insert(new, [a, b, c], [a, b, new, c]). -> yes
%         insert(new, [a, b, c], [a, b, c, new]). -> yes

% (6) sublist(L1, L2).
%     ex) sublist([a, b, c, d], [b, c]). -> yes
%         sublist([a, b, c, d], []). -> yes
%         sublist([a, b, c, d], [b, d]). -> no

% (7) subset(Set, Subset).
%     ex) subset([a, b, c], S).
%         -> S=[a,b,c]; [b,c]; [a,c]; [a,b]; [a]; [b]; [c]; []

% (8) reverse(L1, L2).
%     ex) reverse([a, b, c, d], [d, c, b, a]). -> yes

% (9) max-num(L1, N).
%     ex) max-num([4, 5, 2, 1], 5). -> yes

% (10) total-num(L1, N).
%      ex) total-num([4, 5, 2, 1], 12). -> yes

% (11) list-ave(L1, N).
%      ex) list-ave([1, 4, 4], 3). -> yes

% (12) kaibun(List).
%      ex) kaibun([a, b, c]). -> no
%          kaibun([ta, ke, ya, bu, ya, ke, ta]). -> yes

% (13) assoc-pro(Key, Alist, Result).
%      ex) assoc-pro(b, [[a, x], [b, y], [c, z]], [b, y]). -> yes

% (14) translate(L1, L2).
%      ex) translate([dog, cat, monkey], [inu, neko, saru]). -> yes
means(dog, inu).
means(cat, neko).
means(monkey, saru).

