drawPlot <- function() {
    if (!file.exists("exdata-data-household_power_consumption\\segmented_household_power_consumption.txt")) {
        temp_data <- read.table("exdata-data-household_power_consumption\\household_power_consumption.txt", sep = ";", header = TRUE)
        data <- subset(temp_data, Date == "1/2/2007" | Date == "2/2/2007")
        write.table(data, "exdata-data-household_power_consumption\\segmented_household_power_consumption.txt", sep = ";", row.names = FALSE)
    }else{
        data <- read.table("exdata-data-household_power_consumption\\segmented_household_power_consumption.txt", sep = ";", header = TRUE)
    }
    
    data$TimeStamp <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
    
    png(file = "plot4.png", bg = "white")
    plots <- par(mfrow = c(2, 2))
    #Global Active Power
    plot(data$TimeStamp, data$Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")
    
    # Voltage
    plot(data$TimeStamp, data$Voltage, type="l", xlab = "datetime", ylab = "Voltage")
    
    # Energy sub metering
    plot(data$TimeStamp, data$Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering")
    lines(data$TimeStamp, data$Sub_metering_2, col="red")
    lines(data$TimeStamp, data$Sub_metering_3, col="blue")
    legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"), xjust = 1)
    
    # Global reactive power
    plot(data$TimeStamp, data$Global_reactive_power, type="l", xlab = "datetime", ylab = "Global_reactive_power")
    par(plots)
    dev.off()
}