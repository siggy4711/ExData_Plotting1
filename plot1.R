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

#plot 1
hist(DT2$Global_active_power,main = "Global active power",col = "red",xlab = "Global active power (kilowatts)")

# copy to file
dev.copy(png, file = "./ExData_Plotting1/plot1.png")
dev.off()

#restore locale
Sys.setlocale(category = "LC_TIME", locale = oldLoc_time)





