%number of red card in first deck
int: red1 = 12; 
%total number of red card
int: red = 26;

%variable of black card in first deck
var 0..26: black1; 
%variable of red card in second deck
var 0..26: red2; 
%variable of black card in second deck
var 0..26: black2; 

constraint black1 = 25 - red1;
constraint red2 = red - red1;
constraint black2 = 27 - red2; 

solve satisfy;

output ["The number of black card in second deck is: \(black2)\n"];


