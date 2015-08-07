## Plot 4 - Lattice graph
UCI <- read.table("household_power_consumption.txt", sep = ";", skip = 66637, nrows = 2880, col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), stringsAsFactors = FALSE) #read in the relevant portion of text file

UCI$DateTime <- paste(UCI$Date, UCI$Time, sep = " ") #concatenate date/time field
UCI$DateTime <- strptime(UCI$DateTime, format = "%d/%m/%Y %H:%M:%S") #format date/time field

png(filename = "Plot4.png", width = 480, height = 480) #open PNG graphics device
par(mfrow = c(2,2)) #set global graphics parameters for lattice plot
with(UCI, plot(DateTime, as.numeric(Global_active_power), type = "l", xlab = "", ylab = "Global Active Power")) #create Global Active Power line graph
with(UCI, plot(DateTime, as.numeric(Voltage), type = "l", xlab = "datetime", ylab = "Voltage")) #create Voltage line graph
with(UCI, {
        plot(DateTime, as.numeric(Sub_metering_1), type = "n", xlab = "", ylab = "Energy sub metering") #create line graph
        lines(DateTime, as.numeric(Sub_metering_1), col = "black")
        lines(DateTime, as.numeric(Sub_metering_2), col = "red") 
        lines(DateTime, as.numeric(Sub_metering_3), col = "blue")
        legend("topright", bty = "n", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
}) #Create energy sub-metering line graph
with(UCI, plot(DateTime, as.numeric(Global_reactive_power), type = "l", xlab = "datetime", ylab = "Global_reactive_power")) #create global reactive power line graph)

dev.off() #close graphics device
