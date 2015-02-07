MyData <- read.table(file = "household_power_consumption.txt", header = FALSE,
                     sep = ";", na.strings = "?",nrows = 2880, skip = 66637)

colnames(MyData) <- c("Date",
                      "Time",
                      "Global_Active_Power",
                      "Global_Reactive_Power",
                      "Voltage",
                      "Global_Intensity",
                      "Sub_Metering_1",
                      "Sub_Metering_2",
                      "Sub_Metering_3")
MyData$Day <- strptime(paste(MyData$Date, MyData$Time),"%d/%m/%Y %H:%M:%S")


png(file = "plot2.png")

plot(MyData$Day,MyData$Global_Active_Power, xlab = NA,
     ylab = "Global Active Power (kilowatts)",type="l")

dev.off()