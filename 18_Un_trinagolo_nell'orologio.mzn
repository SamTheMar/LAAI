array[1..3] of var 0..720: time;

var 0..719: hour = time[1];
var 0..15: minute = time[2];
var 0..59: second = time[3];
   
constraint hour = minute * 60;
constraint minute - hour / 60 = 20;
constraint second - minute = 20;

solve satisfy;

%ciclico di pi-mezzi
