int: side_cube_small = 10;
int: side_cube_big = 20;
var 1..10: x;

constraint x * side_cube_small^3 = side_cube_big^3;

solve satisfy;