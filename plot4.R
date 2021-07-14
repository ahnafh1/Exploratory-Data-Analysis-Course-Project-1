hpc <- read.table("./household_power_consumption.txt", skip = 1, sep = ";")
names(hpc) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
hpc1 <- subset(hpc, hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007")

par(mfrow=c(2,2))

png("plot4.png", width=480, height=480)
with(hpc1,{
  plot(hpc1$Time,as.numeric(hpc1$Global_active_power),type="l",  xlab="",ylab="Global Active Power")
  plot(hpc1$Time,as.numeric(hpc1$Voltage), type="l",xlab="datetime",ylab="Voltage")
  plot(hpc1$Time,hpc1$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
  with(hpc1,lines(Time,as.numeric(Sub_metering_1)))
  with(hpc1,lines(Time,as.numeric(Sub_metering_2),col="red"))
  with(hpc1,lines(Time,as.numeric(Sub_metering_3),col="blue"))
  legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
  plot(hpc1$Time,as.numeric(hpc1$Global_reactive_power),type="l",xlab="datetime",ylab="Global_reactive_power")
})
dev.off()
