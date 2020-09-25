df <- read.csv("./household_power_consumption.txt", 
               header = T, sep = ";", na.strings = "?")
df$Date <- as.Date(df$Date, format ="%d/%m/%Y")
df1 <- df[df$Date %in% c(as.Date("2007-02-01"), as.Date("2007-02-02")), ]

hist(df1$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency", col = "red")
dev.copy(png, file = "./plot1.png", width = 480, height = 480)
dev.off()
