#Reads file.
data_full <- read.table("household_power_consumption.txt", header=TRUE, na.strings="?", sep=";")
SetData <- data_full[(data_full$Date=="1/2/2007" | data_full$Date=="2/2/2007" ), ]

#Date and time.
SetData$Date <- as.Date(SetData$Date, format="%d/%m/%Y")
dateTime <- paste(SetData$Date, data$Time)
SetData$DateTime <- as.POSIXct(dateTime)

#Plot 3

globalActivePower <- as.numeric(SetData$Global_active_power)
subMetering1 <- as.numeric(SetData$Sub_metering_1)
subMetering2 <- as.numeric(SetData$Sub_metering_2)
subMetering3 <- as.numeric(SetData$Sub_metering_3)

plot(dateTime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(dateTime, subMetering2, type="l", col="red")
lines(dateTime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()



