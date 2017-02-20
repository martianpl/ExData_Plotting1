#read file
data <- read.table("household_power_consumption.txt", header = TRUE,  dec = ".", sep = ";", na.strings="?", stringsAsFactors=FALSE) #import of the entire dataset

#subset file to get the 2 days
housingdatasubset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))

plot(as.POSIXct(paste(housingdatasubset$Date, housingdatasubset$Time), format="%d/%m/%Y %H:%M:%S"), housingdatasubset$Global_active_power, type = "l", xlab= "", ylab = "Global Active Power (kilowatts)") #constructing graph (linear plot)

plot(as.POSIXct(paste(housingdatasubset$Date, housingdatasubset$Time), format="%d/%m/%Y %H:%M:%S"), housingdatasubset$Voltage, type = "l", xlab= "datetime", ylab = "Voltage") #constructing graph (linear plot)

plot(as.POSIXct(paste(housingdatasubset$Date, housingdatasubset$Time), format="%d/%m/%Y %H:%M:%S"), housingdatasubset$Sub_metering_1, type = "l", xlab= "", ylab = "Enerfy sub metering") #constructing first graph (linear plot)
lines(as.POSIXct(paste(housingdatasubset$Date, housingdatasubset$Time), format="%d/%m/%Y %H:%M:%S"), housingdatasubset$Sub_metering_2, col = "red") #adding the second graph
lines(as.POSIXct(paste(housingdatasubset$Date, housingdatasubset$Time), format="%d/%m/%Y %H:%M:%S"), housingdatasubset$Sub_metering_3, col = "blue") #adding the third graph

plot(as.POSIXct(paste(housingdatasubset$Date, housingdatasubset$Time), format="%d/%m/%Y %H:%M:%S"), housingdatasubset$Global_reactive_power, type = "l", xlab= "datetime", ylab = "Global Reactive Power") #constructing graph (linear plot)


dev.off() #saving png file to working directory (480x480 px by default)


