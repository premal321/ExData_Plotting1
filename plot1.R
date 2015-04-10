data = read.table("household_power_consumption.txt", sep = ";", header = TRUE,
                   stringsAsFactors = FALSE, colClasses = c("character", 
                    "character", "numeric", "numeric", "numeric", "numeric", 
                    "numeric", "numeric", "numeric"), na.strings=c("","?"))

data$Date = as.Date.character(data$Date, "%d/%m/%Y")

mydata = subset(data, Date == "2007-02-01" | Date == "2007-02-02")

png(file = "plot1.png")
hist(mydata$Global_active_power, xlab = "Gloabl Active Power (kilowatts)", 
     main = "Gloabl Active Power", col = "red")
dev.off()
