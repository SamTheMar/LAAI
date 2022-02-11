var 2..30: s;
var 2..30: v;

constraint s = 5 + v;

solve maximize v;

% S = F + V - 2