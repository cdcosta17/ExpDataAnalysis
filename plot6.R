# Loading ggplot2
library(ggplot2)

# Loading the datasets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subsetting the data from Baltimore with motor vehicle related emissions
bmRoad <- subset(NEI,fips=='24510' & type=='ON-ROAD')
bmDF <- aggregate(bmRoad[,'Emissions'], by=list(bmRoad$year),sum)
colnames(bmDF) <- c('year','Emissions')
bmDF$City <- paste(rep('BM',4))

# Subsetting the data from Los Angeles with motor vehicle related emissions
laRoad <- subset(NEI,fips=='06037' & type=='ON-ROAD')
laDF <- aggregate(laRoad[,'Emissions'], by=list(laRoad$year),sum)
colnames(laDF)  <- c('year','Emissions')
laDF$City <- paste(rep('LA',4))

# Combining the Baltimore and Los Angeles Data
mrg <- rbind(bmDF,laDF)

# Compare emissions from motor vehicle sources in Baltimore City with emissions from motor 
# vehicle sources in Los Angeles County, California. Which city has seen greater changes over 
# time in motor vehicle emissions?


# Creating the plot
png("plot6.png")
ggplot(mrg, aes(year, Emissions,color=City))+geom_line()+guides(fill=T) + 
  ggtitle("Motor Vehicle-related Emissions in Baltimore vs Los Angeles") + xlab("Years") + 
  ylab(expression('PM'[2.5]))+facet_grid(.~City)
dev.off()

# The PM2.5 levels in Baltimore have shown a decline in emissions from vehicle-related source, whereas
# in LA the levels have increased during the same period. Also the levels in LA are much higher than Baltimore
# but this could be due to the difference in population