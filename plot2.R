hpc <- read.table("./household_power_consumption.txt", skip = 1, sep = ";")
names(hpc) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
hpc1 <- subset(hpc, hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007")

hpc1$Date <- as.Date(hpc1$Date, format = "%d/%m/%Y")
hpc1$Time <- strptime(hpc1$Time, format = "%H:%M:%S")
png("plot2.png", width=480, height=480)
plot(hpc1$Time,as.numeric(hpc1$Global_active_power),type="l",xlab="",ylab="Global Active Power (kilowatts)") 
dev.off()

