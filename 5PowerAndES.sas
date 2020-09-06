/* Getting Your Feet Wet With SAS
   Example 5.14 Power and Effect Size
   Reading p. 210; Code p. 216  */
  
/* Sample Size Requirements
   
   We wish to conduct the following test at the 5% level of significance:
   H(0): mu = 100 vs. H(a) mu does not = 100
   
   How many subjects would be required to ensure that the probability
   of detecting a 5 (or a 3) unit difference is 80% (power = .80)?
   Also consider scenarios with 90% power and assume sigma = 9.5      */
  
options ps=64 ls=80;
data in;
	input alpha power mu0 mu1 sigma;

z_alpha2 = probit(1-alpha/2);
z_alpha1 = probit(1-alpha);
beta = 1-power;
z_beta = probit(1-beta);
es = abs(mu1-mu0)/sigma;
tempn_2 = ((z_alpha2 + z_beta)/ es)**2;
tempn_1 = ((z_alpha1 + z_beta)/ es)**2;
n_2 = ceil(tempn_2);
n_1 = ceil(tempn_1);

/* Inputs:
   alpha: level of significance
   power: range 0.0 to 1.0
   mu0: mean under the null hypothesis
   mu1: mean under the alternative hypothesis
   sigma: standard deviation                       */
  
	
cards;
0.05 0.80 100 105 9.5
0.05 0.90 100 105 9.5
0.05 0.80 100 103 9.5
0.05 0.90 100 103 9.5
run;

title 'Power / Effect Size';

proc print;
	var alpha beta mu0 mu1 sigma power es n_2 n_1;
run;



/* Based on the output:
   What is the sample size needed for a 5 unit change under 80% power?
   What is the sample size needed for a 3 unit change under 90% power?
   
   Re-run the code changing alpha, mean, unit change, power and other variables.
   
   What do you notice? 
*/
