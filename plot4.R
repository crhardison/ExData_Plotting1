## Exploratory Data Analysis
## Christopher Hardison
## Code to generate plot 4

## Read in table data
dataIn <- read.table("household_power_consumption.txt", header=TRUE, sep= ";", na.strings = c("?",""))

## Set Date column to correct data type 
dataIn$Date <- as.Date(dataIn$Date, format = "%d/%m/%Y")

## Create temp timestamp column combining date and time
dataIn$timetemp <- paste(dataIn$Date, dataIn$Time)

## Set Time column to timestamp in time format
dataIn$Time <- strptime(dataIn$timetemp, format = "%Y-%m-%d %H:%M:%S")

## Select rows for the dates we want to chart
dataIn2 <- dataIn[dataIn$Date>="2007-02-01" & dataIn$Date<="2007-02-02",]

## Declare ping file with dimensions 
png(file = "plot4.png", width = 480, height = 480)

## Set up columns 
par(mfcol = c(2,2))

## plot first chart with labels
plot(dataIn2$Time, dataIn2$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

## Create second chart with labels 
plot(dataIn2$Time, dataIn2$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")

## Add first graph
points(dataIn2$Time, dataIn2$Sub_metering_1, type = "l")

## Add second graph
points(dataIn2$Time, dataIn2$Sub_metering_2, type = "l", col = "red")

## Add third graph
points(dataIn2$Time, dataIn2$Sub_metering_3, type = "l", col = "blue")

## Add legend 
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), col = c("black", "red", "blue"), bty = "n")

## plot third chart with label for x axis
with(test2, plot(Time, Voltage, type = "l", xlab = "datetime"))

## plot fourth chart with label for x axis
with(test2, plot(Time, Global_reactive_power, type = "l", xlab = "datetime"))

## Close Ping device
dev.off() 