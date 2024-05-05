## ---------------------------

## Assignment: 4.2

## 

## Author: Dipika Sharma

## 

## DSC 640 T301 Data Presentation and Visualization

## 

## ---------------------------

## Lets set the Working Directory

setwd("/Users/milindkumartandel/Desktop/Dipika bellevue/Data presentation Visualization/Week7&8/")

## Lets import the required libraries

library('ggplot2')
library('dplyr')
library('tidyverse')
library('mapview')
library('sf')
library(ggplot2)

## Lets load the data
CrimeRate <- read.csv("crimerates-by-state-2005.csv")
BirthRate <- read.csv("birth-rate.csv")

## Lets remove the outliers in the dataset
CrimeRate <- CrimeRate[CrimeRate$state != "District of Columbia",]

## Also removing United States to have clean charts.
CrimeRate <- CrimeRate[CrimeRate$state != "United States",]

## Lets build the Scatterplot

ggplot(CrimeRate, aes(x=murder, y=burglary)) +
  geom_point(col="blue") +
  theme_gray() +
  labs(x="Murders", y="Burglaries") +
  ggtitle("Murders vs Burglaries in the United States")


## lets make the Bubble chart
ggplot(CrimeRate, aes(x=murder, y=burglary, size=population)) +
  geom_point(alpha=0.7, col="blue") +
  scale_size(range=c(0.1,24), name="Population Size") +
  theme_gray() +
  labs(x="Murders", y="Burglaries") +
  ggtitle("Murders vs Burglaries in the United States")


## lets make the Density plot
ggplot(BirthRate, aes(x=X2008)) +
  geom_density(fill="blue", color="green", alpha=0.8) +
  xlim(0,65) +
  theme_gray() +
  labs(x="Live Births per 1,000 Population", y="Density") +
  ggtitle("Global Distribution of Birth Rates in 2008")





