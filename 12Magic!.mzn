/*
Carla prende un numero (intero positivo) di due 
cifre, lo moltiplica per 4 e poi sottrae 3 al risultato 
così ottenuto. Magia: il numero finale ottenuto da
Carla si scrive con le stesse cifre del numero di 
partenza, ma in ordine inverso.

Qual era il numero di partenza?
*/

var 10..99: nStart;
var 10..99: nEnd;

constraint nEnd = nStart * 4 - 3;
constraint nEnd mod 10 == nStart div 10 /\ nEnd div 10 == nStart mod 10;

output ["The start number is: \(nStart)\n"];

