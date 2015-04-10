
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
print(head(data))                ##used to check format comment out for run

## Plot 4 graphs together
par(mfrow=c(2,2), mar=c(4,4,1,2), oma=c(0,0,2,0))  ## set the parameters
                                                   ## mfrow 2 rows and 2 columns of graphs on 1 page
                                                   ## mar is margin around the plot bottom,left.top,right  
                                                   ## cex defines relative size of font
with(data, {
  plot(Global_active_power~Full_Date, type="l", 
       ylab="Global Active Power", xlab="")
  plot(Voltage~Full_Date, type="l", 
       ylab="Voltage", xlab="datetime")
  plot(Sub_metering_1~Full_Date, type="l", 
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Full_Date,col='Red')
  lines(Sub_metering_3~Full_Date,col='Blue')
  legend("top", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),cex=0.8)
  plot(Global_reactive_power~Full_Date, type="l", 
       ylab="Global_reactive_power",xlab="datetime")
})

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()  ## close plot4.png

## dev.copy(png, file="plot3.png", height=480, width=640 ,units = "px", pointsize = 8,  bg = "white")
