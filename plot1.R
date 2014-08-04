
## Exploratory Data Analysis
## exdata-005
## Project 1, Plot 1

## R code for reading in power consumption text file
## for dates Feb 1-2, 2007
## and creating Plot 1

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


## Part 2 - create Plot 1 from formatted table

## plot Histogram of Global Active Power to screen

hist(power_data$Global_active_power,
           col='red',
           main = 'Global Active Power',
           xlab = 'Global Active Power (kilowatts)')


## open PNG device

png(file="plot1.png",width=480,height=480)

## plot Histogram of Global Active Power to PNG file

hist(power_data$Global_active_power,
           col='red',
           main = 'Global Active Power',
           xlab = 'Global Active Power (kilowatts)')

           
## close PNG device

dev.off()
