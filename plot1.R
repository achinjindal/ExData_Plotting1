alldata=read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings = "?")#, nrows=100)
alldata$Date=strptime(alldata$Date, format="%d/%m/%Y")

data=alldata[alldata[,1]==strptime("2007-02-01", format="%Y-%m-%d")  | alldata[,1]==strptime("2007-02-02", format="%Y-%m-%d"),]
data$Datetime=strptime(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")

png(filename = "plot1.png",
    width = 480, height = 480, units = "px")

#plot1
hist(data$Global_active_power, col = "Red", xlab="Global Active Power(kilowatts)", main="Global Active Power")
dev.off()
