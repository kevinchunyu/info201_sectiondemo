### INFO BB Winter: Lab 7
## GGPLOTS
# Demonstration for mapping data

library(ggplot2)
library(tidyverse)
library(maps)
library(mapproj)
library(patchwork)

# Mapping data in R using ggplot2

# Goal: create a map of covid cases across counties in WA (as of most recent date)=

# Step 1: load in the dataset
national <- read.csv("https://raw.githubusercontent.com/nytimes/covid-19-data/master/us.csv")
states <- read.csv("https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-states.csv")
counties <- read.csv("https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-counties.csv")
# gets dates in nice format
states$date <- as.Date(states$date)

# Step 2: Get most recent counties data from dataset
counties_mod <- counties %>%
  filter(date == max(date))

# Step 3: Use map_data function to join covid `counties` dataset with the map_data for county
#         (remember to filter for Washington)
## unite = polyname refers to the column name, region and sub region separated by a comma is as follows in line 36
## NOTE: COUNTY.FIPS in line 37 is also a given dataframe in mapproj package
county_shapes <- map_data("county") %>%
  unite(polyname, region, subregion, sep = ",") %>%
  left_join(county.fips, by="polyname")

# Step 4: Merge map data and filtered covid data together
map_data <- county_shapes %>%
  left_join(counties_mod, by="fips") %>%
  filter(state == "Washington"& county != "Unknown")


# Step 5: Incorporate blank theme (essentially allows the map to be outputted nicely without
# #         any weird axes or other such "graph-things" in the way)
blank_theme <- theme_bw() +
  theme(
    axis.line = element_blank(), # remove axis lines
    axis.text = element_blank(), # remove axis labels
    axis.ticks = element_blank(), # remove axis ticks
    axis.title = element_blank(), # remove axis titles
    plot.background = element_blank(), # remove gray background
    panel.grid.major = element_blank(), # remove major grid lines
    panel.grid.minor = element_blank(), # remove minor grid lines
    panel.border = element_blank() # remove border around plot
  )

# Step 6: Create the map
cases_map <- ggplot(map_data) +
  geom_polygon(
    mapping = aes(x = long, y = lat, group = group, fill = cases),
    color="gray", size = 0.3
  ) +
  coord_map() +
  scale_fill_continuous(limits = c(0, max(map_data$cases)), na.value = "white", low="yellow", high="red") +
  ggtitle("Covid cases of counties in Washington")
