array[1..8] of var 0..9: date;

var 2021..2030: years = sum(i in 5..8)(date[i]*10^(8-i));
var 0..12: months = date[3]*10 + date[4];
var 0..30: days = date[1]*10 + date[2];

constraint forall(i in 1..8)(count(date, date[i], 2));

constraint years == 2021 -> months > 9;
constraint years == 2021 \/ months == 9 -> days > 19;

var int: recentdate = years*10^4 + months*10^2 + days;
solve minimize recentdate;

