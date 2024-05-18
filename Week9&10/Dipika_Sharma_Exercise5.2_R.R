## ---------------------------

## Assignment: 5.2

## 

## Author: Dipika Sharma

## 

## DSC 640 T301 Data Presentation and Visualization

## 

## ---------------------------

## Lets set the Working Directory

setwd("/Users/milindkumartandel/Desktop/Dipika bellevue/Data presentation Visualization/Week9&10/")

## Lets import the required libraries

library('ggplot2')
library(plotly)
library('dplyr')
library('tidyverse')
library(maps)

## Lets load the data
df_Costcos <- read.csv("costcos-geocoded.csv", header = TRUE)
df_ppg <- read.csv("ppg2008.csv", header = TRUE, row.names = 1)

## For heatmap lets change data to matrix
df_ppg_matrix <- data.matrix(df_ppg)


## Lets build the Heat Map

## Creating a heat map
heatmap(df_ppg_matrix, Rowv = NA, Colv = NA,
        scale = 'column', margins = c(5,10),
        main = "Players Performance by Games")

## lets make the Spatial chart
## Creating a map 
map(database = 'state', 
    col = 'red')

## Assigning the values to marker
symbols(df_Costcos$Longitude, df_Costcos$Latitude, 
        bg = 'blue', 
        fg = 'white', 
        lwd = 0.1,
        circles = rep(1, length(df_Costcos$Longitude)), 
        inches = 0.05,  
        add = TRUE)     

## Lets add the title
title("Costcos Location in US", adj = 0)

## lets make the Lollipop Chart

df_ppg <- read.csv("ppg2008.csv", header = TRUE)
ggplot(df_ppg, aes(x=Name, y=G)) +
  geom_segment( aes(x=Name, xend=Name, y=0, yend=G)) +
  geom_point(size=4) + scale_x_discrete(guide = guide_axis(angle = 45)) +
  ggtitle("Team - G Players Performance") +
  xlab("Player Name") + 
  ylab("Team - G")

