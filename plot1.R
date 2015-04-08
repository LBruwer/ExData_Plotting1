
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

## Plot a histogram of Global Active Power
## x-axis label "Global Active Power"
## y-axis label "Frequency"
## colour = red
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Save plot to file
## filename = plot1.png
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off() ## close plot1.png