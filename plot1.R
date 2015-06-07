### reading data
file = "../../data/household_power_consumption.txt"
hpc <- read.table(file, header = TRUE, sep = ";")

### reducing data to the time interval of interest (2 days)
hpc$Date =  as.Date(hpc$Date, format = "%d/%m/%Y")
hpc_time_select = hpc[hpc$Date == as.Date("2007-02-01") | hpc$Date == as.Date("2007-02-02"),]

### transforming the data in the column Global_active_power to numbers
Global_active_power = as.numeric(as.character(hpc_time_select$Global_active_power))

### creating and saving the histogram as png 
png(filename="plot1.png", width = 480, height = 480)
hist(Global_active_power, main="Global Active Power", xlab = "Globale Active Power (kilowatts)", col = "firebrick1")
dev.off()


