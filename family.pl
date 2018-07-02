/*
  family.pl
  Ryosuke Takata
*/

%%% object %%%

parent(pan, bob).
parent(tom, bob).
parent(tom, liz).
parent(bob, ann).
parent(bob, pat).
parent(pat, jim).

female(pan).
male(tom).
male(bob).
female(liz).
female(pat).
female(ann).
male(jim).

%%% relation %%%

offspring(X, Y) :- parent(Y, X).

mother(X) :- parent(X, Y), female(X).

grandparent(X, Y) :- parent(X, Z), parent(Z, Y).

syster(X, Y) :- parent(Z, X), parent(Z, Y), female(X).

predecessor(X, Z) :- parent(X, Z).
predecessor(X, Z) :- parent(X, Y), predecessor(Y, Z).

