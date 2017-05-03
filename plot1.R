setwd("/Users/zliu11/R_for_DScourses/Course4.ExpDataAnalysis/week1project")
library(data.table)
dataUrl = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(dataUrl, destfile = "elec_power_consumption.zip", method = "curl")
unzip("elec_power_consumption.zip")
dt <- fread("household_power_consumption.txt", skip = "1/2/2007", nrows = 2880, col.names = colnames(fread("household_power_consumption.txt", nrows = 1)))
dt[, date.time := paste(dt$Date, dt$Time, sep = " ")]
DateTime <- dt$date.time
DateTime <- as.POSIXct(DateTime, format = "%d/%m/%Y %H:%M:%S")
dt$date.time <- DateTime
# plot1
hist(dt$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.copy(png, file = "plot1.png")
dev.off()