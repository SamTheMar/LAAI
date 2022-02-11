include "all_different.mzn";

set of int: POSSIBLEVALUE = 1..9;

int: t1 = 1;
int: t2 = 7;
int: t3 = 8;
int: t7 = 4;
int: t9 = 5;

var POSSIBLEVALUE: t4;
var POSSIBLEVALUE: t5;
var POSSIBLEVALUE: t6;
var POSSIBLEVALUE: t8;

array[1..9] of var int: triangle = [t1,t2,t3,t4,t5,t6,t7,t8,t9];

constraint alldifferent(triangle);

constraint t1 + t3 + t5 + t9 = 20;
constraint t1 + t2 + t4 + t6 = 20;
constraint t6 + t7 + t8 + t9 = 20;

solve satisfy;

output ["Debora wrote in the box of the lower left vertex the number: \(t6)\n"];