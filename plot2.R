# Global Active Power (Time Series)

# Read data
data <- read.table("household_power_consumption.txt", sep=";", header=T, 
            colClasses = c("character", "character", "numeric", "numeric", 
            "numeric", "numeric", "numeric", "numeric", "numeric"), 
            na.strings="?")

# Convert dates
data$DateTime <- strptime(paste(data$Date, data$Time), 
            "%d/%m/%Y %H:%M:%S")

# Subset on two days in February 2007
data <- subset(data, as.Date(DateTime) >= as.Date("2007-02-01") & 
            as.Date(DateTime) <= as.Date("2007-02-02"))

# Open PNG file
png("plot2.png", height=480, width=480)

# Construct the plot
plot(data$DateTime, data$Global_active_power, pch=NA, xlab="", 
            ylab="Global Active Power (kilowatts)")
lines(data$DateTime, data$Global_active_power)

# Close PNG file
dev.off()