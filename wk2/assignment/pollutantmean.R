pollutantmean <- function(directory, pollutant, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'pollutant' is a character vector of length 1 indicating
    ## the name of the pollutant for which we will calculate the
    ## mean; either "sulfate" or "nitrate".
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return the mean of the pollutant across all monitors list
    ## in the 'id' vector (ignoring NA values)
    ## NOTE: Do not round the result!
    
    ## setting the directory
    #setwd(file.path(getwd(), directory))
    data <- data.frame()
    
    file_extention='csv'
    for (i in id) {
        # alternatively sprintf("%03d", i)
        s=paste('00',toString(i),sep='')
        index=substr(s,nchar(s)-2,nchar(s))
        file_name=paste(index,file_extention, sep = '.')
        data <- rbind(data, read.csv(file_name))
    }
    
    pollutantMean <- mean(data[[pollutant]], na.rm = TRUE);
    pollutantMean;
}