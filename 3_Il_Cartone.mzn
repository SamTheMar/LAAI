/*

Cardboard representation

     0  1  2  3  4  5  6  7  8 

0    0  1  2  3  4  5  6  7  8  
1    9 10 11 12 13 14 15 16 17 
2   18 19 20 21 22 23 24 25 26
3   27 28 29 30 31 32 33 34 35
4   36 37 38 39 40 41 42 43 44

*/

%mask
array[1..45] of int: cardboard = [0, 0, 0, 0, 0, 0, 1, 1, 1,
                                  0, 0, 0, 0, 0, 0, 1, 1, 1, 
                                  1, 1, 1, 1, 1, 1, 1, 1, 1,
                                  0, 0, 0, 0, 1, 1, 1, 1, 0, 
                                  0, 0, 0, 0, 1, 1, 1, 1, 1];

%represent the splitting
array[0..44] of var 0..24: split;
%starting vertex index of all possible rectangle/square
array[0..24] of var 0..44: start;
%ending vertex index of all possible rectangle/square
array[0..24] of var 0..44: end;


%applay the mask to split
constraint forall(i in 0..44)
             (if cardboard[i+1] == 0 
              then split[i]=0   
              else split[i]!=0 
              endif);

%set the starting and ending index
constraint forall(i in 0..44)
             (forall(j in 0..i-1)
               (split[j] != split[i]) -> start[split[i]] = i);
constraint forall(i in 0..44)
             (forall(j in i+1..44)
               (split[j] != split[i]) -> end[split[i]] = i);

%impose that the figure create are rectangle or square 
constraint forall(i in 1..24)
           ((end[i] mod 9 - start[i] mod 9 + 1)*(end[i] div 9 - start[i] div 9 + 1) = count(split,i));

%impose that all rectangle/square don't overlap
constraint forall(i in 0..44)
            (if split[i]!=0 
             then i div 9 >= start[split[i]] div 9  /\ 
                  i div 9 <= end[split[i]] div 9    /\ 
                  i mod 9 >= start[split[i]] mod 9  /\ 
                  i mod 9 <= end[split[i]] mod 9 
             endif);

%count the max number in the split that is the number of split
var int: number = max(split);
solve minimize number;

output ["number of shape: \(number)\n"];
output ["\(split)\n"];

