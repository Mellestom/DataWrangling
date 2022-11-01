# Thomas Melles
# 9/1/22
# Lab Exercises 2

######## Exercise 1 #######

rm(list=ls())

data(islands)
islands

japan <- islands[c('Honshu','Hokkaido','Kyushu')]
japan

medium_Islands <- islands[which(islands > 50 & islands < 100)]
medium_Islands

####### Exercise 2 ########

sorted_islands <- (sort(islands, decreasing = TRUE))
sorted_islands

top3 <- sort(islands, decreasing = TRUE)[1:3]
top3

canada <- sum(islands[c('Vancouver','Southampton','Newfoundland','Ellesmere','Devon','Banks','Victoria','Baffin')])
canada
              
####### Exercise 3 #########

vector1 <- seq(3,20, by=3)
vector2 <- c(1:6)*3

identical(vector1,vector2)

vector2 <- sort(vector2, decreasing = TRUE)
identical(vector1,vector2)

####### Exercise 4 ########

data(WorldPhones)
WorldPhones_DataFrame <- WorldPhones

phones <- sum(WorldPhones_DataFrame['1960',])
phones

north_america <- sum(WorldPhones_DataFrame['1961','N.Amer'] - sum(WorldPhones_DataFrame['1951','N.Amer']))
north_america

####### Exercise 5 ########


data(WorldPhones)
WorldPhones_DataFrame <- WorldPhones



annual_phones <- rowSums(WorldPhones_DataFrame[,])
annual_phones


years <- rownames(WorldPhones_DataFrame[WorldPhones_DataFrame[,'S.Amer'] >= 3000, ])
years

