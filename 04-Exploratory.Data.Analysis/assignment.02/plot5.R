library(ggplot2)

source("initial.R")
read_dataset_nei()

## Plot the data to the png file
png(file = "figure/plot5.png", width = 480, height = 480, units = "px")

## Subsetting columns (Maryland (fips == "24510")) and vehicle type
ey <- subset(NEI, (fips == "24510") & (type == "ON-ROAD"), select = c(Emissions, year))

## Sum by categorical variable (year)
emi_by_year <- aggregate(Emissions ~ year, data = ey, FUN = sum)

## Plot the data for each type
p <- ggplot(emi_by_year, 
        aes(year, Emissions)) + 
        geom_point() + 
        geom_smooth() + 
        ylab("Emissions from motor vehicle sources changed from 1999-2008 in Baltimore City") + 
        xlab("Year")
print(p)

## Shut down the graphical device
dev.off()