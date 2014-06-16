source("initial.R")
read_dataset_nei()

## Plot the data to the png file
png(file = "figure/plot1.png", width = 480, height = 480, units = "px")

## Subsetting columns
ey <- subset(NEI, select = c(Emissions, year))

## Sum by categorical variable (year)
emi_by_year <- tapply(ey$Emissions, ey$year, sum)

## Plot without X axis 
plot(names(emi_by_year), 
        emi_by_year, 
        xlab = "Years", 
        ylab = "Total emissions", 
        type = "o", 
        xaxt = 'n',
        col = "red",
        pch = 3
)

## Add X axis for 1999, 2002, 2005, 2008
axis(side = 1, at = names(emi_by_year))

## Shut down graphical device
dev.off()