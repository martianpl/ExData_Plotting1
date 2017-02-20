
## Getting full dataset
data_full <- read.table("household_power_consumption.txt", header = TRUE,  dec = ".", sep = ";", na.strings="?", stringsAsFactors=FALSE) #import of the entire dataset
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

## Subsetting the data
df <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_full)

png("plot10.png")
hist(df$Global_active_power,col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency")
dev.off()
