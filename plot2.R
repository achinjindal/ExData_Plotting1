alldata=read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings = "?")#, nrows=100)
alldata$Date=strptime(alldata$Date, format="%d/%m/%Y")

data=alldata[alldata[,1]==strptime("2007-02-01", format="%Y-%m-%d")  | alldata[,1]==strptime("2007-02-02", format="%Y-%m-%d"),]
data$Datetime=strptime(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")

png(filename = "plot2.png",
    width = 480, height = 480, units = "px")

#plot2
plot(as.numeric(data$Datetime),data$Global_active_power, type="l", xaxt='n', ylab="Global Active Power(kilowatts)", xlab="")
axis(1, labels =c("Thu", "Fri", "Sat"),at= c(1170300000,1170350000, 1170400000),las=2)

dev.off()
