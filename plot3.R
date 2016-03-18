drawPlot <- function() {
    if (!file.exists("exdata-data-household_power_consumption\\segmented_household_power_consumption.txt")) {
        temp_data <- read.table("exdata-data-household_power_consumption\\household_power_consumption.txt", sep = ";", header = TRUE)
        data <- subset(temp_data, Date == "1/2/2007" | Date == "2/2/2007")
        write.table(data, "exdata-data-household_power_consumption\\segmented_household_power_consumption.txt", sep = ";", row.names = FALSE)
    }else{
        data <- read.table("exdata-data-household_power_consumption\\segmented_household_power_consumption.txt", sep = ";", header = TRUE)
    }
    
    data$TimeStamp <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
    
    png(file = "plot3.png", bg = "white")
    plot(data$TimeStamp, data$Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering")
    lines(data$TimeStamp, data$Sub_metering_2, col="red")
    lines(data$TimeStamp, data$Sub_metering_3, col="blue")
    legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))
    dev.off()
}