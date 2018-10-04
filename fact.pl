fact(0, 1).
fact(X, Sum) :-
  X > 0,
  X1 is X - 1,
  fact(X1, Sum1),
  Sum is X * Sum1.

