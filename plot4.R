# Exploratory Data Analysis, Course Project 1
# Plot 4/4

# Load data
readFrom <- 66638
readTo <- 69517
dt <- read.table("household_power_consumption.txt",
                 col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),
                 sep=";", na.strings="?", skip=readFrom-1, 
                 nrows=readTo-readFrom+1)

# Add a column to merge and convert date/time
dt <- cbind(data.frame(Datetime=strptime(paste(dt$Date, dt$Time, sep=" "), "%d/%m/%Y %H:%M:%S")), dt)

# Make plots
png(filename="plot4.png", width=480, height=480)
par(mfrow=c(2,2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))

# Sub plot 1/4
plot(x=dt$Datetime, y=dt$Global_active_power, type="l",
     xlab="", ylab="Global Active Power")

# Sub plot 2/4
plot(x=dt$Datetime, y=dt$Voltage, type="l",
     xlab="datetime", ylab="Voltage")

# Sub plot 3/4
plot(x=dt$Datetime, y=dt$Sub_metering_1, type="l",
     xlab="", ylab="Energy sub metering")
lines(x=dt$Datetime, y=dt$Sub_metering_2, col="Red")
lines(x=dt$Datetime, y=dt$Sub_metering_3, col="Blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("Black", "Red", "Blue"), lwd=1, bty="n")

# Sub plot 4/4
plot(x=dt$Datetime, y=dt$Global_reactive_power, type="l",
     xlab="datetime", ylab="Global_reactive_power")

dev.off()