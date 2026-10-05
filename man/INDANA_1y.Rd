\name{INDANA_1y}
\docType{data}
\alias{INDANA_1y}

\title{Studies on Systolic and Diastolic Blood Pressure}

\description{
Results from eight trials evaluating the treatment effect on systolic and
diastolic blood pressure one year post randomisation.
}

\usage{INDANA_1y}

\format{
The data frame contains the following columns:
\tabular{lll}{
\bold{trial}      \tab \code{character} \tab trial label \cr
\bold{n}          \tab \code{numeric}   \tab number of individuals \cr
\bold{mean.sys}   \tab \code{numeric}   \tab systolic blood pressure (mmHG) \cr
\bold{var.sys}    \tab \code{numeric}   \tab variance of systolic blood pressure \cr
\bold{mean.dia}   \tab \code{numeric}   \tab diastolic blood pressure (mmHG) \cr
\bold{var.dia}    \tab \code{numeric}   \tab variance of diastolic blood pressure \cr
\bold{covariance} \tab \code{numeric}   \tab covariance \cr
\bold{age}        \tab \code{numeric}   \tab mean age \cr
\bold{year}       \tab \code{numeric}   \tab year of publication \cr
}
}

\details{
This data set comes from eight trials evaluating the treatment effect on
systolic and diastolic blood pressure one year post randomisation.
}

\author{Guido Schwarzer, \email{guido.schwarzer@uniklinik-freiburg.de}}

\examples{
\donttest{
if (requireNamespace("meta", quietly = TRUE) &&
    requireNamespace("mvmeta", quietly = TRUE) &&
    requireNamespace("dplyr", quietly = TRUE)) {
library("meta")
library("mvmeta")
library("dplyr")

ma_sys <- metagen(mean.sys, sqrt(var.sys), data = INDANA_1y, 
  sm = "MD", studlab = paste(trial, year))
print(ma_sys, digits = 2)

ma_dia <- metagen(mean.dia, sqrt(var.dia), data = INDANA_1y, 
  sm = "MD", studlab = paste(trial, year))
print(ma_dia, digits = 2)

rownames(INDANA_1y) <- INDANA_1y$trial
INDANA_1y \%>\% select(mean.sys, mean.dia) \%>\%
  as.matrix() -> theta
INDANA_1y \%>\%
  select(var.sys, covariance, var.dia) \%>\%
  as.matrix() -> S

mv_1y <- mvmeta(theta, S, method = "fixed")
print(summary(mv_1y), digits = 3)
}
}
}

\keyword{data sets}
\concept{multivariate meta-analysis}
\section{Concepts}{multivariate meta-analysis}
