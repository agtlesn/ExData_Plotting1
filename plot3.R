df <- read.csv("./household_power_consumption.txt", 
               header = T, sep = ";", na.strings = "?")
df$Date <- as.Date(df$Date, format ="%d/%m/%Y")
df1 <- df[df$Date %in% as.Date(c("2007-02-01", "2007-02-02")), ]
datetime <- paste(df1$Date, df1$Time)
df1$datetime <- as.POSIXct(datetime)


png(file = "./plot3.png", width = 480, height = 480) 
with(df1, {
    plot(Sub_metering_1 ~ datetime, type = "l",
         ylab = "Energy sub metering", xlab = "")
    lines(Sub_metering_2 ~ datetime, col = "red")
    lines(Sub_metering_3 ~ datetime, col = "blue")
})
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
