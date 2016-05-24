pollutantmean <- function(directory, pollutant, id=1:332){
  df=data.frame()
  for(i in id){
    f <- paste(sprintf("%03d", i),'.csv',sep='')
    f <- paste(directory, f, sep='/')
    df <- rbind(df, read.csv(f))
  }
  mean(df[[pollutant]], na.rm = TRUE)
}

complete <- function(directory, id=1:332){
  df=data.frame(row.names = c('id','nobs'))
  for(i in id){
    f <- paste(sprintf("%03d", i),'.csv',sep='')
    f <- paste(directory, f, sep='/')
    data <- complete.cases(read.csv(f))
    nob <- sum(data)
    df <- rbind(df, c(i,nob))
  }
  names(df)<-c('id','nobs')
  df
}

corr <- function(directory, threhold=0){
  data <- complete(directory)
  ids <- subset(data, nobs>threhold)[['id']]
  corr_list <- vector()
  for(i in ids){
    f <- paste(sprintf("%03d", i),'.csv',sep='')
    f <- paste(directory, f, sep='/')
    data <- read.csv(f)
    corr_list <- c(corr_list,cor(data$sulfate, data$nitrate, , use = "complete.obs"))
  }
  corr_list
}