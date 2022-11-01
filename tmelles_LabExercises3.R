# Thomas Melles
# 9/9/22
# Lab Exercises 3

######## Exercise 1 ########

rm(list=ls())

#setwd('~/Docs/School/Fall 2022/Data Wrangling/Lab Exercises/Lab Exercises 3/')
load(file='grades.rda')

seniors <- data.frame(subset(grades,grades$Year == 'Senior'))

write.csv(seniors,'seniors.csv', row.names = FALSE)

####### Exercise 2 #######

load(file='grades.rda')

homework = as.character(rowSums(grades[,c('Assignment','Tutorial')]))

writeLines(homework,'homework.txt')


####### Exercise 3 #######

#setwd('~/Docs/School/Fall 2022/Data Wrangling/Lab Exercises/Lab Exercises 3/')

gpa <- as.numeric(readLines('gpa.txt'))

low_gpa <- gpa[which(gpa<3)]
top_ten <- as.character(sort(gpa[1:10], decreasing = TRUE))

writeLines(top_ten,'high_gpa.txt')

###### Exercise 4 ######

#setwd('~/Docs/School/Fall 2022/Data Wrangling/Lab Exercises/Lab Exercises 3/')

abc <- read.csv(file = 'abc_local_radio.csv', sep = ",")

nw_australia <- abc

#Option 1
nw_australia <- nw_australia[c('Station', 'Town', 'State', 'Longitude','Latitude')][which(nw_australia$Longitude < 135 & nw_australia$Latitude > -25), ]

#Option 2
nw_australia <- abc

nw_australia$Longitude[nw_australia$Longitude > 135] = NA
nw_australia$Latitude[nw_australia$Latitude < -25] = NA
nw_australia <- na.omit(nw_australia)
nw_australia[2] <- NULL
nw_australia[6:17] <- NULL

save(nw_australia, file = 'nw_australia.Rdata')


####### Exercise 5 #######

#setwd('~/Docs/School/Fall 2022/Data Wrangling/Lab Exercises/Lab Exercises 3/')
abc2 <- read.csv(file = 'abc_local_radio.csv', sep = ",", na.string = c('','NA'))

se_australia <- subset(abc2, !is.na(Twitter) & State == 'NSW' | State == 'VIC', select = c(State, Station, Twitter))
se_australia <- data.frame(State=se_australia$State,Station=se_australia$Station,Twitter=se_australia$Twitter)

write.csv(se_australia, file = 'se_australia.txt', row.names = FALSE)

