## This is Plot 1.R, Coursera course
## Read a txt file

a<-read.table("household_power_consumption.txt", header=TRUE, sep=";", colClasses="character")

## Change Date to Date format, G_active_power to numeric format

a$Date<-as.Date(a$Date, format="%d/%m/%Y")

a$DateTime<-as.POSIXct(paste(a$Date, a$Time), format="%Y-%m-%d %H:%M:%S")

a$Global_active_power<-as.numeric(a$Global_active_power)

## Ignore Warning

c<-subset(a, subset=(Date=='2007-02-01'| Date=='2007-02-02'))

## Make Graphics histogram

png("plot1.png", width=480, height=480)

hist(c$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col='red')

dev.off()

