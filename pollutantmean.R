#Data From https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2Fspecdata.zip

load_data <- function(path) {
  files <- dir(path, full.names = TRUE)
  tables <- lapply(files, read.csv)
  pollutant.data <- do.call(rbind, tables)
}

pollutantmean <- function(directory, pollutant, id=1:332){
  
  if(max(id) > 332 | min(id) < 1){
    return(print("Please specify valid station IDs"))
  }
  
  pollutant.data <- load_data(paste(directory))
  
  if(tolower(paste(pollutant)) == "nitrate"){
    
    pollutant.data <- pollutant.data[pollutant.data$ID %in% id, ]
    mean(pollutant.data$nitrate, na.rm = TRUE)
    
  }else if (tolower(paste(pollutant)) == "sulfate"){
    
    pollutant.data <- pollutant.data[pollutant.data$ID %in% id, ]
    mean(pollutant.data$sulfate, na.rm = TRUE)
    
  }else{
    print("Invalid Pollutant")
  }
  
}