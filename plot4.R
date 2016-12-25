# Loading ggplot2
library(ggplot2)

# Loading the datasets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subsetting the coal related emissions 
coalSub <- SCC[grepl("Coal", SCC$Short.Name),]
sub1 <- NEI[NEI$SCC %in% coalSub$SCC,]

# Across the United States, how have emissions from coal 
# combustion-related sources changed from 1999–2008?

# Creating the plot
png("plot4.png")
ggplot(sub1,aes(x=factor(year), y = Emissions, fill = type))+geom_bar(stat="identity", width=0.5)+
  xlab("Year")+ggtitle("Total Emissions from Coal-related sources")
dev.off()

# Total emissions from coal related sources have been steady between 1999 and 2005,  but since then 
# have decreased