%garden area
int: squareMeters = 2021;

%lawn area
var 100..2021: totalSquareMeters;
%side of the garden
var 11..100: lUp;
var 11..100: lDown;
var 11..100: lRigth;
var 11..100: lLeft;

constraint lUp > lRigth;
constraint lUp = lDown;
constraint lRigth = lLeft;
constraint lUp * lRigth = squareMeters;
constraint totalSquareMeters = squareMeters - (5 * lRigth);

output ["total= \(totalSquareMeters)\n"];