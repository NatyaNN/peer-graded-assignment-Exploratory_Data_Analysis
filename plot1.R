# 1. Unzip and download file
fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl, destfile = "electric.zip", method = "curl")
unzip("electric.zip")

# 2. Read file and subset the relevant dates (2 January 2007 - 2 February 2007)
electric_full <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
electric <- subset(electric_full, Date %in% c("1/2/2007", "2/2/2007"))

# 3. Change Date format from factor to date
electric$Date <- as.Date(electric$Date, format = "%d/%m/%Y")

# 4. Open png device
png(file = "plot1.png")

# 5. Create Plot 1
plot1 <- hist(as.numeric(electric$Global_active_power),
              main = "Global Active Power",
              xlab = "Global Active Power (kilowatts)",
              ylab = "Frequency",
              col = "red")

# 6. Close the png file device
dev.off()
