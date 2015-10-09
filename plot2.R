plot2 <- function() {
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
  plot(filteredData$Time, filteredData$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  
  ##save plot to png
  dev.copy(png,"plot2.png")
  dev.off()
  
  ## remove all items
  rm(powerData)
  rm(filteredData)
  rm(beginDate)
  rm(endDate)
}