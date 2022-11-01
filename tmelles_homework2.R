# Thomas Melles
# 9/24/22
# Homework 2

rm(list=ls())

####### Question 1 ########

#setwd('~/Docs/School/Fall 2022/Data Wrangling/Homework/Homework 2/')
Gun_Violence <- read.csv('gun-violence-data_01-2013_03-2018.csv')

###### Part A ######
str(Gun_Violence)

###### Part B ######
Gun_Violence_IowaCityIA <- Gun_Violence[which(Gun_Violence$state == 'Iowa' & Gun_Violence$city_or_county == 'Iowa City'),]

###### Part C ######
Gun_Violence_IowaCity_CedarRapids <- Gun_Violence[which(Gun_Violence$state == 'Iowa' & (Gun_Violence$city_or_county == 'Iowa City' | Gun_Violence$city_or_county == 'Cedar Rapids')),]

###### Part D ######
Gun_Violence_Iowa <- Gun_Violence[which(Gun_Violence$state == 'Iowa'),]

library(rjson)
Gun_Violence_Iowa <- toJSON(Gun_Violence_Iowa)
write(Gun_Violence_Iowa, 'Gun_Violence_Iowa.json')


# Sum of Fatalities by State

###### Part E #######
Gun_Violence_2016 <- Gun_Violence

Gun_Violence_2016$date <- as.Date(Gun_Violence_2016$date)

Gun_Violence_2016 <- subset(Gun_Violence_2016, date >= '2016-01-01' & date <= '2016-12-31' )

max_n_killed <- max(Gun_Violence_2016$n_killed)



Highest_Violence_City <- Gun_Violence_2016[which(Gun_Violence_2016$n_killed == max_n_killed),]

Highest_Violence_City <- Highest_Violence_City[,c('city_or_county','state')]


####### Question 2 ########

fifa21 <- read.csv('players_21.csv')

###### Part A #####
Specific_fifaid <- subset(fifa21, sofifa_id == 231747 | sofifa_id == 153079 | sofifa_id == 162835 | sofifa_id == 200104 | sofifa_id == 223848 | sofifa_id == 208421, select = c(sofifa_id, long_name))

###### Part B #####
Size_Players <- subset(fifa21, height_cm >= 191 & weight_kg >= 90)

###### Part C ######
Oldest_Player_Age <- max(fifa21$age)
Youngest_Player_Age <- min(fifa21$age)

###### Part D ######
Left_Foot_Players <- subset(fifa21, preferred_foot == 'Left' & age >= Oldest_Player_Age, select = c('long_name','age','height_cm'))

###### Part E ######
Number_of_Players <- nrow(fifa21)


                                