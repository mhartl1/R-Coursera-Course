source("~/documents/R-Coursera-Course/week2/functions.R")

head(load.file(directory = "specdata", i=2))

head(load.files(directory = "specdata", id=2:3))

pollutantmean(
    directory = "specdata",
    pollutant = "nitrate",
    id = 1:5
)

complete(
    directory = "specdata", 
    id=c(2, 4, 8, 10, 12)
)

corr("specdata", 400)
















