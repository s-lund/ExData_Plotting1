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

### transforming the data in the columns Sub_metering_x (x = 1,2,3) to numbers
Sub_metering_1 = as.numeric(as.character(hpc1_time_select$Sub_metering_1))
Sub_metering_2 = as.numeric(as.character(hpc1_time_select$Sub_metering_2))
Sub_metering_3 = as.numeric(as.character(hpc1_time_select$Sub_metering_3))

### creating and saving the plot as png 
png(filename="plot3.png", width = 480, height = 480)
plot(hpc_time_select$DateTime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", ,col="black")
lines(hpc_time_select$DateTime, Sub_metering_2, ,col="red")
lines(hpc_time_select$DateTime, Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1, col=c("black", "red", "blue"))
dev.off()


