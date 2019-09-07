# Coursera
# Data Science Specialization - Johns Hopkins
# Exploratory Data Analysis
# Course Project 2

# Question 4

# Across the United States, how have emissions from coal combustion-related 
# sources changed from 1999–2008?

# Import data
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

# Combine and select relevant data
combineddata <- full_join(NEI, SCC, by = "SCC")

Q4 <- combineddata %>% 
  select(EI.Sector, Emissions, year) %>% 
  filter(str_detect(EI.Sector, "Comb")) %>% 
  filter(str_detect(EI.Sector, "Coal")) %>% 
  group_by(year) %>% 
  summarise(sum = sum(Emissions))

# Create plot
png("Plot4.png", width=480, height=480)
barplot(Q4$sum, 
        names.arg = Q4$year, 
        ylab = "Total Emissions (tons)", 
        xlab = "Year", 
        main = "Total Coal-related PM2.5 Emissions per Year", 
        sub = " ")
dev.off()

# Answer to question 4
# Emissions from coal combustion-related sources decreased from 1999–2008.