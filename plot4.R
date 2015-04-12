## Getting the uncompressed dataset
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", 
                   stringsAsFactors=FALSE, dec=".", na.strings="?")

## Filtering the data
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data <- subset(data, subset=(Date >= "2007-02-01" 
                             & Date <= "2007-02-02")) 

## Converting dates 
data$Datetime <- as.POSIXct(paste(data$Date, data$Time))

## Plot 4
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
with(data, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power", xlab="", cex=0.2)
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage", xlab="datetime")
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Global Active Power", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lwd=2.5, bty="o",
         c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), pch=21, cex=0.5)
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global_Rective_Power",xlab="datetime")
})

## Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()