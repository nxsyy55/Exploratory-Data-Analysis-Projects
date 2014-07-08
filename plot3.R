# the data was first cleaned by python
data.raw <- read.csv('cleanData.csv')
data.raw$Date <- as.Date(data.raw$Date, format = '%d/%m/%Y')

# combine the Date and Time
data.raw$time <- strptime(paste(data.raw$Date, data.raw$Time, sep = '-'), format = "%Y-%m-%d-%H:%M")
data <- data.raw

plot(x = data$time, y = data$Sub_metering_1, type = 'l', xlab = '',
     ylab = 'Global Active Power (kilowatts)')
lines(x = data$time, y = data$Sub_metering_2, col = 'red')
lines(x = data$time, y = data$Sub_metering_3, col = 'blue')
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=1, lwd=2)

dev.copy(png, file="plot3.png")
dev.off()