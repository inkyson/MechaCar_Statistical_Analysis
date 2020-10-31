library(dplyr)

## Deliverable 1: Linear Regression to Predict MPG
# D1.4 Import and read file as dataframe
mecha_data <- read.csv("MechaCar_mpg.csv",stringsAsFactors = F,check.names = F)

#D1.5 Perform linear regression
mecha_lm <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mecha_data)

#D1.6 Determine p-value and r-squared value
summary(mecha_lm)

## Deliverable 2: Create Visualizations for the Trip Analysis
# D2.2 Import and read file as a table
suspension_data <- read.csv("Suspension_Coil.csv",stringsAsFactors = F, check.names = F)

# D2.3 Create total summary dataframe
total_summary <- suspension_data %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI))

# D2.4 Create lot summary dataframe
lot_summary <- suspension_data %>% group_by(Manufacturing_Lot) %>% 
  summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups = 'keep')

## Deliverable 3: T-Tests on Suspension Coils
# D3.1 t.test for all Lots
t.test(suspension_data$PSI, mu = 1500)

# D3.2 t.test for each lot
t.test(subset(suspension_data, Manufacturing_Lot=='Lot1')$PSI, mu = 1500)
t.test(subset(suspension_data, Manufacturing_Lot=="Lot2")$PSI, mu = 1500)
t.test(subset(suspension_data, Manufacturing_Lot=="Lot3")$PSI, mu = 1500)
