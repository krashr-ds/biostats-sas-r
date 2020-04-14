/* Problem 12
   Page 76
   Input Data */

data Problem12;
input times;
cards;
6
18
12
9
10
14
6
5
run;

/* Problem 12
   Page 76
   Means */

proc means mean median min p25 p50 p75 max std;
var times;
run;

/* Problem 12
   Page 76
   Univariate */

proc univariate data=Problem12 plot normal;
Title 'Assignment #1, Problem 12 Page 76';
var times;
run;
