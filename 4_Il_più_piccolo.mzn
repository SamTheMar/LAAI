include "all_different.mzn";

%array represenation of the number
array[1..4] of var 0..9: x;

constraint all_different(x);
%the number is divisible for 11
constraint (x[1] + x[3]) - (x[2] + x[4]) mod 11 = 0;
constraint x[1] > 1;
%all digit are even
constraint forall(el in x) (el mod 2 == 0); 

%transform the array to the real number
var int: number= sum(i in 1..4) (10^(4-i)*x[i]);
solve minimize number;

output ["number: \(number)\n"];