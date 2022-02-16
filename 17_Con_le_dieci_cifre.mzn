var 0..100: x;

array [1..16] of var 0..9: power;

var int: n3 = sum(i in 0..7) (power[i+1]*10^i);
var int: n4 = sum(i in 0..7) (power[i+9]*10^i);

constraint x^3 = n3;
constraint x^4 = n4;
constraint forall(i in 0..9) (count(power, i) > 0);

solve satisfy;

output ["x: \(x)\n"];