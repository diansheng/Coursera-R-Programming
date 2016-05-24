corr <- function(directory, threshold = 0) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'threshold' is a numeric vector of length 1 indicating the
    ## number of completely observed observations (on all
    ## variables) required to compute the correlation between
    ## nitrate and sulfate; the default is 0
    
    ## Return a numeric vector of correlations
    ## NOTE: Do not round the result!
    files <- list.files(directory,full.names = TRUE)
    corr_list <- vector(mode = "numeric", length = 0)
    # how to initiate a empty list and append?
    
    for (i in 1:length(files)){
        complete_list <- complete(directory,i)
        if (complete_list$nobs > threshold){
            data <- read.csv(files[i], comment.char = "");
            corr_list <- c(corr_list, cor(data$sulfate, data$nitrate, use = "complete.obs"));
        }
    }
    corr_list
}