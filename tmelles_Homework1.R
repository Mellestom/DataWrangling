# Thomas Melles
# 9/7/22
# Homework 1

####### Question 1 #######

rm(list=ls())

h_inches <- 4.83
h_cm <- h_inches * 2.54

Sodacan_Diameter <- 2.37
r_in <- Sodacan_Diameter/2
r_cm <- r_in * 2.54

Sodacan_Cost <- 0.99

Sodacan_Volume <- pi * r_cm^2 * h_cm

cost_cubic_cm <- Sodacan_Cost / Sodacan_Volume

######## Question 2 ########

rm(list=ls())

rent_data <- c(784,1793,1147,1229,902,1747,1171,1261)
column_names <- c('Iowa','Illinois','Wisconsin','Minnesota')
row_names <- c('2019','2020')

rent <- matrix(rent_data, nrow = 2,byrow = TRUE,dimnames = list(row_names,column_names))

avg_rent <- rowMeans(rent)

iowa_change <- ((rent['2020','Iowa'] - rent['2019','Iowa'] )/ rent['2019','Iowa']) * 100

####### Question 3 #######

rm(list=ls())

library('mosaicData')
Births_Data <- Births2015

View(Births_Data)

first_day <- Births_Data[1,1]
last_day <- Births_Data[nrow(Births_Data),1]

days <- as.numeric(difftime(last_day,first_day, unit = 'days'))

sundays <- sum(Births_Data[which(Births_Data[,'month'] == 1 & Births_Data[,'wday'] == 'Sun'),'births'])

april <- subset(Births_Data, Births_Data$month == '4')



