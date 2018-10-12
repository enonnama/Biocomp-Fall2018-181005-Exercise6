######## Exercise 6 ###########

## 1 ##

#Write R code that replicates the functionality of the head function we used in
# Unix. Your code should define a variable with the file to return lines from and a
# variable representing the number of lines to be returned from the top of the 
# indicated file. The selected file content should be printed to the terminal in R
#- use the 'iris.csv' file to complete this

rm(list=ls())
setwd("/Users/emilynonnamaker/Box/personalStuff/School/PhD/
      biocomputingFall2018/Exercise 6/Biocomp-Fall2018-181005-Exercise6-master")
flowers = read.csv("iris.csv")
head(flowers)
str (flowers)
# I want to find first ten entries for  sepal width 
head(flowers$Sepal.Width, n=10)

### Brittni: We wanted you to recreate head without using it. I took off 0.5 points
## nlines=10
## flowers[1:nlines,]

## 2 ##

# Load the data contained in the provided ‘iris.csv’ file and write R code to 
# do the following things:
#- print the last 2 rows in the last 2 columns to the R terminal
#- get the number of observations for each species included in the data set
#- get rows with Sepal.Width > 3.5
#- write the data for the species setosa to a comma-delimited file names ‘setosa.csv’
#- calculate the mean, minimum, and maximum of Petal.Length for observations of virginica

# Print last two rows and last two columns
# First look at tail to see what the last two rows are numbered
tail(flowers)
# Now apply those, 149 and 150 to tail, 
# in conjunction with last two columns, 4 and 5:
tail(flowers[c(149:150),c(4:5)])

### Brittni: The tail part is actually redundant. flowers[c(149:150),c(4:5)] works perfectly

# It's this:
#Petal.Width   Species
#149         2.3 virginica
#150         1.8 virginica

# Number of observations for each species:
# What are the different species?
unique(flowers$Species)
# virginica, versicolor, setosa
virginica = subset(flowers, flowers$Species=="virginica")
length(virginica) # it's 5
setosa = subset(flowers, flowers$Species=="setosa")
length(setosa) # it's 5
versicolor = subset(flowers, flowers$Species=="versicolor")
length(versicolor) # it's also 5, they're all 5. 

### Brittni: length() actually counts the number of columns, not the number of rows (observations). You would want to use nrow(), and this would give you 50 for all. I took off 0.25 points.

# get rows with sepal.width > 3.5: 
flowers[flowers$Sepal.Width > "3.5",]

### Brittni: I'm not entirely sure why this works, but you shouldn't use quotes since you're asking it to consider Sepal.Width numeric

# write just the setosa observations into a csv: 
setosa <- flowers[flowers$Species == "setosa",]
write.csv(setosa, "setosa.csv")

#subset to get just virginica
virgin = subset(flowers, flowers$Species == "virginica")
virgin
# now find the mean
mean(virgin$Petal.Length)
# it's  5.552
# now find the min and max using range
range(virgin$Petal.Length)
# min is 4.5, max is 6.9
