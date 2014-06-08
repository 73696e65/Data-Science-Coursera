source("initial.R")

dframe <- read_dataset()

# plot the data to the png file
png(file = "figure/plot3.png", width = 480, height = 480, units = "px")

with(dframe, plot(datetime,  Sub_metering_1, xlab = "",  ylab = "Energy sub metering", type = "l"))
with(dframe, lines(datetime, Sub_metering_2, col = "red"))
with(dframe, lines(datetime, Sub_metering_3, col = "blue"))

# add legend
columns = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legend("topright", lty = "solid", col = c("black", "red", "blue"), legend = columns)

dev.off()
