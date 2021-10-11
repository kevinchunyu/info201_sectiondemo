# INFO 201 Lab 2
# Review
# Variables and Functions, Data

# Declaring variables
# Can also use different operators ( +, *, %, /)
a <- 3
b <- 5
print(paste("A plus B is:", a + b))

# Functions
# Using mean, median, mode
list_data <- c(1,2,3,4,5)

get_stats <- function(list) {
  # Built-in functions in R: mean, median, min, max
  list_mean <- mean(list)
  list_median <- median(list)

  result <- paste("Mean:", list_mean, " Mode:", list_median)
  # Always add a return to your function even if R returns the last variable
  return(result)
}

print(get_stats(list_data))

## Assignment 1: Tips

# 1. Reading data from a csv file
data <- read.csv("info201_sectiondemo/data/countlove.csv")

# 2. View data in console, type assignment code in the file