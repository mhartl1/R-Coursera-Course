##########################
# Data loading functions #
##########################

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

##########
# Part 1 #
##########

pollutantmean <- function(directory, pollutant, id = 1:332){
    combined.data <- load.files(directory, id)
    values <- combined.data[[pollutant]]
    values <- values[!is.na(values)]
    mean(values)
}

##########
# Part 2 #
##########

complete <- function(directory, id = 1:332){
    nobs = vector("numeric", length=length(id))
    for (i in 1:length(id)){
        df <- load.file(directory, id[i])
        nobs[i] <- sum(complete.cases(df[["suflate"]], df[["nitrate"]]))
    }
    data.frame(id = id, nobs = nobs)
}

##########
# Part 3 #
##########

corr <- function(directory, threshold = 0){
    #ids of the relevant locations
    nobs.data <- complete(directory)
    id <- nobs.data[nobs.data$nobs > threshold, "id"]
    
    #calculate correlations
    cors <- vector("numeric", length=length(id))
    for (n in 1:length(id)){
        tmp.data <- load.file(directory, id[n])
        cors[n] <- cor(
            x = tmp.data$nitrate,
            y = tmp.data$sulfate,
            use = "complete.obs"
            )
    }
    cors   
}











