### reading data
file = "../../data/household_power_consumption.txt"
hpc <- read.table(file, header = TRUE, sep = ";")

### reducing data to the time interval of interest (2 days)
hpc$Date =  as.Date(hpc$Date, format = "%d/%m/%Y")
hpc_time_select = hpc[hpc$Date == as.Date("2007-02-01") | hpc$Date == as.Date("2007-02-02"),]

### adding usable date and time information plus 
combinedDateTime_raw <- paste(hpc_time_select$Date, hpc_time_select$Time)
hpc_time_select$DateTime <- strptime(combinedDateTime_raw, format = ("%Y-%m-%d %H:%M:%S"))
hpc_time_select$WeekDays = weekdays(hpc_time_select$DateTime)

########## transforming data ########## 

### transforming the data in the column Global_active_power to numbers
Global_active_power = as.numeric(as.character(hpc1_time_select$Global_active_power))

### transforming the data in the column Voltage to numbers
Voltage = as.numeric(as.character(hpc1_time_select$Voltage))

### transforming the data in the columns Sub_metering_x (x = 1,2,3) to numbers
Sub_metering_1 = as.numeric(as.character(hpc1_time_select$Sub_metering_1))
Sub_metering_2 = as.numeric(as.character(hpc1_time_select$Sub_metering_2))
Sub_metering_3 = as.numeric(as.character(hpc1_time_select$Sub_metering_3))

### transforming the data in the column Global_reactive_power to numbers
Global_reactive_power = as.numeric(as.character(hpc1_time_select$Global_reactive_power))

########## plotting and saveing 2x2 ########## 
png(filename="plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))

### plotting TOP_LEFT (Global_active_power)
plot(hpc_time_select$DateTime, Global_active_power, type = "l", xlab="" ,ylab = "Globale Active Power (kilowatts)")
axis.POSIXct(2, at=hpc_time_select$DateTime, labels=hpc_time_select$WeekDays)

### plotting TOP_RIGHT (Voltage)
plot(hpc_time_select$DateTime, Voltage, type = "l", xlab="datetime" ,ylab = "Voltage")
axis.POSIXct(2, at=hpc_time_select$DateTime, labels=hpc_time_select$WeekDays)

### plotting BOTTOM_LEFT (Energy_Sub_metering)
plot(hpc_time_select$DateTime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", ,col="black")
lines(hpc_time_select$DateTime, Sub_metering_2, ,col="red")
lines(hpc_time_select$DateTime, Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty="n" ,lty=1, col=c("black", "red", "blue"))

### plotting BOTTOM_RIGHT (Global_reactive_power)
plot(hpc_time_select$DateTime, Global_reactive_power, type = "l", xlab="datetime" ,ylab = "Global_reactive_power")
axis.POSIXct(2, at=hpc_time_select$DateTime, labels=hpc_time_select$WeekDays)


dev.off()



