array[1..4] of var 0..9: x;

var 2000..2150: year = x[1]*10^3 + x[2]*10^2 + x[3]*10 + x[4];
var 0..36: sum = x[1]+x[2]+x[3]+x[4];
var 0..100: age = year - 2000;

constraint sum=age/5;

solve satisfy;


