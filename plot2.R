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
png(filename="plot2.png")
plot(forplots$Global_active_power, cex = 0, ylab="Global Active Power (kilowatt)", xaxt='n')
axis(side = 1, at=c(0,1440,2880), labels= c("Thu", "Fri", "Sat"))
lines(forplots$Global_active_power)
dev.off()
```