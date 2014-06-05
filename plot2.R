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

#plot 2
plot(strptime(paste(DT2$Date,DT2$Time,sep=" "), format = "%Y-%m-%d %H:%M:%S"),DT2$Global_active_power,type="l", ylab = "Global active power (kilowatts)",xlab="" )

# copy to file
dev.copy(png, file = "./ExData_Plotting1/plot2.png")
dev.off()

#restore locale
Sys.setlocale(category = "LC_TIME", locale = oldLoc_time)