## ---------------------------
## Assignment: 1.2
##
## Author: Dipika Sharma
##
## DSC 640 T301 Data Presentation and Visualization
##
## ---------------------------

## -------Import libraries--------------------
library('ggplot2')
library('readxl')
library('purrr')
library('plyr')
library('dplyr')
library('magrittr')
library('stringr')
library('tidyverse')
library('tidyr')

## Obama dataframe
Obama_df <- read_excel("obama-approval-ratings.xls")
View(Obama_df)  

## HotDog dataframe
HotDog_df <- read_excel("hotdog-contest-winners.xlsm")
View(HotDog_df)   

## Lets create a bar chart
Obamabargraph<-ggplot(data=Obama_df, aes(x=Approve, y=Issue)) + geom_bar(stat="identity", color="Blue", fill="Blue") + theme(text = element_text(size=10), axis.text.x = element_text(angle=90, hjust=.1)) + coord_flip() + ggtitle("Approval Ratings of Issues") + xlab("Approve") + ylab("Issue")

## Displaying the bar chart
Obamabargraph

## Lets convert data of Obama dataframe to long format
long_df <- gather(obama_df, Type, value, Approve:None, factor_key=TRUE)

## Creating levels
long_df$Type <- factor(long_df$Type, levels = c('None', 'Disapprove', 'Approve'))    
Type <- c('Approve', 'Disapprove', 'None')

## Lets create stacked bar chart
ObamaStackedBar <- ggplot(long_df, aes(fill=Type, y=value, x=Issue)) + 
  +     geom_bar(position="stack", stat="identity") + 
  +     ggtitle("Issues Rating") + xlab("Issue") + ylab("Approve, Disapprove, and None") + scale_fill_manual(values = c("green","red","blue")) + theme(axis.text.x = element_text(angle = 90))

## Lets display the stacked bar chart
ObamaStackedBar

## Lets have rating and type from Obama dataframe
rating <- c(obama_df$Approve[10], obama_df$Disapprove[10], obama_df$None[10])
type <- c('Approve', 'Disapprove', 'None')

## Lets create new dataframe with rating and type
data <- data.frame(group=type, value=rating)

## Working on Pie Chart
ObamaPieChart <- ggplot(data, aes(x="", y=rating, fill=Type))+
  +     geom_bar(stat="identity", width=1, color="white") +
  +     coord_polar("y", start=0) + theme_void() + 
  +     ggtitle("Issues Rating") + geom_text(aes(label = value), color = "white", position = position_stack(vjust = 0.5)) + scale_fill_manual(values=c("green","red","blue"))

## Lets display the Pie Chart
ObamaPieChart

## Lets set the hole size for donut chart
hsize <- 4

## Donut Chart
obamadonut <- ggplot(data, aes(x=hsize, y=rating, fill=Type))+
  +     geom_col() +
  +     coord_polar(theta = "y") +
  +     xlim(c(1, hsize + 0.5)) +
  +     ggtitle("Issues Rating")+ xlab("") + ylab("") + geom_text(aes(label = value), color = "white", position = position_stack(vjust = 0.5)) + scale_fill_manual(values=c("green","red","blue"))

## Lets display Donut Chart
obamadonut
