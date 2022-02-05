# Module 15: MechaCar Statistical Analysis

## Project Overview 
### Purpose of Module 15
### Overview of Assignment 
### Resources 


## Deliverable 1: Linear Regression to Predict MPG
A linear model was created to predict the mpg of the MechaCar using the following metrics that were collected on the 50 prototype cars: vehicle length, vehicle weight, spoiler angle, drive train (AWD), and ground clearance. Assuming all assumptions were met, we are able to perform a multiple linear regression where our null hypothesis is that the slope of the linear model is zero and the alternative hypothesis is that the slope of the linear model is not zero. The linear regression was performed throughout he use of R’s lm() function where our dependent variable is mpg and our independent variables are the remaining metrics from the data frame. 

<img width="646" alt="lm_D1" src="https://user-images.githubusercontent.com/92558842/152601028-44cc04dc-b7ff-4668-ba42-918ff8c0011e.png">

Based on the results of the lm() function, we can create the following regression model: 
	
	mpg = 6.267(vehicle_length) + 1.245e-3(vehicle_weight) + 6.877e-2(spoiler_angle)+3.546(ground_clearance) -3.411(AWD) -1.04e2
		
We are then able to gather the statistical metrics with R’s summary() function to determine the p-value and r-squared value for the multiple linear regression model. 

<img width="648" alt="summarylm_D1" src="https://user-images.githubusercontent.com/92558842/152601041-a80b735a-5bf9-46dc-8a8a-e09b511e0b58.png">

From the summary statistics, we find an adjusted r-squared value of 0.6825 and a p-value of 5.35e-11. We can also look at the individual p-values to determine which variables have a significant contribution to the linear model. Assuming a significance level of 0.05, we find that vehicle_length and ground_clearance have a significant contribution to the linear model and have a significant impact on mpg. Furthermore, we can state that vehicle_length and ground_clearance are statistically unlikely to provide random amounts of variance to the linear model (they provide a non-random amount of variance to mpg values). We also find that the intercept is statistically significant, meaning that the intercept term explains a significant amount of variability in mpg when all independent variables are equal to zero. With a p-value of 5.35e-11, we are able to reject the null hypothesis that the slope of the linear model is zero. With an adjusted r-squared value of 0.6825, we are able to say that 68.25% of the data fit the multiple linear regression model. With this fairly high level of correlation, we can state that the linear model effectively predicts the mpg of MechaCar prototypes. 

## Deliverable 2: Summary Statistics on Suspension Coils 
Summary statistics were created to aid in determining if the manufacturing process for MechaCars is consistent across multiple production lots. We initially created total summary statistics for all cars suspension coil’s PSI using the summarize function and pipe operators. 
	
	total_summary <- Suspension_Coil %>% summarize(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI))

<img width="348" alt="total_sum_D2" src="https://user-images.githubusercontent.com/92558842/152618510-eb36529e-9149-4bbd-bed9-2987c613d1cd.png">

We then grouped the data by the manufacturing lot using the group_by() function to gather the PSI summary statistics for each manufacturing lot.  
	
	lot_summary <- Suspension_Coil %>% group_by(Manufacturing_Lot) %>% summarize(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI), .groups = "keep")

<img width="502" alt="lot_sum_D2" src="https://user-images.githubusercontent.com/92558842/152618531-1925ef3e-55fb-4d84-8649-fd0647e03178.png">

Given the design specifications for the MechaCar suspension coils in which the variance of the suspension coils should not exceed 100 pounds per square inch; we can see, given the data and the total_summary dataframe, that the current manufacturing data meets the requirements. However, taking a deeper dive into the data, we can see from the lot_summary dataframe that Lot 3 does not meet the design specification. The variance for Lot 1 and Lot 2 do meet the expectations and are a fraction of Lot 3. We further see this discrepancy in the standard deviation for the lots, where Lot 1 and Lot 2 are far less than Lot 3. However, the mean and median for all the lots are similar at around 1500. This could indicate a necessary investigation in the manufacturing process of Lot 3. 
