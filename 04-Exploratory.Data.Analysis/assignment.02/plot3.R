library(ggplot2)

source("initial.R")
read_dataset_nei()

## Plot the data to the png file
png(file = "figure/plot3.png", width = 480, height = 480, units = "px")

## Subsetting columns (Maryland (fips == "24510"))
ey <- subset(NEI, fips == "24510", select = c(Emissions, year, type))

## Sum by categorical variable (year + type)
emi_by_type_year <- aggregate(Emissions ~ year + type, data = ey, FUN = sum)

## Plot the data for each type
p <- qplot(year, Emissions, data = emi_by_type_year, facets = ~ type, geom = c("point", "smooth"), method = "loess")
print(p)

## Shut down the graphical device
dev.off()