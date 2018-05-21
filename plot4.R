library(lubridate)

# get and reduce data  (sorry for repeating, but since the files should be independent ...)
householdConsumption <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE)
householdConsumption$DateTime <- dmy_hms(paste(householdConsumption$Date, householdConsumption$Time))
householdConsumption <- subset(householdConsumption,
                               DateTime >= ymd("2007-02-01") & DateTime < ymd("2007-02-03"))

# convert to numeric
householdConsumption$Global_active_power <- as.numeric(householdConsumption$Global_active_power)
householdConsumption$Global_reactive_power <- as.numeric(householdConsumption$Global_reactive_power)
householdConsumption$Voltage <- as.numeric(householdConsumption$Voltage)
householdConsumption$Sub_metering_1 <- as.numeric(householdConsumption$Sub_metering_1)
householdConsumption$Sub_metering_2 <- as.numeric(householdConsumption$Sub_metering_2)
householdConsumption$Sub_metering_3 <- as.numeric(householdConsumption$Sub_metering_3)

# plot into png
png("plot4.png")
library(lubridate)

# get and reduce data
householdConsumption <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE)
householdConsumption$DateTime <- dmy_hms(paste(householdConsumption$Date, householdConsumption$Time))
householdConsumption <- subset(householdConsumption,
                               DateTime >= ymd("2007-02-01") & DateTime < ymd("2007-02-03"))

# convert to numeric
householdConsumption$Global_active_power <- as.numeric(householdConsumption$Global_active_power)
householdConsumption$Global_reactive_power <- as.numeric(householdConsumption$Global_reactive_power)
householdConsumption$Voltage <- as.numeric(householdConsumption$Voltage)
householdConsumption$Sub_metering_1 <- as.numeric(householdConsumption$Sub_metering_1)
householdConsumption$Sub_metering_2 <- as.numeric(householdConsumption$Sub_metering_2)
householdConsumption$Sub_metering_3 <- as.numeric(householdConsumption$Sub_metering_3)

# plot into png
png("plot4.png")
par(mfrow = c(2,2))
# plot 1 of 4 --------------
with(householdConsumption, plot(DateTime, Global_active_power, type = "l", 
                                ylab = "Global Active Power (kilowatts)", xlab = ""))

# plot 2 of 4 --------------
with(householdConsumption, plot(DateTime, Voltage, type = "l", 
                                ylab = "Voltage", xlab = "datetime"))

# plot 3 of 4 --------------
with(householdConsumption, plot(DateTime, Sub_metering_1, type = "n",
                                ylab = "Energy sub metering", xlab = ""))
with(householdConsumption, lines(DateTime, Sub_metering_1, col = "black"))
with(householdConsumption, lines(DateTime, Sub_metering_2, col = "red"))
with(householdConsumption, lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black", "red", "blue"), lwd = c(1,1), bty = "n")

# plot 4 of 4 --------------
with(householdConsumption, plot(DateTime, Global_reactive_power, type = "l", 
                                ylab = "Global_reactive_power", xlab = "datetime"))

dev.off()