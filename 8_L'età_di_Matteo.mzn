%array rapresentation of year
array[1..4] of var 0..9: x;

%year array to int
var 2000..2150: year = sum(i in 1..4) (x[i]*10^(4-i));
%sum of year digits
var 0..36: sum = sum(x);
%age of Matteo
var 0..100: age = year - 2000;

constraint sum=age/5;

solve satisfy;

output ["The corret year is: \(year)\n"];


