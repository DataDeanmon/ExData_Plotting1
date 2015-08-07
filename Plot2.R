## Plot 2 - Line graph of Global Active Power

UCI <- read.table("household_power_consumption.txt", sep = ";", skip = 66637, nrows = 2880, col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), stringsAsFactors = FALSE) #read in the relevant portion of text file

UCI$DateTime <- paste(UCI$Date, UCI$Time, sep = " ") #concatenate date/time field
UCI$DateTime <- strptime(UCI$DateTime, format = "%d/%m/%Y %H:%M:%S") #format date/time field

png(filename = "Plot2.png", width = 480, height = 480) #open PNG graphics device
with(UCI, plot(DateTime, as.numeric(Global_active_power), type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")) #create line graph
dev.off() #close graphics device
