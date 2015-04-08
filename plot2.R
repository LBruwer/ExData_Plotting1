
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

## Plot Graph of Global Active Power
## y-axis label "Global Active Power"
## x-axis weekdays
plot(data$Global_active_power~data$Full_Date, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()  ## close plot2.png