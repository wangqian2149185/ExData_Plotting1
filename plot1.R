# read file "household_power_consumption.txt" to object hhp
files <- file("/Users/QianWang/Documents/Coursera_exploratoryGraphics/week1/household_power_consumption.txt")
hhp <- read.table(text = grep("^[1,2]/2/2007",readLines(files),value=TRUE), sep = ';', col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings = '?')


# create png
if(!file.exists('figures')) dir.create('figures')
png(filename = "./figures/plot1.png", width = 480, height = 480, units= "px")

####### plot 1 ######
par(mfrow(c(1,1)))  # 1 row 1col;
hist(hhp$Global_active_power,col ="red",breaks = 12,main = "Global Active Power"
     , xlab = "Global Active Power (kilowatts)")
dev.off()
