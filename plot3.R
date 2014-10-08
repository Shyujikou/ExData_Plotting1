# Exploratory Data Analysis, Course Project 1
# Plot 3/4

# Load data
readFrom <- 66638
readTo <- 69517
dt <- read.table("household_power_consumption.txt",
                 col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),
                 sep=";", na.strings="?", skip=readFrom-1, 
                 nrows=readTo-readFrom+1)

# Add a column to merge and convert date/time
dt <- cbind(data.frame(Datetime=strptime(paste(dt$Date, dt$Time, sep=" "), "%d/%m/%Y %H:%M:%S")), dt)

# Make plot
png(filename="plot3.png", width=480, height=480)
plot(x=dt$Datetime, y=dt$Sub_metering_1, type="l",
     xlab="", ylab="Energy sub metering")
lines(x=dt$Datetime, y=dt$Sub_metering_2, col="Red")
lines(x=dt$Datetime, y=dt$Sub_metering_3, col="Blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("Black", "Red", "Blue"), lwd=1)
dev.off()