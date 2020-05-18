# 1. Unzip and download file
fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl, destfile = "electric.zip", method = "curl")
unzip("electric.zip")

# 2. Read file and subset the relevant dates (2 January 2007 - 2 February 2007)
electric_full <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
electric <- subset(electric_full, Date %in% c("1/2/2007", "2/2/2007"))

# 3. Change variable date & time
electric$Date <- as.Date(electric$Date, format="%d/%m/%Y")
electric$Time <- strptime(electric$Time, format="%H:%M:%S")
electric[1:1440,"Time"] <- format(electric[1:1440,"Time"],"2007-02-01 %H:%M:%S")
electric[1441:2880,"Time"] <- format(electric[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

# 4. Open png device
png(file = "plot2.png")

# 5. Create Plot 2
plot2 <- plot(electric$Time, as.numeric(as.character(electric$Global_active_power)),
              type="l",
              xlab="",
              ylab="Global Active Power (kilowatts)",
              main = "Global Active Power Vs Time") 

# 6. Close the png file device
dev.off()