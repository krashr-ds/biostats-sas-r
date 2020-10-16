options nodate;

title 'Problem 12 Page 76 of Text';
/* input data */
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

/* Request statistics */

proc means data = Problem12 mean median min p25 p50 p75 max std;
var times;
run;

ods listing;
ods graphics off;

proc univariate data=Problem12 plot normal;
run;
