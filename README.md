# Simulation hypothesis test
A small fun simulation project I made on Statistical Hypothesis testing in different kinds of distributions: 

## Simulate from Normal distribution
I first started out with simulating samples of different sizes from a normal distribution with known mean and variance. When test mean is = known population mean, referred to as the correct mean case, the simulation worked just as we expect: in all sample sizes, the proportion of rejected hypotheses are about the significant level α. 

However, once the test diverge from the actual mean, referred to as the incorrect mean case, the significance level drastically shifted away from the significance level. In the bellow graph, I included the bar plot of proportions of rejected hypotheses in both cases: 

<img src="https://github.com/LeoLQH/Simulation_hypothesis_test/assets/125975253/24ef706c-8190-4ed7-81d6-204ac196ba4f" width = "500" height = "500"> 

<img src="https://github.com/LeoLQH/Simulation_hypothesis_test/assets/125975253/f1050951-82cd-4562-af76-044cfdd58ce8" width = "500" height = "500">   

The meaning of the significance level α does not follow anymore: in the smallest sample from the normal distribution, we reject about 15% of the samples, then the proportion gradually increases, as sample size increase. In this case, it is good, as the actual mean is different than our test mean. I also tested it out with some other significance levels, (0.10, 0.15), and the results are the same in the sense that **the proportion of rejected hypotheses is always greater than the specified level**. 

This shows that: If we have repeated, identical samplings/experiments, and the proportion of rejected hypotheses is greater than 0.05, then for large enough samplings, we can be much more confident that the means are different. 

The problem with this approach is, of course, the limitation of trials. In many real-world situations, often we only have one sample, and thus know exactly nothing once we reject or fail to reject or null. Furthermore, take a look at the p-values for when the population mean and test mean are the same, and when they differs: 

<img src="https://github.com/LeoLQH/Simulation_hypothesis_test/assets/125975253/31302f17-61ba-4bc8-acdb-014cfdd00880" width = "500" height = "500"> 

<img src="https://github.com/LeoLQH/Simulation_hypothesis_test/assets/125975253/57f353ba-937c-4978-8081-a02b9d30ad09" width = "500" height = "500"> 

We can see that the p-value for the correct mean case is almost perfectly normally distributed around the 0.5, while for the test mean ≠ population case, the distribution of p-value shrinks, as our sample size increases. From these two graphs, one can infer two things: (1) p-value does not bear any inherent meaning (as in the correct mean case, p-value is normally distributed around 0.5 even for very large sample, which does not make sense if we interpret it as the probability of our test being correct), and (2) The lower the p-value is, the more confident we are! The latter point is well-known, but still a worthwhile observation from the simulation. 

## Simulate from Skewed Normal distribution
I also tested it out with skewed distributions, as we would often meet with skewed data in real life. Using skewed normal distributions, as I’d like to sample from on the set of real numbers. We again have two bar plots of proportion of rejected hypotheses and sample sizes, for the test mean = population mean case, and for the different case: 

<img src="https://github.com/LeoLQH/Simulation_hypothesis_test/assets/125975253/f09e3301-af3a-4a4a-a09a-720e999f177f" width = "500" height = "500"> 

<img src="https://github.com/LeoLQH/Simulation_hypothesis_test/assets/125975253/b2b45118-4ba9-4d7c-a3f4-9e004bb6bbc9" width = "500" height = "500"> 


The result is astonishing! We reject almost all the hypotheses, regardless of the sample size, in the **correct mean case!** Even in the test mean ≠ population case, the number of rejected hypotheses is still very high. Thus, this comes up as a cautionary note for practitioners of hypothesis testing: when the null hypothesis is rejected, it could also be because of violation of the assumption. In this case for the simulation, the violation was strong, and thus, the simulated data was not consistent to the null hypothesis, resulting in strong hypotheses rejection. 

One more disadvantage to note about hypothesis testing: we usually does not know what to test the mean by! Without any prior research, gaining information about this would mean a need to subset our data, or perform a preliminary data analysis to gather insights on to what value the mean might be. This adds more to our data collection burden, on top of what we already discussed above on repeated sampling! 

Yet, again, this project is not to ridicule Frequentist statistics. Rather, this is just my learning project! 

## Conclusion
Use hypothesis testing, and thus confidence interval, with cautions. They are only best deployed when the assumption are met (including: large amount of data, whether or data are reasonably to come from a normal distribution). If a test fail, it could be either: the mean (or whatever test quantity is being tested) is wrong, or that the data does not come from a normal population. 



