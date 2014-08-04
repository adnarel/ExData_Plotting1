
## Exploratory Data Analysis
## exdata-005
## Project 1, Plot 4

## R code for reading in power consumption text file
## for dates Feb 1-2, 2007
## and creating Plot 4

## Part 1 - read in input file and format the table for further analysis
## assume input file is unzipped and in local directory

## read header of input file into a vector of names

header <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?",nrows = 1)

## read data for Feb 1-2, 2007 into a table

power_data <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?",nrows=2880, skip = 66637)

## use transposed header as column names for data frame

names(power_data) <- t(header)

## paste Date and Time values together 

date_time <- paste(power_data[,1],power_data[,2],sep=" ")

## Format Date/Time variable

date_time <- strptime(date_time, format="%d/%m/%Y %H:%M:%S")

## Add Date/Time variable to data table

power_data$Date_Time <- date_time


## Part 2 - create Plot 4 from formatted table

## plot 4 graphs on one image

par(mfrow=c(2,2),cex=0.79)

## Upper-left Plot

plot(power_data$Date_Time,
     power_data$Global_active_power,
           type = "l",
           xlab = "",
           ylab = 'Global Active Power')

## Upper-right plot

plot(power_data$Date_Time,
     power_data$Voltage,
           type = "l",
           xlab = "datetime",
           ylab = 'Voltage')

## Lower-left Plot

plot(power_data$Date_Time,
     power_data$Sub_metering_1,
            col = "black",
           type = "l",
           xlab = "",
           ylab = 'Energy sub metering')

points(power_data$Date_Time,
     power_data$Sub_metering_2,
            col = "red",
           type = "l")

points(power_data$Date_Time,
     power_data$Sub_metering_3,
            col = "blue",
           type = "l")

legend("topright", names(power_data)[7:9],col=c("black","red","blue"),lty = 1,bty="n")

## Lower-right plot

plot(power_data$Date_Time,
     power_data$Global_reactive_power,
           type = "l",
           xlab = "datetime",
           ylab = 'Global_reactive_power')


## open PNG device

png(file="plot4.png",width=480,height=480)

## plot 4 graphs on one image

par(mfrow=c(2,2),cex=0.79)

## Upper-left Plot

plot(power_data$Date_Time,
     power_data$Global_active_power,
           type = "l",
           xlab = "",
           ylab = 'Global Active Power')

## Upper-right plot

plot(power_data$Date_Time,
     power_data$Voltage,
           type = "l",
           xlab = "datetime",
           ylab = 'Voltage')

## Lower-left Plot

plot(power_data$Date_Time,
     power_data$Sub_metering_1,
            col = "black",
           type = "l",
           xlab = "",
           ylab = 'Energy sub metering')

points(power_data$Date_Time,
     power_data$Sub_metering_2,
            col = "red",
           type = "l")

points(power_data$Date_Time,
     power_data$Sub_metering_3,
            col = "blue",
           type = "l")

legend("topright", names(power_data)[7:9],col=c("black","red","blue"),lty = 1,bty='n')

## Lower-right plot

plot(power_data$Date_Time,
     power_data$Global_reactive_power,
           type = "l",
           xlab = "datetime",
           ylab = 'Global_reactive_power')

           
# close PNG device

dev.off()
