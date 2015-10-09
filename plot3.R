plot3 <- function() {
  ##load data
  powerData <- read.table("household_power_consumption.txt",
                          header=TRUE,
                          sep=";",
                          colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),
                          na.strings="?")
  
  ##convert the Time field to POSIXlt type
  powerData$Time <- strptime(paste(powerData$Date, powerData$Time), "%d/%m/%Y %H:%M:%S")
  
  ##convert the Date field to Date type
  powerData$Date <- as.Date(powerData$Date, "%d/%m/%Y")
  
  ##filter data from Feb 1 to Feb 2, 2007
  beginDate <- as.Date("2007-02-01", "%Y-%m-%d")
  endDate <- as.Date("2007-02-02", "%Y-%m-%d")
  filteredData <- powerData[powerData$Date >= beginDate & powerData$Date <= endDate,]
  
  ##plot the line graph of time vs global active power
  png("plot3.png")
  plot(filteredData$Time, filteredData$Sub_metering_1, type="n")
  plot(filteredData$Time, filteredData$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
  lines(filteredData$Time, filteredData$Sub_metering_1, col="black")
  lines(filteredData$Time, filteredData$Sub_metering_2, col="red")
  lines(filteredData$Time, filteredData$Sub_metering_3, col="blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"), lty=c(1,1,1))
  dev.off()
  
  ## remove all items
  rm(powerData)
  rm(filteredData)
  rm(beginDate)
  rm(endDate)
}