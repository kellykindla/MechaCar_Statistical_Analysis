# Module 15: MechaCar Statistical Analysis

## Project Overview 
### Purpose of Module 15
The purpose of Module 15 was to review summary statistics and regular expression and advanced models though loading, cleaning and reshaping datasets. We were introduced to R and its libraries, such as tidyverse and ggplot2. Using R, we were able to visualize data sets with basic plots and implement linear regression models, t-tests, ANOVA, and chi-squared tests. We further explored formulating hypotheses and identifying the most appropriate statistical test for the proposed hypothesis. 
 
### Overview of Assignment 
In this assignment, we were challenged to provide summary statistics and implement t-tests and linear regression analyses for automotive data from AutoRU’s prototype, the MechaCar. The goal of the assignment was to review the production data and provide insights based on the results of the tests performed that may aid the manufacturing team. We then were challenged to design a statistical study to compare vehicle performance of the MechaCar against vehicles from other manufacturers. 

### Resources 
	- MechaCar_mpg.csv 
	- Suspension_Coil.csv 
	- R version 4.1.2
	- RStudio version 2021.09.2


## Deliverable 1: Linear Regression to Predict MPG
A linear model was created to predict the mpg of the MechaCar using the following metrics that were collected on the 50 prototype cars: vehicle length, vehicle weight, spoiler angle, drive train (AWD), and ground clearance. Assuming all assumptions were met, we are able to perform a multiple linear regression where our null hypothesis is that the slope of the linear model is zero and the alternative hypothesis is that the slope of the linear model is not zero. The linear regression was performed throughout the use of R’s lm() function where our dependent variable is mpg and our independent variables are the remaining metrics from the data frame. 

<img width="646" alt="lm_D1" src="https://user-images.githubusercontent.com/92558842/152601028-44cc04dc-b7ff-4668-ba42-918ff8c0011e.png">

Based on the results of the lm() function, we can create the following regression model: 
	
	mpg = 6.267(vehicle_length) + 1.245e-3(vehicle_weight) + 6.877e-2(spoiler_angle)+3.546(ground_clearance) -3.411(AWD) -1.04e2
		
We are then able to gather the statistical metrics with R’s summary() function to determine the p-value and r-squared value for the multiple linear regression model. 

<img width="648" alt="summarylm_D1" src="https://user-images.githubusercontent.com/92558842/152601041-a80b735a-5bf9-46dc-8a8a-e09b511e0b58.png">

From the summary statistics, we find an adjusted r-squared value of 0.6825 and a p-value of 5.35e-11. We can also look at the individual p-values to determine which variables have a significant contribution to the linear model. Assuming a significance level of 0.05, we find that vehicle_length and ground_clearance have a significant contribution to the linear model and have a significant impact on mpg. Furthermore, we can state that vehicle_length and ground_clearance are statistically unlikely to provide random amounts of variance to the linear model (they provide a non-random amount of variance to mpg values). We also find that the intercept is statistically significant, meaning that the intercept term explains a significant amount of variability in mpg when all independent variables are equal to zero. With a p-value of 5.35e-11, we are able to reject the null hypothesis that the slope of the linear model is zero. With an adjusted r-squared value of 0.6825, we are able to say that 68.25% of the data fit the multiple linear regression model. With this fairly high level of correlation, we can state that the linear model effectively predicts the mpg of MechaCar prototypes. 


## Deliverable 2: Summary Statistics on Suspension Coils 
Summary statistics were created to aid in determining if the manufacturing process for MechaCars is consistent across multiple production lots. We initially created total summary statistics for all cars' suspension coil’s PSI using the summarize function and pipe operators. 
	
	total_summary <- Suspension_Coil %>% summarize(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI))

<img width="348" alt="total_sum_D2" src="https://user-images.githubusercontent.com/92558842/152618510-eb36529e-9149-4bbd-bed9-2987c613d1cd.png">

We then grouped the data by the manufacturing lot using the group_by() function to gather the PSI summary statistics for each manufacturing lot.  
	
	lot_summary <- Suspension_Coil %>% group_by(Manufacturing_Lot) %>% summarize(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI), .groups = "keep")

<img width="502" alt="lot_sum_D2" src="https://user-images.githubusercontent.com/92558842/152618531-1925ef3e-55fb-4d84-8649-fd0647e03178.png">

Given the design specifications for the MechaCar suspension coils in which the variance of the suspension coils should not exceed 100 pounds per square inch; we can see, given the data and the total_summary dataframe, that the current manufacturing data meets the requirements. However, taking a deeper dive into the data, we can see from the lot_summary dataframe that Lot 3 does not meet the design specification. The variance for Lot 1 and Lot 2 do meet the expectations and are a fraction of Lot 3. We further see this discrepancy in the standard deviation for the lots, where Lot 1 and Lot 2 are far less than Lot 3. However, the mean and median for all the lots are similar at around 1500. This could indicate a necessary investigation in the manufacturing process of Lot 3. 


