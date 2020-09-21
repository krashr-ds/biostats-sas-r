/* Base Assignment 2; Erin Griffin Ph.D*/

libname hca202in "/courses/d70e69e5ba27fe300"
access=readonly;
libname hca202 "~/hca202";

data hca202.frmgham;
set hca202in.frmgham;
run;


/*Problem #1*/ 
proc univariate data=hca202.frmgham alpha=0.05; 
title 'Assignment #2, Problem 1'; 
var cursmoke age bmi sex sysbp ldlc; 
histogram cursmoke age bmi sex sysbp ldlc; 
run; 

/* Now,  stratify by SEX.*/ 
proc sort data= hca202.frmghamfrm; 
by sex; 
run; 
proc univariate data=hca202.frmgham alpha=0.05; 
var cursmoke age bmi sex sysbp ldlc; 
histogram cursmoke age bmi sex sysbp ldlc; 
by sex; 
run; 

/* Increase alpha to 0.1 (90% CI).*/



proc univariate data=hca202.frmgham alpha=0.1; 

var cursmoke age bmi sex sysbp ldlc; 

by sex; 

run; 

/* Problem #2 */ 
proc freq data=hca202.frmgham;
title 'Assignment #2, Problem 2'; 
table sex/chisq; 
table sex*curSmoke/chisq; 
run;

/*Problem #3*/ 
proc freq data=hca202.frmgham; 
title 'Assignment #2, Problem 3'; 
table sex/chisq; 
table sex*curSmoke/cmh chisq norow nopercent; 

run;
