/* Assignment 2
   
   Using UNIVARIATE and histogram option, estimate the mean, 
   median and confidence interval with alpha = 0.05 for current 
   smoking status CURSMOKE and two of the following variables: 
   AGE, BMI, SYSBP, LDL 										*/

/* Part 1 - CURSMOKE, BMI & SYSBP ; 95% CI */
proc univariate data=hca202.frmgham alpha=0.05 plot normal;
	Title 'Assignment #2';
	var CURSMOKE BMI SYSBP;
	histogram;
run;

/* Part 2 - by SEX ; 95% CI */
proc univariate data=hca202.frmgham alpha=0.05 plot normal;
	Title 'Assignment #2';
	var CURSMOKE BMI SYSBP;
	by sex;
	histogram;
run;

/* Part 3 - alpha 0.1 ; 90% CI */
proc univariate data=hca202.frmgham alpha=0.1 plot normal;
	Title 'Assignment #2';
	var CURSMOKE BMI SYSBP;
	by sex;
	histogram;
run;
