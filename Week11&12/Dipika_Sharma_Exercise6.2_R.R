## ---------------------------

## Assignment: 6.2

## 

## Author: Dipika Sharma

## 

## DSC 640 T301 Data Presentation and Visualization

## 

## ---------------------------

## Lets set the Working Directory

setwd("/Users/milindkumartandel/Desktop/Dipika bellevue/Data presentation Visualization/week11&12/")

## Lets import the required libraries
library(ggplot2)
library(stringr)  
library(reshape2) 
library(tm)       
library(readxl)
library(plotly)   
library(dplyr)

## Lets load the data
BirthRate_Df <- read.csv('birth-rate.csv')
CrimeRate_Df <- read.csv('crimeratesbystate-formatted.csv')
Education_Df <- read.csv("education.csv")

## Lets build the Histogram

## Creating a Histogram

ggplot(BirthRate_Df, aes(x=X2008)) +
  geom_histogram(binwidth = 2, fill="blue", color="blue", alpha=0.8) +
  xlim(0,60) +
  ggtitle('Birth Rate in Year 2008') +
  labs(x="Birth rate", y="Total")



## lets make the Box Plot chart

fig <- plot_ly(type = "box", y = CrimeRate_Df$motor_vehicle_theft, name="Motor Vehicle Theft")
        
fig <- fig %>% layout(title = "Boxplot for Motor Vehicle Theft")

## Lets show the Box Plot      
fig

## lets make the Bullet Chart
eduSummary <- read.csv("education_summary.csv")
ggplot(eduSummary, aes(Category, Average)) +
  geom_col(fill="56B4E9", width = 0.5) +
  geom_col(fill="blue", aes(Category, Actual), width = 0.2) +
  geom_errorbar(aes(y = Max, x = Category, 
                    ymin = Max, ymax = Max), 
                width = 0.45) +
  coord_flip() +
  ggtitle('Reading, Writing and Math Score') +
  labs(x="Section", y="Score")

## Lets work on Scatter Plot

ggplot(education_df, aes(x=reading, y=writing))+ geom_point(colour='blue') + theme_bw() + theme(panel.border = element_blank(), 
                                                                                       panel.grid.major = element_blank(), panel.grid.minor = element_blank(), axis.line = element_line(colour = "grey")) + xlab("Reading") + ylab("Writing") + ggtitle("Reading and Writing Scores")
