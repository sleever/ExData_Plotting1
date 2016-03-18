drawPlot <- function() {
    if (!file.exists("exdata-data-household_power_consumption\\segmented_household_power_consumption.txt")) {
        temp_data <- read.table("exdata-data-household_power_consumption\\household_power_consumption.txt", sep = ";", header = TRUE)
        data <- subset(temp_data, Date == "1/2/2007" | Date == "2/2/2007")
        write.table(data, "exdata-data-household_power_consumption\\segmented_household_power_consumption.txt", sep = ";", row.names = FALSE)
    }else{
        data <- read.table("exdata-data-household_power_consumption\\segmented_household_power_consumption.txt", sep = ";", header = TRUE)
    }
    
    data$TimeStamp <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
    
    png(file = "plot1-1.png", bg = "white")
    chart <- hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
    dev.off()
}