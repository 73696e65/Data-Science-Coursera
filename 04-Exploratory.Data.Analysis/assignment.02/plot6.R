library(ggplot2)

source("initial.R")
read_dataset_nei()

## Plot the data to the png file
png(file = "figure/plot6.png", width = 480, height = 480, units = "px")

## Subsetting columns (Maryland (fips == "24510") and California (fips == "06037)) and vehicle type
ey <- subset(NEI, (fips %in% c("24510", "06037")) & (type == "ON-ROAD"), select = c(Emissions, year, fips))

## Sum by categorical variable (year + fips)
emi_by_fips_year <- aggregate(Emissions ~ year + fips, data = ey, FUN = sum)

## Create labeller for facets
fips_labeller <- function(variable, value) {
        fips_names <- list(
                "24510" = "Maryland",
                "06037" = "California"
        )
        fips_names[value]
}

## Plot the data for each type
p <- ggplot(emi_by_fips_year, 
        aes(year, Emissions)) + 
        geom_point() + 
        geom_smooth(colour = "red") + 
        ylab("Emissions from motor vehicle sources changed from 1999-2008") + 
        xlab("Year") +
        facet_grid(. ~ fips, labeller = fips_labeller) +
        geom_text(aes(label = as.integer(Emissions)), size = 3, vjust = -1)
print(p)

## Shut down the graphical device
dev.off()