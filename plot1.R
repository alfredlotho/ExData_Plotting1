plot1 <- function() {
  ##load data
  powerData <- read.table("household_power_consumption.txt",
                          header=TRUE,
                          sep=";",
                          colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),
                          na.strings="?")
  
  ##convert the Date field to Date type
  powerData$Date <- as.Date(powerData$Date, "%d/%m/%Y")
  
  ##filter data from Feb 1 to Feb 2, 2007
  beginDate <- as.Date("2007-02-01", "%Y-%m-%d")
  endDate <- as.Date("2007-02-02", "%Y-%m-%d")
  filteredData <- powerData[powerData$Date >= beginDate & powerData$Date <= endDate,]
  
  ##plot the histogram of global active power
  hist(filteredData$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col = "red")
  
  ##save plot to png
  dev.copy(png,"plot1.png")
  dev.off()
}