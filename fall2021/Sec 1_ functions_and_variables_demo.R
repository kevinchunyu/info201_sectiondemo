# User Ctrl/Cmd + Enter to run a line of code
# You can use the up/down arrow keys in the console to repeat commands
# You can also use the terminal tab to push into your repo 
#   But, before doing that remember to go to 
#   Session -> Set working directory -> to source file location
# You can also directly type commands into the console to debug things
# Notice formatting of code (spaces between operators)

# Variable types
number_var <- 7
string_var <- "Hello"
bool_var <- TRUE

# Mathematical operations
number_var + 3
number_var - 3
number_var / 3
number_var * 3
number_var %% 3 # mod operator, 
            # means remainder when number is divided by the number



# Logical operators
number_var > 10
string_var == "World" # Notice two equal signs
string_var != "Hello"

# Combine operators
(string_var == "Hello" | number_var == 5) # OR (LEFT OR RIGHT IS TRUE)

(string_var == "Hello" & number_var == 5) # AND
(string_var == "Hello" & number_var == 7)
(string_var == "Hello" & bool_var)

# FUNCTIONS

print(string_var)
# paste vs paste0 - IMPORTANT
paste(string_var, "World")
paste0(string_var, "World")

paste(string_var, "World", sep = "_")

# sub("replace this", "with this", in this)
sub("e", "i", "Memes")
sub("E", "i", "Memes") #it is case sensitive

# You can also use REGEX! (Regular Expression)
# sequence of characters that define a search pattern. 

# Anything that starts with h, replace with H
# ^ is the regular expression for "starts with"
gsub("^h", "H", "hello")

# Remove non alphanumeric characters
gsub("\\W", "", "12abc!&^%")


# substr(in this, go from this, to this)
substr("abcde", 3, 5) # includes both 3 and 5
substr("abcde", 2, 5) # does not start from 0

# install.packages("stringr")
library(stringr) # Check out the cheat sheet
str_count("memes", "e")
str_count("mEmEs", "e") # case sensitive

# in the real world, to check you do
str_count(tolower("mEmEs"), "e")

# CREATING FUNCTIONS

# From Chapter 6 Exercise 4:
# Define a function `describe_difference` that takes in two strings. The
# function should return one of the following sentences as appropriate
#   "Your first string is longer by N characters"
#   "Your second string is longer by N characters"
#   "Your strings are the same length!"

describe_difference <- function(first, second) {
    diff <- nchar(first) - nchar(second)
    if (diff > 0) {
        sentence <- paste("Your first string is longer by", diff, "characters")
    } else if (diff < 0) {
        sentence <- paste("Your second string is longer by", -diff, "characters")
    } else {
        sentence <- "Your strings are the same length!"
    }
    sentence # return the sentence
}

# Tip: If you don't know what's going wrong with your functions please put 
# some print statements at different times to see where the expected 
# route is deviating!