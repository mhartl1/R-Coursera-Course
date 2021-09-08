source("documents/R-Coursera-Course/week2/functions.R")

head(load.file(directory = "documents/R-Coursera-Course/data/specdata/", i=2))

head(load.files(directory = "documents/R-Coursera-Course/data/specdata/", id=2:3))

pollutantmean(
    directory = "documents/R-Coursera-Course/data/specdata/",
    pollutant = "nitrate",
    id = 1:5
)

complete(
    directory = "documents/R-Coursera-Course/data/specdata/", 
    id=c(2, 4, 8, 10, 12)
)

corr("documents/R-Coursera-Course/data/specdata/", 400)
















