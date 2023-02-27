#Download the file.
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="data.zip", method="curl")
unzip ("data.zip", exdir = "./")

#Reads file.
data_full <- read.table("household_power_consumption.txt", header=TRUE, na.strings="?", sep=";")
SetData <- data_full[(data_full$Date=="1/2/2007" | data_full$Date=="2/2/2007" ), ]

#Plot 1
globalActivePower <- as.numeric(SetData$Global_active_power)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()


