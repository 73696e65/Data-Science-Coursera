Sys.setlocale(category = "LC_ALL", locale = "C")

read_dataset <- function(fname = "household_power_consumption.txt") {
        
        ## extract table information
        first_row <- read.table(file = fname, header = TRUE, nrow = 1, sep = ";", stringsAsFactors=FALSE)
        classes <- sapply(first_row, class)
        labels <- names(first_row)
        
        dataset <- read.table(file = fname, 
                              header = FALSE,
                              colClasses = classes, 
                              sep = ";", 
                              comment.char = "",
                              skip = 66637,
                              nrow = 2880,
                              na.strings = "?"
        )
        names(dataset) <- labels
        
        ## extend dataset with datestamp (POSIXlt type)
        X <- (apply(dataset[c("Date", "Time")], 1, paste, collapse = " "))
        Y <- strptime(X, format = "%d/%m/%Y %X")
        dataset <- cbind(dataset, datetime=Y)
}
