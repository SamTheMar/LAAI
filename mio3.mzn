/* array[1..2, 1..24] of int: index =
  [| 1, 1, 1, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 5,
   | 7, 8, 9, 7, 8, 9, 1, 2, 3, 4, 5, 6, 7, 8, 9, 5, 6, 7, 8, 5, 6, 7, 8, 9 |];
   
array[1..24] of var 1..10: result;
array[1..10] of var 1..24: start;
array[1..10] of var 1..24: end;


%constraint forall(i in 1..24, j in 1..10)(result[i] == j -> edge[j] = i);


constraint forall(i in 1..24)(if forall(j in 0..i-1)(result[j] != result[i]) then start[result[i]] = i endif);
constraint forall(i in 1..24)(if forall(j in i+1..24)(result[j] != result[i]) then end[result[i]] = i endif );

%constraint forall(i in 1..10)( abs(index[1, start[i]] - index[1, end[i]] + 1) * abs(index[2, start[i]] - index[2, end[i]] + 1) = count(result, i));

solve satisfy; */

int: rows = 5;
int: cols = 9;

array[1..45] of int: cardboard =
  [0, 0, 0, 0, 0, 0, 1, 1, 1,
   0, 0, 0, 0, 0, 0, 1, 1, 1, 
   1, 1, 1, 1, 1, 1, 1, 1, 1,
   0, 0, 0, 0, 1, 1, 1, 1, 0, 
   0, 0, 0, 0, 1, 1, 1, 1, 1];

array[0..7,1..2] of var 0..45: pos;

array[0..44] of var 0..7: matrix;

constraint forall(i in 0..44)
             (if cardboard[i+1] == 0 
              then matrix[i]==0   
              else matrix[i]!=0 
              endif);

%constraint forall(i in 0..44)(if forall(j in 0..i-1)(matrix[j]!=matrix[i]) then pos[matrix[i],1]=i endif);
constraint forall(i in 0..44)
             (forall(j in 0..i-1)
               (matrix[j] != matrix[i]) -> pos[matrix[i],1] = i);
%constraint forall(i in 0..44)(if forall(j in i+1..(rows*cols)-1)(matrix[j]!=matrix[i]) then pos[matrix[i],2]=i endif );
constraint forall(i in 0..44)
             (forall(j in i+1..44)
               (matrix[j] != matrix[i]) -> pos[matrix[i],2] = i);

constraint forall(i in 1..7)
           ((pos[i,2] mod 9 - pos[i,1] mod 9 + 1)*(pos[i,2] div 9 - pos[i,1] div 9 + 1) = count(matrix,i));

constraint forall(i in 0..44)
            (if matrix[i]!=0 
             then   i div 9 >= pos[matrix[i],1] div 9 /\ 
                    i div 9 <= pos[matrix[i],2] div 9 /\ 
                    i mod 9 >= pos[matrix[i],1] mod 9 /\ 
                    i mod 9 <= pos[matrix[i],2] mod 9 
             endif);

solve minimize max(matrix);
%output ["path: \(max)\n"];


/*
constraint forall(i in 6..8)(matrix[i]!=0);
constraint forall(i in 9..14)(matrix[i]==0);
constraint forall(i in 15..26)(matrix[i]!=0);
constraint forall(i in 27..30)(matrix[i]==0);
constraint forall(i in 31..34)(matrix[i]!=0);
constraint forall(i in 35..39)(matrix[i]==0);
constraint forall(i in 40..44)(matrix[i]!=0);
*/



/*
0, 0, 0, 0, 0, 0, 3, 3, 3,
0, 0, 0, 0, 0, 0, 3, 3, 3, 
2, 2, 2, 2, 2, 2, 2, 2, 2, 
0, 0, 0, 0, 4, 4, 4, 4, 0, 
0, 0, 0, 0, 1, 1, 1, 1, 1

[0, 0, 0, 0, 0, 0, 1, 1, 1, 
 0, 0, 0, 0, 0, 0, 1, 1, 1,
 3, 3, 3, 3, 3, 3, 1, 1, 1, 
 0, 0, 0, 0, 4, 4, 4, 4, 0, 
 0, 0, 0, 0, 2, 2, 2, 2, 2]
 
 0, 0, 0, 0, 0, 0, 1, 1, 1,
 0, 0, 0, 0, 0, 0, 1, 1, 1, 
 2, 2, 2, 2, 2, 2, 1, 1, 1, 
 0, 0, 0, 0, 3, 3, 3, 3, 0, 
 0, 0, 0, 0, 3, 3, 3, 3, 4






include "globals.mzn";

array[1..45] of int: cardboard = [0, 0, 0, 0, 0, 0, 1, 1, 1,
                                  0, 0, 0, 0, 0, 0, 1, 1, 1, 
                                  1, 1, 1, 1, 1, 1, 1, 1, 1,
                                  0, 0, 0, 0, 1, 1, 1, 1, 0, 
                                  0, 0, 0, 0, 1, 1, 1, 1, 1];

array[1..25] of var int: occurrences = global_cardinality(matrix, [i | i in 0..24]);
array[0..24,1..2] of var 0..45: position;
array[0..44] of var 0..24: matrix;

constraint forall(i in 0..44)
             (if cardboard[i+1] == 0 
              then matrix[i]==0   
              else matrix[i]!=0 
              endif);
              
constraint forall(i in 0..44)
             (forall(j in 0..i-1)
               (matrix[j] != matrix[i]) -> position[matrix[i],1] = i);
               
constraint forall(i in 0..44)
             (forall(j in i+1..44)
               (matrix[j] != matrix[i]) -> position[matrix[i],2] = i);
               
constraint forall(i in 1..24)
           ((position[i,2] mod 9 - position[i,1] mod 9 + 1)*(position[i,2] div 9 - position[i,1] div 9 + 1) = count(matrix,i));
           
constraint forall(i in 0..44)
            (if matrix[i]!=0 
             then i div 9 >= position[matrix[i],1] div 9 /\ 
                  i div 9 <= position[matrix[i],2] div 9 /\ 
                  i mod 9 >= position[matrix[i],1] mod 9 /\ 
                  i mod 9 <= position[matrix[i],2] mod 9 
             endif);
             
var int: num_diff = count(el in occurrences)(el > 0);
solve minimize num_diff;
*/