## Getting the uncompressed dataset
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## Filtering the data
data <- subset(data, subset=(as.Date(data$Date, format="%d/%m/%Y") >= "2007-02-01" 
                               & as.Date(data$Date, format="%d/%m/%Y") <= "2007-02-02")) 
## Plot 2
plot(strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S"), 
       data$Global_active_power, 
       type="l", 
       xlab="", ylab="Global Active Power (kilowatts)")
  
## Saving to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()