## Plot 3

if(!exists("NEI")){
        NEI <- readRDS("D:/000 jit/003 Coursera/03 Exploratory Data Analysis/summarySCC_PM25.rds")
}
if(!exists("SCC")){
        SCC <- readRDS("D:/000 jit/003 Coursera/03 Exploratory Data Analysis/Source_Classification_Code.rds")
}

library(ggplot2)

subsetNEI  <- NEI[NEI$fips=="24510", ]

aggregatedTotalByYearAndType <- aggregate(Emissions ~ year + type, subsetNEI, sum)


png("plot3.png", width=640, height=640)
g <- ggplot(aggregatedTotalByYearAndType, aes(year, Emissions, color = type))
g <- g + geom_line() +
        xlab("year") +
        ylab(expression('Total PM'[2.5]*" Emissions")) +
        ggtitle('Total Emissions in Baltimore City, Maryland (fips == "24510") from 1999 to 2008')
print(g)
dev.off()