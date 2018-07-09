/*
  last.pl
  Ryosuke Takata
*/

last(Data, [Data]).
last(Data, [H|T]) :- last(Data, T).

