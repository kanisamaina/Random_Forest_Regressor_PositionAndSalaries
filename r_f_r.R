#Importing the dataset
dataset = read.csv('Position_Salaries.csv')
dataset=dataset[2:3]

#Splitting the dataset into Training set and Testing set
#install.packages("caTools")
# library(caTools)
# set.seed(123)
# split=sample.split(dataset$Purchased,SplitRatio = 0.8)
# training_set=subset(dataset,split==TRUE)
# test_set=subset(dataset,split==FALSE)

#Feature Scaling
# training_set[,2:3]=scale(training_set[,2:3])
# test_set[,2:3]=scale(test_set[,2:3])


#Fitting Random Forest Regression to the dataset
# install.packages('randomForest')
library(randomForest)
set.seed(1234)
regressor = randomForest(x = dataset[1],y = dataset$Salary,ntree = 500)

#Predicting a new result
y_pred=predict(regressor, newdata = data.frame(Level = 6.5))
print(y_pred)


# #Visualising the egression Model results
# # install.packages('ggplot2')
# library(ggplot2)
# ggplot()+
#   geom_point(aes(x = dataset$Level ,y = dataset$Salary),colour = 'red')+
#   geom_line(aes(x = dataset$Level ,y = predict(regressor,newdata = dataset)),colour = 'blue')+
#   ggtitle('Truth or Bluff(Regression Model)')+
#   xlab('Level')+
#   ylab('Salary')

#Visualising the Random Forest Regression results (for higher resolution and smoother curve)
x_grid = seq(min(dataset$Level), max(dataset$Level), 0.01)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = x_grid, y = predict(regressor,
                                        newdata = data.frame(Level = x_grid))),
            colour = 'blue') +
  ggtitle('Truth or Bluff (Random Forest Regression)') +
  xlab('Level') +
  ylab('Salary')
