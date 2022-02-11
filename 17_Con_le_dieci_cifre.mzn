array [1..4] of var 0..9: n;
var 0..200: x;
var 2000..10000: n3 = n[1] * 10^3 + n[2] * 10^2 + n[3] * 10 + n[4];
array [1..6] of var 0..9: m;
var 2000..1000000: n4 = m[1] * 10^5 + m[2] * 10^4 + m[3] * 10^3 + m[4] * 10^2 + m[5] * 10 + m[6];

constraint x^3 = n3;
constraint x^4 = n4;
constraint sum(n) + sum(m) = 45;


%104976
%5832