best <- function(state, outcome){
  ## Check that outcome is valid
  validOutcome = c("heart attack","heart failure","pneumonia")
  if (!outcome %in% validOutcome) { stop("invalid outcome")}
  
  # it is extremely critical to have colClasses="character"
  data <- read.csv("./data/outcome-of-care-measures.csv", colClasses = "character", na.strings = "Not Available")
  
  ## Check that state is valid
  validState = unique(data[,7])
  if (!state %in% validState) stop("invalid state")
  
  sd <- subset(data, State==state, select=c(2, 11, 17, 23)) # selected data
  names(sd) <- c('Hospital',validOutcome)
  
  ## Return hospital name in that state with lowest 30-day death rate
  # it is extremely critical to have na.rm="TRUE"
  get_min <- function(x) which(x==min(x, na.rm = TRUE))
  # it is extremely critical to have as.numeric
  idx <- get_min(as.numeric(sd[,outcome]))
  sd[idx,"Hospital"]
}

rankhospital <- function(state, outcome, num="best"){
  ## Check that outcome is valid
  validOutcome = c("heart attack","heart failure","pneumonia")
  if (!outcome %in% validOutcome) { stop("invalid outcome")}
  
  # it is extremely critical to have colClasses="character"
  data <- read.csv("./data/outcome-of-care-measures.csv", colClasses = "character", na.strings = "Not Available")
  
  ## Check that state is valid
  validState = unique(data[,7])
  if (!state %in% validState) stop("invalid state")
  
  sd <- subset(data, State==state, select=c(2, 11, 17, 23)) # selected data
  names(sd) <- c("Hospital",validOutcome)

  ## Construct the ordered data frame based on death rate
  osd <- sd[order(as.numeric(sd[,outcome]), sd$Hospital, na.last = NA),]
  if(num=="best") { num <- 1}
  else if(num=="worst") { num <- nrow(osd)}
  osd[num,"Hospital"]
}


rankall <- function(outcome, num="best"){
  ## Check that outcome is valid
  validOutcome = c("heart attack","heart failure","pneumonia")
  if (!outcome %in% validOutcome) { stop("invalid outcome")}
  
  # it is extremely critical to have colClasses="character"
  data <- read.csv("./data/outcome-of-care-measures.csv", colClasses = "character", na.strings = "Not Available")

  sd <- subset(data, select=c(2, 7, 11, 17, 23)) # selected data
  names(sd) <- c("hospital","State", validOutcome)
  
  ## Construct the ordered data frame based on death rate
  osd <- sd[order(as.numeric(sd[,outcome]), sd$hospital, na.last = NA),]
  get_num <- function(x, num){
    if(num=="best") { num <- 1}
    else if(num=="worst") { num <- nrow(x)}
    x[num]
  }
  aosd <- aggregate(osd, list(state=osd$State), get_num, num)
  aosd[,c("hospital", "state")]
}