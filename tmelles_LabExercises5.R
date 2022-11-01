# Thomas Melles
# 9/23/22
# Lab Exercises 5

rm(list=ls())
#setwd('~/Docs/School/Fall 2022/Data Wrangling/Lab Exercises/Lab Exercises 5/')
######### Exercise 1 ########

coaches <- read.csv('coaches.txt', sep = '#')
coaches <- unique(coaches)

coaches <- coaches[!duplicated(coaches$Coach),]

######### Exercise 2 ########

airport <- read.csv('airport_screening.txt', sep = '\t', header = TRUE, na.strings = c('','NA'))

missing <- sum(is.na(airport))

airport$Explosives2<-airport$Explosives # Create copy



airport$Explosives2[is.na(airport$Explosives)]<-
  mean(airport$Explosives2[which(airport$Year >= 1991 & airport$Year  <= 1995)], na.rm=TRUE)

######## Exercise 3 ########

airport2 <- read.table('airport_screening.txt', sep = '\t', header = TRUE, na.strings = c('NA',''))

missing2 <- colSums(is.na(airport2))

airport2$Explosives_edited <- airport2$Explosives
airport2$Explosives_edited[is.na(airport2$Explosives_edited)]<- max(airport2$Explosives_edited, na.rm = TRUE)


######## Exercise 4 ########

library(jsonlite)

nyt <- stream_in(file('newyorktimes.json'))

str(nyt)
View(nyt)

nyt$bestsellers_date_edited <- nyt$bestsellers_date
nyt$bestsellers_date_edited <- as.Date(nyt$bestsellers_date_edited)

nyt$published_date_edited <- nyt$published_date
nyt$published_date_edited <- as.Date(nyt$published_date_edited)

nyt$price_edited <- nyt$price
nyt$price_edited <- as.numeric(nyt$price_edited)

nyt$rank_edited <- nyt$rank
nyt$rank_edited <- as.integer(nyt$rank_edited)

nyt$rank_last_week_edited <- nyt$rank_last_week
nyt$rank_last_week_edited <- as.integer(nyt$rank_last_week_edited)

nyt$weeks_on_list_edited <- nyt$weeks_on_list
nyt$weeks_on_list_edited <- as.integer(nyt$weeks_on_list_edited)

######### Exercise 5 #########

library(jsonlite)

nyt2 <- stream_in(file('newyorktimes.json'))

nyt2$description[nyt2$description== ''] <- NA
nyt2$price[nyt2$price == 0] <- NA
nyt2$rank_last_week[nyt2$rank_last_week == 0] <- NA

missing3 <- colSums(is.na(nyt2))

