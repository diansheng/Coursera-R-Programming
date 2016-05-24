complete <- function(directory, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return a data frame of the form:
    ## id nobs
    ## 1  117
    ## 2  1041
    ## ...
    ## where 'id' is the monitor ID number and 'nobs' is the
    ## number of complete cases
    file_extention='.csv'
    completeCases<-data.frame()
    for (i in id) {
        # s=paste('00',toString(i),sep='')
        # index=substr(s,nchar(s)-2,nchar(s))
        index=sprintf("%03d", i)
        file_name=paste(directory,'/',index,file_extention, sep = '')
        data <- read.csv(file_name)
        c <- complete.cases(data)
        completeCases<- rbind(completeCases, c(i,nrow(data[c,])))
    }
    names(completeCases)<-c('id','nobs')
    completeCases
}