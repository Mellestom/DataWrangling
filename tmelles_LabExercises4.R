# Thomas Melles
# 9/16/22
# Lab Exercises 4

####### Exercise 1 #######

rm(list=ls())
#setwd('~/Docs/School/Fall 2022/Data Wrangling/Lab Exercises/Lab Exercises 4/')

library(jsonlite)

iris <- fromJSON(file('iris.json'))
versicolor <- subset(iris,iris['species'] == 'versicolor')

write.table(versicolor, file = 'versicolor.txt', row.names = FALSE, sep = '\t')

####### Exercise 2 #######

rm(list=ls())
#setwd('~/Docs/School/Fall 2022/Data Wrangling/Lab Exercises/Lab Exercises 4/')

library(jsonlite)

toronto <- flatten(stream_in(file('toronto_fashion.json')))

top_businesses <- subset(toronto, stars > 4, select = c('name','city','stars','review_count','categories'))

write.csv(top_businesses, file='top_businesses.csv', row.names = TRUE)

######### Exercise 3 ########

rm(list=ls())
#setwd('~/Docs/School/Fall 2022/Data Wrangling/Lab Exercises/Lab Exercises 4/')

airport <- read.delim(file='airport_screening.txt',col.names = c('Year','Screened','Weapons','Handguns','Long_Guns','Firearms','Explosives','False_Info'))

airport_years <- subset(airport, 1990 <= airport$Year & airport$Year <= 2000)

write.table(airport_years, file = 'airport_years.txt', sep ='|', row.names = TRUE)

######## Exercise 4 ########

rm(list=ls())
#setwd('~/Docs/School/Fall 2022/Data Wrangling/Lab Exercises/Lab Exercises 4/')

airport2 <- read.csv('airport_screening.txt', row.names = 1, sep = '\t', na.string = c(' ','','NA'))

false_info <- rownames(airport2)[which(airport2$False.info == max(airport2$False.info))]


####### Exercise 5 ########

rm(list=ls())

library(jsonlite)
nyt <- stream_in(file('newyorktimes.json'))

bestsellers <- unique(subset(nyt, weeks_on_list >= 10, select = title))

write.table(bestsellers, 'bestsellers.txt')
