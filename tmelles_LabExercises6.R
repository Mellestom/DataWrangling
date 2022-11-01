# Thomas Melles
# 9/30/22
# Lab Exercises 6

rm(list=ls())

#setwd('~/Docs/School/Fall 2022/Data Wrangling/Lab Exercises/Lab Exercises 6')
######### Exercise 1 ##########

mortgage <- read.csv('mortgage.txt', sep = '|', na.strings = c('','-') )

summary(mortgage$CreditScore)
summary(mortgage$HomeAge)

CreditScore_mean<-mean(mortgage$CreditScore)
CreditScore_sd<-sd(mortgage$CreditScore)
mortgage$CreditScore2<-(mortgage$CreditScore-CreditScore_mean)/CreditScore_sd

HomeAge_mean<-mean(mortgage$HomeAge)
HomeAge_sd<-sd(mortgage$HomeAge)
mortgage$HomeAge2<-(mortgage$HomeAge-HomeAge_mean)/HomeAge_sd


########## Exercise 2 #########

mortgage2 <- read.csv('mortgage.txt', sep = '|', na.strings = c('','-') )

names(mortgage2)[names(mortgage2) == 'CreditCardDebt'] <- 'Debt'

HomeRange <- c(-Inf,9,24,Inf)
HomeLevel <- c('New','Med','Old')

mortgage2$AgeRange <- cut(mortgage2$HomeAge, HomeRange, HomeLevel)

########### Exercise 3 ##########

mortgage3 <- read.csv('mortgage.txt', sep = '|', na.strings = c('','-') )

DebtMin <- min(mortgage3$CreditCardDebt, na.rm = TRUE)
DebtMax <- max(mortgage3$CreditCardDebt, na.rm = TRUE)

mortgage3$Debt <- (mortgage3$CreditCardDebt - DebtMin) / (DebtMax - DebtMin)

mortgage3$CreditRage <- cut(mortgage3$CreditScore, breaks = 3, labels = c('Bad','Okay','Good'))

############ Exercise 4 ############

ufo <- read.csv('ufo.csv', stringsAsFactors = TRUE)

table(ufo$Shape)

levels(ufo$Shape)[which(levels(ufo$Shape) == 'Diamond' | levels(ufo$Shape) == 'Rectanglge' | levels(ufo$Shape) == 'Triangle')] <- 'Geometric'
levels(ufo$Shape)[which(levels(ufo$Shape) == 'Cigar' | levels(ufo$Shape) == 'Cylinder' | levels(ufo$Shape) == 'Disk' | levels(ufo$Shape) == 'Egg' | levels(ufo$Shape) == 'Oval' | levels(ufo$Shape) == 'Teardrop')] <- 'Rounded'
levels(ufo$Shape)[which(levels(ufo$Shape) == 'Changing' | levels(ufo$Shape) == 'Formation' | levels(ufo$Shape) == 'Other')] <- 'Other'
levels(ufo$Shape)[which(levels(ufo$Shape) == 'Circle' | levels(ufo$Shape) == 'Sphere')] <- 'Sphere'
levels(ufo$Shape)[which(levels(ufo$Shape) == 'Flash' | levels(ufo$Shape) == 'Light')] <- 'Light'
levels(ufo$Shape)[which(levels(ufo$Shape) == 'Unknown' | levels(ufo$Shape) == '')] <- 'Unknown'

levels(ufo$Shape)

########### Exercise 5 #########

ufo$Intensity

levels(ufo$Intensity)

ufo$Intensity <- factor(ufo$Intensity, levels = c('Low','Mid','High'))

levels(ufo$Intensity)

ufo$Witnesses2 <- ifelse(ufo$Witnesses > 1, 'Multiple','Single')
