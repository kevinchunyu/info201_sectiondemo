# INFO 201 Lab 2
# Review
# Variables and Functions, Data

# Declaring variables
# Can also use different operators ( +, *, %, /)
a <- 3
b <- 5
print(paste("A plus B is:", a + b))

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

## Assignment 1: Tips

# 1. Reading data from a csv file
data <- read.csv("info201_sectiondemo/data/countlove.csv")

# 2. View data in console, type assignment code in the file
# View(data)