# Exploratory Data Analysis, Course Project 1
# Plot 1/4

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
png(filename="plot1.png", width=480, height=480)
hist(dt$Global_active_power, col="Red",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency",
     main="Global Active Power")
dev.off()