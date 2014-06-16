Sys.setlocale(category = "LC_ALL", locale = "C")

read_dataset_nei <- function() {
        NEI <<- readRDS("summarySCC_PM25.rds")        
}

read_dataset_scc <- function() {
        SCC <<- readRDS("Source_Classification_Code.rds")
}