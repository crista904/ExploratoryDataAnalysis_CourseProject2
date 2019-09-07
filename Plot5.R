# Coursera
# Data Science Specialization - Johns Hopkins
# Exploratory Data Analysis
# Course Project 2

# Question 5
# How have emissions from motor vehicle sources changed 
# from 1999–2008 in Baltimore City?

# Import data
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

# Combine and select relevant data
combineddata <- full_join(NEI, SCC, by = "SCC")
Q5 <- combineddata %>% 
  select(Emissions, year, fips, EI.Sector) %>% 
  filter(fips == "24510") %>%
  filter(str_detect(EI.Sector, "Vehicle")) %>% 
  group_by(year) %>% 
  summarise(sum = sum(Emissions))

# Create plot and export
png("Plot5.png", width=480, height=480)
plot(Q5$year, Q5$sum, 
     ylab = "Total Emissions (tons)", 
     xlab = "Year", 
     main = "Total PM2.5 Emissions in Baltimore, MD from motor vehicles", 
     sub = "Decrease of -25.98 tons of emission per year", 
     pch = 19)

# Create trendline and calculate slope
abline(lm(Q5$sum ~ Q5$year, data = Q5), col = "blue")
lm(formula = Q5$sum ~ Q5$year, data = Q5)
dev.off()


# Answer to question 5
# Emissions from motor vehicle sources have decreased at a rate of  
# -25.98 tons per year from 1999–2008 in Baltimore City. 