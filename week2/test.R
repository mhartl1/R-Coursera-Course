source("documents/R-Coursera-Course/week2/functions.R")

head(load.file(directory = "documents/R-Coursera-Course/data/specdata/", i=2))

head(load.files(directory = "documents/R-Coursera-Course/data/specdata/", id=2:3))

pollutantmean(
    directory = "documents/R-Coursera-Course/data/specdata/",
    pollutant = "nitrate",
    id = 1:5
)
