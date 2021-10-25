# INFO201 LAB 3
# 10/18/2021

# library 
library(stringr)

# Dataframes
data <- read.csv("data/countlove.csv")

# Extracting columns
location <- data$Location

# unique location
unique_location <- unique(location)
print(unique_location)


# string detection and how to use it
library(stringr)
sum(str_detect(unique_location, "NY"))

# dataframe review/lecture
class(data['Location']) # VECTOR

class(data[['Location']]) # CHARACTER 

# in general make sure you are familiar with both differences and when to use them
# Usually if you are graphing/plotting - single brackets - or use the dollar sign to get values

# Data frame manipulation and obtaining data


# Obtaining Attendees from data that are equal to exactly 1500
# Returns a data frame
# Contains NA values - which generally there are many different ways to ignore/not include these data
# into our results
attendees <-data$Attendees
a <- data[attendees == 1500, ]
a

# a note on dates
class(data$Date)

dates <- as.Date(data$Date)

class(dates)


