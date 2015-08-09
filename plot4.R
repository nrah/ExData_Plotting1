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

# Make the four plots
png(file = "plot4.png", width = 480, height = 480)
par(mfcol = c(2,2))

# Plot 1
with(data, plot(datetime, Global_active_power, type = "l", xlab = "",
                ylab = "Global Active Power (kilowatts)"))

# Plot 2
with(data, plot(datetime, Sub_metering_1, type = "l", xlab = "",
                ylab = "Energy sub metering"))
with(data, lines(datetime, Sub_metering_2, col = "red"))
with(data, lines(datetime, Sub_metering_3, col = "blue"))
with(data, legend("topright", lty = 1, col = c("black", "red", "blue"), bty = "n",
                  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")))

# Plot 3
with(data, plot(datetime, Voltage, type = "l"))

# Plot 4
with(data, plot(datetime, Global_reactive_power, type = "l"))

dev.off()