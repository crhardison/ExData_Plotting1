## Exploratory Data Analysis
## Christopher Hardison
## Code to generate plot 1 

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
png(file = "plot1.png", width = 480, height = 480)

## plot histogram with labels and title
hist(dataIn2$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

## Close Ping device
dev.off() 