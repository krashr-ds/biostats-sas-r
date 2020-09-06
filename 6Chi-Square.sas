/* Getting Your Feet Wet With SAS
   Example 7.13 Chi-Square Test of Independence
   Reading p. 322; Code p. 338  */
  
/* Is there a relationship between gender and treatment regimen? 
   
   Suppose an investigator is interested in evaluating whether or not
   treatment regimens differ by gender.  Restricting our analyes to the 
   HMO patients, the following table displays the number of male and 
   female patients according to their treatment regimens.  Based on the
   data, is there evidence of a significant relationship between gender
   and treatment regimen among the HMO patients?  Test if there is a
   relationship between site and treatment regimen using the chi-square
   test of independence in SAS.                                         */
  
options ps=62 ls=80;
data in;
	input gender $ trt $ count;

	
cards;
male diet 147
male oral 392
male insulin 323
female diet 147
female oral 435
female insulin 256
run;

title 'Gender, Treatment Relationships and Independence';

proc freq;
	tables gender*trt/chisq alpha=0.05;
	weight count;
run;



/* The null hypothesis H(0) is 'Gender and Treatment Regimen are independent.'
   State the alternative hypothesis.
   What is the test statistic (chi-squared)?
   What is the critical value and decision rule?
 
   Do we reject the null hypothesis in this case? 
   Is there a relationship between gender and treatment type? 
*/
