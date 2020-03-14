Sys.setlocale("LC_ALL","English")

data <- read.csv("household_power_consumption.txt",
                 header = TRUE,
                 sep = ';',
                 stringsAsFactors = FALSE)

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

data <- subset(data, Date >= as.Date("2007-02-01") &
                     Date <= as.Date("2007-02-02"))

data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)

data$DateTime <- paste(data$Date, data$Time)

data$DateTime <- strptime(data$DateTime,
                          format = "%Y-%m-%d %H:%M:%S")

png(filename = "plot3.png",
    width = 480,
    height = 480,
    units = "px")

plot(x = data$DateTime,
     y = data$Sub_metering_1,
     type = "l",
     col = "black",
     xlab = "",
     ylab = "Energy sub metering")

lines(y = data$Sub_metering_2,
      x = data$DateTime,
      col = "red")

lines(y = data$Sub_metering_3,
      x = data$DateTime,
      col = "blue")

legend("topright",
       col = c("black",
               "red",
               "blue"),
       lty = "solid",
       legend = c("Sub_metering_1",
                  "Sub_metering_2",
                  "Sub_metering_3")
)

dev.off()
