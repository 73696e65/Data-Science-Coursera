library(ggplot2)

source("initial.R")
read_dataset_nei()
read_dataset_scc()

## Plot the data to the png file
png(file = "figure/plot4.png", width = 480, height = 480, units = "px")

##  Take only coal combustion-related sources from SCC (91 entries)
comb_col_related_scc <- subset(SCC, grepl("Comb.*Coal", Short.Name))

## Merge entries with the NEI dataset
comb_col_data <- merge(x = NEI, y = comb_col_related_scc, by = "SCC", all = FALSE)

## Subsetting columns
ey <- subset(comb_col_data, select = c(Emissions, year))

## Sum by categorical variable (year)
emi_by_type_year <- aggregate(Emissions ~ year, data = ey, FUN = sum)

## Plot the data for each type
p <- qplot(year, Emissions, data = emi_by_type_year, geom = c("point", "smooth"), method = "loess")
print(p)

## Shut down the graphical device
dev.off()