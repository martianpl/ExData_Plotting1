
#read file
data <- read.table("household_power_consumption.txt", header = TRUE,  dec = ".", sep = ";", na.strings="?", stringsAsFactors=FALSE) #import of the entire dataset

#subset file to get the 2 days
housingdatasubset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]


#plot graph

png("plot2.png", width=480, height=480)
plot(as.POSIXct(paste(housingdatasubset$Date, housingdatasubset$Time), format="%d/%m/%Y %H:%M:%S"), housingdatasubset$Global_active_power, type = "l", xlab= "", ylab = "Global Active Power (kilowatts)") #constructing graph (linear plot)
dev.off()
