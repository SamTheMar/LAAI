include "all_different.mzn";

%sides
var 1..30: l1;
var 1..30: l2;
var 1..30: l3;

%trinagle array
array[1..9] of var 1..9: triangle;

constraint alldifferent(triangle);

%sum of each side
constraint triangle[1] + triangle[2] + triangle[4] + triangle[6] = l1;
constraint triangle[1] + triangle[3] + triangle[5] + triangle[9] = l2;
constraint triangle[6] + triangle[7] + triangle[8] + triangle[9] = l3;

%sum of all sides
var int: totalsum= l1 + l2 +l3;
solve maximize totalsum;

output ["The sum is: \(totalsum)\n"];