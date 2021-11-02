# Lab 5 Example R Script 

# load the dplyr library
library(dplyr)

# loads Example data
data <- read.csv("https://raw.githubusercontent.com/nytimes/covid-19-data/master/us.csv")

# dplyr (review)
# load second dataset
data_2 <- read.csv("https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-states.csv")

# using groupby function
# 1. grouping by the state
# We want to obtain all the deaths (sum of deaths) of each state

# Summarise function here: creates a new column name called total_deaths that gets the sum of deaths
# AFTER the dataframe has been GROUPED BY each unique state in data_2

state_group <- data_2 %>% group_by(state) %>% summarise( total_deaths = sum(deaths) )

# OR .. we can chain commands line-by-line to achieve the same results
# state_group_2 <- group_by(data_2, state)
# summarise_deaths <- summarise(state_group, total_deaths = sum(deaths))
#   

# Function to be used in Rmarkdown
# Function that takes in a date and reports the number of deaths
data$date <- as.Date(data$date)

date_deaths <- function(date) {
  # converts the parameter date into a date type so we can compare it with the data
  # in the data set
  date_type <- as.Date(date)
  filter_df <- data %>% filter(data$date == date_type)
  return(filter_df$deaths)
}

