/*
Labyrinth representation

 1  2  3  4  5
 6  7  8  9 10
11 12 13 14 15
16 17 18 19 20

*/

array[1..16] of var 2..19: path;

constraint path[1] = 2;
constraint forall (i in 2..length(path)-1) (path[i] == 15 -> path[i+1] = 15);
constraint forall(i in 1..length(path)) (path[i] != 15 -> count(path, path[i], 1));             
constraint count(path, 15) > 0;

constraint forall (i in 1..length(path)-1)
             (if path[i] != 15 
              then path[i+1] = path[i]+5 \/ 
                   path[i+1] = path[i]-5 \/ 
                   path[i+1] = path[i]-1 \/
                   path[i+1] = path[i]+1 
              endif);  
                       
constraint forall(i in 2..length(path)) (path[i] != 5 /\ path[i] != 16);
             
constraint forall(i in 2..length(path)-1) ((path[i]==10 -> path[i+1] != 11) /\ 
                                           (path[i]==11 -> path[i+1] != 10));

var int: distance = (length(path) - count(path,15)) * 10;
solve maximize distance;

output ["distance: \(distance)\n"];
output ["path: \(path)\n"];