# Thomas Melles
# 10/19/22
# Homework 3

rm(list=ls())
#setwd('~/Docs/School/Fall 2022/Data Wrangling/Homework/Homework 3/')

##### Question 1 #####

  ## Part A ##

Budget_Data <- read.csv('City_Budget_and_Actual_Expenditures.csv')

  ## Part B ##

    ## Part I ##
Budget_Data <- subset(Budget_Data, Fiscal.Year == '2021')

    ## Part II ##
duplicates <- sum(duplicated(Budget_Data))

    ## Part III ##
Budget_Data[!duplicated(Budget_Data), ]

    ## Part IV ##
City_Finances_2021 <- subset(Budget_Data, Fiscal.Year == '2021', select = c('Fiscal.Year','County','City.Name','Budget','Actual'))

    ## Part V ##
write.csv(City_Finances_2021,'City_Finances_2021.csv' ,row.names = FALSE)

  ## Part C ##
City_Finances <- read.csv('City_Finances_2021.csv')

    ## Part I ##
str(City_Finances)
City_Finances$Budget <- as.numeric(City_Finances$Budget)
City_Finances$Actual <- as.numeric(City_Finances$Actual)

    ## Part II ##
City_Finances <- as.data.frame(unclass(City_Finances), stringsAsFactors = TRUE)

    ## Part III ##
library(tidyverse)
library(janitor)
library(dplyr)
City_Finances <- City_Finances %>% clean_names()
City_Finances <- clean_names(City_Finances, "snake")

    ## Part IV ##
sum(is.na(City_Finances))

  ## Part D ##
write.csv(City_Finances, 'City_2021_Finances_Clean.csv', row.names = FALSE)

##### Question 2 #####
city_finances_clean <- read.csv('City_2021_Finances_Clean.csv')

duplicates <- sum(duplicated(City_Finances))

##### Question 3 #####
county_count <- length(unique(city_finances_clean$county))

##### Question 4 #####
city_count <- length(unique(city_finances_clean$city_name))

##### Question 5 #####
fiscal_year <- unique(city_finances_clean$fiscal_year)

##### Question 6 #####
city_finances_clean <- city_finances_clean %>%
  group_by(city_name,county) %>%
  summarise(across(c(budget, actual), sum))

##### Question 7 #####
city_finances_clean$difference_actual_budget <- city_finances_clean$budget - city_finances_clean$actual

##### Question 8 #####
top_spenders <- subset(city_finances_clean, select = c('county','city_name','difference_actual_budget'))
top_spenders <- top_spenders[with(top_spenders,order(difference_actual_budget)),]
top_spenders <- top_spenders[1:10,]

##### Question 9 #####
top_savers <- subset(city_finances_clean, select = c('county','city_name','difference_actual_budget'))
top_savers <- top_savers[with(top_savers,order(-difference_actual_budget)),]
top_savers <- top_savers[1:10,]
