# Thomas Melles
# 10/24/22
# Homework 4

rm(list=ls())
#setwd('~/Docs/School/Fall 2022/Data Wrangling/Homework/Homework 4/')

########## Question 1 ##########

library(xml2)

name2 <- character(0)
year2 <- character(0)
wins2 <- character(0)
losses2 <- character(0)

for (i in 1:6) {
  url <- paste('https://www.scrapethissite.com/pages/forms/?page_num=',i,'&per_page=100', sep ='')
  page <- read_html(url)
  
  print(i)
    
  name <- xml_text(xml_find_all(page,"//td[@class='name']"))
  name2 <- c(name2,name)
    
  year <- xml_text(xml_find_all(page,"//td[@class='year']"))
  year2 <- c(year2,year)
    
  wins <- xml_text(xml_find_all(page,"//td[@class='wins']"))
  wins2 <- c(wins2,wins)
    
  losses <- xml_text(xml_find_all(page,"//td[@class='losses']"))
  losses2 <- c(losses2,losses)
  
  Sys.sleep(5)
}

nhl<- data.frame(name2,year2,wins2,losses2)

########## Question 2 ##########
losses <- trimws(losses2)
name <- trimws(name2)
wins <- trimws(wins2)
year <- trimws(year2)

rm(name2,wins2,losses2,year2)

nhl <- data.frame(name,year,wins,losses)

nhl <- setNames(nhl, c("Team","Year","Wins",'Losses'))

nhl$Year <- as.integer(nhl$Year)
nhl$Wins <- as.integer(nhl$Wins)
nhl$Losses <- as.integer(nhl$Losses)

########## Question 3 ##########

library(readxl)

nhl_expanded <- read_excel('nhl_2012-2021.xlsx', skip = 1)

nhl_expanded <- subset(nhl_expanded, select = c('Team','W','L','Season'))

colnames(nhl_expanded)[which(names(nhl_expanded) == 'W')] <- 'Wins'
colnames(nhl_expanded)[which(names(nhl_expanded) == 'L')] <- 'Losses'
colnames(nhl_expanded)[which(names(nhl_expanded) == 'Season')] <- 'Year'

nhl_expanded$Team <- gsub('\\*','', nhl_expanded$Team)

nhl2 <- rbind(nhl,nhl_expanded)

nhl2$WinPercent <- (nhl2$Wins/(nhl2$Wins + nhl2$Losses))*100

########## Question 4 ##########

arena <- read.csv('nhl_hockey_arenas.csv')

colnames(arena)[which(names(arena) == 'Team.Name')] <- 'Team'
colnames(arena)[which(names(arena) == 'Arena.Name')] <- 'Arena'
colnames(arena)[which(names(arena) == 'Arena.Location')] <- 'Location'
colnames(arena)[which(names(arena) == 'Seating.Capacity')] <- 'Capacity'
arena$Opening.Year <- NULL

nhl2$Team_Edited <- nhl2$Team

nhl2$Team_Edited[nhl2$Team_Edited == 'Mighty Ducks of Anaheim'] <- 'Anaheim Ducks'

nhl2$Team <- nhl2$Team_Edited
nhl2$Team_Edited <- NULL

nhl3<-merge(arena,nhl2, by="Team", all.y = TRUE)

########## Question 5 ##########

write.csv(nhl3, file = 'hockey_data.csv')

