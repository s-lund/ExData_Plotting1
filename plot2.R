### reading data
file = "../../data/household_power_consumption.txt"
hpc <- read.table(file, header = TRUE, sep = ";")

### reducing data to the time interval of interest (2 days)
hpc$Date =  as.Date(hpc$Date, format = "%d/%m/%Y")
hpc_time_select = hpc[hpc$Date == as.Date("2007-02-01") | hpc$Date == as.Date("2007-02-02"),]

### transforminc the data in the column Global_active_power to numbers
Global_active_power = as.numeric(as.character(hpc1_time_select$Global_active_power))



plot(Global_active_power, type = "l", xlab="" ,ylab = "Globale Active Power (kilowatts)")

png(filename="plot2.png", width = 480, height = 480)
hist(Global_active_power, main="Global Active Power", xlab = "Globale Active Power (kilowatts)", col = "firebrick1", lab = "Globale Active Power (kilowatts)")
dev.off()
