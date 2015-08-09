library(lubridate)

# Read in the data
data <- read.table("household_power_consumption.txt", skip = 66637,
                   nrow = 2880, sep = ";")

names(data) <- c("Date", "Time", "Global_active_power",
                 "Global_reactive_power","Voltage", "Global_intensity",
                 "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

# Merge the date and time data to a new datetime variable
data$datetime <- paste(data$Date, data$Time)
data$datetime <- dmy_hms(data$datetime)

# Make the plot
png(file = "plot2.png", width = 480, height = 480)
with(data, plot(datetime, Global_active_power, type = "l", xlab = "",
                ylab = "Global Active Power (kilowatts)"))
dev.off()