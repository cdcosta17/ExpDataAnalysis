# Loading the datasets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Aggregating the total emissions by year
emdata <- with(NEI, aggregate(Emissions, by=list(year), sum))
emdata$PM25 <- round(emdata[,2]/1000,2)

# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting 
# system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 
# 2005, and 2008.

# Plotting the data
png("plot1.png")
plot(emdata$Group.1,emdata$PM25,pch=18, type = "o", lty=2,main = expression('Total Emissions of PM'[2.5] ),
     xlab = "Years",ylab = "PM2.5 in Kilotons")
dev.off()

# From the data there has been a downward trend in total PM2.5 emissions over the period 1999-2008