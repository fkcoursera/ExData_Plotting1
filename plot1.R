# data preparation
# import the data
data <- read.csv("household_power_consumption.txt", sep=";", colClasses = "character")
head(data)
# class date and time into one variable
data$datetime <- paste(data$Date, data$Time)
data$datetime <- strptime(data$datetime, format = "%d/%m/%Y %H:%M:%S")
head(data)
# subset
forplots = subset(data, as.Date(datetime) == '2007-02-01' | as.Date(datetime) == '2007-02-02')
head(forplots)
forplots$Date <- NULL; forplots$Time <- NULL
# plot
class(forplots$Global_active_power)
forplots$Global_active_power <- as.numeric(forplots$Global_active_power)
head(forplots)
png(filename="plot1.png", width=480, height=480)
hist(forplots$Global_active_power, breaks = 12, col="red", xlab="Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()
```