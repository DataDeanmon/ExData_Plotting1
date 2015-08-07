## Plot 3 - #Energy sub-metering line graph
UCI <- read.table("household_power_consumption.txt", sep = ";", skip = 66637, nrows = 2880, col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), stringsAsFactors = FALSE) #read in the relevant portion of text file

UCI$DateTime <- paste(UCI$Date, UCI$Time, sep = " ") #concatenate date/time field
UCI$DateTime <- strptime(UCI$DateTime, format = "%d/%m/%Y %H:%M:%S") #format date/time field

png(filename = "Plot3.png", width = 480, height = 480) #open PNG graphics device
with(UCI, plot(DateTime, as.numeric(Sub_metering_1), type = "n", xlab = "", ylab = "Energy sub metering")) #create line graph
with(UCI, lines(DateTime, as.numeric(Sub_metering_1), col = "black"))
with(UCI, lines(DateTime, as.numeric(Sub_metering_2), col = "red"))           
with(UCI, lines(DateTime, as.numeric(Sub_metering_3), col = "blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off() #close graphics device
