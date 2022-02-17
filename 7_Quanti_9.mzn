%variable of 2 digits
var 10..99: x;

%all moltiplication contein at least one 9
constraint forall(j in 1..11) 
             ((((x*j) div 100) = 9) \/ 
             ((((x*j) mod 100) div 10) = 9) \/ 
              (((x*j) mod 10) = 9));

solve satisfy;

output ["The number is: \(x)\n"];