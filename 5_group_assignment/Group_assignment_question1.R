##### GROUP ASSIGNMENT QUESTION 1 ######

#datasets withthe ISLR book
# Import packages ISLR, dplyr, ggplot2
library(ISLR)
library(dplyr)
library(ggplot2)

#######################
### 1. IMPORT DATA ####
#######################

## This dataset comes with the ISLR book
Credit <- read.csv('./data/Credit.csv')


### 2. SUBSET OPERATIONS ###

# Total Balance and average Balance
sum(Credit$Balance)
mean(Credit$Balance)

### filter ###
# Student=='Yes' 
filter(Credit,Student=='Yes')
# Married=='Yes' AND Age>40
filter(Credit,Married=='Yes',Age>40)

# dataframe : Student=='Yes' 
df1 <- Credit[Credit$Student=='Yes',]
df2 <- Credit[Credit$Married=='Yes' & Credit$Age>40,]

# Total Balance and average Balance when Student=='Yes' 
sum(df1$Balance)
mean(df1$Balance)
# Total Balance and average Balance when Married=='Yes' AND Age>40 
sum(df2$Balance)
mean(df2$Balance)

##Histogram##
# Histogram plot of Balance
p <- ggplot(data=Credit, aes(x=Balance))
p + geom_histogram() + labs(x='Balance', y='Number of individuals', title='Histogram plot of Balance')

# Histogram plot of Limit
p <- ggplot(data=Credit, aes(x=Limit))
p + geom_histogram() + labs(x='Limit', y='Number of individuals', title='Histogram plot of Limit')

##Boxplot##
# Boxplot of Balance by Student
p <- ggplot(data=Credit, aes(x=Student, y=Balance))
p + geom_boxplot() 


###Addition of two numbers entered by the user - Question 1.7 ###
# Take two numbers as imputs
a <- readline(prompt='Enter your first number: ')
b <- readline(prompt='Enter your second number: ')
# Define the two numbers as numeric
a <- as.numeric(a)
b <- as.numeric(b)
# Calculation of the addition of the two numbers
c <- a + b
# Display of the result
print(paste("Addition of the two numbers is: ",c))


### Creation of a data frame - Question 1.8###
# Creation of a data frame when Income > 30 & Age > 29
cr <- Credit[Credit$Income>30 & Credit$Age>29,]
subset(cr)

# Print the number of colums and rows of the data frame & display of the results
nb.row <- nrow(cr)
nb.col <- ncol(cr)
print(paste("The number of rows in the dataset is: ",nb.row))
print(paste("The number of columns in the dataset is: ",nb.col))

# Write the dataset as a csv file 
write.csv(cr,"database.csv")

