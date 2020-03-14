Sys.setlocale("LC_ALL","English")

data <- read.csv("household_power_consumption.txt",
                 header = TRUE,
                 sep = ';',
                 stringsAsFactors = FALSE)

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

data <- subset(data, Date >= as.Date("2007-02-01") &
                     Date <= as.Date("2007-02-02"))

data$Global_active_power <- as.numeric(data$Global_active_power)

png(filename = "plot1.png",
    width = 480,
    height = 480,
    units = "px")

hist(data$Global_active_power,
     col = "red",
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")

print(range(data$Date))

dev.off()