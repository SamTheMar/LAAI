int: side_cube_small = 10;
int: side_cube_big = 20;
var 1..10: x;

constraint x * 10^3 = 20^3;

solve satisfy;