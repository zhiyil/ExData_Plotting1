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
# plot3
with(dt, {plot(Sub_metering_1 ~ date.time, type = "l", ylab = "Energy sub metering", xlab = "") 
        lines(Sub_metering_2 ~ date.time, col = "red")
        lines(Sub_metering_3 ~ date.time, col = "blue")
})

legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file = "plot3.png")
dev.off()
