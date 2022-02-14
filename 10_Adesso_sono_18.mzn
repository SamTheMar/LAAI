int: nWhite = 18;

var 3..9: nUp;
var 3..9: nDown;
var 3..9: nRigth;
var 3..9: nLeft;

constraint nUp + nDown + nRigth + nLeft - 4 = nWhite;
constraint nUp == nDown;
constraint nRigth == nLeft;

var int: nGray = (nUp-2) * (nRigth-2);
solve maximize nGray;

output ["Number of gray squares: \(nGray)\n"];