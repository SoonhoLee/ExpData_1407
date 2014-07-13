## This is Plot 2.R, Coursera course
## Read a txt file

a<-read.table("household_power_consumption.txt", header=TRUE, sep=";", colClasses="character")

## Change Date to Date format, G_active_power to numeric format

a$Date<-as.Date(a$Date, format="%d/%m/%Y")

a$DateTime<-as.POSIXct(paste(a$Date, a$Time), format="%Y-%m-%d %H:%M:%S")

a$Global_active_power<-as.numeric(a$Global_active_power)

## Set language as a English(Original:Korean)

Sys.setlocale("LC_TIME","English_United States.1252")

## Extract data from 2007-02-01 to 2007-02-02

c<-subset(a, subset=(Date=='2007-02-01'| Date=='2007-02-02'))

## Make Line Graph

png("plot2.png", width=480, height=480)

plot(c$DateTime, c$Global_active_power, type="l", xlab=" ", ylab="Global Active Power (kilowatts)")

dev.off()