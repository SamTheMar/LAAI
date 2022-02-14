int: rows = 5;
int: cols = 11;

array[0..7,1..2] of var 0..54: pos;

array[0..(rows*cols)-1] of var 0..7: matrix;

constraint forall(i in 0..54)(if forall(j in 0..i-1)(matrix[j]!=matrix[i]) then pos[matrix[i],1]=i endif);
constraint forall(i in 0..54)(if forall(j in i+1..(rows*cols)-1)(matrix[j]!=matrix[i]) then pos[matrix[i],2]=i endif );
constraint forall(i in 1..7)((pos[i,2] mod 11 - pos[i,1] mod 11 + 1)*(pos[i,2] div 11 - pos[i,1] div 11 + 1) = count(matrix,i));

constraint forall(i in 0..54)(if matrix[i]!=0 then i div 11 >= pos[matrix[i],1] div 11 /\ i div 11 <= pos[matrix[i],2] div 11 /\ i mod 11 >= pos[matrix[i],1] mod 11 /\ i mod 11 <= pos[matrix[i],2] mod 11 endif);

constraint forall(i in 0..6)(matrix[i]==0);
constraint forall(i in 7..10)(matrix[i]!=0);
constraint forall(i in 11..17)(matrix[i]==0);
constraint forall(i in 18..32)(matrix[i]!=0);
constraint forall(i in 33..37)(matrix[i]==0);
constraint forall(i in 38..42)(matrix[i]!=0);
constraint forall(i in 43..48)(matrix[i]==0);
constraint forall(i in 49..54)(matrix[i]!=0);


solve satisfy;
