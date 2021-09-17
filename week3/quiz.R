## Week 3 Quiz

library(datasets)
data(iris)
data(mtcars)
?iris

##############
# Question 1 #
##############

mean(iris[iris$Species == "virginica", ]$Sepal.Length)

##############
# Question 2 #
##############

apply(iris[, 1:4], 2, mean)

##############
# Question 3 #
##############

tapply(mtcars$mpg, mtcars$cyl, mean)
sapply(split(mtcars$mpg, mtcars$cyl), mean)
with(mtcars, tapply(mpg, cyl, mean))

##############
# Question 4 #
##############

x <- lapply(split(mtcars$mpg, mtcars$cyl), mean)
abs(x$`4` - x$`8`)














