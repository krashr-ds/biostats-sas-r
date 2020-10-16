Title 'Problem 6 Page 83 of Text';
data Problem06;
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

/* Request statistics */

ods listing;
ods graphics off;

proc univariate data=Problem06 plot normal;
run;
