%number
var 0..100: x;
%power conteins the digits of the initial number raised to the third in the first 9 
%positions and digits of the same number raised to the fourth in the following positions
array [1..16] of var 0..9: power;

%number raised to the third from array to int
var int: n3 = sum(i in 0..7) (power[i+1]*10^i);
%number raised to the fourth from array to int
var int: n4 = sum(i in 0..7) (power[i+9]*10^i);

constraint x^3 = n3;
constraint x^4 = n4;
%use all digits from 0 to 9
constraint forall(i in 0..9) (count(power, i) > 0);

solve satisfy;

output ["x: \(x)\n"];