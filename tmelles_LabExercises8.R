# Thomas Melles
# 10/14/22
# Lab Exercises 8

rm(list=ls())

#setwd('~/Docs/School/Fall 2022/Data Wrangling/Lab Exercises/Lab Exercises 8/')

##### Exercise 1 #####

books

books$url_edited <- paste('http://books.toscrape.com/', books$url, sep = "")

books$star_edited[books$star== 'star-rating One'] <- 1
books$star_edited[books$star== 'star-rating Two'] <- 2
books$star_edited[books$star== 'star-rating Three'] <- 3
books$star_edited[books$star== 'star-rating Four'] <- 4
books$star_edited[books$star== 'star-rating Five'] <- 5

books$star_edited <- as.integer(books$star_edited)

books$price_edited <- as.numeric(gsub("\\£", "", books$price))

books$availability_edited <- trimws(books$availability)


##### Exercise 2 #####

url2 <- character(0)
title2 <- character(0)
star2 <- character(0)
price2 <- character(0)
availability2 <- character(0)

for (i in 1:50) {
  link<-paste("http://books.toscrape.com/catalogue/page-", i, ".html",
              sep="")
  
  url<-xml_attr(xml_find_all(page,"//article[@class='product_pod']/div[@class='image_container']/a"),"href")
  url2<-c(url2, url)
  
  title<-xml_attr(xml_find_all(page,"//article[@class='product_pod']/h3/a"),"title")
  title2<-c(title2, title)
  
  star<-xml_attr(xml_find_all(page,"//article[@class='product_pod']/p"),"class")
  star2<-c(star2, star)
  
  price<-xml_text(xml_find_all(page,"//article[@class='product_pod']/div[@class='product_price']/p[1]"))
  price2<-c(price2, price)
  
  availability<-xml_text(xml_find_all(page,"//article[@class='product_pod']//p[@class='instock availability']"))
  availability2<-c(availability2, availability)
}

all_books<-data.frame(url2, title2, star2, price2, availability2)

##### Exercise 3 ##### 

page<-read_html("http://books.toscrape.com/catalogue/a-light-in-the-attic_1000/index.html")

upc<-xml_text(xml_find_all(page, "//table//tr[1]/td"))

product_type<-xml_text(xml_find_all(page, "//table//tr[2]/td"))

review<-xml_text(xml_find_all(page, "//table//tr[7]/td"))

upc<-xml_text(xml_find_all(page,"//table//th[text()='UPC']/following-sibling::td"))

product_type<-xml_text(xml_find_all(page, "//table//th[text()='Product Type']/following-sibling::td"))

review<-xml_text(xml_find_all(page,"//table//th[text()='Number of reviews']/following-sibling::td"))

##### Exercise 4 #####

page<-read_html("http://books.toscrape.com/catalogue/a-light-in-the-attic_1000/index.html")

copies<-xml_text(xml_find_all(page,"//table//th[text()='Availability']/following-sibling::td"))

copies<-gsub("[^0-9]", "", copies)
copies<-as.integer(copies)

copies<-xml_text(xml_find_all(page,"//p[@class='instock availability']"))

copies<-trimws(copies)
copies<-gsub("In stock (", "", copies, fixed=TRUE)
copies<-gsub(" available)", "", copies)
copies<-as.integer(copies)

##### Exercise 5 #####

descriptions<-character(0)
for (u in books$url) {
  full_url<-paste("http://books.toscrape.com/",u,sep="")
  
  page<-read_html(full_url)
  
  description<-xml_text(xml_find_all(page,"//div[@id='product_description']/following-sibling::p"))
  descriptions<-c(descriptions, description)
}

