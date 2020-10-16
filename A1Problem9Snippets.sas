Title 'Problem 9 Page 84 of Text';
data Problem09;
input rate;
cards;
65
86
84
85
97
94
89
84
83
89
88
78
77
76
82
72
92
99
94
83
81
85
97
93
79
run;
/* Request statistics */

ods listing;
ods graphics off;

proc univariate data=Problem09 plot normal;
Title 'Assignment #1, Problem 09 Page 84 of Text';
var rate;
run;
