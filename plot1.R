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
png("plot1.png")
hist(householdConsumption$Global_active_power, col = "red",
     xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()

     