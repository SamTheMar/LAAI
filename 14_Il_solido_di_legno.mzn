%number of edges contestant to the same vertices
int: c = 3;
%number of total faces  
int: f = 7;
%number of total edges 
var 15..30: s;
%number of total vertices
var 10..30: v;

%Euler's formula 
constraint s=f+v-2;
%number of vertices formula
constraint v=(2*s)/c;

%number of faces after the cut
var int: finalF = v+f;
solve maximize finalF;

output ["number: \(finalF)\n"];