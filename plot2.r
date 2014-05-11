par(mfrow = c(1, 1));
data <- read.csv("household_power_consumption.txt", sep=";", colClasses = "character", na.strings = "?");
subset <- subset(data, Date=="2/2/2007" | Date=="1/2/2007");
subset$Datetime <- paste(subset$Date,subset$Time);
subset$DateTime <- strptime(subset$Datetime, "%d/%m/%Y %H:%M:%S");
subset[, 3] <- as.numeric(subset[, 3]);

plot(subset$DateTime, ylab="Global Active Power (kilowatts)", xlab="", subset$Global_active_power, type="l", main="");
dev.copy(png, file = "plot2.png", width=480, height=480);
dev.off();
