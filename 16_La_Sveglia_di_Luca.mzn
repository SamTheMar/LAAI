include "globals.mzn";

array[1..6] of var 0..5: x; 
  
constraint x[1]<3;  
constraint x[2]<4;  
constraint all_different(x);

solve satisfy;