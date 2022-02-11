array [1..4] of var 0..9: n;
var 0..200: x;
var 2000..10000: n3 = n[1] * 10^3 + n[2] * 10^2 + n[3] * 10 + n[4];


constraint x^3 = n3;


%104976
%5832