/* Problem 1; pg. 404 */

options ps=62 ls=80;

proc format;
  value eventf 1='yes' 2='no';
  value grpf 1='Therapy 1' 2='Therapy 2';
  
run;

data in;
  input group complications f;
  format complications eventf. group grpf.;
  
cards;
1 1 89
1 2 911
2 1 127
2 2 873
run;

proc freq;
  tables group*complications/nocol nopercent
    expected relrisk chisq;
    
weight f;

run;
