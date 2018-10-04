conc([], L2, L2).
conc([L1H|L1T], L2, [L1H|LoT]) :- conc(L1T, L2, LoT).

% 3-1 
separate(L3, [], L3).
separate([L1H|L1T], [L1H|L2T], L3) :- separate(L1T, L2T, L3).
% separate(L1, L2, L3) :- conc(L2, L3, L1).

% 3-2
reverse([], []).
%reverse([X], [X]).
%reverse([L1H|L1T], [L2H|L2T]) :- reverse(L1T, [L1T|
%reverse([L1H|L1T], [L2H|[L1H]]) :- reverse(L1T, [L2H|L2T]).
reverse([H|T], L) :- reverse(T, ReverseT), conc(ReverseT, [H], L).

% 3-3
rotate_left([], []).
rotate_left([X], [X]).
rotate_left([L1H|L1T], L2) :- conc(L1T, [L1H], L2).
