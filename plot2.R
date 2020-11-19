#Reading household power consumption data
hpc <- read.table("household_power_consumption.txt", skip = 1, sep = ";")
names(hpc) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

#Subsetting household power consumption data
subhpc <- subset(hpc, hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007")
gap <- as.numeric(as.character(subhpc$Global_active_power))
datetime <- strptime(paste(subhpc$Date, subhpc$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

#Making the plot
plot(datetime, gap, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.copy(png, filename="plot2.png")
dev.off()
