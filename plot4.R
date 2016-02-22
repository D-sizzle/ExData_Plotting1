#load packages
library(lubridate)


#download file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "zipdata.zip")
unzip("zipdata.zip",exdir='source data',overwrite=TRUE)

# read the raw table and limit to 2 days
v.class<-c(rep('character',2),rep('numeric',7))
power.c<-read.table('source data/household_power_consumption.txt',header=TRUE,
                    sep=';',na.strings='?',colClasses=v.class)
power.c<-power.c[power.c$Date=='1/2/2007' | power.c$Date=='2/2/2007',]
power.c$DateTime<-dmy(power.c$Date)+hms(power.c$Time)
power.c<-power.c[,c(10,3:9)]







# open device
png(filename="/Users/danielconnell/Coursera/ExData_Plotting1/plot4.png",width=480,height=480,units='px')


# make 4 plots
par(mfrow=c(2,2))

# plot data on top left (1,1)
plot(power.c$DateTime,power.c$Global_active_power,ylab='Global Active Power',xlab='',type='l')

# plot data on top right (1,2)
plot(power.c$DateTime,power.c$Voltage,xlab='datetime',ylab='Voltage',type='l')

# plot data on bottom left (2,1)
lncol<-c('black','red','blue')
lbls<-c('Sub_metering_1','Sub_metering_2','Sub_metering_3')
plot(power.c$DateTime,power.c$Sub_metering_1,type='l',col=lncol[1],xlab='',ylab='Energy sub metering')
lines(power.c$DateTime,power.c$Sub_metering_2,col=lncol[2])
lines(power.c$DateTime,power.c$Sub_metering_3,col=lncol[3])

# plot data on bottom right (2,2)
plot(power.c$DateTime,power.c$Global_reactive_power,xlab='datetime',ylab='Global_reactive_power',type='l')

# close device
dev.off()