source("initial.R")

dframe <- read_dataset()

# plot the data to the png file
png(file = "figure/plot2.png", width = 480, height = 480, units = "px")

with(dframe, 
     plot(datetime, 
          Global_active_power, 
          col = "black", 
          xlab = "", 
          ylab = "Global Active Power (killowats)",
          type = "l"
          )
     )
dev.off()
