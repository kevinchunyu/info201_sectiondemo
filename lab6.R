# LAB 6 Example Code

# Loading the stringr library
library(stringr)

# Assignment 1 - review/advice

# 1. Difference between using str_count and str_detect
# Many switched between the two. The difference is shown below: 

list_example = c("apple", "banana", "cream", "donut", "elephant")

# str_count - counts the number of patterns of each occurrence of every vowel
sum(str_count(list_example, "[aeiou]"))

# str_detect - matches with any occurrence that matches with given pattern 
sum(str_detect(list_example, "[aeiou]"))

# LECTURE REVIEW/EXAMPLE OF GGPLOTS

# load the ggplot library

library(ggplot2)

# get R built-in dataset of titanic
data <- mtcars

# MPG vs HP
# mpg: miles/gallon
# hp: gross horsepower

# 1. Scatter plot
scatter_mtcars <- ggplot(mtcars, aes(x = mpg, y = hp) ) + geom_point()

# 2. Bar plots
# Bar plot of the count of gears of each cars
bar_mtcars  <- ggplot(mtcars, aes(x = gear)) + geom_bar()

# 3. Histogram
# Histogram of the distribution of hp
hist_mtcars <- ggplot(mtcars, aes(hp)) + geom_histogram(binwidth = 25)

# 4. Adding labels, colors, titles for ggplot 

# HP vs AM
# horsepower versus transmission type (0 = automatic, 1 = manual)
labeled_mtcars <- ggplot(mtcars, aes(hp, am)) + geom_point(color="red", size =3) + 
    labs(title="mtcars - HP vs AM") +
    xlab("HP - gross horsepower") +
    ylab("Automatic (0) / Manual Transmission (1)")

# 5. adding color and aesthetics
# weight to miles per gallon
aes_blue_mtcars <- ggplot(mtcars, aes(wt, mpg, color = disp)) +
  geom_point()

# 6. using size as aesthetics
# Change the color aesthetic to a size aesthetic
# weight to miles per gallon
size_mtcars <- ggplot(mtcars, aes(wt, mpg, size = disp)) +
  geom_point()

# 7 More examples of data visualiation
# loading a new r-built-in data
data_2 <- data(diamonds)

diamonds_basic <- ggplot(diamonds, aes(carat, price)) + geom_point()

# 7a. diamonds changing alpha values (transparency)
diamonds_alpha <- ggplot(diamonds, aes(carat, price)) + geom_point(alpha=0.1)


# 7b. adding geom_smooth() with geom_point
diamonds_complex <- ggplot(diamonds, aes(carat, price)) +
  geom_point() +
  geom_smooth()






