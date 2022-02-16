include "all_different.mzn";

array[1..4] of var 0..9: x;

constraint all_different(x); 
constraint (x[1] + x[3]) - (x[2] + x[4]) mod 11 = 0;
constraint x[1] >1;
constraint forall(el in x) (el mod 2 = 0); 

var int: total_sum= sum(i in 1..4) (10^(4-i)*x[i]);
solve minimize total_sum;

output ["number: \(total_sum)\n"];