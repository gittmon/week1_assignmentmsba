# load the required packages

library(tidyverse)
library(haven)

# import the data file into R
df <- read_dta("raw data/Datafile.dta")

# How many households are there in the full data set?
nrow(df)
# 109041
# Flag this Question

# How many variables are there?
ncol(df)
# 3588

# Flag this Question

# There is no reason to carry this many variables around so subset the data so 
# that you only keep the variables between "hhid" and "shstruc".
df2 <- df %>% select(hhid:shstruc)

# How many variables are you left with now?
ncol(df2)
# 196
# Flag this Question

# If you have not previously committed the R script you should do it now. You should have at least two commits with good commit messages by the time you are done with this assignment.

# Flag this Question


# Plot the distribution of the number of listed household members for the entire sample and upload here.
df2 %>% ggplot(aes(x = hv009)) + geom_histogram(binwidth = 1)  # univariate graphic, we analyze 1 variable, a histogram shows the distribution of the values of a numeric variable (continuous or discrete variable)

# Note 1: there are (at least) two different ways to do this using "ggplot." 
# If you use a histogram, make sure you pick a "binwidth" that makes sense for this variable.

# Note 2: there is a way to save plots directly in the script, but for this time simply export the plot from RStudio.

# Upload Choose a File

# Flag this Question

# Create a new data frame that contains only urban households (the variable is "hv025").
df3 <- filter(df2, hv025 == 1)

# Flag this Question

# Create a boxplot plot using the data frame you just created that shows the 
# distribution of household size by type of urban area. 
# You will need to use factor to get R to understand that the type of urban area 
# is a categorical variable.
df3 %>% ggplot(aes(x = as.factor(hv026), y = hv009)) + geom_boxplot() + 
  labs(x = "Type of urban areas", y = "Household size") + 
  scale_x_discrete(labels = c('Capital, large city','Small city','Town'))

# Label the variables and types of urban areas. The latter might take some Googling.

# Upload Choose a File

# Flag this Question

# Use "group_by" and "summarise" to find the means and medians of the number of 
# household members by type of urban area. 
df3 %>% group_by(hv026) %>% 
  summarise(mean_household_members = mean(hv009), median_household_members = median(hv009))


# Match the correct means to their urban areas.

# Group of answer choices

# Large City

# [ Choose ] 4.93 4.69 4.00 4.65 5.15 4.88

# Small City

# [ Choose ] 4.93 4.69 4.00 4.65 5.15 4.88

# Town

# [ Choose ] 4.93 4.69 4.00 4.65 5.15 4.88

# Flag this Question

# What does the relationship between the mean and median tell you about the distribution of household size?
# the mean of household size is larger than the median
# the distribution of household size has positive skew

# Please upload a link to your GitHub repository for the Week 1 assignment (the assignment is in GitHub Classroom at https://classroom.github.com/a/PzhUoSpv (Links to an external site.)). You should have the following when you submit:

# A GitHub repository
# An R project for the organization
# Separate folders/directories code, raw data, generated data, and figures
# An R script that fulfills the following:
# Load relevant libraries
# Uses only relative paths
# Provide appropriate comments
# Load data
# Performs simple data transformation and summaries
# Produces the plots
# Note: only the code directory will show up on GitHub because that is the only one with a committed file in it when you finish this assignment. If you want your other directories to show up on GitHub, you can add a ReadMe file to it and commit that.
