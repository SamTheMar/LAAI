include "all_different.mzn";

array[1..16] of var 2..19: path;

constraint path[1] = 2;
constraint forall (i in 2..length(path)-1) (path[i] == 15 -> path[i+1] = 15);
constraint forall (i in 1..length(path)-1)
           (if path[i] != 15 then path[i+1] = path[i]+5 \/ path[i+1] = path[i]-5 \/ path[i+1] = path[i]-1 \/ path[i+1] = path[i]+1 endif);           
constraint forall(j in 2..length(path)) (path[j] != 5 /\ path[j] != 16);
constraint forall(i in 2..length(path)-1)((path[i]==10 -> path[i+1] != 11) /\ (path[i]==11 -> path[i+1] != 10)); % vedi giù
constraint forall(i in 1..length(path))(path[i] != 15 -> count(path, path[i], 1));

var int: distance = (length(path) - count(path,15)) * 10;
solve maximize distance;
output ["\(distance)\n"];


%constraint forall(i in 2..length(path))(path[i] mod cols == 1 -> path[i] != path[i-1]+1);
%constraint forall(i in 2..length(path))(path[i] mod cols == 0 -> path[i] != path[i-1]-1);