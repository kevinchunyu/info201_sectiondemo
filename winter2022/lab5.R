### Lab 5 - INFO201 Winter 2022
library(dplyr)

data <- read.csv("https://raw.githubusercontent.com/melaniewalsh/Neat-Datasets/main/1979-2020-National-Park-Visits-By-State.csv")
# 1.) DPLYR Functions

# Filter to get National Parks in WA

#### using dplyr filters
data_wa <- data %>% filter(State == "WA")

#### using base-R to filter
data_wa_base_r <- data[data$State == "WA",]

##############################################
# AN EXAMPLE OF WHY WE USE PIPES (%>%) TO SIMPLIFY OUR CODE
# Filter to get 2017 and 2020 only
data_17_20 <- data_wa %>% filter(Year == 2019 | Year == 2020)

# Mutate and have location string "Parkname, Region, State". Example: "Mount Rainier, Pacific West, WA"
data_17_20_string <- data_17_20 %>% mutate(location_string = paste0(ParkName, ",", Region, ",", State))

# find park names used in the dataframe
park_names <- data_17_20_string %>% select(ParkName, location_string)

# Using the pipe operator to do the same thing above
data_park <- data %>% filter(State == "WA") %>% 
  filter(Year == 2019 | Year == 2020) %>% 
  mutate(location_string = paste0(ParkName, ",", Region, ",", State)) %>% 
  select(ParkName, location_string)

##############################
# GROUP BY IN DATAFRAMES
# In the data - we only want to have the TOTAL number of visit to all the parks from each state

# NOTE: WE NEED A FUNCTION/ACTION AFTER group_by. If we do not - we will not see any changes to our dataframe  
data_grouped <- data %>% group_by(State) %>% summarise(totalVisits = sum(RecreationVisits))


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



