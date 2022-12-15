##### GROUP ASSIGNMENT QUESTION 2 ######

#######################
### 1. IMPORT DATA ####
#######################

#import data
# Data: Default dataset in the ISLR has sample data on credit card customers
# Import package ISLR
library(ISLR)
df <- Default

#structure of the dataset
str(df)
# summary stats
summary(df)

#####################
### 2. CLEAN DATA ###
#####################

#check for NAs/missing values
any(is.na(df))

### set correct data types for columns
## factor() : set categorical columns as factors
# df$var <- factor(df$factor)
df$default <- factor(df$default)
df$student <- factor(df$student)

#######################
### 3. BUILD MODEL ####
#######################

## Split data into Train and Test Groups
# Import package caTools
library(caTools)

#split up the sample. a boolean vector split is generated
# SplitRatio = percent of sample==TRUE
split <- sample.split(df$default, SplitRatio = 0.75) # SplitRatio = percent of sample==TRUE

# Training Data
train = subset(df, split == TRUE)

# Testing Data
test = subset(df, split == FALSE)

## TRAIN model on train group
# logistic regression model in order to predict Default = Yes

# how is dummy variable created for default
contrasts(df$default)  # Yes=1, No=0 ; model will be trained for probability of default

## Train the model for default = Yes
glm.fits=glm(default ~ student + balance + income , data=train ,family=binomial)

#model summary
summary(glm.fits)

# model trained for probability of default=Yes
contrasts(train$default)  # Yes=1, No=0

# coef() function in order to access just the coefficients for this fitted model
coef(glm.fits)

########################
### 4. TEST  MODEL  ####
########################

## TEST MODEL USING TEST DATA 

# vector with predicted PROBABILITY of default using and test data, using the mdoel created using train data
glm.probs=predict(glm.fits,newdata=test,type="response")
# print first 10 probabilities
glm.probs[1:10]

# convert these predicted probabilities into class labels, Yes or No
glm.pred <- ifelse(glm.probs > 0.5,"Yes","No")

## CONFUSION MATRIX 
#in order to determine how many observations were correctly or incorrectly classified.
table(glm.pred,test$default)

# accuracy (tp+tn)/total
(22+2407)/(2500)  # 0.97 -  - But high false negatives. model not good.

# recall tp/(tp+fn) - what proportion of the true defaulters were predicted as defaulter
22/(22+10)  ## 69% recall

# precision tp/(tp+fp) - of the ones predicted Yes (Defaulter), how many are actually Yes (defaulter)
22/(22+61)  ## 27%

## misclassification = 1 - accuracy = 1 - 0.97 = 3%
mean(glm.pred!=test$default)

#####################################################
### 5. MODELING ITERATION  - sort class imbalance ###
#####################################################

# Import package dplyr
library(dplyr)

## SORT CLASS IMBALANCE IN PREDICTOR
# defaulters - 333
df.yes <- df[df$default=='Yes',]

# non-defaulters - 9667
df.no <- df[df$default=='No',]











