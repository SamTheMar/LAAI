/*
10. Adesso sono 18!
Disponendo di 14 quadratini bianchi lungo tutto il 
perimetro di un rettangolo, si possono 
“accerchiare” 4 oppure 6 quadratini grigi (come si 
vede in figura).
Liliana ha ben 18 quadratini bianchi da disporre 
lungo il perimetro di un rettangolo di opportune 
dimensioni.

Quanti quadratini grigi può “accerchiare” al 
massimo Liliana?
*/

int: nWhite = 18;

var 0..9: nUp;
var 0..9: nDown;
var 0..9: nRigth;
var 0..9: nLeft;

constraint nUp + nDown + nRigth + nLeft - 4 = nWhite;
constraint nUp == nDown;
constraint nRigth == nLeft;
constraint nRigth >= 3;
constraint nLeft >= 3;
constraint nUp >= 3;
constraint nDown >= 3;

solve maximize (nUp-2) * (nRigth-2);

output ["Number of gray squares: \((nUp-2) * (nRigth-2))\n"];