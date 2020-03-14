Sys.setlocale("LC_ALL","English")

data <- read.csv("household_power_consumption.txt",
                 header = TRUE,
                 sep = ';',
                 stringsAsFactors = FALSE)

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

data <- subset(data, Date >= as.Date("2007-02-01") &
                     Date <= as.Date("2007-02-02"))

data$Global_active_power <- as.numeric(data$Global_active_power)

data$DateTime <- paste(data$Date, data$Time)

data$DateTime <- strptime(data$DateTime,
                          format = "%Y-%m-%d %H:%M:%S")

png(filename = "plot2.png",
    width = 480,
    height = 480,
    units = "px")

with(
    data,
    plot(y = Global_active_power,
         x = DateTime,
         type = "l",
         xlab = "",
         ylab = "Global Active Power (kilowatts)",
         main = "")
)

dev.off()