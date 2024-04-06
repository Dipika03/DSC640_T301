---
output:
  word_document: default
  html_document: default
  pdf_document: default
---

## ---------------------------

## Assignment: 2.2

## 

## Author: Dipika Sharma

## 

## DSC 640 T301 Data Presentation and Visualization

## 

## ---------------------------

## Lets import the libraries

library('readxl')

## Lets set the Working Directory

setwd("/Users/milindkumartandel/Desktop/Dipika bellevue/Data presentation Visualization/Week3&4/")

## Import data for visualization

worldPop \<- read_excel("world-population.xlsm")

## Line Chart

plot(worldPop$Year, worldPop$Population, type = 'l', ylim = c(0, 7e9), xlab = 'Year', ylab = 'Population', main = "World Population by Year")

## Step Chart

plot(worldPop$Year, worldPop$Population, type = 's', ylim = c(0, 7e9), xlab = 'Year', ylab = 'Population', main = "World Population by Year")
