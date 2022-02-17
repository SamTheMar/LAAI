%array rapresentation of the number
array[1..4] of var 0..9: number;
%array rapresentation of the ninth number
array[1..3] of var 0..9: ninth;

%number from array to int
var 1000..9999: n1 = sum(i in 1..4) (number[i]*10^(4-i));
%ninth from number array to int
var 0..999: n2 = sum(i in 1..3) (ninth[i]*10^(3-i));

%number must contein 0 in the last 3 digits
constraint number[2] = 0 \/ number[3] = 0 \/ number[4] = 0;

%remove the 0 digit
constraint number[2] == 0 -> (ninth[1] = number[1] /\ 
                              ninth[2] = number[3] /\ 
                              ninth[3] = number[4]);           
constraint number[3] == 0 -> (ninth[1] = number[1] /\ 
                              ninth[2] = number[2] /\ 
                              ninth[3] = number[4]);
constraint number[4] == 0 -> (ninth[1] = number[1] /\  
                              ninth[2] = number[2] /\ 
                              ninth[3] = number[3]);
                              
constraint (n1/9) = n2;

solve minimize n1;

output ["number: \(n1)\n"];