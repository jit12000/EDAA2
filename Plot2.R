## Plot 2
if(!exists("NEI")){
        NEI <- readRDS("D:/000 jit/003 Coursera/03 Exploratory Data Analysis/summarySCC_PM25.rds")
}
if(!exists("SCC")){
        SCC <- readRDS("D:/000 jit/003 Coursera/03 Exploratory Data Analysis/Source_Classification_Code.rds")
}

subsetNEI  <- NEI[NEI$fips=="24510", ]

aggregatedTotalByYear <- aggregate(Emissions ~ year, subsetNEI, sum)

png('plot2.png', ,width=480, height=480)
barplot(height=aggregatedTotalByYear$Emissions, names.arg=aggregatedTotalByYear$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' in the Baltimore City, MD emissions at various years'))
dev.off()