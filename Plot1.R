
# Now read it in
namesData <- read.table(file = "household_power_consumption.txt", header=TRUE, sep=";", nrows=1)

# Now grab the intended data
# Beginning of February 1st 2007 is on the 66637th row
# subsetting work from before, there are 1440 observations per day-
# and so to grab Feb 1 and Feb 2, we need 2880 rows

subsetData <- read.table("household_power_consumption.txt", sep=";", 
                         na.strings=c("NA","?"), skip=66637, nrows=2880)

# Assign names to the data frame to clean it up
names(subsetData) <- names(namesData)

# Create a new array for an actual date object
#dates <- paste(subsetData$Date, subsetData$Time)
#datetime <- strptime(dates, "%d/%m/%Y %H:%M:%S")

# First plot1
par(mfrow=c(1,1))
hist(subsetData$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")

# Save to file
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()