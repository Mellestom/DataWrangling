# Thomas Melles
# 10/6/22
# Exam 1

rm(list=ls())
#setwd('~/Docs/School/Fall 2022/Data Wrangling/Exams/Exam 1')
######### Question 1 ###########

hbcu_data <- read.csv('Exam1Data.txt', sep = ';' , na.strings = c('',' ','-','NA','N/A'), encoding = "UTF-8")

######### Question 2 ###########

### Part A ###

# check the column types
str(hbcu_data)

# check for repeated rows
duplicated(hbcu_data)

# change earnings column to numeric
hbcu_data$earnings_edited <- hbcu_data$earnings
hbcu_data$earnings_edited<-gsub(",","",hbcu_data$earnings_edited)
hbcu_data$earnings_edited <- as.numeric(hbcu_data$earnings_edited)


### Part B ###

# use install_github commmand
library(devtools)
#install_github("CRAN/dataQualityR")
library(dataQualityR)

# check the data quality 
checkDataQuality(hbcu_data, 'hbcu_num.csv','hbcu_cat.csv')

### Part C ###

str(hbcu_data)

### Part D ###

for(i in 1:length(hbcu_data$state)){
  
    if (is.na(hbcu_data$verbal[i])) {
      
      hbcu_data$verbal[i] <- median(hbcu_data[which(hbcu_data$state == hbcu_data$state[i]), ]$verbal, na.rm=TRUE)
    }
  
    if (is.na(hbcu_data$math[i])) {
      hbcu_data$math[i] <- median(hbcu_data[which(hbcu_data$state == hbcu_data$state[i]), ]$math, na.rm=TRUE)
    }
}


hbcu_data$verbal[is.na(hbcu_data$verbal)] <- median(hbcu_data$verbal, na.rm=TRUE)
hbcu_data$math[is.na(hbcu_data$math)] <- median(hbcu_data$math, na.rm=TRUE)

### Part E ###

hbcu_data_Clean <- na.omit(hbcu_data)
library(jsonlite)
write_json(hbcu_data_Clean,'hbcu_clean.JSON', row.names = FALSE, encoding = "UTF-8")


############ Question 3 ##############

### Part A ###
hbcu_data_Clean$region <- hbcu_data_Clean$latitude

hbcu_data_Clean$region[which(hbcu_data_Clean$latitude > 36.3)] <- "North"
hbcu_data_Clean$region[which(hbcu_data_Clean$latitude <= 36.3)] <- "South"

### Part B ###

hbcu_data_Clean$payment <- hbcu_data_Clean$price

month_interest <- 0.051 / 12
periods <- 120

hbcu_data_Clean$payment <- (hbcu_data_Clean$debt * month_interest) / (1 - ((1 + month_interest)^-periods))

############# Question 4 ###############

### Part A ###

most_debt <- head(hbcu_data_Clean[order(-hbcu_data_Clean$debt),],5) 

### Part B ###
highest_salary <- head(hbcu_data_Clean[order(-hbcu_data_Clean$earnings_edited),],5)


### Part C ###

religious_public <- (sum(hbcu_data_Clean$religious == TRUE & hbcu_data_Clean$type == 'Public')) / nrow(hbcu_data_Clean) * 100
religious_private <- (sum(hbcu_data_Clean$religious == TRUE & hbcu_data_Clean$type == 'Private')) / nrow(hbcu_data_Clean) * 100 
notreligious_public <- (sum(hbcu_data_Clean$religious == FALSE & hbcu_data_Clean$type == 'Public')) / nrow(hbcu_data_Clean) * 100 
notreligious_private <- (sum(hbcu_data_Clean$religious == FALSE & hbcu_data_Clean$type == 'Private')) / nrow(hbcu_data_Clean) * 100

religious_matrix_data <- c(religious_public,notreligious_public,religious_private,notreligious_private)
religious_private_matrix <- matrix(religious_matrix_data, nrow = 2, ncol = 2)
rownames(religious_private_matrix) <- c('Public','Private')
colnames(religious_private_matrix) <- c('Religious','Not Religious')

############### Question 5 ###############

write.csv(hbcu_data_Clean, 'hbcu.csv', row.names = FALSE, fileEncoding = "UTF-8")
