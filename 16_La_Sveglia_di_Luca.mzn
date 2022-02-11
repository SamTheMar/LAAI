include "globals.mzn"; 

array[1..6] of var 0..5: time;

var 0..23: hour = time[1]*10 + time[2];
var 0..59: minute = time[3]*10 + time[4];
var 0..59: second = time[5]*10 + time[6];
   
constraint all_different(time);

solve satisfy;

% per ottener il risultato corretto: modificare il compilatore