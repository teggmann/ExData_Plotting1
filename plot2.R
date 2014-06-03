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
par(mfrow=c(1,1))

# plot TWO
# copy to PNG
png(filename="plot2.png", width=480, height=480, bg="white")
with(data, plot(dateTime, Global_active_power, xlab="", 
                ylab="Global Active power (kilowatts)", type="l"))
dev.off()
