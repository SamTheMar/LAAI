%start number
var 10..99: nStart;
%end number
var 10..99: nEnd;

constraint nEnd = nStart * 4 - 3;
%nStart is equal to nEnd digits reverse  
constraint nEnd mod 10 == nStart div 10;
constraint nEnd div 10 == nStart mod 10;

solve satisfy;

output ["The start number is: \(nStart)\n"];

