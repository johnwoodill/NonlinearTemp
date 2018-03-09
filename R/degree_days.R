#' @title Caclulate degree days
#'
#' @description
#' \code{degree_days} returns a data frame with calculated daily degree days within a specified thresholds.
#' 
#' @details 
#' To generate degree days the data must be in wide format with minimum temperature 
#' column labeled as tmin and maximum temperature labeled as tmax. 
#' 
#' Degree days are calcuated from the following cases:
#' 
#' (1) Minimum temperature >= threshold
#' 
#' dday = (tmax - tmin/2) - threshold
#' 
#' (2) Minimum temperature < Threshold < Maximum Temperature
#' 
#' dday = ( W integral_{theta}^{pi/2} sin(t)dt - integral_{theta}^{pi/2} (threshold - tmin)dt ) / pi
#' 
#' W = (tmax - tmin)/2
#' 
#' theta = sin^{-1} [ ( tmax - tmin )/W ]
#'
#' (3) Otherwise, degree days = 0
#' 
#' @references 
#' 
#' Snyder, Richard L. "Hand calculating degree days." Agricultural and forest meteorology 35, no. 1-4 (1985): 353-358.
#'
#' Woodill, A. John "United States Temperature Exposure 1900-2013." (2016) 
#' http://johnwoodill.blogspot.com/2016/06/us-degree-days-heat-map-interesting.html
#'
#' @param data data in wide format with minimum temperature labeled as tmin and maximum temperature labeled as tmax
#'
#' @param thresholds threshold of temperature intervals to calculate degree days
#'
#' @examples 
#' data(napa)
#' degree_days(napa, thresholds = c(0:35))

degree_days <- function(data, thresholds){
  
  # Check for tmin and tmax columns
  name_check <- names(data)
  check <- ifelse(any(name_check == 'tmax') & any(name_check == 'tmin'), 1, 0)
  
  if(check != 1) {
    warning("data.frame does not contain tmax or tmin. Please provide data.frame with these columns.")
  } else {
    retdat <- data
    
    #Order by date
    retdat <- retdat[order(as.Date(retdat$date)), ]
    
    # Generate average temp
    retdat$tavg <- (retdat$tmax + retdat$tmin)/2
    
    # Generate new columns for degree days from thresholds
    nc <- ncol(retdat)
    
    # Loop through each degree day
    for (i in 1:length(thresholds)){
      
      # Insert new column
      col <- paste0("dday", thresholds[i], "C")
      cadd <- i + nc
      b <- thresholds[i]
      retdat[, cadd] <- 0
      
      # If degree <= min, then difference average from degree; otherwise, zero
      retdat[, cadd] <- ifelse(b <= retdat$tmin, retdat$tavg - b, 0)
      
      # Integrate of inverse sine
      # Suppressing message because produces NA, which are ignored
      temp <- suppressWarnings(acos((2*b - retdat$tmax - retdat$tmin)/(retdat$tmax - retdat$tmin)))
      retdat[, cadd] <- ifelse(retdat$tmin < b & b < retdat$tmax, ((retdat$tavg - b)*temp + (retdat$tmax - retdat$tmin)*sin(temp)/2)/pi, retdat[,cadd])
      
      # Round degree days
      retdat[, cadd] <- round(retdat[,cadd], 5)
      
      # Rename column
      colnames(retdat)[cadd] <- col
    }
    # Return data
    return(retdat)
  }
  
}
