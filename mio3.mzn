array[1..2, 1..24] of int: index =
  [| 1, 1, 1, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 5,
   | 7, 8, 9, 7, 8, 9, 1, 2, 3, 4, 5, 6, 7, 8, 9, 5, 6, 7, 8, 5, 6, 7, 8, 9 |];
   
array[1..24] of var 1..10: result;
array[1..10] of var 1..24: start;
array[1..10] of var 1..24: end;


%constraint forall(i in 1..24, j in 1..10)(result[i] == j -> edge[j] = i);


constraint forall(i in 1..24)(if forall(j in 0..i-1)(result[j] != result[i]) then start[result[i]] = i endif);
constraint forall(i in 1..24)(if forall(j in i+1..24)(result[j] != result[i]) then end[result[i]] = i endif );

%constraint forall(i in 1..10)( abs(index[1, start[i]] - index[1, end[i]] + 1) * abs(index[2, start[i]] - index[2, end[i]] + 1) = count(result, i));

solve satisfy;