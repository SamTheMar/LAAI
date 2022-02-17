%side of small cube
int: cube_s = 10;
%side of big cube
int: cube_b = 20;
var 1..10: x;

%times that small cub is conteined in big cube
constraint x * cube_s^3 = cube_b^3;

solve satisfy;