# Coursera
# Data Science Specialization - Johns Hopkins
# Exploratory Data Analysis
# Course Project 2

# Question 3
# 3a: Of the four types of sources indicated by the type (point, nonpoint, 
# onroad, nonroad) variable, which of these four sources have seen decreases 
# in emissions from 1999–2008 for Baltimore City? 
# 3b: Which have seen increases in emissions from 1999–2008? 
# Use the **ggplot2 plotting system** to make a plot answer this question.

# Import data first
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")

# Select relevant data
Q3 <- NEI %>% 
  select(Emissions, year, fips, type) %>% 
  filter(fips == "24510") %>% 
  group_by(type, year) %>% 
  summarise(sum = sum(Emissions))

# Create plot
ggplot(Q3, aes(year, sum, fill = year)) + 
  geom_bar(stat = "identity") + 
  facet_wrap(~ Q3$type) + 
  ggtitle("Baltimore City Emissions by Source") + 
  ylab("Total Emissions (Tons)") + 
  xlab("Year")
ggsave("Plot3.png", width=6, height=6)



# Answer to question 3

# Non-road, nonpoint and on-road have seen year-by-year decreases
# Point saw increases between 1999 - 2005 then a decreased from 
# 2005 - 2008 to approximately the levels it was in 1999.