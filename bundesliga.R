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

# See Which Players had the Highest Market Value
# Grouped by Name, get the Sum Total of Max_Price
max_marketVal <- bliga %>%
  group_by(name) %>%
  summarise(MaxValue = sum(max_price))

# Find the Top 10 Most Expensive Players
top10MV <- max_marketVal %>%
  arrange(desc(MaxValue)) %>%
  head(10)

# Print the Top 10 Most Expensive Players
cat("\nTop 10 Players by Market value (Millions):\n")
print(top10MV)

library(ggplot2)
# Create a bar chart for the top 10 players by total goals
plotTopMVs <- ggplot(top10MV, aes(x = reorder(paste(name), MaxValue), y = MaxValue)) +
  geom_bar(stat = "identity", fill = "orange") +
  labs(title = "Top 10 Most Expensive Players", x = "Player", y = "Max. Market Value (Millions)") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Save the plot
ggsave(filename = "plots/bundesliga/topMarketValue.png", plot = plotTopMVs, width = 10, height = 6)
