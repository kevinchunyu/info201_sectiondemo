# lab 4 winter 2022

#### Vectors & Lists

# 1.) Adding vectors together and seeing how R "recycles" indexes
a <- c(1,2,3,4,5)
b <- c(1,2,3,4,5)

c <- a + b
# c will have values (2 4 6 8 10)

d <- c(1,2,3,4,5,6,7)

e <- a + d
# e will have values of (2,4,6,8,10,7,9)

# 2.) Choosing specific values in vectors
greater_than_3 <- a[a > 3]

# 3.) Values that are in between 2 and 5
between_two_five <- a[a > 2 & a < 5]

# Vectorized Functions 
# finding the mean of a vector/list
mean_a <- mean(a)


#### Dataframes
data <- read.csv("https://raw.githubusercontent.com/melaniewalsh/Neat-Datasets/main/1979-2020-National-Park-Visits-By-State.csv")

# Selecting Rows
# 1.) Selecting specific information from the dataframe
parknames <- data$ParkName

### R - bracket notation means [row, columns]
parknames_row <- data[2:6, ]

parknames_columns <- data[, 1:3]

# getting the first three rows and the first three columns of the data
combined <- data[1:3, 1:3]

# 2.) `parknames` is a vector data type - thus you can do all sorts of functions 
#     on it - as shown below.
unq_parknames <- unique(parknames)

avg_visits <- mean(data$RecreationVisits)

# 3.) Filtering a vector from a dataframe

data_test <- data$RecreationVisits[data$RecreationVisits > 1000]

# 4.) Calculate the average number of visits in the year 2000, with visits greater than 1,000,000
avg_2000 <- mean(data$RecreationVisits[data$RecreationVisits > 1000000 & data$Year == 2000])

#### More stringr (will help you on a1)
library(stringr)

cities <- c("Seattle, WA", "Los Angeles, CA", "Anchorage, AK", "Miami, FL", "Bellevue, WA")
# 1 .) str_detect() - Find the NUMBER of cities that are in WA
sum(str_detect(cities, "WA"))

demo_string <- "ana marie cauce"
# 2.) str_sub() example: Obtain the following string: "ana marie cau"
str_sub(demo_string, 1, 5)

#### 2a.) str_sub() on a vector - obtaining just a vector of state
state_vector <- str_sub(cities, -2, -1)

#### gsub()
# 1.) gsub() example: Replace all occurrences of "Boba Up" to "TP Tea"
boba_string <- "Boba Up is the best boba tea place on the Ave. Boba Up is just amazing."

gsub("Boba Up", "TP Tea", boba_string)

# 2.) Using gsub() to extract only the class code in the vector - using regex
classes <- c("MATH126 (Calc III)", "CSE373 (Data Structures and Algorithms)", "INFO370 (Intro to Data Science)")
class_codes <- gsub("\\(.*", "", classes) 

# 3.) Dealing with leading spaces in R in objects
class_codes_new <- trimws(class_codes)










