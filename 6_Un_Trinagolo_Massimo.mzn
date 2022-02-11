include "all_different.mzn";

set of int: POSSIBLEVALUE = 1..9;

var 1..100: l1;
var 1..100: l2;
var 1..100: l3;

var POSSIBLEVALUE: t1;
var POSSIBLEVALUE: t2;
var POSSIBLEVALUE: t3;
var POSSIBLEVALUE: t4;
var POSSIBLEVALUE: t5;
var POSSIBLEVALUE: t6;
var POSSIBLEVALUE: t7;
var POSSIBLEVALUE: t8;
var POSSIBLEVALUE: t9;

array[1..9] of var int: triangle = [t1,t2,t3,t4,t5,t6,t7,t8,t9];

constraint alldifferent(triangle);

constraint t1 + t2 + t4 + t6 = l1;
constraint t1 + t3 + t5 + t9 = l2;
constraint t6 + t7 + t8 + t9 = l3;

var int: total_sum= l1 + l2 +l3;
solve maximize total_sum;

output ["The sum is: \(total_sum)\n"];