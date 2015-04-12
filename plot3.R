## Getting the uncompressed dataset
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", 
                   stringsAsFactors=FALSE, dec=".", na.strings="?")

## Filtering the data
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data <- subset(data, subset=(Date >= "2007-02-01" 
                             & Date <= "2007-02-02")) 

## Converting dates 
data$Datetime <- as.POSIXct(paste(data$Date, data$Time))

## Plot 3
with(data, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=2, lwd=1, col=c("black", "red", "blue"))


## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()