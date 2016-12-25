# Loading ggplot2
library(ggplot2)

# Loading the datasets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Creating a subset for Maryland, Baltimore Data(fips=24510)
MD <- subset(NEI,fips=="24510")
# MD$year <- factor(MD$year, levels=c('1999','2002','2005','2008'))
# Aggregating the total emissions by year
bm <- aggregate(MD[c("Emissions")],list(type=MD$type, year=MD$year),sum)


# Of the four types of sources indicated by the 𝚝𝚢𝚙𝚎 (point, nonpoint, onroad, nonroad)
# variable, which of these four sources have seen decreases in emissions from 1999–2008 for 
# Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system 
# to make a plot answer this question.

# Creating the plot
png("plot3.png")
qplot(year, Emissions, data = bm, color=type, geom = "line")+ggtitle("Emissions by type in Baltimore,MD")+xlab("Years")+ylab(expression('PM'[2.5]))
dev.off()

# Non point, non-road and on-road sources of emissions have decreased between 1999-2008, whereas, point sources 
# of emissions have increased until 2005, but are decreasing since then
