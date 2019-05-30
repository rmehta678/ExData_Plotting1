## AUTHOR: ROHAN MEHTA
## DATE: 05/29/2019

# Reading in only the dates 2007-02-01 and 2007-02-02 for plotting purposes
household_power_consumption <- read.table("household_power_consumption.txt", skip = 66637, nrow = 2880, sep = ";")

# Applying names to data table since we skipped first row while reading
name <- sapply(read.table("household_power_consumption.txt", nrow = 1, sep = ";"), as.character)
names(household_power_consumption) <- name

#Creating 480x480 window and plotting 
dev.new(480,480)
hist(household_power_consumption$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red", ylim = c(0, 1200))
