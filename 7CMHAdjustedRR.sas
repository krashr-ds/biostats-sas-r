/* Getting Your Feet Wet With SAS
   Adjusted Relative Risk with Cochran-Mantel-Haenszel Testing
   Reading p. 377; Code example: The SAS Institute  */
  
/* Comparing the risk of two groups, controlling for another factor

	The Cochran-Mantel-Haenszel method (cmh) is an extension of the 
	chi-square method and is applied when interest lies in comparing
	two groups in terms of a dichotomous outcome over several levels
	of a third variable.  p. 377
	
	In this example, the data set 'Migraine' contains hypothetical 
	data for a clinical trial of migraine treatment. Subjects of both 
	genders receive either a new drug therapy or a placebo. Their 
	response to treatment is coded as 'Better' or 'Same'. The data 
	are recorded as cell counts, and the number of subjects for each 
	treatment and response combination is recorded in the variable 
	'Count'.
	
	*/
  
data Migraine;
      input Gender $ Treatment $ Response $ Count @@;
      datalines;
   female Active  Better 16   female Active  Same 11
   female Placebo Better  5   female Placebo Same 20
   male   Active  Better 12   male   Active  Same 16
   male   Placebo Better  7   male   Placebo Same 19
   ;


/* The following 'PROC FREQ' statements create a multiway table 
stratified by 'gender', where 'treatment' forms the rows and 
response forms the columns. The CMH option produces the 
Cochran-Mantel-Haenszel statistics. For this stratified  
table, estimates of the common relative risk and the Breslow-Day 
test for homogeneity of the odds ratios are also displayed. 

The NOPRINT option suppresses the display of the contingency tables. */

proc freq data=Migraine;
    tables Gender*Treatment*Response / cmh alpha=0.05; 
    weight Count;
    title 'Clinical Trial for Treatment of Migraine Headaches';
run;



/* Does the association between treatment and response remain strong after controlling for gender? 
   What is the probability of migraine improvement with the new drug?
   
 
   Challenge: Interpret the Breslow-Day Test.  
   Is there a significant gender difference in the odds ratios?
*/
