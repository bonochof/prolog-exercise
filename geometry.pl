/*
  geometry.pl
  Ryosuke Takata
*/

%%% object %%%

point(1, 1).
point(1, 5).
point(3, 3).
point(4, 4).

% define line segment
seg(point(X1, Y1), point(X2, Y2)).

% define triangle
triangle(point(X1, Y1), point(X2, Y2), point(X3, Y3)).

% define rectangle
rectangle(point(X, Y), Width, Height, Angle).

% define square
square(point(X, Y), Length, Angle).

% define circle
circle(point(X, Y), R).

% inference vertical
vertical(seg(point(X, Y1), point(X, Y2))).

% inference horizontal
horizontal(seg(point(X1, Y), point(X2, Y))).

% inference horizontal base
regular(point(X1, Y1), point(X2, Y1), point(X2, Y2), point(X1, Y2)).

