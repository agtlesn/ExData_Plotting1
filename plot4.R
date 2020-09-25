df <- read.csv("./household_power_consumption.txt", 
               header = T, sep = ";", na.strings = "?")
df$Date <- as.Date(df$Date, format ="%d/%m/%Y")
df1 <- df[df$Date %in% as.Date(c("2007-02-01", "2007-02-02")), ]
datetime <- paste(df1$Date, df1$Time)
df1$datetime <- as.POSIXct(datetime)


png(file = "./plot4.png", width = 480, height = 480) 
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
with(df1, {
    plot(Global_active_power ~ datetime, type = "l", 
         ylab = "Global Active Power", xlab = "")
    plot(Voltage ~ datetime, type = "l", 
         ylab = "Voltage")
    plot(Sub_metering_1 ~ datetime, type = "l", 
         ylab = "Energy sub metering", xlab = "")
    lines(Sub_metering_2 ~ datetime, col = "red")
    lines(Sub_metering_3 ~ datetime, col = "blue")
    legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, bty = "n",
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Global_reactive_power ~ datetime, type = "l", 
         ylab = names(df1[4]))
})
dev.off()


