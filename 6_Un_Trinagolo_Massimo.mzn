include "all_different.mzn";

var 1..100: l1;
var 1..100: l2;
var 1..100: l3;

array[1..9] of var 1..9: triangle;

constraint alldifferent(triangle);

constraint triangle[1] + triangle[2] + triangle[4] + triangle[6] = l1;
constraint triangle[1] + triangle[3] + triangle[5] + triangle[9] = l2;
constraint triangle[6] + triangle[7] + triangle[8] + triangle[9] = l3;

var int: total_sum= l1 + l2 +l3;
solve maximize total_sum;

output ["The sum is: \(total_sum)\n"];