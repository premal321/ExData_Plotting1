data = read.table("household_power_consumption.txt", sep = ";", header = TRUE,
                  stringsAsFactors = FALSE, colClasses = c("character", 
                    "character", "numeric", "numeric", "numeric", "numeric", 
                    "numeric", "numeric", "numeric"), na.strings=c("","?"))

data$Date = as.Date.character(data$Date, "%d/%m/%Y")

mydata = subset(data, Date == "2007-02-01" | Date == "2007-02-02")

mydata$Time = paste(as.character(mydata$Date), mydata$Time)

mydata$Time = strptime(mydata$Time, "%Y-%m-%d %H:%M:%S")

png(file = "plot2.png")
plot(mydata$Time, mydata$Global_active_power, type='l', xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()
