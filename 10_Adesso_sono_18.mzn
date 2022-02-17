%total number of white squares 
int: nWhite = 18;

%number of white squares at the top, bottom, right and left respectively
var 3..9: nUp;
var 3..9: nDown;
var 3..9: nRigth;
var 3..9: nLeft;

%the white squares make a rectangle
constraint nUp == nDown;
constraint nRigth == nLeft;
%the perimeter of the rectangle must be the number of white squares
constraint nUp + nDown + nRigth + nLeft - 4 = nWhite;

%total number of gray squares
var int: nGray = (nUp-2) * (nRigth-2);
solve maximize nGray;

output ["Number of gray squares: \(nGray)\n"];