#Reading household power consumption data
hpc <- read.table("household_power_consumption.txt", skip = 1, sep = ";")
names(hpc) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

#Subsetting household power consumption data
subhpc <- subset(hpc, hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007")
gap <- as.numeric(as.character(subhpc$Global_active_power))
datetime <- strptime(paste(subhpc$Date, subhpc$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
subMetering1 <- as.numeric(as.character(subhpc$Sub_metering_1))
subMetering2 <- as.numeric(as.character(subhpc$Sub_metering_2))
subMetering3 <- as.numeric(as.character(subhpc$Sub_metering_3))
voltage <- as.numeric(as.character(subhpc$Voltage))
grp <- as.numeric(as.character(subhpc$Global_reactive_power))

#Making the plot
par(mfcol = c(2,2))

plot(datetime, gap, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

plot(datetime, subMetering1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(datetime, subMetering2, type = "l", col = "red")
lines(datetime, subMetering3, type = "l", col = "blue")
legend("topright", lty = 1, col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.2)

plot(datetime, voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(datetime, grp, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.copy(png, filename="plot4.png")
dev.off()
