# read file "household_power_consumption.txt" to object hhp
files <- file("/Users/QianWang/Documents/Coursera_exploratoryGraphics/week1/household_power_consumption.txt")
hhp <- read.table(text = grep("^[1,2]/2/2007",readLines(files),value=TRUE), sep = ';', col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings = '?')


# create dir
if(!file.exists('figures')) dir.create('figures')


######## plot 2#######
df<- copy(hhp)
df$Date <- as.Date(df$Date, format = '%d/%m/%Y')
df$DateTime <- as.POSIXct(paste(df$Date, df$Time))
# open device png and plot
png(filename = './figures/plot2.png', width = 480, height = 480, units='px')
plot(df$DateTime, df$Global_active_power, xlab = '', ylab = 'Global Active Power (kilowatt)', type = 'l')
dev.off()