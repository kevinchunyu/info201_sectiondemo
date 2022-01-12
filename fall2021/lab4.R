# lab 4

# Lecture 6 Exercise Answers
# 1) Read in the female baby names data file into a variable called `names`
female_names_data <- read.csv('data/female_names.csv')

# 2) Create a data frame `names_2013` that contains only the rows for the year 2013
names_2013 <- female_names_data[female_names_data$year == 2013, ]

# 3) write in a comment the question "What was the most popular female name in 2013?" 
#    and answer. 
most_pop_name <- female_names_data[female_names_data$prop == max(names_2013$prop) , ]
print(most_pop_name)

# 4) Write a function `most_popular_in_year` that takes in a year as a value and
# returns the most popular name in that year
most_popular_in_year <- function(year) {
  filtered_year <- female_names_data[female_names_data$year == year, ]
  most_pop_name <- filtered_year[filtered_year$prop  == max(filtered_year$prop), ]
  return(most_pop_name$name)
}

most_popular_in_year(1961)
most_popular_in_year(1962)

# 5) write in a comment "What was the most popular female name in 1994?" and answer
most_popular_in_year(1964)

# 6) Write a function `number_in_million` that takes in a name and a year, and returns 
# statistically how many babies out of 1 million born that year have that name. 
# Hint: get the popularity percentage, and take that percentage out of 1 million.
number_in_million <- function(name, year) {
  df_name_year <- female_names_data[female_names_data$name == name & female_names_data$year == year, ]
  return( df_name_year$prop  / 1000000)
}

############################################################################
# SECTION CODING EXAMPLES

# loading dplyr
library(dplyr)
library(tidyverse)
data <- read.csv("data/countlove.csv")

###########################
# Filtering values
# filtering articles that are greater than 4 using dplyr
article_filter <- filter(data, Total.Articles > 4)

# filtering articles using built-in R
article_filter_v2 <- data[data$Total.Articles > 4, ]
  
############################
# Mutating data frames
# With mutating, make sure that you type the column names correctly
# If you accidentally run the code with the incorrect code, then you might run into
# problems when you source the whole document. In this case, you would usually have to
# re-source the code again for the correct output.

# Creating a new column that divides articles with attendees using dplyr
mutate_df <- mutate(data, article_per_attendee = Total.Articles/Attendees)

# Creating a new column using built-in R 
mutate_r <- data
mutate_r$art_per_attendee <- mutate_r$Total.Articles / mutate_r$Attendees

#################################
# Arrange
# DPLYR
# sorting numeric values 
sorted_attendees <- arrange(data, Attendees)
sorted_desc_attendees <- arrange(data, desc(Attendees))

# sorting multiple columns
sorted_both <- arrange(data, Attendees, Total.Articles)

# arrange also works with characters in alphabetical order
sorted_location <- arrange(data, Location)

# Using built-in R to sort columns
# ascending
sorted_attendees_r <- data[order(data$Attendees),]

# descending
sorted_attendees_desc_r <- data[order(-data$Attendees),]

################################
# JOIN IN DATAFRAMES
# data frame 1
df1 = data.frame(CustomerId = c(1:6), Product = c("Oven","Television","Mobile","WashingMachine","Lightings","Ipad"))
df1 

# data frame 2
df2 = data.frame(CustomerId = c(2, 4, 6, 7, 8), State = c("California","Newyork","Santiago","Texas","Indiana")) 
df2

# INNER JOIN
# I want to join df1 and df2 by customerId. The code below will join the columns that have matching
# customerId between the two dataframes.
inner_join_df <-  merge(x=df1,y=df2,by="CustomerId")
inner_join_df

# OUTER JOIN
# I want to join df1 and df2 by customerId. I also want to preserve every single data
outer_join_df <- merge(x=df1, y=df2, by="CustomerId", all=TRUE)
outer_join_df

# LEFT JOIN
# left join only returns all the rows of the left table (in this case being df1)
left_join_df <- merge(x=df1, y=df2, by="CustomerId", all.x=TRUE)
left_join_df

# RIGHT JOIN
right_join_df <- merge(x=df1, y=df2, by="CustomerId", all.y=TRUE)
right_join_df

##########################################
# Piping/Chaining Methods
# using the pipe symbol in R (%>%), we can chain a lot of dplyr methods together and sort our
# data frames with multiple conditions

# Filter location in WA, greater than 100 Attendees, and sorted by ascending order of attendees
example_chain_1 <- data %>% filter(str_detect(Location, 'WA') & Attendees > 100) %>% arrange(Attendees)







