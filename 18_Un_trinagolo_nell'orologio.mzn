%array rapresentation of time
array[1..3] of var 0..720: time;

%hour from array to int
var 0..719: hour = time[1];
%minute from array to int
var 0..15: minute = time[2];
%second from array to int
var 0..59: second = time[3];

%possible hand movements
constraint hour = minute * 60;

%equilateral triangle constraint
constraint minute - hour / 60 = 20;
constraint second - minute = 20;

solve satisfy;

%ciclico di pi-mezzi
