## This is Plot 3.R, Coursera course
## Read a txt file

a<-read.table("household_power_consumption.txt", header=TRUE, sep=";", colClasses="character")

## Change Date to Date format, Sub_meterings to numeric format

a$Date<-as.Date(a$Date, format="%d/%m/%Y")

a$DateTime<-as.POSIXct(paste(a$Date, a$Time), format="%Y-%m-%d %H:%M:%S")

a$Sub_metering_1<-as.numeric(a$Sub_metering_1)
a$Sub_metering_2<-as.numeric(a$Sub_metering_2)
a$Sub_metering_3<-as.numeric(a$Sub_metering_3)

## Set language as a English(Original:Korean)

Sys.setlocale("LC_TIME","English_United States.1252")

## Extract data from 2007-02-01 to 2007-02-02

c<-subset(a, subset=(Date=='2007-02-01'| Date=='2007-02-02'))

## Make plot 3

png("plot3.png", width=480, height=480)

plot(c$DateTime, c$Sub_metering_1, type="l", xlab = " ", ylab = "Energy sub metering")
lines(c$DateTime, c$Sub_metering_2, col="red")
lines(c$DateTime, c$Sub_metering_3, col="blue")
legend(x="topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("Black","Red","Blue"), lwd = 1)

dev.off()