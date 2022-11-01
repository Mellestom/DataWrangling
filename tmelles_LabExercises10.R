# Thomas Melles
# 10/29/22
# Lab Exercises 10

rm(list = ls())

library(RSocrata)
library(Quandl)

url = "https://data.iowa.gov/resource/3adi-mht4.json"

recent_expenditure <- read.socrata(url)

url1 <- "https://data.iowa.gov/resource/3adi-mht4.json?$where=date>='2019-01-01T00:00:00.000'"
recent_expenditure1 <- read.socrata(url1)

url = "https://data.iowa.gov/resource/3adi-mht4.json?$where=amount>25000"
highest_expenditure <- read.socrata(url)

url1<-"https://data.iowa.gov/resource/3adi-mht4.json?$where=amount>25000&$select=committee_nm,amount"
highest_expenditure1 <- read.socrata(url1)

url<-"https://data.iowa.gov/resource/3adi-mht4.json?$where=amount>25000 AND date>='2019-01-01T00:00:00.000'&$select=committee_nm,amount"
recent_high_expenditures<-read.socrata(url)

########## Exercise 1 ##########
--UMICH/SOC22
homeValue <- Quandl('UMICH/SOC22')

########## Exercise 2 ##########
--FMAC/15US
mortgage <- Quandl('FMAC/15US')

########## Exercise 3 ##########
url <- "https://data.iowa.gov/resource/mw8r-vqy4.json?$where=age_at_release='25-34' OR age_at_release='Under 25'"
recidivism_young <- read.socrata(url)

########## Exercise 4 ##########

url <- "https://data.iowa.gov/resource/mw8r-vqy4.json?$where=days_return<=180 AND return_to_prison='Yes'"
recidivism <- read.socrata(url)

########## Exercise 5 ##########

