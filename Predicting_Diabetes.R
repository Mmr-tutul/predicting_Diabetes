
#------------------------------------------------------------------------------------
# Title:   "Machine Learning: Predicting Diabetes using Pima Indians Data Set"
# Model:   "Random Forest Model"
# Author:  "Md. Mizanoor Rahman"
# Date:    "3rd August, 2020"
#--------------------------------------------------------------------------------------

#Install mlbench package to get the dataset
install.packages("mlbench")
library(mlbench)


#Get the dataset
dataset <- data("PimaIndiansDiabetes")
dataset <- PimaIndiansDiabetes


#Encoding categorical data
dataset$diabetes <- factor(dataset$diabetes,
                           levels = c('pos','neg'),
                           labels = c(1,0))

# Splitting the dataset into the Training set and Test set
install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$diabetes, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)


#store the actual data from test set
diabetes_test <- test_set$diabetes

#Remove the actual data from test set 
test_set <- test_set[,1:8]

# Fitting Random Forest Regression to the dataset
install.packages('randomForest')
library(randomForest)
set.seed(123)
regressor = randomForest(x= training_set[-9],
                         y= training_set$diabetes,
                         ntree = 500)
#Predict the test set
y_pred = predict(regressor, newdata = test_set)


#Compare with actual data and predicted data &
#check the accuracy of model
install.packages("caret")
library(caret)
confusionMatrix(y_pred,diabetes_test)

#Accuracy of the model is 73.48%

#--------------------------------------E--N--D----------------------------------






