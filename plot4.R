# read file "household_power_consumption.txt" to object hhp
files <- file("/Users/QianWang/Documents/Coursera_exploratoryGraphics/week1/household_power_consumption.txt")
hhp <- read.table(text = grep("^[1,2]/2/2007",readLines(files),value=TRUE), sep = ';', col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings = '?')


# create png
if(!file.exists('figures')) dir.create('figures')


###########plot 4 #####
png(filename = './figures/plot4.png', width = 480, height = 480, units='px')

par(mfrow= c(2,2))    # 2row 2col canvus
# 1st plot
plot(df$DateTime, df$Global_active_power, xlab = '', ylab = 'Global Active Power (kilowatt)', type = 'l')
#2nd plot
plot(df$DateTime, df$Voltage, xlab = 'datetime', ylab = 'Voltage', type = 'l')
#3rd plot
plot(df$DateTime, df$Sub_metering_1, xlab = '', ylab = 'Energy sub metering', type = 'l')
lines(df$DateTime, df$Sub_metering_2, col = 'red')
lines(df$DateTime, df$Sub_metering_3, col = 'blue')
legend('topright', col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#last plot
plot(df$DateTime, df$Global_reactive_power, xlab = 'datetime', ylab = 'Global_reactive_power', type = 'l')
#over
dev.off()
