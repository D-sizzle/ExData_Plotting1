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
png(filename="/Users/danielconnell/Coursera/ExData_Plotting1/plot2.png",width=480,height=480,units='px')

# plot data
plot(power.c$DateTime,power.c$Global_active_power,ylab='Global Active Power (kilowatts)', xlab='', type='l')

# Turn off device
dev.off()




