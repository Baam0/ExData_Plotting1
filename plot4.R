#Download the file.
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="data.zip", method="curl")
unzip ("data.zip", exdir = "./")

#Reads file.
data_full <- read.table("household_power_consumption.txt", header=TRUE, na.strings="?", sep=";")
SetData <- data_full[(data_full$Date=="1/2/2007" | data_full$Date=="2/2/2007" ), ]

#Date and time.
SetData$Date <- as.Date(SetData$Date, format="%d/%m/%Y")
dateTime <- paste(SetData$Date, data$Time)
SetData$DateTime <- as.POSIXct(dateTime)

#Plot 4 
globalActivePower <- as.numeric(SetData$Global_active_power)
globalReactivePower <- as.numeric(SetData$Global_reactive_power)
voltage <- as.numeric(SetData$Voltage)
subMetering1 <- as.numeric(SetData$Sub_metering_1)
subMetering2 <- as.numeric(SetData$Sub_metering_2)
subMetering3 <- as.numeric(SetData$Sub_metering_3)

par(mfrow = c(2, 2)) 

plot(dateTime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(dateTime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(dateTime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(dateTime, subMetering2, type="l", col="red")
lines(dateTime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(dateTime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()



