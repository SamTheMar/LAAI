/*
Debora, dopo avere cancellato tutti i nove numeri 
(vedi quesito precedente), lancia una sfida ad 
Alessandro: “Scrivi i nove numeri, uno in ogni 
casella, in modo che la somma delle tre somme 
dei numeri che compaiono sullo stesso lato del 
triangolo sia la massima possibile”.
Quanto vale tale somma?
*/

include "all_different.mzn";

set of int: POSSIBLEVALUE = 1..9;

var 1..100: l1;
var 1..100: l2;
var 1..100: l3;

var POSSIBLEVALUE: t1;
var POSSIBLEVALUE: t2;
var POSSIBLEVALUE: t3;
var POSSIBLEVALUE: t4;
var POSSIBLEVALUE: t5;
var POSSIBLEVALUE: t6;
var POSSIBLEVALUE: t7;
var POSSIBLEVALUE: t8;
var POSSIBLEVALUE: t9;

array[1..9] of var int: triangle = [t1,t2,t3,t4,t5,t6,t7,t8,t9];

constraint alldifferent(triangle);

constraint t1 + t2 + t4 + t6 = l1;
constraint t1 + t3 + t5 + t9 = l2;
constraint t6 + t7 + t8 + t9 = l3;

solve maximize l1 + l2 +l3;

output ["The sum is: \(l1+l2+l3)\n"];