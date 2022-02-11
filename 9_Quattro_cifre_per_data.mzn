array[1..8] of var 0..9: date;

var 2021..2030: anno = date[5]*10^3 + date[6]*10^2 + date[7]*10 + date[8];
var 0..12: mese = date[3]*10 + date[4];
var 0..30: giorno = date[1]*10 + date[2];

%constraint date[1]<3 \/ (date[1] = 3 /\ date [2] = 0);
%constraint date[3]=0 \/ (date[3] = 1 /\ date [4] < 3);

constraint forall(i in 1..8)(count(date, date[i], 2));

%constraint (date[5] * 1000 + date[6] * 100 + date[7] * 10 + date[8] > 2021) \/
%            (date[5] * 1000 + date[6] * 100 + date[7] * 10 + date[8] = 2021 /\ date[3]*10 + date[4] > 9) \/
%            (date[5] * 1000 + date[6] * 100 + date[7] * 10 + date[8] = 2021 /\ date[3]*10 + date[4] = 9 /\ date[1]*10 + date[2] > 19) ;
constraint anno == 2021 -> mese > 9;
constraint anno == 2021 \/ mese == 9 -> giorno > 19;

var int: recent_date = date[1]*10 + date[2] + date[3]*10^3 + date[4]*10^2 + date[5]*10^7 + date[6]*10^6 + date[7]*10^5 + date[8]*10^4;
solve minimize recent_date;

