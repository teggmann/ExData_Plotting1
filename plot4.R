# set working directory
setwd("E:/DATA/Thomas/Coursera/GitHub/ExData_Plotting1")

# get file
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
fileName <- "Fhousehold_power_consumption.zip"

if (!file.exists(fileName)){
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile=fileName)
    unzip(fileName)
}
fileName <- "household_power_consumption.txt"

# load in data.frame
data <- read.csv(fileName, header=TRUE, sep=';', na.strings='?', stringsAsFactors=F)

# keep only data for day 2007-02-01 and 2007-02-02
data <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

# process data
# add column with date format for date and time
dateTime <- with(data, paste(Date, Time, sep=" "))
data$dateTime <- strptime(dateTime, format="%d/%m/%Y %H:%M:%S")

# plotting the graphs
# plot FOUR
par(mfrow=c(2,2))
png(filename="plot4.png", width=480, height=480, bg="white")

# first
with(data, plot(dateTime, Global_active_power, xlab="", 
                ylab="Global Active power", type="l"))

# second
with(data, plot(dateTime, Voltage, xlab="datetime", 
                ylab="Voltage", type="l"))

# third
with(data, plot(dateTime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
with(data, lines(dateTime, Sub_metering_2, type="l", col="red"))
with(data, lines(dateTime, Sub_metering_3, type="l", col="blue"))
legend(x="topright", col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       pch=c(NA), lty=1, bty="n", cex=0.75)

# fourth
with(data, plot(dateTime, Global_reactive_power, xlab="datetime", 
                ylab="Global_reactive_power", type="l"))
dev.off()