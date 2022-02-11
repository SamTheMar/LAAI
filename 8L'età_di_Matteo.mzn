array[1..4] of var 0..9: x;
var 0..100:sum;
var 0..100:age;
constraint sum= x[1]+x[2]+x[3]+x[4]; 
constraint age=x[4]+x[3]*10;
constraint x[1]=2; 
constraint x[2]=0;
constraint sum=age/5; 
solve maximize sum


