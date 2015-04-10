data = read.table("household_power_consumption.txt", sep = ";", header = TRUE,
                  stringsAsFactors = FALSE, colClasses = c("character", 
                                                           "character", "numeric", "numeric", "numeric", "numeric", 
                                                           "numeric", "numeric", "numeric"), na.strings=c("","?"))

data$Date = as.Date.character(data$Date, "%d/%m/%Y")

mydata = subset(data, Date == "2007-02-01" | Date == "2007-02-02")

mydata$Time = paste(as.character(mydata$Date), mydata$Time)

mydata$Time = strptime(mydata$Time, "%Y-%m-%d %H:%M:%S")

png(file = "plot4.png")
par(mfrow = c(2,2))
with(mydata, {
    plot(Time, Global_active_power, type='l', xlab = "",
         ylab = "Global Active Power")
    
    plot(Time, Voltage, type='l', xlab = "datetime", ylab = "Voltage")  
    
    plot(Time, Sub_metering_1, type='l', xlab = "",
         ylab = "Energy sub metering")
    lines(Time, Sub_metering_2, type='l', col = "red")      
    lines(Time, Sub_metering_3, type='l', col = "blue")      
    legend("topright", lty=c(1,1,1), col = c("black", "red", "blue"), 
           lwd=c(2.5,2.5, 2.5), cex = 0.8, 
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    plot(Time, Global_reactive_power, type='l', xlab = "datetime",
         ylab = "Global_reactive_power")
})
dev.off()
