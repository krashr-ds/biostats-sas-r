/* Assignment 3 BASE */

libname hca202in "/courses/d70e69e5ba27fe300"
access=readonly;
libname hca202 "~/hca202";

data hca202.frmgham;
	set hca202in.frmgham;
run;

/* Problem 1 */
proc corr data=hca202.frmgham;
	title ‘Assignment 3, Problem 1’;
	var timedth age angina;
run;

proc reg data=hca202.frmgham PLOTS(MAXPOINTS=NONE);
	title ‘Assignment 3, Problem 2’;
	Model timedth = age;
run;
quit;

/* Problem 3 */
proc reg data=hca202.frmgham;
	title ‘Assignment 3, Problem 3’;
	Model timedth = age hdlc angina heartrte bmi;
run;
quit;


/* EC - Problem 4 */
/*linear model used with a ~N outcome */ 
proc glm data=hca202.frmgham; 
title 'Assignment 3, Problem 4'; 
class sex; 
model timedth = age sex bmi; 
run; 
quit; 

/* EC - Problem 4a */
/*linear model used with a binary outcome */ 

proc glm data=hca202.frmgham; 
title 'Assignment 3, Problem 4a'; 
class sex death; 
model death = age sex bmi; 
run; 
quit;
