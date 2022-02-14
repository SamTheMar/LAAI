/*
Trinagle representation

    1  
   2 3  
  4   5
 6 7 8 9

*/
include "all_different.mzn";

array[1..9] of var 1..9: triangle;

constraint alldifferent(triangle);

constraint triangle[1] = 1 /\ triangle[2] = 7 /\ triangle[3] = 8 /\ triangle[7] = 4 /\ triangle[9] = 5;
constraint triangle[1] + triangle[3] + triangle[5] + triangle[9] = 20;
constraint triangle[1] + triangle[2] + triangle[4] + triangle[6] = 20;
constraint triangle[6] + triangle[7] + triangle[8] + triangle[9] = 20;

solve satisfy;

output ["Debora wrote in the box of the lower left vertex the number: \(triangle[6])\n"];