data = read.table("household_power_consumption.txt", sep = ";", header = TRUE,
                  stringsAsFactors = FALSE, colClasses = c("character", 
                    "character", "numeric", "numeric", "numeric", "numeric", 
                    "numeric", "numeric", "numeric"), na.strings=c("","?"))

data$Date = as.Date.character(data$Date, "%d/%m/%Y")

mydata = subset(data, Date == "2007-02-01" | Date == "2007-02-02")

mydata$Time = paste(as.character(mydata$Date), mydata$Time)

mydata$Time = strptime(mydata$Time, "%Y-%m-%d %H:%M:%S")

png(file = "plot3.png")
plot(mydata$Time, mydata$Sub_metering_1, type='l', xlab = "",
     ylab = "Energy sub metering")
lines(mydata$Time, mydata$Sub_metering_2, type='l', col = "red")      
lines(mydata$Time, mydata$Sub_metering_3, type='l', col = "blue")      
legend("topright", lty=c(1,1,1), col = c("black", "red", "blue"), 
       lwd=c(2.5,2.5, 2.5), cex = 0.75, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
