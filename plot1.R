#===================================================================
#Exploratory Data Analysis - Assignment 1
#PLOT 1
#===================================================================

#Reading Household Power Consumption data
data <- "household_power_consumption.txt"
allHH <- read.table(data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Create subset of household data for 1/2/2007 - 2/2/2007
subsetHH <- allHH[allHH$Date %in% c("1/2/2007", "2/2/2007") ,]

#Convert Global_active_power to numeric
globalactivepower <- as.numeric(subsetHH$Global_active_power)

#Create png file and insert histograph
png(file = "plot1.png", width = 480, height = 480)
hist(globalactivepower, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()