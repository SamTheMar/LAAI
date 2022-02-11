/*
“Devo tagliare l’erba del giardino e sono ben 2021 
m2
! Non ce la faccio!”. Così si lamenta Renato con 
il suo capo. “Non fare il furbo: nel sentiero 
(segnato in bianco in figura), non c’è erba”, gli 
risponde il capo, “e i m2 del giardino dove tagliare 
l’erba sono perciò molti meno”.

Considerando che l’intero giardino ha la forma di 
un rettangolo con i lati che misurano un numero 
intero di metri, ognuno maggiore di 10, e sapendo 
che i lati opposti congiunti dal sentiero sono più 
lunghi degli altri due, quanti metri quadrati 
d’erba deve effettivamente tagliare Renato?
*/

int: squareMeters = 2021;
var 0..2021: totalSquareMeters;

var 11..100: lUp;
var 11..100: lDown;
var 11..100: lRigth;
var 11..100: lLeft;

constraint lUp > lRigth;
constraint lUp > lLeft;
constraint lDown > lRigth;
constraint lDown > lLeft;
constraint lUp = lDown;
constraint lRigth = lLeft;
constraint lUp * lRigth = squareMeters;

constraint totalSquareMeters = squareMeters - (5 * lRigth);

output ["total= \(totalSquareMeters)\n"];