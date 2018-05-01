\name{napa}
\alias{napa}
\docType{data}
\title{
Napa, CA daily data
}
\description{
A dataset containing daily min and max temperature to calculate degree days and time in each degree.
}
\usage{data("napa")}
\format{
  A data frame with 41305 observations on the following 11 variables.
  \describe{
    \item{\code{date}}{a Date}
    \item{\code{year}}{a numeric vector}
    \item{\code{month}}{a numeric vector}
    \item{\code{day}}{a numeric vector}
    \item{\code{fips}}{a numeric vector}
    \item{\code{county}}{a character vector}
    \item{\code{state}}{a factor with levels \code{AK} \code{AL} \code{AR} \code{AS} \code{AZ} \code{CA} \code{CO} \code{CT} \code{DC} \code{DE} \code{FL} \code{GA} \code{GU} \code{HI} \code{IA} \code{ID} \code{IL} \code{IN} \code{KS} \code{KY} \code{LA} \code{MA} \code{MD} \code{ME} \code{MI} \code{MN} \code{MO} \code{MP} \code{MS} \code{MT} \code{NC} \code{ND} \code{NE} \code{NH} \code{NJ} \code{NM} \code{NV} \code{NY} \code{OH} \code{OK} \code{OR} \code{PA} \code{PR} \code{RI} \code{SC} \code{SD} \code{TN} \code{TX} \code{UM} \code{UT} \code{VA} \code{VI} \code{VT} \code{WA} \code{WI} \code{WV} \code{WY}}
    \item{\code{lat}}{a numeric vector}
    \item{\code{long}}{a numeric vector}
    \item{\code{tmax}}{a numeric vector}
    \item{\code{tmin}}{a numeric vector}
  }
}
\examples{
data(napa)
## maybe str(napa) ; plot(napa) ...
}
\keyword{datasets}
