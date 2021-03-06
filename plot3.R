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
png(filename="plot3.png", width = 480, height = 480)
plot(forplots$Sub_metering_1, cex = 0, ylab="Energy sub metering", xaxt='n', xlab=c(""))
axis(side = 1, at=c(0,1440,2880), labels= c("Thu", "Fri", "Sat"))
l1 <- lines(forplots$Sub_metering_1)
l2 <- lines(forplots$Sub_metering_2, col="red")
l3 <- lines(forplots$Sub_metering_3, col="blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))
dev.off()
```