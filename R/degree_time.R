#' @title Calculate time in each degree
#'
#' @description
#' \code{degree_time} returns a data frame with calculated time in each degree at one degree intervals
#' within a specified thresholds.
#' 
#' @details 
#' To generate time in each degree the data passed must be in wide format with minimum temperature 
#' column labeled as tmin and maximum temperature labeled as tmax. 
#' 
#' @param data data in wide format with minimum temperature labeled as tmin and maximum temperature labeled as tmax
#' @param thresholds threshold of temperature intervals to calculate time in each degree
#' @examples 
#' data(napa)
#' degree_time(napa, thresholds = c(0:35))
#'

degree_time <- function(data, thresholds){
  
  # Assign return data
  retdat <- data
  
  # ncols to add
  nc <- ncol(retdat)
  
  # Loop through each threshold
  for (i in 1:length(thresholds)){
    
    # Insert new column
    col <- paste0("tdegree", thresholds[i], "C")
    cadd <- i + nc
    b <- thresholds[i]
    retdat[, cadd] <- 0
    
    # Intervals between +- 0.5
    n   =  length(retdat$tmin)
    t0  =  rep(thresholds[i] - 0.5, n)
    t1  =  rep(thresholds[i] + 0.5, n)
    
    # Calculate time in each degree
    t0[t0 < retdat$tmin]  =  retdat$tmin[t0 < retdat$tmin]
    t1[t1 > retdat$tmax]  =  retdat$tmax[t1 > retdat$tmax]
    # Suppressing message because produces NA, which are ignored
    retdat[, cadd] <- suppressWarnings((2/pi) * (asin((t1 - retdat$tmin)/(retdat$tmax - retdat$tmin)) - 
                                asin((t0 - retdat$tmin)/(retdat$tmax - retdat$tmin))))
    
    # If NA or less than zero, recode to zero
    retdat[, cadd] <- ifelse(is.na(retdat[, cadd]), 0, retdat[, cadd])
    retdat[, cadd] <- ifelse(retdat[, cadd] < 0 , 0, retdat[, cadd])
    
    # Round time in each degree
    retdat[, cadd] <- round(retdat[,cadd], 5)
    
    # Rename column
    colnames(retdat)[cadd] <- col
  }
  return(retdat)
}
  
