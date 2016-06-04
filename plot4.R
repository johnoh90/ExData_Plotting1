#===================================================================
#Exploratory Data Analysis - Assignment 1
#PLOT 4
#===================================================================

#Reading Household Power Consumption data
data <- "household_power_consumption.txt"
allHH <- read.table(data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Create subset of household data for 1/2/2007 - 2/2/2007
subsetHH <- allHH[allHH$Date %in% c("1/2/2007", "2/2/2007") ,]
names(subsetHH)

#Convert to numeric and Date/Time
datetime <- strptime(paste(subsetHH$Date, subsetHH$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalactivepower <- as.numeric(subsetHH$Global_active_power)
globalreactivepower <- as.numeric(subsetHH$Global_reactive_power)
voltage <- as.numeric(subsetHH$Voltage)
submetering1 <- as.numeric(subsetHH$Sub_metering_1)
submetering2 <- as.numeric(subsetHH$Sub_metering_2)
submetering3 <- as.numeric(subsetHH$Sub_metering_3)

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2), mar = c(4,4,2,2))
#Plot 1 of 4
plot(datetime, globalactivepower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
#Plot 2 of 4
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
#Plot 3 of 4
plot(datetime, submetering1, type="l", ylab = "Energy Submetering", xlab = "")
lines(datetime, submetering2, type="l", col="red")
lines(datetime, submetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col = c("black", "red", "blue"), cex=0.75)
#Plot 4 of 4
plot(datetime, voltage, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
