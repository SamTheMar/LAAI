/*
Desiderio considera i primi undici multipli di un 
numero intero di due cifre: il numero stesso, il 
numero moltiplicato per 2, il numero moltiplicato 
per 3, ..., fino al numero moltiplicato per 11. A 
questo punto si accorge che tutti questi undici 
multipli contengono almeno una cifra 9.
Qual era il numero di partenza?
*/

var 10..99: x;

constraint forall(j in 1..11) ((((x*j) div 100) = 9) \/ ((((x*j) mod 100) div 10) = 9) \/ (((x*j) mod 10) = 9));

solve satisfy;
