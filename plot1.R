# the data was first cleaned by python
data.raw <- read.csv('cleanData.csv')
data.raw$Date <- as.Date(data.raw$Date, format = '%d/%m/%Y')

# combine the Date and Time
data.raw$time <- strptime(paste(data.raw$Date, data.raw$Time, sep = '-'), format = "%Y-%m-%d-%H:%M")
data <- data.raw

png('plot1.png')
hist(data$Global_active_power, col = 'red',
     main = 'Global Active Power', xlab = 'Global Active Power(kilopwatts)')
dev.off()