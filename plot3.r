par(mfrow = c(1, 1));
data <- read.csv("household_power_consumption.txt", sep=";", colClasses = "character", na.strings = "?");
subset <- subset(data, Date=="2/2/2007" | Date=="1/2/2007");
subset$Datetime <- paste(subset$Date,subset$Time);
subset$DateTime <- strptime(subset$Datetime, "%d/%m/%Y %H:%M:%S");
subset[, 3] <- as.numeric(subset[, 3]);

dev.copy(png, file = "plot3.png", width=480, height=480);

plot(subset$DateTime, ylab="Energy sub metering", xlab="", subset$Sub_metering_1, type="l", main="");
lines(subset$DateTime, subset$Sub_metering_2, type= "l", col="Red");
lines(subset$DateTime, subset$Sub_metering_3, type= "l", col="blue");
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd =2.5,
       col=c("black", "red", "blue"))
dev.off();
