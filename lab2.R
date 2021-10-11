# INFO 201 Lab 2
# Review
# Variables and Functions, Data

# Declaring variables
# Can also use different operators ( +, *, %, /)
a <- 3
b <- 5
print(paste("A plus B is:", a + b))

# Logical Operators
string_var =  "Hello"
number_var = 7 
bool_var = TRUE

number_var > 10
string_var == "World" # Notice two equal signs
string_var != "Hello"

# Combine operators
(string_var == "Hello" | number_var == 5) # OR (LEFT OR RIGHT IS TRUE)

(string_var == "Hello" & number_var == 5) # AND
(string_var == "Hello" & number_var == 7)
(string_var == "Hello" & bool_var)



# Functions

# Sample conditional #1
grades <- c(90, 92, 21, 50, 75)


# get_class_status <- function(grades) {
#   if(mean(grades) > 90) {
#     print("Class is doing good.")
#   } else {
#     print("Class is doing not good.")
#   }
# }
# 
# get_class_status(grades)


# Sample conditional #2

# get_even_or_odd <- function(number) {
#   if (number %% 2 == 0 & number <= 10) {
#     print("Number is even and less than 10.")
#   } else {
#     # we know that the number is odd
#     if(number < 0) {
#       print("Number if odd and negative.")
#     } else {
#       print("Number is odd and positive.")
#     }
#   }
# }
# 
# get_even_or_odd(7)



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

## Assignment 1: Introduction

# 1. Reading data from a csv file
data <- read.csv("data/countlove.csv")

# 2. View data in console, type assignment code in the file
# View(data)

# 3. libraries
library(stringr)
# install.packages(stringr) if have not installed a new package
str_detect("hello", "ello")
str_count("memes", "e")

# 4. dataframes - accessing columns and reading data
# data$Date
# data$Location
