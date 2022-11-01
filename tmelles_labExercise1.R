# Thomas Melles
# 8/24/22
# Lab Exercises

####### Exercise 1 #########

rm(list=ls())

a <- 1
b <- 2
c <- 3

x <- b * c^2 + a
  
y <- ((a+c)^3) / b
  
z <- abs(b^-c - a)


####### Exercise 2 #########

donuts <- 86

orderSize <- 3

leftovers <- donuts%%orderSize


###### Exercise 3 ######

today <- Sys.Date()
due_date <- today+23

minutes <- difftime(due_date,today,units = 'mins')

paste("Rosemary's baby is due in ",minutes, 'minutes')


###### Exercise 4 ########

number_of_items <- 12
cost_per_case <- 34.99

order_subtotal <- number_of_items*cost_per_case

discount <- order_subtotal*0.04
subtotal_after_discount <- order_subtotal - discount
tax <- subtotal_after_discount*0.06
  
order_total <- order_subtotal + tax
round(order_total)  

###### Exercise 6 ########

sentence <- paste("My father's favorite book is \"Sackett's Land\" by Louis L'Amour")



