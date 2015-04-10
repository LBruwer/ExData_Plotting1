
## Read dataset into data frame called hpc
hpc <- read.csv("./data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")

## Subsetting the data
data <- subset(hpc, subset=(Date >= "2007-02-01" & Date <= "2007-02-02")) ## store subset date range in variable data
rm(hpc)					## remove data frame hpc

## Converting dates
fulldate <- paste(as.Date(data$Date), data$Time)
data$Full_Date <- as.POSIXct(fulldate)
## print(head(data))                used to check format comment out for run

## Plot Graph of Energy Sub Metering
par(mar = c(3, 5, 2, 4),cex = 0.9)  # margin around the plot bottom,left.top,right  cex defines size of font

## creating plot with label
with(data, {
  plot(Sub_metering_1~Full_Date, type="l", ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Full_Date,col='Red')    
  lines(Sub_metering_3~Full_Date,col='Blue')
})

## creating legend
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.9,)


dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()  ## close plot3.png

