array[1..4] of var 0..9: n;
array[1..3] of var 0..9: nono;

var 1000..9999: n1 = (n[1] * 10^3 + n[2] * 10^2 + n[3] * 10 + n[4]);
var 0..999: n2 = (nono[1] * 10^2 + nono[2] * 10 + nono[3]);

constraint n[2] = 0 \/ n[3] = 0 \/ n[4] = 0;
constraint n[2] == 0 -> (nono[1] = n[1] /\ nono[2] = n[3] /\ nono[3] = n[4]);
constraint n[3] == 0 -> (nono[1] = n[1] /\ nono[2] = n[2] /\ nono[3] = n[4]);
constraint n[4] == 0 -> (nono[1] = n[1] /\ nono[2] = n[2] /\ nono[3] = n[3]);
constraint (n1/9) = n2;

solve minimize n1;

output ["number: \(n1)\n"];