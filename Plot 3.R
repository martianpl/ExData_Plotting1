
#read file
data <- read.table("household_power_consumption.txt", header = TRUE,  dec = ".", sep = ";", na.strings="?", stringsAsFactors=FALSE) #import of the entire dataset

#subset file to get the 2 days
housingdatasubset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]


#Plot graph 

png("plot3.png", width=480, height=480)
plot(as.POSIXct(paste(housingdatasubset$Date, housingdatasubset$Time), format="%d/%m/%Y %H:%M:%S"), housingdatasubset$Sub_metering_1, type = "l", xlab= "", ylab = "Global Active Power (kilowatts)") #constructing first graph (linear plot)
lines(as.POSIXct(paste(housingdatasubset$Date, housingdatasubset$Time), format="%d/%m/%Y %H:%M:%S"), housingdatasubset$Sub_metering_2, col = "red") #adding the second graph
lines(as.POSIXct(paste(housingdatasubset$Date, housingdatasubset$Time), format="%d/%m/%Y %H:%M:%S"), housingdatasubset$Sub_metering_3, col = "blue") #adding the third graph

legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black", "red", "blue"), lty=1) #constructing legend (colors assigned manually, probably there is a better solution)

dev.off()