## Project One
setwd("~/CourseraMaterials/Exploratory Data Analysis/project1")

# the data was first cleaned by python
data.raw <- read.csv('cleanData.csv')
data.raw$Date <- as.Date(data.raw$Date, format = '%d/%m/%Y')

# combine the Date and Time
data.raw$time <- strptime(paste(data.raw$Date, data.raw$Time, sep = '-'), format = "%Y-%m-%d-%H:%M")

# write the file
write.csv(data.raw, 'cleanDataToUse.csv', row.names = F)