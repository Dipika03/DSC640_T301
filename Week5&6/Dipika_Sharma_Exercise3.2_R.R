## ---------------------------

## Assignment: 3.2

## 

## Author: Dipika Sharma

## 

## DSC 640 T301 Data Presentation and Visualization

## 

## ---------------------------

## Lets import the libraries

library(ggplot2)
library("xlsx")
library(reshape2)
library("dplyr") 
library(numbers)
library("treemap") 

## Lets set the Working Directory

setwd("/Users/milindkumartandel/Desktop/Dipika bellevue/Data presentation Visualization/Week5 & 6/")

## Import data for visualization
expenditures = read.table(file = "expenditures.txt", header = TRUE, sep = '\t', dec = '.', fill = TRUE)
unemployement = read.csv2(file = "unemployement-rate-1948-2010.csv", header = TRUE, sep=',')
unemployement$Value = as.numeric(as.character(unemployement$Value))

## Data structure:

str(expenditures)
str(unemployement)

## Tree map Chart:

treemap::treemap(expenditures,index = c('category'),
                 vSize = 'expenditure',
                 title = 'Expenditure by Category')

## Area Chart:

## Lets calculate the mean rating
unemployement_total = aggregate(Value ~ Year, unemployement, mean)

ggplot(unemployement_total, ggplot2::aes(x=Year , y=`Value`)) +
geom_area( fill='blue', alpha=.2) +
geom_line() +
ylab("Mean Rate") +
ggtitle('Unemployment rate by Year')
 
## Stacked Area Chart:
   

ggplot(expenditures, aes(x=year, y=expenditure, fill=category)) + geom_area() + ggtitle('Expenditures for each category by Year')
 
 
