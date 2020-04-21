/* Assignment 2
   
   Using UNIVARIATE and histogram option, estimate the mean, 
   median and confidence interval with alpha = 0.05 for current 
   smoking status CURSMOKE and two of the following variables: 
   AGE, BMI, SYSBP, LDL 										*/

libname hca202in "/courses/d70e69e5ba27fe300"
access=readonly;
libname hca202 "~/hca202";

data hca202.frmgham;
set hca202in.frmgham;
label sex='Gender 1=Male 2=Female';
label bmi='Body Mass Index kg/m^2';
run;

proc contents data=hca202._all_ details;run;

/* Part 1 - CURSMOKE, BMI & SYSBP ; 95% CI */
proc univariate data=hca202.frmgham alpha=0.05 plot normal;
	Title 'Assignment #2';
	var CURSMOKE BMI SYSBP;
	histogram;
run;

/* Part 2 - by SEX ; 95% CI */
proc sort data=hca202.frmgham; by sex; run;
proc univariate data=hca202.frmgham alpha=0.05 plot normal;
	Title 'Assignment #2-B';
	by sex;
	var CURSMOKE BMI SYSBP;
	histogram / normal;
run;

/* Part 3 - alpha 0.1 ; 90% CI */
proc univariate data=hca202.frmgham alpha=0.1 plot normal;
	Title 'Assignment #2-C';
	var CURSMOKE BMI SYSBP;
	by sex;
	histogram;
run;

/*Proc Freq*/
proc freq data=hca202.frmgham;
    tables sex * bmi;
run;

proc freq data=hca202.frmgham;
    tables sex * sysbp;
run;
