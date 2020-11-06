/* Assignment 4 BASE */

libname hca202in "/courses/d70e69e5ba27fe300"
access=readonly;
libname hca202 "~/hca202";

data hca202.frmgham;
	set hca202in.frmgham;
run;


/*Problem 1, logit model used with a binary outcome variable*/ 
proc logistic data=hca202.frmgham; 
	title 'Assignment 4, Problem 1'; 
	class sex death; 
	model death = sex; 
run; 


/*Problem 2*/ 
proc logistic data=hca202.frmgham; 
	title 'Assignment 4, Problem 2'; 
	class sex death curSmoke; 
	model curSmoke = sex; 
run; 


/*Problem 3*/ 
proc logistic data=hca202.frmgham; 
	title 'Assignment 4, Problem 3'; 
	class sex death; 
	model death = age sex bmi; 
run;

/*Problem 4*/ 
proc logistic data=hca202.frmgham; 
	title 'Assignment 4, Problem 4'; 
	class sex death; 
	model diabetes = age sex bmi hdlc; 
run; 

