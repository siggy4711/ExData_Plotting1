setwd("F:/dload/coursera/Exploratory Data Analysis")

# Note:
# read from <wd>/data
# write to <wd>/ExData_Plotting1/

oldLoc_time <- Sys.getlocale("LC_TIME")
Sys.setlocale(category = "LC_TIME", locale = "English")


#setup faster read
n <- 2075265L
classrows <- read.table("./data/household_power_consumption.txt", header = TRUE, nrows = 5,sep = ";",stringsAsFactors = FALSE)
classes <- sapply(classrows, class)

setClass('myDate')
setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )
classes[[1]] <- "myDate"

#read data and filter
DT <- read.table("./data/household_power_consumption.txt",nrows=n,sep = ";",stringsAsFactors = FALSE, colClasses = classes, header = TRUE,na.strings = "?")
DT2 <- subset(DT,(  (Date == "2007-02-01") | (Date == "2007-02-02") ))

#open png device, copy ruins topright labels
png(file = "./ExData_Plotting1/plot3.png")

#plot 3
plot(strptime(paste(DT2$Date,DT2$Time,sep=" "), format = "%Y-%m-%d %H:%M:%S"),DT2$Sub_metering_1,type="n", ylab = "Energy sub metering",xlab="" )
lines(strptime(paste(DT2$Date,DT2$Time,sep=" "), format = "%Y-%m-%d %H:%M:%S"),DT2$Sub_metering_1,type="l" )
lines(strptime(paste(DT2$Date,DT2$Time,sep=" "), format = "%Y-%m-%d %H:%M:%S"),DT2$Sub_metering_2,type="l" ,col="red")
lines(strptime(paste(DT2$Date,DT2$Time,sep=" "), format = "%Y-%m-%d %H:%M:%S"),DT2$Sub_metering_3,type="l" ,col="blue")
legend("topright", lwd=1, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#close png device
dev.off()

#restore locale
Sys.setlocale(category = "LC_TIME", locale = oldLoc_time)