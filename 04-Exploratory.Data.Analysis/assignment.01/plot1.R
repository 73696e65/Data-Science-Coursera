source("initial.R")

dframe <- read_dataset()

# plot the data to the png file
png(file = "figure/plot1.png", width = 480, height = 480, units = "px")

with(dframe, 
     hist(Global_active_power, 
          col = "red", 
          main = "Global Active Power", 
          xlab = "Global Active Power (killowats)", 
          ylab = "Frequency"
     )
)
dev.off()
