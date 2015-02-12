#Data from https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2Fspecdata.zip

corr <- function(directory = "specdata", threshold = 1){
  
  countgoods <- function(filetocount){
    sum(complete.cases(read.csv(filetocount, header = T)))
  }
  
  getcor <- function(gooddata){
    gooddata <- gooddata[,2:3]
    gooddata <- gooddata[complete.cases(gooddata), ]
    cor(gooddata[,1], gooddata[,2])
  }
  
  allfiles <- dir(paste0(directory,"/"))
  paths <- paste0(directory,"/",allfiles)
  completes <- sapply(paths, FUN = countgoods)
  
  df <- data.frame(FileName = allfiles, nobs = completes)
  rownames(df) <- NULL
  goodfiles <- df[df$nobs > threshold, ]
  if(!plyr::empty(goodfiles)){
    goodfiles <- as.character(goodfiles[,1])
    filelist <- lapply(paste0(directory,"/",goodfiles), read.csv)
    #gooddata <- do.call(rbind, filelist)
    cors <- unlist(lapply(filelist, FUN = getcor))
  }

}