%Numero facce, spigoli concorrenti nello stesso vertice
var 3..30: c;
%Numero totale facce
int: f = 7;
%Numero totale spigoli 
var 1..30: s;
%Numero totale vertici
var 1..30: v;

constraint s=f+v-2;
constraint v=(2*s)/c;

var int: finalF = v+f;
solve maximize finalF;

output ["number: \(finalF)\n"];