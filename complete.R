#Data from https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2Fspecdata.zip

complete <- function(directory = "specdata/", id){
  
  countgoods <- function(filetocount){
    sum(complete.cases(read.csv(filetocount, header = T)))
  }
  
  allfiles <- dir(paste0(directory,"/"))
  files <- allfiles[id]
  paths <- paste0(directory,"/",files)
  completes <- sapply(paths, FUN = countgoods)

  df <- data.frame(id, nobs = completes)
  rownames(df) <- NULL
  df
}
