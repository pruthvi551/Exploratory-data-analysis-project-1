library("data.table")



pwr <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?"
)

pwr[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

pwr[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

pwr <- pwr[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

png("plot2.png", width=480, height=480)

## Plot 2
plot(x = pwr[, dateTime]
     , y = pwr[, Global_active_power]
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
