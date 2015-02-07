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


png(file = "plot3.png")

with(MyData, plot(Day,Sub_Metering_1, xlab = NA,
                  ylab = "Energy sub metering", type="l"))
with(MyData, lines(Day,Sub_Metering_2,col = "red"))
with(MyData, lines(Day,Sub_Metering_3,col = "blue"))
legend("topright", col = c("black","red","blue"), lty=c(1,1,1),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()