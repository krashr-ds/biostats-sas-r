/* Problem 6
   Page 83
   Input Data */

data Problem6;
input times;
cards;
8
15
7
6
4
20
3
6
4
3
run;

/* Problem 6
   Page 83
   Univariate - Get Statistics */

proc univariate data=Problem6 plot normal;
Title 'Assignment #1 Problem 6 Page 83';
var times;
run;
