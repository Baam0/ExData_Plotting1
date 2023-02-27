#Reads file.
data_full <- read.table("household_power_consumption.txt", header=TRUE, na.strings="?", sep=";")
SetData <- data_full[(data_full$Date=="1/2/2007" | data_full$Date=="2/2/2007" ), ]

#Date and time.
SetData$Date <- as.Date(SetData$Date, format="%d/%m/%Y")
dateTime <- paste(SetData$Date, data$Time)
SetData$DateTime <- as.POSIXct(dateTime)

#Plot 2.

globalActivePower <- as.numeric(SetData$Global_active_power)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

