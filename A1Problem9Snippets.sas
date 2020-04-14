/* Problem 9
   Page 84
   Input Data */

data Problem9;
input rate;
cards;
65
88
81
86
78
85
84
77
97
85
76
93
97
82
79
94
72
89
92
84
99
83
94
89
83
run;

/* Problem 9
   Page 84
*/

ods listing;
ods graphics off;
proc univariate data=Problem9 plot normal;
Title 'Assignment #1 Problem 9 Page 84';
var rate;
run; 
