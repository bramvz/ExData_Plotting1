par(mfrow = c(1, 1));

data <- read.csv("household_power_consumption.txt", sep=";", colClasses = "character", na.strings = "?");
subset <- subset(data, Date=="2/2/2007" | Date=="1/2/2007");
subset[, 3] <- as.numeric(subset[, 3]);

hist(subset$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red");
dev.copy(png, file = "plot1.png", width=480, height=480);
dev.off();
