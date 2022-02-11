include "globals.mzn";

array [1..4, 1..5] of int: dist =[|0, 1, 1, 1, 0
                                  |1, 1, 1, 1, 1
                                  |1, 1, 1, 1, 1
                                  |0, 1, 1, 1, 0|];
int: start = 1;
int: end = 16;
array[1..4, 1..5] of var 0..1: point;
array[1..16] of var 0..1: p;

constraint point[1,2] = 1;
constraint point[3,5] = 1;
constraint point[1,1] = 0 /\ point[1,5] = 0 /\ point[4,1] = 0 /\ point [4,5] = 0;

constraint all_different(p);
constraint p[start] = 1;
constraint p[end] = 1;
constraint p[] = 1 -> p[i] = 1;
%constraint point[i, j] = point

var int: total_point = sum(point);
solve maximize total_point;

