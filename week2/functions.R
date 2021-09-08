load.file <- function(directory, i) {
    file.int <- sprintf("%03i", i)
    file.name <- paste(directory, file.int, ".csv", sep="")
    data <- read.csv(file.name)
    data
}

load.files <- function(directory, id){
    for (i in id){
        if (!exists("combined.data")) {
            combined.data <- load.file(directory, i)
        } else {
            combined.data <- rbind(combined.data, load.file(directory, i))
        }
    }
    combined.data
}
