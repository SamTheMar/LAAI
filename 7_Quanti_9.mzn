var 10..99: x;

constraint forall(j in 1..11) ((((x*j) div 100) = 9) \/ ((((x*j) mod 100) div 10) = 9) \/ (((x*j) mod 10) = 9));

solve satisfy;
