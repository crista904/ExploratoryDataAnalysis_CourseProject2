# Coursera
# Data Science Specialization - Johns Hopkins
# Exploratory Data Analysis
# Course Project 2

# Question 6
# Compare emissions from motor vehicle sources in Baltimore City 
# with emissions from motor vehicle sources in Los Angeles County, 
# California (fips=="06037"). Which city has seen greater changes 
# over time in motor vehicle emissions?
  
# Import data
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

# Combine and select relevant data
combineddata <- full_join(NEI, SCC, by = "SCC")

Q5 <- combineddata %>% 
  select(Emissions, year, fips, EI.Sector) %>% 
  filter(fips == "24510" | fips == "06037") %>%
  filter(str_detect(EI.Sector, "Vehicle")) %>%
  group_by(year, fips) %>% 
  summarise(sum = sum(Emissions)) 

# Create plot
ggplot(Q5, aes(year, sum, fill = fips)) + 
  geom_bar(stat = "identity", position = "dodge") +
  ggtitle("Baltimore versus Los Angeles County Emissions\n(From motor vehicles only)") + 
  ylab("Total Emissions (Tons)") + 
  xlab("Year") +
  scale_fill_discrete(name = "County", labels = c("Los Angeles", "Baltimore"))
ggsave("Plot6.png")

# Answer to question 6
# LA has a much higher level of motor vehicle emissions when compared to 
# Baltimore. LA has seen a higher increase over time (Emissions rose from 1998
# - 2005 then dropped from 2005 - 2008) whereas Baltimore has seen a 
# decrease in emissions from 1998 - 2008. 