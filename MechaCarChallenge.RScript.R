## Deliverable 1 
# use library() function to load dplyr package 
library(dplyr)

#import and read in the mechaCar_mpg.csv
MechaCar_DF <- read.csv("MechaCar_mpg.csv")

#perform linear regression with all six variables on MechaCar_DF
lm(mpg~vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data = MechaCar_DF)

# use the summary() function to determine the pvalue and rsquared value for linear regression model 
summary(lm(mpg~vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data = MechaCar_DF)
)


##Deliverable 2 
# import and read in the suspension_coil.csv file 
Suspension_Coil <- read.csv("Suspension_Coil.csv")

#create total_summary df using summarize() to get the mean, median, variance, and sd of the PSI column 
total_summary <- Suspension_Coil %>% summarize(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI))

#create lot_summary df using the group_by() and summarize() functions to group each lot by the mean, meidan,variance, and sd of PSI
lot_summary <- Suspension_Coil %>% group_by(Manufacturing_Lot) %>% summarize(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI), .groups = "keep")
