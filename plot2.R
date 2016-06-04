#===================================================================
#Exploratory Data Analysis - Assignment 1
#PLOT 2
#===================================================================

#Reading Household Power Consumption data
data <- "household_power_consumption.txt"
allHH <- read.table(data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Create subset of household data for 1/2/2007 - 2/2/2007
subsetHH <- allHH[allHH$Date %in% c("1/2/2007", "2/2/2007") ,]

#Convert Global_active_power and Date/Time
globalactivepower <- as.numeric(subsetHH$Global_active_power)
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Create plot
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