## Deliverable 3: T-Tests on Suspension Coils 
Multiple one-sample t-tests were performed on the suspension coils data set to determine if the manufacturing lots statistically differed from the population mean of 1500 pounds per square inch. Since we are trying to determine if there is a statistical difference between the mean of a sample distribution and the mean of the population distribution, we will be performing a one-sample t-test. Assuming all assumption for the input data for a one-sample t-test were met, we are able to perform a one-sample t-test with the t.test() function given that our null hypothesis is that there is no statistical difference between the observed sample mean and the population mean of 1500 pounds per square inch and the alternative hypothesis is that there is a statistical difference between the observed sample mean and the presumed population mean. 

### All Lots: 
<img width="419" alt="ttest_all_D3" src="https://user-images.githubusercontent.com/92558842/152623179-ee84ccdf-58dd-41bc-b0a9-419d146f0c4e.png">

With a population mean of 1500 pounds per square inch and a significance level of 0.05, the one-sample t-test for all manufacturing lots resulted in a p-vlaue of 0.06 so, based on the data, we do not reject our null hypotheses that there is a statistical difference between the observed sample mean and the presumed population mean. Therefore, we can state that, from the data, all the manufacturing lots do not statistically differ from the population mean of 1500 pounds per square inch when analyzing PSI. 
To determine if each manufacturing lot differed statistically from the population mean, we used the subset() function to create data frames for each lot, on which we ran a t.test. 

### Lot 1: 
<img width="473" alt="ttest_lot1_D3" src="https://user-images.githubusercontent.com/92558842/152623200-ff501996-157b-48fd-a5a9-c2f39adbd5c1.png">

The one-sample t-test for lot 1 resulted in a p-value of 1 and with a significance level of 0.05, we do not reject the null hypothesis that there is a statistical difference between the observed sample mean and the presumed population mean of 1500. We can further see that the true mean of the dataframe of Lot 1 is 1500, equal to the population mean. 

### Lot 2: 
<img width="469" alt="ttest_lot2_D3" src="https://user-images.githubusercontent.com/92558842/152623207-bccc2248-b613-4099-96f3-ab96687034a5.png">

The one-sample t-test for lot 2 resulted in a p-value of 0.6072 and with a significance level of 0.05, we do not reject the  null hypothesis that there is a statistical difference between the observed sample mean and the presumed population mean of 1500. Based on the data for Lot 2, we find a true mean of 1500.2 which is not significantly different than the population mean. 

### Lot 3: 
<img width="465" alt="ttest_lot3_D3" src="https://user-images.githubusercontent.com/92558842/152623212-4dda33b7-b3b9-4457-b8b3-bdf6b3c1489f.png">

The one-sample t-test for lot 3 resulted in a p-value of 0.04168 and with a significance level of 0.05, we are able to reject the null hypothesis that there is a statistical difference between the observed sample mean and the presumed population mean of 1500. We can therefore state, based on the data, that there is a statistical difference between the observed sample mean for Lot 3 and the population mean. We find that the true mean of Lot 3 is 1496.14 which is significantly different than the population mean. 


## Deliverable 4: Study Design: MechaCar vs Competition
When considering the performance of a vehicle, the most telling metric to analyze is the horsepower of the vehicle. However, for a typical consumer, horsepower may not be a priority. To best quantify how the MechaCar performs against other cars, we should consider, along with horsepower, metrics such as miles per gallon, re-sell value, overall cost, and safety. To accurately determine what cars to compare the MechaCar to I would gather the previously stated metrics for vehicles within a similar price range. Then, to further ensure the cars are of similar values, I would initially perform an ANOVA test that compares the average overall cost of the cars. The null hypotheses for the ANOVA test would be that the mean cost of all groups are equal while the alternative is that at least one mean is different from the other groups. Assuming all assumptions are met, I would perform the ANOVA test and analyze the p-value. With a significance level of 0.05, I would either reject or fail to reject the null hypotheses. If I reject the null hypothesis and find that one of the mean costs are different from the others, I would perform t-tests to pinpoint which car cost varies from the others. 
With a proper sample group of cars to compare against the MechaCar, I would then perform multiple two-sample t-tests for each metric for each car against the MechaCar. Though tedious, the results should accurately display how the MechaCar performs against the competition and could offer insights on areas of improvement for the MechaCar. An example of a two-sample t-test I would perform would be the mean miles per gallon of the MechaCar versus that of the competitor car. I would repeat this analysis for each competitor car and then move on to the next metric: horsepower, re-sell value, or safety rating. The null hypothesis for each t-test is that there is no statistical difference between the mean MechaCar metric and that of the competitor. The alternative hypothesis is that there is a statistical difference between the mean MechaCar metric and that of the competitor. The data required to run the t-test is a numeric vector for each metric for the MechaCar and the competitor. Assuming all assumptions for a t-test are met and given a significance level of 0.05, I would perform a two sample t-test and analyze the p-value against the significance level to determine if the null hypothesis can be rejected. A two-sample t-test is best in this scenario since we are comparing dichotomous, continuous data for each metric and comparing sample A versus sample B. To further gain insight on the performance of the MechaCar, it would be advantageous to plot each metric and determine the MechaCar's performance visually from a bar chart. 
