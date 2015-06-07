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

### transforming the data in the column Global_active_power to numbers
Global_active_power = as.numeric(as.character(hpc1_time_select$Global_active_power))

### creating and saving the plot as png 
png(filename="plot2.png", width = 480, height = 480)
plot(hpc_time_select$DateTime, Global_active_power, type = "l", xlab="" ,ylab = "Globale Active Power (kilowatts)")
axis.POSIXct(2, at=hpc_time_select$DateTime, labels=hpc_time_select$WeekDays)
dev.off()




