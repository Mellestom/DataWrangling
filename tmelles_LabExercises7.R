# Thomas Melles
# 10/7/22
# Lab Exercises 7

rm(list=ls())

#setwd('~/Docs/School/Fall 2022/Data Wrangling/Lab Exercises/Lab Exercises 7')
###### Exercise 1 ######

library(xml2)

page <- read_html('example.html')

children <- xml_children(page)

children[[1]]

subchildren <- xml_children(children[[1]])
xml_text(subchildren[[7]])

#table<-xml_find_all(page, "//table[@id='Job Title']")
table<-xml_find_all(page, "//table")
table




###### Exercise 2 ######

page2 <- read_html('example.html')

open_source<-xml_find_all(page2, "//table[@id='tools']/tr/td[1]")
open_source<-xml_text(tools)

open_source2<-xml_attr(xml_find_all(page2, "//table[@id='tools']/
                            tr/td[1]/a"),"href")


######## Exercise 3 ########

menu <- read_xml("menu.xml")

prices<-xml_text(xml_find_all(menu, "/breakfast_menu/food/price"))

prices <- gsub("\\$", "", prices)
prices <- as.numeric(prices)

avg_price <- mean(prices)

########## Exercise 4 ########

french_toast<-xml_text(xml_find_all(menu, "//name[text()='French Toast']/../price"))

high_cal<-xml_text(xml_find_all(menu, "//calories[text()='950']/../name"))


####### Exercise 5 #######

cd <- read_xml('cds.xml')

nineties <-xml_text(xml_find_all(cd, "//CD[@year='1991']/./TITLE"))
nineties2 <-xml_text(xml_find_all(cd, "//CD[@year='1992']/./TITLE"))
nineties3 <-xml_text(xml_find_all(cd, "//CD[@year='1993']/./TITLE"))
nineties4 <-xml_text(xml_find_all(cd, "//CD[@year='1994']/./TITLE"))
nineties5 <-xml_text(xml_find_all(cd, "//CD[@year='1995']/./TITLE"))

ninties_titles <- c(nineties,nineties2,nineties3,nineties4,nineties5)

artists1 <- xml_text(xml_find_all(cd, "//CD[@year='1991']/./ARTIST"))
artists2 <- xml_text(xml_find_all(cd, "//CD[@year='1992']/./ARTIST"))
artists3 <- xml_text(xml_find_all(cd, "//CD[@year='1993']/./ARTIST"))
artists4 <- xml_text(xml_find_all(cd, "//CD[@year='1994']/./ARTIST"))
artists5 <- xml_text(xml_find_all(cd, "//CD[@year='1995']/./ARTIST"))

nineties_artists <- c(artists1,artists2,artists3,artists4,artists5)



                                