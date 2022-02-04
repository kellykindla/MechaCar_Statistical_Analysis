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

