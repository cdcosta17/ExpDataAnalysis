# Loading the datasets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Creating a subset for Maryland, Baltimore Data(fips=24510)
MD <- subset(NEI,fips=="24510")
MD$year <- factor(MD$year, levels=c('1999','2002','2005','2008'))
# Calculating the total emissions by year
bm <- tapply(MD$Emissions,MD$year, sum)


# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips=24510)
# from 1999 to 2008? Use the base plotting system to make a plot answering this question.

# Creating the plot
png("plot2.png")
barplot(bm, main = "Total Emissions in Baltimore, MD", xlab = "Years",
        ylab = expression('PM'[2.5]),col="blue")
dev.off()

# Total PM2.5 emissions have been decreasing in Baltimore except for 2005, which showed an increase 
# in total PM2.5 levels