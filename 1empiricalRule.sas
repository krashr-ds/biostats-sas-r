/* Getting Your Feet Wet With SAS
   Example 2.3 The Empirical Rule
   Reading p. 35; Code p. 61      */
  
/* Age Data Example */

options ps=64 ls=80;

data in;
	input age;

label age="Age in Years";

cards;
60
62
63
64
64
65
65
65
65
65
65
66
66
66
66
66
67
67
67
68
68
68
70
70
70
71
71
72
72
73
73
73
73
73
75
75
75
75
76
76
77
77
77
77
77
79
82
83
85
85
87
run;

title 'Summary Statistics: Age';

proc univariate plot;
	var age;
run;

/* How closely does the Empirical Rule reflect the distribution of this data?
   Play with the cards values and re-run the code.
   How do the percentages (and the graph) change?                            */
  
  
