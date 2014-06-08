source("initial.R")

dframe <- read_dataset()

# plot the data to the png file
png(file = "figure/plot4.png", width = 480, height = 480, units = "px")

# we need 4 pictures
par(mfrow = c(2, 2))

with(dframe, {
        # 1,1
        plot(datetime, Global_active_power, col = "black", xlab = "", 
             ylab = "Global Active Power", type = "l")

        # 1,2
        plot(datetime, Voltage, type = "l")
        
        # 2,1
        plot(datetime,  Sub_metering_1, xlab = "",  ylab = "Energy sub metering", type = "l")
        lines(datetime, Sub_metering_2, col = "red")
        lines(datetime, Sub_metering_3, col = "blue")
        columns = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
        legend("topright", lty = "solid", col = c("black", "red", "blue"), legend = columns, bty = "n")
        
        # 2,2
        plot(datetime, Global_reactive_power, type = "l")
})

dev.off()
