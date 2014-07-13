# This is Plot 4.R, Coursera course
## Read a txt file

a<-read.table("household_power_consumption.txt", header=TRUE, sep=";", colClasses="character")

## Change Date to Date format, Sub_meterings to numeric format

a$Date<-as.Date(a$Date, format="%d/%m/%Y")

a$DateTime<-as.POSIXct(paste(a$Date, a$Time), format="%Y-%m-%d %H:%M:%S")

a$Global_active_power<-as.numeric(a$Global_active_power)
a$Global_reactive_power<-as.numeric(a$Global_reactive_power)

a$Sub_metering_1<-as.numeric(a$Sub_metering_1)
a$Sub_metering_2<-as.numeric(a$Sub_metering_2)
a$Sub_metering_3<-as.numeric(a$Sub_metering_3)

## Set language as a English(Original:Korean)

Sys.setlocale("LC_TIME","English_United States.1252")

## Extract data from 2007-02-01 to 2007-02-02

c<-subset(a, subset=(Date=='2007-02-01'| Date=='2007-02-02'))

## Draw plot 4

png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))

plot(c$DateTime, c$Global_active_power, type="l", xlab=" ", ylab="Global Active Power (kilowatts)")
plot(c$DateTime, c$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(c$DateTime, c$Sub_metering_1, type="l", xlab = " ", ylab = "Energy sub metering")
lines(c$DateTime, c$Sub_metering_2, col="red")
lines(c$DateTime, c$Sub_metering_3, col="blue")
legend(x="topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("Black","Red","Blue"), lwd = 1, bty = "n")

plot(c$DateTime, c$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()