%array rapresentation of the date
array[1..8] of var 0..9: date;

%year from array to int
var 2021..2030: year = sum(i in 5..8) (date[i]*10^(8-i));
%month from array to int
var 0..12: month = date[3]*10 + date[4];
%day from array to int
var 0..30: day = date[1]*10 + date[2];

%all digits are contained exactly twice 
constraint forall(i in 1..8) (count(date, date[i], 2));

%the date found is after the 19-09-2021
constraint year == 2021 -> month > 9;
constraint year == 2021 /\ month == 9 -> day > 19;

%recent date function
var int: recentdate = year*10^4 + month*10^2 + day;
solve minimize recentdate;

output ["date: \(day)-\(month)-\(year)\n"];

