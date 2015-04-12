## Getting the uncompressed dataset
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## Filtering the data
data <- subset(data, subset=(as.Date(data$Date, format="%d/%m/%Y") >= "2007-02-01" 
                             & as.Date(data$Date, format="%d/%m/%Y") <= "2007-02-02"))

## Plot 1
hist(as.numeric(data$Global_active_power), main="Global Active Power",xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()