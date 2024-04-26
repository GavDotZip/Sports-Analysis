# Dataset taken from https://www.kaggle.com/datasets/oles04/bundesliga-soccer-player

# Load the required library for data manipulation
library(dplyr)

# Read the CSV file into a dataframe
bliga <- read.csv("C:/Users/gavin/RProjects/Sports-Analysis/datasets/bundesliga_players.csv")

# View the structure of the dataframe
str(bliga)

# Display summary of data
cat("\nSummary of Data:\n")
print(summary(bliga))
