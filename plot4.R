# the data was first cleaned by python
data.raw <- read.csv('cleanData.csv')
data.raw$Date <- as.Date(data.raw$Date, format = '%d/%m/%Y')

# combine the Date and Time
data.raw$time <- strptime(paste(data.raw$Date, data.raw$Time, sep = '-'), format = "%Y-%m-%d-%H:%M")
data <- data.raw

par(mfcol = c(2,2))
plot(y = data$Global_active_power, x= data$time, type="l",
     ylab="Global Active Power", xlab="")

plot(x = data$time, y = data$Sub_metering_1, type = 'l', xlab = '',
     ylab = 'Global Active Power (kilowatts)')
lines(x = data$time, y = data$Sub_metering_2, col = 'red')
lines(x = data$time, y = data$Sub_metering_3, col = 'blue')
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=1, lwd=2)

plot(y = data$Voltage, x= data$time, type="l",
     ylab="Voltage", xlab="datetime")

plot(y = data$Global_reactive_power, x= data$time, type="l",
     ylab="Global_reactive_power", xlab="datetime")

dev.copy(png, file="plot4.png")
dev.off()

