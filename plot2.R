df <- read.csv("./household_power_consumption.txt", 
               header = T, sep = ";", na.strings = "?")
df$Date <- as.Date(df$Date, format ="%d/%m/%Y")
df1 <- df[df$Date %in% c(as.Date("2007-02-01"), as.Date("2007-02-02")), ]
datetime <- paste(df1$Date, df1$Time)
df1$datetime <- as.POSIXct(datetime)

plot(df1$Global_active_power ~ df1$datetime, type = "l",
         ylab = "Global Active Power (kilowatts)", xlab = "")

dev.copy(png, file = "./plot2.png", width = 480, height = 480)
dev.off()
