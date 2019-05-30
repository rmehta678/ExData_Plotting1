## AUTHOR: ROHAN MEHTA
## DATE: 05/29/2019

# Reading in only the dates 2007-02-01 and 2007-02-02 for plotting purposes
household_power_consumption <- read.table("household_power_consumption.txt", skip = 66637, nrow = 2880, sep = ";")

# Applying names to data table since we skipped first row while reading
name <- sapply(read.table("household_power_consumption.txt", nrow = 1, sep = ";"), as.character)
names(household_power_consumption) <- name

#Converting to Date Time using strptime()
household_power_consumption$DateTime <- strptime(paste(household_power_consumption$Date, household_power_consumption$Time), format="%d/%m/%Y %H:%M:%S")

#Plotting
dev.new(480,480)
with(household_power_consumption, plot(DateTime, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering" , axes = F, frame.plot=TRUE))
axis(1, at=c(as.numeric(min(household_power_consumption$DateTime)), as.numeric(min(household_power_consumption$DateTime))+86400
             , as.numeric(min(household_power_consumption$DateTime))+2*86400), labels=c("Thu", "Fri", "Sat"))
axis(2, yaxs = "r")
with(household_power_consumption, points(DateTime, Sub_metering_1, type = "l"))
with(household_power_consumption, points(DateTime, Sub_metering_2, type = "l", col = "red"))
with(household_power_consumption, points(DateTime, Sub_metering_3, type = "l", col = "blue"))
legend("topright", pch = "w", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
