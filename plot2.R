drawPlot <- function() {
    if (!file.exists("exdata-data-household_power_consumption\\segmented_household_power_consumption.txt")) {
        temp_data <- read.table("exdata-data-household_power_consumption\\household_power_consumption.txt", sep = ";", header = TRUE)
        data <- subset(temp_data, Date == "1/2/2007" | Date == "2/2/2007")
        write.table(data, "exdata-data-household_power_consumption\\segmented_household_power_consumption.txt", sep = ";", row.names = FALSE)
    }else{
        data <- read.table("exdata-data-household_power_consumption\\segmented_household_power_consumption.txt", sep = ";", header = TRUE)
    }
    
    data$TimeStamp <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
    
    png(file = "plot2.png", bg = "white")
    plot(data$TimeStamp, data$Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")
    dev.off()
}