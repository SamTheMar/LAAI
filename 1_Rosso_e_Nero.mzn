int: red1=12; 
int: red=26;
int: black=26;

var 0..26: black1; 
var 0..26: red2; 
var 0..26: black2; 

constraint 25-red1=black1;
constraint red-red1=red2;
constraint 27-red2=black2; 

solve satisfy;


