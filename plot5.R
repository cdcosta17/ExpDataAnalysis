# Loading ggplot2
library(ggplot2)

# Loading the datasets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subsetting the data from Baltimore with motor vehicle related emissions
bmRoad <- subset(NEI,fips==24510 & type=='ON-ROAD')
bmDF <- aggregate(bmRoad[,'Emissions'], by=list(bmRoad$year),sum)
colnames(bmDF) <- c('year','Emissions')

# How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

# Creating the plot
png("plot5.png")
ggplot(bmDF, aes(year, Emissions))+geom_line()+guides(fill=T) + 
  ggtitle("Motor Vehicle-related Emissions in Baltimore,MD") + xlab("Years") + 
  ylab(expression('PM'[2.5]))
dev.off()

# There has been a sharp decline in vehicle related emissions between 1999 and 2002, 
# following that period there has been a gradual decline in PM2.5 levels from vehicle related 
# emissions in Baltimore

