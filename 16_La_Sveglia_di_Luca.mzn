include "all_different.mzn";

%array rapresentation of time
array[1..6] of var 0..5: time;

%hour from array to int
var 0..23: hour = time[1]*10 + time[2];
%miute from array to int
var 0..59: minute = time[3]*10 + time[4];
%second from array to int
var 0..59: second = time[5]*10 + time[6];
   
constraint all_different(time);

solve satisfy;