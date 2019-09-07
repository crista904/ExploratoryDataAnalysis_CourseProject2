# Coursera
# Data Science Specialization - Johns Hopkins
# Exploratory Data Analysis
# Course Project 2

# Question 1
# Have total emissions from PM2.5 decreased in the United States from 1999 
# to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 
# emission from all sources for each of the years 1999, 2002, 2005, and 2008.

# Import data first
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")

# Select relevant data
Q1 <- NEI %>% 
  select(Emissions, year) %>% 
  group_by(year) %>% 
  summarise(sum = sum(Emissions))

# Make plot
png("Plot1.png", width=480, height=480)
barplot(Q1$sum, names.arg = Q1$year, 
        ylab = "Total Emissions (tons)", 
        xlab = "Year", 
        main = "Total PM2.5 Emissions per Year", 
        sub = "Rate of decrease is -392912 tons per year")
dev.off()


# Answer to question 1
# Total emissions from PM2.5 decreased in the United States from 1999 
# to 2008 have decreased at a rate of -392912 per year.
