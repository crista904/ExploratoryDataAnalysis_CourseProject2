# Coursera
# Data Science Specialization - Johns Hopkins
# Exploratory Data Analysis
# Course Project 2

# Question 2
# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland
# (fips == "24510") from 1999 to 2008? 
# Use the base plotting system to make a plot answering this question.

# Import data first
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")

# Select relevant data
Q2 <- NEI %>% 
  select(Emissions, year, fips) %>% 
  filter(fips == "24510") %>% 
  group_by(year) %>% 
  summarise(sum = sum(Emissions))

# Create plot using base plotting system
png("Plot2.png", width=480, height=480)
plot(Q2$year, Q2$sum, 
     ylab = "Total Emissions (tons)", 
     xlab = "Year", 
     main = "Total PM2.5 Emissions in Baltimore, MD", 
     sub = "Decrease of -119.9 tons of emission per year", 
     pch = 19)
abline(lm(Q2$sum ~ Q2$year, data = Q2), col = "blue")

#The below portion will give you the  trendline with slope so you can see change over time.
lm(formula = Q2$sum ~ Q2$year, data = Q2)

dev.off()

# Answer to question 2
# Total emissions from PM2.5 have decreased in the Baltimore City, Maryland
# from 1999 to 2008 at a rate of -119.9 tons per year.