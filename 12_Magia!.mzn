var 10..99: nStart;
var 10..99: nEnd = nStart * 4 - 3;

constraint nEnd mod 10 == nStart div 10;
constraint nEnd div 10 == nStart mod 10;

output ["The start number is: \(nStart)\n"];

